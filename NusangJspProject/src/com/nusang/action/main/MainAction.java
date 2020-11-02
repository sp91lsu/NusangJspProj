package com.nusang.action.main;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.controller.assistance.ConAsist;
import com.nusang.dao.PostDao;
import com.nusang.dto.Location;
import com.nusang.dto.Post;
import com.nusang.dto.User;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward actionForward = new ActionForward();

		actionForward.setNextPath(ConAsist.URL_MAIN);
		Location location = ConAsist.getLocation(request);
		User user = (User) request.getSession().getAttribute("user");
		int distance = user == null ? 5 : user.getView_distance();

		// 근방의 게시글 가지고 오기
		List<Post> postList = PostDao.getInstance().findPostByLocation(location, distance);
		System.out.println("이 근처 " + distance + "km의 게시글 갯수 : "+ postList.size());
		request.setAttribute("postList", postList);

		// 기본 업로드 경로 생성 및 이미지 업로드
		String savePath = request.getSession().getServletContext().getRealPath("upload");
		File mkFile = new File(savePath );
		if (!mkFile.exists()) {
			// 디렉토리 생성 메서드
			mkFile.mkdirs();
			System.out.println("created directory successfully!");
			
			int maxPostSize = 5 * 1024 * 1024; // 최대 5M
			String encoding = "utf-8"; // 인코딩
			FileRenamePolicy policy = new DefaultFileRenamePolicy(); // 중복파일명에 대한 rename 정책
			MultipartRequest multi = null;
			ServletContext context = request.getServletContext();
			String saveDirectory = context.getRealPath("upload");

			// MultipartRequest 생성 단계에서 이미 파일은 저장됨.
			try {
				multi = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
			} catch (Exception e1) {
				e1.printStackTrace();
			}

			// 2. 업로드된 파일의 '원본이름(들)' 과 '저장된 이름(들)' 받아오기
			List<String> originalFileNames = new ArrayList<String>();
			List<String> fileSystemNames = new ArrayList<String>();

			Enumeration names = multi.getFileNames(); // type='file' 요소 name 들 추출

			while (names.hasMoreElements()) {
				String name = (String) names.nextElement();
				String originalFileName = multi.getOriginalFileName(name);
				String fileSystemName = multi.getFilesystemName(name);
				System.out.println("첨부파일: " + originalFileName + "->" + fileSystemName);

				if (originalFileName != null && fileSystemName != null) {
					originalFileNames.add(originalFileName);
					fileSystemNames.add(fileSystemName);

				}
			} // end while

		}
		return actionForward;
	}

}

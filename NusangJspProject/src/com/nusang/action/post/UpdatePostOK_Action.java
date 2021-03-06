package com.nusang.action.post;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.bo.KakaoBO;
import com.nusang.controller.assistance.ConAsist;
import com.nusang.dao.Payment_MarketDao;
import com.nusang.dao.PostDao;
import com.nusang.dto.Location;
import com.nusang.dto.Payment_Market;
import com.nusang.dto.Post;
import com.nusang.dto.Post_Picture;
import com.nusang.dto.User;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

public class UpdatePostOK_Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int maxPostSize = 5 * 1024 * 1024; // 최대 5M
		String encoding = "utf-8"; // 인코딩
		FileRenamePolicy policy = new DefaultFileRenamePolicy(); // 중복파일명에 대한 rename 정책
		MultipartRequest multi = null;
		ServletContext context = request.getServletContext();
		String saveDirectory = context.getRealPath("upload");

		// upload할 경로가 없을때 생성
		File mkFile = new File(saveDirectory);
		// !표를 붙여주어 파일이 존재하지 않는 경우의 조건을 걸어줌
		if (!mkFile.exists()) {
			// 디렉토리 생성 메서드
			mkFile.mkdirs();
			System.out.println("created directory successfully!");
		}
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

		// ↑↑↑↑↑↑↑↑↑↑이미지 업로드 관련
		User user = (User) request.getSession().getAttribute("user");

		double map_latitude = Double.parseDouble(multi.getParameter("map_latitude"));
		double map_longtitude = Double.parseDouble(multi.getParameter("map_longtitude"));
		int locationno = Integer.parseInt(multi.getParameter("locationno"));
		int postno = Integer.parseInt(multi.getParameter("postno"));
		int post_picno = Integer.parseInt(multi.getParameter("post_picno"));
		
		Location location = KakaoBO.getInstance().reqLocation(map_longtitude, map_latitude);
		location.setLocationno(locationno);
		location.setTabletype("POST");
		Post post = new Post();
		post.setPostno(postno);
		post.setTitle(multi.getParameter("title"));
		post.setCategory(multi.getParameter("category"));
		post.setPrice(Integer.parseInt(multi.getParameter("price")));
		post.setBodytext(multi.getParameter("bodytext"));
		post.setProductname(multi.getParameter("productName"));
		post.setLocation(location);
		Post_Picture pp = new Post_Picture();
		pp.setPost_picno(post_picno);
		pp.setPicture(fileSystemNames);
		post.setPost_picture(pp);
		PostDao.getInstance().updatePost(post, fileSystemNames);
		// 데이터 확인
		post = PostDao.getInstance().findBy("postno", postno);

		ActionForward acf = new ActionForward();
		if (post != null) {
			acf.setNextPath(ConAsist.SERVLET_READPOST + "?postno=" + post.getPostno());
		} else {
			request.setAttribute("error", "게시글 등록에 실패하였습니다.");
			acf.setNextPath("/0_common/error.jsp");
		}

		return acf;
	}

}

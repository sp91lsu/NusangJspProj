package com.nusang.action.main;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
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
		
		int distance = user == null ? 
				10 //기본검색반경
				: user.getView_distance();

		// 근방의 게시글 가지고 오기
		List<Post> postList = PostDao.getInstance().findPostByLocation(location, distance);
		System.out.println("이 근처 " + distance + "km의 게시글 갯수 : " + postList.size());
		request.setAttribute("postList", postList);

		// 기본 업로드 경로 생성 및 이미지 업로드
		String savePath = request.getSession().getServletContext().getRealPath("upload");
		System.out.println("세이브패스 "+savePath);
		File mkFile = new File(savePath);
		if (!mkFile.exists()) {
			// 디렉토리 생성 메서드
			mkFile.mkdirs();
			System.out.println("created directory successfully!");
			File file = new File("/WebContent/img/profile.png");
			File mFile = new File(savePath + "/profile.png");
		
			copyFile(file, mFile);
		}
		return actionForward;
	}

	public void copyFile(File file, File mfile) throws IOException {
		System.out.println("파일이 어떻게되니 "+file);
		System.out.println("파일이 어떻게되니222 "+mfile);
	System.out.println("기본이미지 생성해야한다!!!");
		InputStream inStream = null;
		OutputStream outStream = null;

		try {
			inStream = new FileInputStream(file); // 원본파일
			outStream = new FileOutputStream(mfile); // 이동시킬 위치

			byte[] buffer = new byte[1024];

			int length;

			while ((length = inStream.read(buffer)) > 0) {
				outStream.write(buffer, 0, length);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			inStream.close();
			outStream.close();
		}
	}

}

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

public class CreatePost_Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

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

		// ↑↑↑↑↑↑↑↑↑↑이미지 업로드 관련

		String pm_merchant_uid = multi.getParameter("pm_merchant_uid");
		int pm_paid_amount = Integer.parseInt(multi.getParameter("pm_paid_amount"));
		String imp_uid = multi.getParameter("pm_imp_uid");

		User user = (User) request.getSession().getAttribute("user");

		double map_latitude = Double.parseDouble(multi.getParameter("map_latitude"));
		double map_longtitude = Double.parseDouble(multi.getParameter("map_longtitude"));
		
		System.out.println("Payment_Market 유저 아이디 : " + user.getUserno());
		Payment_Market pm = Payment_Market.builder().name("게시글 등록 ").imp_uid(imp_uid).paymenttype("card").state(1)
				.userno(user.getUserno()).price(pm_paid_amount).build();

		

		Location location = KakaoBO.getInstance().reqLocation(map_longtitude, map_latitude);
		location.setTabletype("POST");
		Post post = new Post();
		post.setTitle(multi.getParameter("title"));
		post.setCategory(multi.getParameter("category"));
		post.setPrice(Integer.parseInt(multi.getParameter("price")));
		post.setBodytext(multi.getParameter("bodytext"));
		post.setProductname(multi.getParameter("productName"));
		post.setUser(user);
		post.setLocation(location);
		Post_Picture pp = new Post_Picture();
		pp.setPicture(fileSystemNames);
		post.setPost_picture(pp);
		int postno = PostDao.getInstance().insertPost(post, fileSystemNames,pm);
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

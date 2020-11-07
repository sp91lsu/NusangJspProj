package com.nusang.action.post;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;


import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.controller.assistance.ConAsist;
import com.nusang.dao.PostDao;
import com.nusang.dao.Post_PictureDao;
import com.nusang.dto.Post;

public class UpdatePost_Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int postNo = Integer.parseInt(request.getParameter("postno"));
		Post post = PostDao.getInstance().findBy("postno",postNo );
		
		//사진 파일 삭제 및 디비값 삭제(null로 업데이트)
		ArrayList list = post.getPost_picture().getList();
		System.out.println("사진 리스트값: " +list);
		for(Object li  : list) {
			int cnt = 1;
			String fileName = (String)li;
			String filePath = request.getSession().getServletContext().getRealPath("upload")+"/";
			filePath += fileName;
			File f = new File(filePath);
			if(f.exists())f.delete();
			String colum = "p_"+cnt;
			Post_PictureDao.getInstance().updateBy(post.getPost_picture().getPost_picno(), colum, null);
			cnt++;
		}
		
		request.setAttribute("post", post);
		ActionForward acf = new ActionForward();
		acf.setNextPath(ConAsist.URL_UPDATEPOST);
		return acf;
	}

}

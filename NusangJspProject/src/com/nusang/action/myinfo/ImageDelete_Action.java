
package com.nusang.action.myinfo;

import java.io.File;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.type.EnumOrdinalTypeHandler;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.action.EActionType;
import com.nusang.controller.assistance.ConAsist;
import com.nusang.dao.BasicDao;
import com.nusang.dao.UserDao;
import com.nusang.dto.User;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ImageDelete_Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		request.setCharacterEncoding("UTF-8");
		ActionForward actionForward = new ActionForward();
		actionForward.setNextPath(ConAsist.URL_PROFILE);
//
//		MultipartRequest mReq = null;
//		String fileSystemName = "";
//		String originalFileName = "";
//		
		String initImg = "profile.png";

//		System.out.println("request getContentType : " + request.getContentType());
//		// ---> request getContentType : multipart/form-data;
//		// boundary=----WebKitFormBoundaryQCnDTHQWMsW1AOTC
//
//		int maxSize = 10 * 1024 * 1024;
//		// String savePath =
//		String savePath = request.getSession().getServletContext().getRealPath("upload");
//		//String savePath = "C:\\Users\\Sunghoon\\Desktop\\nusangJspProject";
//		String format = "UTF-8";
//		String uploadFile = "";
//		String fileName = "";
//		int read = 0;
//		byte[] buf = new byte[1024];
//		try {
//			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, format,
//					new DefaultFileRenamePolicy());
//			String title = multi.getParameter("title");
//			uploadFile = multi.getFilesystemName("uploadFile");
//			File file = new File(savePath + uploadFile);
//			
//			//업로드 파일 이름가져오기
//			Enumeration names = multi.getFileNames();
//			while (names.hasMoreElements()) {
//				String name = (String) names.nextElement();
//
//				// 그 name 을 통해, 원래 파일정보 추출
//				originalFileName = multi.getOriginalFileName(name);
//
//				// 저장된 파일 정보 추출
//				// 중복된 파인은 FileRenamePolicy 에 의해 다른 이름으로 변경되어 저장되어 있다.
//				fileSystemName = multi.getFilesystemName(name);
//
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		
		
		
		//fileName = savePath + "\\" + fileSystemName;
		User user = (User)request.getSession().getAttribute("user");
		UserDao.getInstance().updateBy(user.getUserno(), "picture", initImg);
		user = UserDao.getInstance().findBy("userno", user.getUserno());
		System.out.println("여기 안타????!!!!--" + user.getPicture());
		actionForward.setActionType(EActionType.REDIRECT);
		request.getSession().setAttribute("user", user);
		
		return actionForward;
	}

}

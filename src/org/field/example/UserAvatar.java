package org.field.example;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.field.dao.DB;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class UserAvatar
 */
public class UserAvatar extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserAvatar() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/* 灏嗙敤鎴风殑鍥剧墖瀛樺偍鍒版湰鍦帮紝骞惰繑鍥炶矾寰� */

		// 瀵煎叆涓や釜jar鍖�

		/*
		 * 
		 * String str = System.getProperty("user.dir");
		 * 
		 * File file = new File(str + "/image/");
		 * 
		 * if(!file.exists() && !file.isDirectory()) { try {
		 * 
		 * file.mkdir();
		 * 
		 * } catch (Exception e) {
		 * 
		 * e.printStackTrace();
		 * 
		 * }
		 * 
		 * }
		 * 
		 * SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		 * 
		 * String strCurrentTime = df.format(new Date());
		 * 
		 * String imagePath = str + "/image/" + strCurrentTime + ".png";
		 * 
		 * InputStream stream = request.getInputStream();
		 * 
		 * FileOutputStream fos = new FileOutputStream(imagePath);
		 * 
		 * byte[] bbuf = new byte[32];
		 * 
		 * int hasRead = 0;
		 * 
		 * while ((hasRead = stream.read(bbuf)) > 0) {
		 * 
		 * fos.write(bbuf, 0, hasRead);
		 * 
		 * }
		 * 
		 * fos.close();
		 * 
		 * stream.close();
		 */

		// 鑾峰彇浜岃繘鍒舵祦

		try {

			JSONObject json = new JSONObject();

			DiskFileItemFactory factory = new DiskFileItemFactory();

			ServletFileUpload upload = new ServletFileUpload(factory);
			
			//String demo = request.getContextPath();
			
			//System.out.print(this.getServletContext());
			
			
			
			//String uploadPath = str + "/webapps/upload";

			String uploadPath = "" ;
			
			File file = new File(uploadPath);

			if (!file.exists() && !file.isDirectory()) {
				try {

					file.mkdir();

				} catch (Exception e) {

					e.printStackTrace();

				}

			}

			FileItemIterator fii = upload.getItemIterator(request);

			while (fii.hasNext()) {

				FileItemStream fis = fii.next();

				if (fis.isFormField()) {

					json.put("code", "301");

					json.put("message", "璇疯緭鍏ユ纭殑淇℃伅");

					response.getWriter().print(json.toString());

				} else {

					String path = fis.getName();

					String filename = path.substring(path.lastIndexOf("\\") + 1);

					BufferedInputStream bis = new BufferedInputStream(fis.openStream());

					BufferedOutputStream bos = new BufferedOutputStream(

							new FileOutputStream(new File(uploadPath + "\\" + filename)));

					Streams.copy(bis, bos, true);
					
					

					DB db = new DB();

					HttpSession session = request.getSession();

					String tel = (String) session.getAttribute("tel");

					String sql = "update t_khb set avatar = ? where tel = ?";

					String avatar = filename;

					Object[] params = { avatar, tel };

					boolean bool = db.executeUpdate(sql, params);

					if (bool) {

						json.put("code", "200");

						json.put("message", "淇敼鎴愬姛");

						json.put("path", filename);

						response.getWriter().print(json.toString());
					}else {
						
						json.put("code", "401");

						json.put("message", "淇敼澶辫触");
						
						response.getWriter().print(json.toString());
					}

				}
			}

		} catch (FileUploadException e) {

			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

/*
 * 闂锛�
 * 
 * 淇敼servlet娌℃湁鎴愬姛
 * 
 */

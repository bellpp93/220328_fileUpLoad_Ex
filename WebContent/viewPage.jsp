<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 추가 -->
<%@ page import="com.oreilly.servlet.MultipartRequest,
				 com.oreilly.servlet.multipart.DefaultFileRenamePolicy,
				 java.util.*,
				 java.io.*"
%>
<%  // 자바 코드
	String savePath = "C:/FileUpload/filestorage";
	String encType = "UTF-8";
	int maxSize = 50 * 1024 * 1024;  // 50M 까지 제한
	
	try {
		MultipartRequest multi = null;
		// [제일 중요] MultipartRequest 객체 생성
		multi = new MultipartRequest(request,
									 savePath,
									 maxSize,
									 encType,
									 new DefaultFileRenamePolicy());
		String name = multi.getParameter("name");		// 작성자
		String subject = multi.getParameter("subject");	// 제목
		out.println("작성자: " + name + "<br>");
		out.println("제  목: " + subject + "<br>");
		out.println("<br>");
		
		Enumeration files = multi.getFileNames();
		
		while(files.hasMoreElements()) {
			String fname = (String)files.nextElement();
			String original = multi.getOriginalFileName(fname);
			String filename = multi.getFilesystemName(fname);
			String type = multi.getContentType(fname);
			File f = multi.getFile(fname);
			
			out.println("파일 업로드 객체 이름: " + fname + "<br>");
			out.println("실제 파일 이름: " + original + "<br>");
		}
		
	} catch(Exception e) {
		System.out.println(e);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewPage.jsp 페이지</title>
</head>
<body>

</body>
</html>
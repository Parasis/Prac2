<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加图书</title>
</head>
<body>
<form action="postBook.jsp" >
	书名：<input type="text" name="bookname"><br>
	作者：<input type="text" name="author"><br>
	价格: <input type="text" name="price"><br>
	<input type="submit" value="提交">
</form>

<%
			request.setCharacterEncoding("utf-8");

			if (request.getParameter("bookname") == null || request.getParameter("bookname").equals("")
					|| request.getParameter("author") == null || request.getParameter("author").equals("")
						|| request.getParameter("price") == null || request.getParameter("price").equals("")) {

				//do nothing

			} else {
				String bookname = request.getParameter("bookname");
				String author = request.getParameter("author");
				int price =Integer.parseInt(request.getParameter("price"));

				//取得books
				Vector books;

				if (application.getAttribute("books") == null) {
					books = new Vector();
				}else{
					books=(Vector)application.getAttribute("books");
				}

				//遍历确保不存在同名用户
				for(int i = 0 ;i<books.size();i++){
					Map<String,Object> oneBook =(Map<String,Object> ) books.get(i);
					if(oneBook.get("name").equals(bookname)){
						//存在同名用户，输出相关信息
						out.println("<red>该书已存在！请重新输入</red>");
						return;
					}
				}
				
				// bookname, author, price为从新增书目表单中接收的书名、作者、价格
				Map<String,Object> book=new HashMap<String,Object>();
				book.put("name",bookname);
				book.put("author", author);
				book.put("price", price);
				books.add(book);
				
				//将用户集合放入application中
				application.setAttribute("books", books);
				
				response.sendRedirect("index.jsp");			
					
			}
		%>




</body>
</html>
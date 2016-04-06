<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
</head>
<body>

	<div>
		<form action="register.jsp" method="post">
			用户名：<input type="text" name="username" /><br> 密码：<input
				type="password" name="password"><br> 
				<input type="radio" name="type" value="seller"> 商家
				
				<input type="radio" name="type" value="user" checked="checked"> 普通用户
				<input type="submit" value="注册" />
		</form>



		<%
			if (request.getParameter("password") == null || request.getParameter("password").equals("")
					|| request.getParameter("username") == null || request.getParameter("username").equals("")) {

				//do nothing

			} else {
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				String type = request.getParameter("type");

				//取得users
				Vector users;

				if (application.getAttribute("users") == null) {
					users = new Vector();
				}else{
					users=(Vector)application.getAttribute("users");
				}

				//遍历确保不存在同名用户
				for(int i = 0 ;i<users.size();i++){
					Map<String,Object> oneUser =(Map<String,Object> ) users.get(i);
					if(oneUser.get("name").equals(username)){
						//存在同名用户，输出相关信息
						out.println("<red>用户名已被注册！请重新输入</red>");
						return;
					}
				}
				
				//username,password,type为从注册表单中接收的用户名、密码、用户类型
				Map<String,Object> user=new HashMap<String,Object>();
				user.put("name",username);
				user.put("password",password);
				user.put("type",type);
				users.add(user);
				
				
				//将用户集合放入application中
				application.setAttribute("users", users);
				
				//session中存放用户信息
				session.setAttribute("username", username);
				session.setAttribute("type", type);
				
				response.sendRedirect("index.jsp");			
					
			}
		%>

	</div>

</body>
</html>
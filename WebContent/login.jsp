<%@page import="java.util.Map"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
</head>
<body>
<form action="login.jsp" method="post">
	用户名：<input type="text" name="username"><br>
	密码：<input type="password" name="password"><br>
	<input type="submit" value="登录">
</form>
<%
	if(request.getParameter("username")==null||request.getParameter("password")==null){
		
		//do nothing 
		
	}else{
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		//取得users
		Vector users;

		if (application.getAttribute("users") == null) {
			users = new Vector();
		}else{
			users=(Vector)application.getAttribute("users");
		}

		//遍历确保不存在同名用户
		for(int i = 0 ;i<users.size();i++){
			Map<String,Object> oneUser =(Map<String,Object>) users.get(i);
			if(oneUser.get("name").equals(username)){
				//用户存在，检查密码
				if(oneUser.get("password").equals(password)){
					//密码正确。给予登录
					session.setAttribute("username", username);
					session.setAttribute("type", (String)oneUser.get("type"));
					//登录完成 跳回首页
					response.sendRedirect("index.jsp");
				}else{
					out.print("密码错误，请重新输入");
				}
			}
		}
		out.print("用户不存在，请重新输入");		
	}

%>


</body>
</html>
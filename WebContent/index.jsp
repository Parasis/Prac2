<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
</head>
<body>
<div id="nav">
<%

	request.setCharacterEncoding("utf-8");
	if(session.getAttribute("username")==null||session.getAttribute("username").equals("")){
		out.print("<a href=\"register.jsp\">注册</a> <a href=\"login.jsp\">登录</a>");
	}else{
		String username = (String)session.getAttribute("username");
		String type = (String)session.getAttribute("type");
		
		out.print("欢迎你！"+username);
		out.print("<button onclick=\"exitLogin()\">退出登录</button>");
		
		
		if(type.equals("seller")){
			//类型是商家
			out.print("<br><a href=\"postBook.jsp\">发布图书</a>");			
		}else if(type.equals("user")){
			//类型是普通用户
		}
		
		
		
	}


%>
</div>
<hr>
<!-- 书目信息 -->
<div id="books">
<table border="1px">
	<tr>
		<td>书名</td>
		<td>作者</td>
		<td>价格</td>	
		<%
			if("users".equals(session.getAttribute("type"))){
				out.print("<td>选项</td>");
			}
		%>
	</tr>
<%
	if(application.getAttribute("books")==null){
		//do nothing 
	}else{
		Vector books = (Vector)application.getAttribute("books");
		for(int i = 0 ;i<books.size();i++){
			Map<String,Object> book=(Map<String,Object>)books.get(i);
			%>
				<tr>
					<td><%=book.get("name") %></td>
					<td><%=book.get("author") %></td>
					<td><%=book.get("price") %></td>	
					<%
						if("users".equals(session.getAttribute("type"))){
							out.print("<td>加入购物车</td>");
						}
					%>
				</tr>
			<%		
		}
		
	}
%>
</table>

<script type="text/javascript">

	function exitLogin(){
		<%
			//session.setAttribute("username", null);
			//session.setAttribute("type", null);
		%>
	}


</script>


</div>


</body>
</html>
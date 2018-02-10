<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form name="iforma" action="iispis.jsp">
	<%
		Integer br2 = (Integer) session.getAttribute("iedit");
		Integer x2 = (Integer) session.getAttribute("ibroj");
		
		if(br2==null || !br2.equals(x2)){
	%>
	<input name="opcija" type="submit" value="Отвори текст"/>
	<%
		}else{
	%>
	<input name="opcija" type="submit" value="Откажи едитовање"/>
	<% 
		}
		out.println("<input name=\"broj\" type=\"hidden\" value=\""+x2+"\"/>");
		session.setAttribute("ibroj", ++x2);
	%>
	<input name="opcija" type="submit" value="Избриши ставку"/>
</form>
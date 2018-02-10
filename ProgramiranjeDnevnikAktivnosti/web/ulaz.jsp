<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
    
<%@page import="java.util.Date" %>
<%@page import="java.util.ArrayList" %>
<%@page import="evidencije.dnevnik.bean.Biljeska" %>

<form name="forma" action="index.jsp">
	<textarea name="sadrzaj" rows="20" cols="80"><%
		Integer x3 = (Integer) session.getAttribute("iedit");
		ArrayList data3 = (ArrayList) session.getAttribute("sadrzaj");
		if(x3!=null){
			Biljeska b = (Biljeska) data3.get((int)x3);
			out.println(b.getText());
		}
	%></textarea><br><br>
	<input name="potvrda" type="submit" value="Потврда"/>
	<input name="potvrda" type="submit" value="Испис"/>
	<input name="potvrda" type="submit" value="Памћење"/>
	<input name="potvrda" type="submit" value="Учитавање"/>
</form>
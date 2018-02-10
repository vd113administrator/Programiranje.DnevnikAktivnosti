<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date" %>
<%@page import="java.util.ArrayList" %>
<%@page import="evidencije.dnevnik.bean.Biljeska" %>

<%
	ArrayList data1 = (ArrayList) session.getAttribute("sadrzaj");
	String str1 = request.getParameter("opcija");
	String br1 = request.getParameter("broj");
	Integer ed1 = (Integer) session.getAttribute("iedit");
	if(data1!=null && str1.equals("Избриши ставку") && br1!=null){
		data1.remove((int) new Integer(br1));
		if(ed1!=null){
			Integer i = new Integer(ed1);
			Integer n = new Integer(br1);
			if(i>n) 
				session.setAttribute("iedit",i-1);
			else if(i.equals(n)) 
				session.setAttribute("iedit",null);
		}
	}
	if(data1!=null && str1.equals("Отвори текст") && br1!=null){
		session.setAttribute("iedit",new Integer(br1));
	}
	if(data1!=null && str1.equals("Откажи едитовање") && br1!=null){
		session.setAttribute("iedit",null);
	}
	session.setAttribute("sadrzaj",data1);
%>
<jsp:include page="index.jsp"></jsp:include>
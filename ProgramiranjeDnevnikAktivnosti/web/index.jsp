<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" 
		  content="text/html; charset=UTF-8">
	<title>Дневник активности</title>
        <style>
            p.uspeh{
                color:green
            }
            p.greska{
                color:red
            }
        </style>
	</head>
	
	<body>
	<%@ include file="ispis.jsp"%>
	<%
		String param = request.getParameter("potvrda");
		if(param==null || !param.equals("Испис")){
	%>
	<%@ include file="ulaz.jsp"%>
    <%
	}
    %>
	</body>
</html>
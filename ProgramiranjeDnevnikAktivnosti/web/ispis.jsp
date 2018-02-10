<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.io.File" %>
<%@page import="java.io.IOException" %>
<%@page import="java.io.FileInputStream" %>
<%@page import="java.io.FileOutputStream" %>
<%@page import="java.io.ObjectInputStream" %>
<%@page import="java.io.ObjectOutputStream" %>

<%@page import="java.util.Date" %>
<%@page import="java.util.ArrayList" %>
<%@page import="evidencije.dnevnik.bean.Biljeska" %>
<%  
			ArrayList data = (ArrayList) session.getAttribute("sadrzaj");
			Integer x = (Integer) session.getAttribute("iedit");			

			if(data==null){
				data = new ArrayList();
			}
			else{
				String param = (String) request.getParameter("sadrzaj");
				 
				Biljeska b = new Biljeska();
				b.setDatum(new Date());
				b.setText(param);
				
				String submit = request.getParameter("potvrda");
				if(submit==null || submit.equals("Потврда")){
					if(param!=null && !data.contains(b)){
						if(x==null)
							data.add(b);
						else
							data.set(x, b);
					}
				}
				else if(submit.equals("Памћење")){
						try{
							File file = new File("Biljeske.srz");
							FileOutputStream fos = new FileOutputStream(file);
							ObjectOutputStream oos = new ObjectOutputStream(fos);
							oos.writeObject(data);
							oos.close();
							out.println("<p class=\"uspeh\">Памћење успјешно.</p>");
						}catch(Exception ex){
							out.println("<p class=\"greska\">Памћење није успјешно.</p>");
							ex.printStackTrace();
						}
				}
				else if(submit.equals("Учитавање")){
					try{
						File file = new File("Biljeske.srz");
						FileInputStream fos = new FileInputStream(file);
						ObjectInputStream ois = new ObjectInputStream(fos);
						data = (ArrayList) ois.readObject();
						ois.close();
						out.println("<p class=\"uspeh\">Учитавање успјешно.</p>");
					}catch(Exception ex){
						out.println("<p class=\"greska\">Учитавање није успјешно.</p>");
					}
				}	
					
			}
			
			int broj = 0;
			
			out.println("<hr>");
			
			session.setAttribute("ibroj", 0);
			
			for(Object o: data){
		      out.println(o);
		      String param = request.getParameter("potvrda");
			  if(param==null || !param.equals("Испис")){
%><jsp:include page="/iulaz.jsp"></jsp:include><% 
				++broj;
			  }
			  out.println("<hr>");
			}
			
			session.setAttribute("sadrzaj",data);
%>
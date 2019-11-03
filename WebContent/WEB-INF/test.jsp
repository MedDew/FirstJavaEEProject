<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Test</title>
    </head>

    <body>
        <p>Ceci est une page générée depuis une JSP.</p>
        <%
        	String attr = (String) request.getAttribute("test");
        	out.print(attr);
        	
        	String auteur = request.getParameter("auteur");
        	out.println("<br/>");
        	out.println("Auteur : "+auteur);
        %>
    </body>
</html>
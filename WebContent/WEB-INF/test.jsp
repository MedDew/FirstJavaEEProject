<%@page import="com.meddew.beans.Coyote"%>
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
        <p>
        	Récupération du bean : 
        	<%
	        	com.meddew.beans.Coyote coyote = (com.meddew.beans.Coyote) request.getAttribute("coyote");
	        	out.println("<br/>");
	        	out.println("Coyote rusé : "+coyote.getNom()+" "+coyote.getPrenom());
        	%>
        </p>
        <%-- Ceci est un commentaire JSP, non visible dans la page HTML finale.  --%>
        <%!
        	//Déclartion d'une variable dans une jsp
        	String str = "Une chaine";
        	private String getString(String s){
        		return str+" "+s;
        	}
        	public String getString(){
        		return str;
        	}
        %>
        <%
        	out.println("Utilisation d'une varibale créee dans une jsp : "+str);
        	out.println("<br/>");
        	out.println("Utilisation d'une method private créee dans une jsp : "+getString("de caractère"));
        	out.println("<br/>");
        	out.println("Utilisation d'une method public créee dans une jsp : "+getString());
        %>
        
        <form action="/tirage" method="post">
		  	<%
			    for(int i = 1; i < 3; i++){
			      out.println("Numéro " + i + ": <select name=\"number"+i+"\">");
			      for(int j = 1; j <= 10; j++){
			        out.println("<option value=\""+j+"\">"+ j + "</option>");
			      }
			      out.println("</select><br />");
			    }
		    %>
		    <br />
	    	<input type="submit" value="Valider" />
		</form>
    </body>
</html>
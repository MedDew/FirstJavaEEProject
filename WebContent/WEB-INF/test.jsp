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
		
		<%-- Balise scriptlet  --%>
		<% out.println("YAWP Buddy !"); %>
		<%-- Raccourci 	balise scriptlet  --%>
		<%= "YAWP Buddy !" %>
		
		
		<%-- L'action suivante récupère un bean de type Coyote et nommé "coyote" dans
			la portée requête s'il existe, ou en crée un sinon. --%>
			<jsp:useBean id="coyote2" class="com.meddew.beans.Coyote" scope="request" />
			
			<%-- Elle a le même effet que le code Java suivant : --%>
			<%--
				com.meddew.beans.Coyote coyote2 = (com.meddew.beans.Coyote) request.getAttribute( "coyote" ); 
				if ( coyote2 == null ){
				    coyote2 = new com.meddew.beans.Coyote();
				    request.setAttribute( "coyote", coyote2 );
				}
			--%>
			 <jsp:useBean id="coyote3" class="com.meddew.beans.Coyote" scope="request">
                   <%-- Ici, vous pouvez placer ce que vous voulez :
                   définir des propriétés, créer d'autres objets, etc. --%>
                   <p>Nouveau bean créé !</p>
             </jsp:useBean>
             <br/>
             <span>Coyote3 Nom:</span>
             <%= coyote3.getNom()  %>
             <span>Coyote Nom:</span>
             <%= coyote.getNom() %>
			
    </body>
</html>
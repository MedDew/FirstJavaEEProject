<%@page import="com.meddew.beans.Coyote"%>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Test</title>
    </head>
	
    <body>
    
    	<h1>Jsp utilisant du code Java</h1>
    	<p>Ceci est une page générée depuis une JSP.</p>
    	<p>
	    	<%
	    		String test = (String) request.getAttribute("test");
	    	%>
	    	<%= test %>
    	</p>
    	
    	<p>
	    	<% String nom = request.getParameter("nom"); %>
    		<%= nom %>
    	</p>
    	
    	<p>
    		<%-- <jsp:useBean id="coyote" class="com.meddew.beans.Coyote" scope="request">
    			<p>Creation de com.meddew.servlet.TestServletElOnly</p>
    		</jsp:useBean>
    		<jsp:getProperty property="prenom" name="coyote"/>
    		<jsp:getProperty property="nom" name="coyote"/>
    		--%>
    	</p>
    	
    	<h1>Jsp utilisant EL</h1>
    	${ test }
    	<br/>
    	<span>Bonne pratique en utilisant \${ requestScope.test } plutôt que \${ test }</span>
    	${ requestScope.test }
    	<br/>
    	${ param.nom }
    	<br/>
    	<h2>Récupération du bean :</h2>
    	
    	${ coyote }
    	<br/>
    	<span>Bonne pratique en utilisant \${ requestScope.coyote } plutôt que \${ coyote }</span>
    	${ requestScope.coyote }
    	<br/>
    	${ coyote.nom }
    	<br/>
    	<span>Bonne pratique en utilisant \${ requestScope.coyote.nom } plutôt que \${ coyote.nom }</span>
    	${ requestScope.coyote.nom }
    	<br/>
    	${ coyote.prenom }
    	<br/>
    	<span>Bonne pratique en utilisant \${ requestScope.coyote.prenom } plutôt que \${ coyote.prenom }</span>
    	${ requestScope.coyote.prenom }
    	
    	<h1>Affichage d'une liste</h1>
    	<%
    		String[] arr = (String[]) request.getAttribute("arr");
    		for(String v : arr){
    			out.println(v);
    		}
    	%>
    	<p>
    		<%
    			int jourDumois = (int) request.getAttribute("jourDuMois");
    			if(jourDumois % 2 == 0){
    				out.println("Jour pair : "+jourDumois);
    			}else{
    				out.println("Jour impair : "+jourDumois);
    			}
    		%>
    	</p>
    </body>
</html>
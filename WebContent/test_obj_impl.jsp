<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Test des objets implicites EL</title>
    </head>
    <body>
    <p>
	<% 
	String paramLangue = request.getParameter("langue");
	out.println( "Langue : " + paramLangue );
	%>
	<br />
	<%
	String paramArticle = request.getParameter("article");
	out.println( "Article : " + paramArticle );
	%>
    </p>
    
    <p>
    	Param langue from EL with implicit obj param : ${ param.get("langue") }
    	<br/>
    	Param article from EL with implicit obj param : ${ param.get("article") }
    	<br/>
    	Params from EL with implicit obj paramValues : ${ paramValues.langue[1] }
    </p>
    </body>
</html>
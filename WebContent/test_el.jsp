<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Test des expressions EL</title>
    </head>
    <body>
    <p>
        <!-- Logiques sur des booléens -->
        \${ true && true } :  ${ true && true } <br /> <!-- Affiche true -->
        \${ true && false } : ${ true && false } <br /> <!-- Affiche false -->
        \${ true || false } : ${ !true || false } <br /> <!-- Affiche false -->
		
        <!-- Calculs arithmétiques -->
        \${ 10 / 4 } : ${ 10 / 4 } <br /> <!-- Affiche 2.5 -->
        \${ 10 mod 4 } : ${ 10 mod 4 } <br /> <!-- Affiche le reste de la division entière, soit 2 -->
        \${ 10 % 4 } : ${ 10 % 4 } <br /> <!-- Affiche le reste de la division entière, soit 2 -->
        \${ 6 * 7 } : ${ 6 * 7 } <br /> <!-- Affiche 42 -->
        \${ 63 - 8 } : ${ 63 - 8 } <br /> <!-- Affiche 55 -->
        \${ 12 / -8 } : ${ 12 / -8 } <br /> <!-- Affiche -1.5 -->
        \${ 7 / 0 } : ${ 7 / 0 } <br /> <!-- Affiche Infinity -->
		
        <!-- Compare les caractères 'a' et 'b'. Le caractère 'a' étant bien situé avant le caractère 'b' dans l'alphabet ASCII, cette EL affiche true. -->
        \${ 'a' < 'b' } : ${ 'a' < 'b' } <br />  
		
        <!-- Compare les chaînes 'hip' et 'hit'. Puisque 'p' < 't', cette EL affiche false. -->
        \${ 'hip' gt 'hit' } : ${ 'hip' gt 'hit' } <br /> 
		
        <!-- Compare les caractères 'a' et 'b', puis les chaînes 'hip' et 'hit'. Puisque le premier test renvoie true et le second false, le résultat est false. -->
        \${ 'a' < 'b' && 'hip' gt 'hit' } : ${ 'a' < 'b' && 'hip' gt 'hit' } <br /> 
		
        <!-- Compare le résultat d'un calcul à une valeur fixe. Ici, 6 x 7 vaut 42 et non pas 48, le résultat est false. -->
        \${ 6 * 7 == 48 } : ${ 6 * 7 == 48 } <br /> 
        
        <!-- Vérifications si vide ou null -->
		\${empty 'test' } : ${ empty 'test' } <!-- La chaîne testée n'est pas vide, le résultat est false --><br />
		\${ empty '' } : ${ empty '' } <!-- La chaîne testée est vide, le résultat est true --><br />
		\${ !empty '' } : ${ !empty '' } <!-- La chaîne testée est vide, le résultat est false --><br />
		
		<!-- Conditions ternaires -->
		\${ true ? 'vrai' : 'faux' } : ${ true ? 'vrai' : 'faux' } <!-- Le booléen testé vaut true, vrai est affiché --><br />
		\${ 'a' > 'b' ? 'oui'  : 'non' }  : ${ 'a' > 'b' ? 'oui'  : 'non' } <!-- Le résultat de la comparaison vaut false, non est affiché --><br />
		\${ empty 'test' ? 'vide' : 'non  vide'  } : ${ empty 'test' ? 'vide' : 'non  vide'  } <!-- La chaîne testée n'est pas vide, non vide est affiché --><br />
		
    </p>
    
    <p>
   		
		<!-- L'expression EL suivante n'affiche rien si la propriété "prenom" n'a pas été initialisée,
		et n'affiche rien si l'objet "coyote" n'a pas été initialisé : -->
		${ coyote.prenom }
		
    	
    	<jsp:useBean id="coyote" class="com.meddew.beans.Coyote" scope="request"></jsp:useBean>
    	<!-- La scriptlet suivante affiche "null" si la propriété "prenom" n'a pas été initialisée, 
		et provoque une erreur à la compilation si l'objet "coyote" n'a pas été initialisé : -->
		<%= coyote.getPrenom() %>
		<!-- L'action suivante affiche "null" si la propriété "prenom" n'a pas été initialisée, 
		et provoque une erreur à l'exécution si l'objet "coyote" n'a pas été initialisé : -->
		<jsp:getProperty name="coyote" property="prenom" />
		
		
		
    	<jsp:setProperty property="prenom" name="coyote" value="Lenny BOY"/>
    	<jsp:getProperty property="prenom" name="coyote" />
    	<%-- Cette ligne est équivalente à celle du dessus --%>
    	<br/>
    	${ coyote.prenom }
    	<br/>
    	
    	<!-- Syntaxe conseillée pour récupérer la propriété 'prenom' du bean 'coyote'. -->
		${ coyote.prenom }
    	<br/>
		
		<!-- Syntaxe correcte, car il est possible d'expliciter la méthode d'accès à la propriété. Préférez toutefois la notation précédente. -->
		${ coyote.getPrenom() }
    	<br/>
		
		<!-- Syntaxe erronée : la première lettre de la propriété doit être une minuscule. -->
		<%-- ${ coyote.Prenom } --%>
    </p>
    <p>
    	<%
    		List<String> legumes = new ArrayList();
    		legumes.add("poireau");
    		legumes.add("haricot");
    		legumes.add("carotte");
    		legumes.add("pomme de terre");
    		request.setAttribute("legumes", legumes);
    	%>
    	<!-- Les quatre syntaxes suivantes retournent le deuxième élément de la liste de légumes  -->
        ${ legumes.get(1) }<br />
        ${ legumes[1] }<br />
        ${ legumes['1'] }<br />
        ${ legumes["1"] }<br />
    </p>
    <p>
    	<% 
        	/* Création d'un tableau */
        	String[] animaux = {"chien", "chat", "souris", "cheval"};
        	request.setAttribute("animaux" , animaux);
        %>
        
        <!-- Les trois syntaxes suivantes retournent le troisième élément du tableau  -->
        ${ animaux[2] }<br />
        ${ animaux['2'] }<br />
        ${ animaux["2"] }<br />
    </p>
    </body>
</html>
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
        <!-- Logiques sur des bool�ens -->
        \${ true && true } :  ${ true && true } <br /> <!-- Affiche true -->
        \${ true && false } : ${ true && false } <br /> <!-- Affiche false -->
        \${ true || false } : ${ !true || false } <br /> <!-- Affiche false -->
		
        <!-- Calculs arithm�tiques -->
        \${ 10 / 4 } : ${ 10 / 4 } <br /> <!-- Affiche 2.5 -->
        \${ 10 mod 4 } : ${ 10 mod 4 } <br /> <!-- Affiche le reste de la division enti�re, soit 2 -->
        \${ 10 % 4 } : ${ 10 % 4 } <br /> <!-- Affiche le reste de la division enti�re, soit 2 -->
        \${ 6 * 7 } : ${ 6 * 7 } <br /> <!-- Affiche 42 -->
        \${ 63 - 8 } : ${ 63 - 8 } <br /> <!-- Affiche 55 -->
        \${ 12 / -8 } : ${ 12 / -8 } <br /> <!-- Affiche -1.5 -->
        \${ 7 / 0 } : ${ 7 / 0 } <br /> <!-- Affiche Infinity -->
		
        <!-- Compare les caract�res 'a' et 'b'. Le caract�re 'a' �tant bien situ� avant le caract�re 'b' dans l'alphabet ASCII, cette EL affiche true. -->
        \${ 'a' < 'b' } : ${ 'a' < 'b' } <br />  
		
        <!-- Compare les cha�nes 'hip' et 'hit'. Puisque 'p' < 't', cette EL affiche false. -->
        \${ 'hip' gt 'hit' } : ${ 'hip' gt 'hit' } <br /> 
		
        <!-- Compare les caract�res 'a' et 'b', puis les cha�nes 'hip' et 'hit'. Puisque le premier test renvoie true et le second false, le r�sultat est false. -->
        \${ 'a' < 'b' && 'hip' gt 'hit' } : ${ 'a' < 'b' && 'hip' gt 'hit' } <br /> 
		
        <!-- Compare le r�sultat d'un calcul � une valeur fixe. Ici, 6 x 7 vaut 42 et non pas 48, le r�sultat est false. -->
        \${ 6 * 7 == 48 } : ${ 6 * 7 == 48 } <br /> 
        
        <!-- V�rifications si vide ou null -->
		\${empty 'test' } : ${ empty 'test' } <!-- La cha�ne test�e n'est pas vide, le r�sultat est false --><br />
		\${ empty '' } : ${ empty '' } <!-- La cha�ne test�e est vide, le r�sultat est true --><br />
		\${ !empty '' } : ${ !empty '' } <!-- La cha�ne test�e est vide, le r�sultat est false --><br />
		
		<!-- Conditions ternaires -->
		\${ true ? 'vrai' : 'faux' } : ${ true ? 'vrai' : 'faux' } <!-- Le bool�en test� vaut true, vrai est affich� --><br />
		\${ 'a' > 'b' ? 'oui'  : 'non' }  : ${ 'a' > 'b' ? 'oui'  : 'non' } <!-- Le r�sultat de la comparaison vaut false, non est affich� --><br />
		\${ empty 'test' ? 'vide' : 'non  vide'  } : ${ empty 'test' ? 'vide' : 'non  vide'  } <!-- La cha�ne test�e n'est pas vide, non vide est affich� --><br />
		
    </p>
    
    <p>
   		
		<!-- L'expression EL suivante n'affiche rien si la propri�t� "prenom" n'a pas �t� initialis�e,
		et n'affiche rien si l'objet "coyote" n'a pas �t� initialis� : -->
		${ coyote.prenom }
		
    	
    	<jsp:useBean id="coyote" class="com.meddew.beans.Coyote" scope="request"></jsp:useBean>
    	<!-- La scriptlet suivante affiche "null" si la propri�t� "prenom" n'a pas �t� initialis�e, 
		et provoque une erreur � la compilation si l'objet "coyote" n'a pas �t� initialis� : -->
		<%= coyote.getPrenom() %>
		<!-- L'action suivante affiche "null" si la propri�t� "prenom" n'a pas �t� initialis�e, 
		et provoque une erreur � l'ex�cution si l'objet "coyote" n'a pas �t� initialis� : -->
		<jsp:getProperty name="coyote" property="prenom" />
		
		
		
    	<jsp:setProperty property="prenom" name="coyote" value="Lenny BOY"/>
    	<jsp:getProperty property="prenom" name="coyote" />
    	<%-- Cette ligne est �quivalente � celle du dessus --%>
    	<br/>
    	${ coyote.prenom }
    	<br/>
    	
    	<!-- Syntaxe conseill�e pour r�cup�rer la propri�t� 'prenom' du bean 'coyote'. -->
		${ coyote.prenom }
    	<br/>
		
		<!-- Syntaxe correcte, car il est possible d'expliciter la m�thode d'acc�s � la propri�t�. Pr�f�rez toutefois la notation pr�c�dente. -->
		${ coyote.getPrenom() }
    	<br/>
		
		<!-- Syntaxe erron�e : la premi�re lettre de la propri�t� doit �tre une minuscule. -->
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
    	<!-- Les quatre syntaxes suivantes retournent le deuxi�me �l�ment de la liste de l�gumes  -->
        ${ legumes.get(1) }<br />
        ${ legumes[1] }<br />
        ${ legumes['1'] }<br />
        ${ legumes["1"] }<br />
    </p>
    <p>
    	<% 
        	/* Cr�ation d'un tableau */
        	String[] animaux = {"chien", "chat", "souris", "cheval"};
        	request.setAttribute("animaux" , animaux);
        %>
        
        <!-- Les trois syntaxes suivantes retournent le troisi�me �l�ment du tableau  -->
        ${ animaux[2] }<br />
        ${ animaux['2'] }<br />
        ${ animaux["2"] }<br />
    </p>
    </body>
</html>
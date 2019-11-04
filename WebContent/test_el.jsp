<!DOCTYPE html>
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
    </body>
</html>
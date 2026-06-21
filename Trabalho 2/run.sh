clear
echo "JFlex"
java -jar jflex-full-1.9.1.jar ./scanner/scanner.flex

echo "JCup"
java java_cup.Main ./parser/parser.cup
mv ./parser.java ./parser/parser.java
mv ./sym.java ./parser/sym.java

echo "Compile"
javac Main.java

echo "Run"
java Main 

#echo FIMg
#read -n 1 -p "Pressione uma tecla para continuar... "

echo "Clear"
rm ./parser/parser.java
rm ./parser/parser.class
rm ./scanner/Scanner.java
rm ./parser/sym.java
rm ./parser/*.class
rm *.class
rm ./scanner/*.java~
rm ./scanner/*.class
rm ./erros/*.class

echo "JFlex"
java -jar jflex-full-1.9.1.jar scanner.flex

echo "JCup"
java java_cup.Main parser.cup

echo "Compile"
javac Main.java

echo "Run"
java Main

#echo FIM
#read -n 1 -p "Pressione uma tecla para continuar... "

echo "Clear"
rm parser.java
rm parser.class
rm Scanner.java
rm sym.java
rm *.class
rm *.java~

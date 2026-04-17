rm *.java
rm *.java~
rm *.class

echo "JFlex"
java -jar jflex-full-1.9.1.jar microjava.flex

echo "Compile"
javac Yylex.java

echo "Run"
java Yylex input.txt

rm *.java
rm *.class

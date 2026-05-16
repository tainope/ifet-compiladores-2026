import java.io.*;
import java.nio.charset.StandardCharsets;

class Main {
    public static void main(String[] args)   
      throws Exception {
        //Para ler a entrada do teclado
         //Reader reader = new InputStreamReader(System.in, StandardCharsets.UTF_8);
         //Scanner scanner = new Scanner(reader);
         
        
        //Para ler a entrada do arquivo  
        FileInputStream in = new FileInputStream("teste.txt");
        Reader reader = new InputStreamReader(in, StandardCharsets.UTF_8);
        Scanner scanner = new Scanner(reader);
        
        parser parser = new parser(scanner);
        try {
            parser.parse();
            System.out.println("Arquivo sem erros de sintaxe!");
        } catch (Exception e) {
            System.out.println("Erro de sintaxe:" + e);
        }
    }
}
import java.io.*;
import java.nio.charset.StandardCharsets;

import erros.ListaErros;
import parser.parser;
import scanner.Scanner;


class Main {
    public static void main(String[] args) throws Exception {
        
        //Reader reader = new InputStreamReader(in, StandardCharsets.UTF_8);
        ListaErros listaErros = new ListaErros();
        FileReader fileReader = new FileReader("teste.txt");

        Scanner scanner = new Scanner(fileReader, listaErros);
        parser parser = new parser(scanner);

        try{
            parser.parse();
        } catch (Exception e) {
        }
        
        if (!listaErros.hasErros()) {
            System.out.println("Sintaxe Correta");
        } else {
            System.out.println("Erros encontrados:");
            listaErros.dump();
        }
    }
}
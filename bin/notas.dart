import 'dart:io';

void main() {
  List<String> notas = <String>[];
  menu(notas);
}

String getComando() {
  print("Digite um Comando: 1 - Adicionar nota, 2 - Listar notas, 3 - Sair");
  List<String> comandos =  <String> ["1", "2", "3"];
  String? entrada = "";

  entrada = stdin.readLineSync();

  if (entrada == null || !comandos.contains(entrada)){
    print("comando invalido");
    getComando();
  }

  return entrada!;
}

List<String> adicionaNota (List<String> notas) {
  print("Escreva uma nota:");
  String? nota = "";

  nota = stdin.readLineSync();
  
  if (nota == null || nota.isEmpty) {
    print("Não é possivel adcionar uma nota vazia");
    adicionaNota(notas);
  }

  notas.add(nota!);
  
  return notas;
}

void listaNotas(List<String> notas) {
  for (var i = 0; i < notas.length; i++){
    print(notas[i]);
  }
} 

void menu (List<String> notas) {
  print("");
  String comando = getComando();
  print("");

  switch (comando) {
    case "1":
    adicionaNota(notas);
    menu(notas);

    case "2":
    listaNotas(notas);
    menu(notas);

    case "3":
    print("Até Breve!");
  }
}
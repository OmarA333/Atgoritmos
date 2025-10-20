import 'dart:io';



void suma() {
  print('Digite 2 valores');
  int a = int.parse(stdin.readLineSync()!);
  int b = int.parse(stdin.readLineSync()!);
  int suma = a + b;
  print('La suma es: $suma');
}

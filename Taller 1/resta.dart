import 'dart:io';



void resta() {
  print('Digite 2 valores');
  int a = int.parse(stdin.readLineSync()!);
  int b = int.parse(stdin.readLineSync()!);
  int resta = a - b;
  print('La resta es: $resta');
}
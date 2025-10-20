
import 'dart:io';
import 'Ejercicio1.dart';
import 'Ejercicio2.dart';
import 'Ejercicio3.dart';
import 'Ejercicio4.dart';
import 'Ejercicio5.dart';
import 'Ejercicio6.dart';

void main() {
  while (true) {
  print('Seleccione una operación:');
  print('1. ejercicio 1');
  print('2. ejercicio 2');
  print('3. ejercicio 3');
  print('4. ejercicio 4');
  print('5. ejercicio 5');
  print('6. ejercicio 6');
  print('7. Salir');
  String? choice = stdin.readLineSync();

  switch (choice) {
    case '1':
      Ejercicio1();
      break;
    case '2':
      Ejercicio2();
      break;
      case '3':
      Ejercicio3();
      break;
    case '4':
      Ejercicio4();
      break;
    case '5':
      Ejercicio5();
      break;
    case '6':
      Ejercicio6();
      break;
    case '7':
      exit(0);
    default:
      print('Opción no válida');
    
  }
}}
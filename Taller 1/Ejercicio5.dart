import 'dart:io';
import 'dart:math';

void Ejercicio5() {
  double a;
  print('Ingrese la longitud del lado a: ');
  a = double.parse(stdin.readLineSync()!);

  double b;
  print('Ingrese la longitud del lado b: ');
  b = double.parse(stdin.readLineSync()!);

  double hipotenusa = sqrt(pow(a, 2) + pow(b, 2));

  print('La hipotenusa del triángulo rectángulo es: $hipotenusa');
}
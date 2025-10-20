import 'dart:io';

void Ejercicio6() {

  double centigrados;
  print('Ingrese la temperatura en grados Centigrados: ');
  centigrados = double.parse(stdin.readLineSync()!);

  double fahrenheit = (centigrados * 1.8 + 32);

  print('La temperatura en grados Fahrenheit es: $fahrenheit °F');
}


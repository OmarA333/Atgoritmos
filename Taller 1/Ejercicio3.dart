
import 'dart:io';
  void Ejercicio3() {

int ganados;
print('Ingrese el número de partidos ganados: ');   
ganados = int.parse(stdin.readLineSync()!);

int perdidos;
print('Ingrese el número de partidos perdidos: ');
perdidos = int.parse(stdin.readLineSync()!);

int empatados;
print('Ingrese el número de partidos empatados: ');
empatados = int.parse(stdin.readLineSync()!);

int puntos = (ganados * 3) + (empatados * 1);

print('Partidos ganados: $ganados');
print('Partidos perdidos: $perdidos');
print('Partidos empatados: $empatados');
print('Puntos totales: $puntos');
  
  }
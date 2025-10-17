// 2. Se necesita obtener el promedio de un estudiante a partir de sus tres notas parciales. El 
// estudiante debe digitar sus tres notas y el sistema deberá darle el promedio del semestre.
import 'dart:io';
  void main() {

double nota1;
print('Ingrese la primera nota parcial: ');
nota1 = double.parse(stdin.readLineSync()!);

double nota2;
print('Ingrese la segunda nota parcial: ');
nota2 = double.parse(stdin.readLineSync()!);

double nota3;
print('Ingrese la tercera nota parcial: ');
nota3 = double.parse(stdin.readLineSync()!);

double promedio = (nota1 + nota2 + nota3) / 3;

print('El promedio del estudiante es: $promedio');
  }
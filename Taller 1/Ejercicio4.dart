import 'dart:io';

void Ejercicio4() { 
String nombre;
print('Ingrese el nombre del empleado: ');
nombre = stdin.readLineSync()!;
  
int horasLaboradas;
print('Ingrese la cantidad de horas laboradas en el mes: ');

horasLaboradas = int.parse(stdin.readLineSync()!);
double tarifaPorHora;
print('Ingrese la tarifa por hora: ');

tarifaPorHora = double.parse(stdin.readLineSync()!);
double totalDevengado = horasLaboradas * tarifaPorHora;


print('Nombre del empleado: $nombre');
print('Cantidad de horas laboradas: $horasLaboradas');
print('Total devengado: $totalDevengado');
}
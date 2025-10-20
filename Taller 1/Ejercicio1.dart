import 'dart:io';

void Ejercicio1() {

double velocidad;
print('Ingrese la velocidad del automóvil en m/s: ');
velocidad = double.parse(stdin.readLineSync()!);


double tiempo;
print('Ingrese el tiempo recorrido en segundos: ');
tiempo = double.parse(stdin.readLineSync()!);

double distancia;

distancia = velocidad * tiempo;

  print('La distancia recorrida por el automóvil es: $distancia metros');
}

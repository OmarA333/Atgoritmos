import 'dart:io';

void main() {
  List<Map<String, dynamic>> products = [];
  bool running = true;

  while (running) {
    print('Menú Principal');
    print('1. Agregar producto');
    print('2. Listar productos');
    print('3. Actualizar producto');
    print('4. Eliminar producto');
    print('5. Salir');
    print('Seleccione una opción:');

    String? option = stdin.readLineSync();

    switch (option) {
      case '1':
        addProduct(products);
        break;
      case '2':
        listProducts(products);
        break;
      case '3':
        updateProduct(products);
        break;
      case '4':
        deleteProduct(products);
        break;
      case '5':
        running = false;
        break;
      default:
        print('Opción no válida');
    }
  }
}

String generateProductCode(List<Map<String, dynamic>> products) {
  int next = products.length + 1;
  return 'P${next.toString().padLeft(3, '0')}';
}

void addProduct(List<Map<String, dynamic>> products) {
  print('Ingrese el nombre del producto:');
  String? name = stdin.readLineSync();

  print('Ingrese el precio del producto:');
  double? price = double.tryParse(stdin.readLineSync() ?? '');

  print('Ingrese la cantidad disponible:');
  int? quantity = int.tryParse(stdin.readLineSync() ?? '');

  if (name != null && price != null && quantity != null) {
    String code = generateProductCode(products);
    products.add({
      'code': code,
      'name': name,
      'price': price,
      'quantity': quantity,
    });
    print('Producto agregado exitosamente. Código: $code');
  } else {
    print('Datos inválidos. Producto no agregado.');
  }
}

void listProducts(List<Map<String, dynamic>> products) {
  if (products.isEmpty) {
    print('No hay productos en el catálogo.');
    return;
  }

  for (int i = 0; i < products.length; i++) {
    var p = products[i];
    print('${i + 1}. Código: ${p['code']}, Nombre: ${p['name']}, Precio: \$${p['price']}, Cantidad: ${p['quantity']}');
  }
}

void updateProduct(List<Map<String, dynamic>> products) {
  listProducts(products);
  print('Ingrese el número del producto a actualizar:');
  int? index = int.tryParse(stdin.readLineSync() ?? '');

  if (index != null && index > 0 && index <= products.length) {
    var p = products[index - 1];

    print('Ingrese el nuevo nombre del producto (actual: ${p['name']}):');
    String? name = stdin.readLineSync();
    if (name != null && name.isNotEmpty) {
      p['name'] = name;
    }

    print('Ingrese el nuevo precio del producto (actual: \$${p['price']}):');
    double? price = double.tryParse(stdin.readLineSync() ?? '');
    if (price != null) {
      p['price'] = price;
    }

    print('Ingrese la nueva cantidad disponible (actual: ${p['quantity']}):');
    int? quantity = int.tryParse(stdin.readLineSync() ?? '');
    if (quantity != null) {
      p['quantity'] = quantity;
    }

    print('Producto actualizado exitosamente.');
  } else {
    print('Número de producto inválido.');
  }
}

void deleteProduct(List<Map<String, dynamic>> products) {
  listProducts(products);
  print('Ingrese el número del producto a eliminar:');
  int? index = int.tryParse(stdin.readLineSync() ?? '');

  if (index != null && index > 0 && index <= products.length) {
    products.removeAt(index - 1);
    print('Producto eliminado exitosamente.');
  } else {
    print('Número de producto inválido.');
  }
}



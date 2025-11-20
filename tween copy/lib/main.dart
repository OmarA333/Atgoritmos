import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator + Drawer Demo',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

// ----------------------------------------------------------
//                     HOME PAGE
// ----------------------------------------------------------
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<String> _titles = [
    'Home Page',
    'Página 2',
    'Página 3',
  ];

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      // Página principal (índice 0)
      Center(
        child: ElevatedButton(
          child: const Text("Ir a Página 2"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const PageTwo()),
            );
          },
        ),
      ),

      // Página 2 (índice 1)
      const PageTwo(),

      // Página 3 (índice 2)
      const PageThree(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text("Mi Drawer", style: TextStyle(color: Colors.white)),
            ),

            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Inicio"),
              onTap: () {
                Navigator.pop(context);
                setState(() => _currentIndex = 0);
              },
            ),

            ListTile(
              leading: const Icon(Icons.pages),
              title: const Text("Ir a Página 2"),
              onTap: () {
                Navigator.pop(context);
                setState(() => _currentIndex = 1);
              },
            ),

            ListTile(
              leading: const Icon(Icons.info),
              title: const Text("Ir a Página 3"),
              onTap: () {
                Navigator.pop(context);
                setState(() => _currentIndex = 2);
              },
            ),
          ],
        ),
      ),

      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (idx) => setState(() => _currentIndex = idx),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.pages), label: 'Página 2'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Página 3'),
        ],
      ),
    );
  }
}

// ----------------------------------------------------------
//                     PAGE TWO
// ----------------------------------------------------------
class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Página 2"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Volver"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

// ----------------------------------------------------------
//                     PAGE THREE
// ----------------------------------------------------------
class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Página 3"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Volver"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TweenDemoPage(),
    );
  }
}

class TweenDemoPage extends StatefulWidget {
  const TweenDemoPage({super.key});
  @override
  State<TweenDemoPage> createState() => _TweenDemoPageState();
}

class _TweenDemoPageState extends State<TweenDemoPage> {
  bool toggled = false;
  Duration duration = const Duration(milliseconds: 800);

  Route _createRoute() {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 900),
      pageBuilder: (context, animation, secondaryAnimation) => const DetailPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Tween para posición (entra desde la derecha) y para opacidad
        final offsetTween = Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
            .chain(CurveTween(curve: Curves.easeInOut));
        final opacityTween = Tween<double>(begin: 0.0, end: 1.0)
            .chain(CurveTween(curve: Curves.easeIn));

        return SlideTransition(
          position: animation.drive(offsetTween),
          child: FadeTransition(
            opacity: animation.drive(opacityTween),
            child: child,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final begin = toggled ? 0.0 : 1.0;
    final end = toggled ? 1.0 : 0.0;

    return Scaffold(
      appBar: AppBar(title: const Text('Demo TweenAnimationBuilder')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween(begin: begin, end: end),
              duration: duration,
              curve: Curves.easeInOut,
              builder: (context, value, child) {
                // value va entre begin..end; lo usamos para interpolar transformaciones
                final scale = 0.5 + 0.5 * value; // 0.5..1.0
                final translateY = 80 * (1 - value); // 80..0
                final color = Color.lerp(Colors.blue, Colors.orange, value)!;

                return Transform.translate(
                  offset: Offset(0, translateY),
                  child: Transform.scale(
                    scale: scale,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(16 * value + 4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10 * value + 2,
                            offset: Offset(0, 6 * value),
                          )
                        ],
                      ),
                      alignment: Alignment.center,
                      child: child,
                    ),
                  ),
                );
              },
              child: const Text(
                'TWEEN',
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => toggled = !toggled),
                  child: const Text('Alternar'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () => setState(() => duration = const Duration(milliseconds: 300)),
                  child: const Text('Rápido'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => setState(() => duration = const Duration(seconds: 1)),
                  child: const Text('Lento'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).push(_createRoute()),
                  child: const Text('Ir a Detalle'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Nueva página de detalle que muestra cómo vuelve la transición al hacer pop.
class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Volver'),
        ),
      ),
    );
  }
}

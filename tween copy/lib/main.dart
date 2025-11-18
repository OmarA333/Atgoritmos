import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: PhysicsCardDragDemo()));
}

class PhysicsCardDragDemo extends StatelessWidget {
  const PhysicsCardDragDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DraggableCard(child: FlutterLogo(size: 128)),
    );
  }
}

class DraggableCard extends StatefulWidget {
  const DraggableCard({required this.child, super.key});

  final Widget child;

  @override
  State<DraggableCard> createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard> {
  Alignment _alignment = Alignment.center;
  bool _isDragging = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: AnimatedAlign(
        alignment: _alignment,
        duration: _isDragging ? Duration.zero : const Duration(milliseconds: 500),
        curve: Curves.easeOut,
        child: GestureDetector(
          onPanStart: (_) {
            setState(() => _isDragging = true);
          },
          onPanUpdate: (details) {
            final renderBox = context.findRenderObject() as RenderBox?;
            if (renderBox == null) return;
            final size = renderBox.size;
            // Convert pixel delta to Alignment units (-1..1)
            final dx = details.delta.dx / (size.width / 2);
            final dy = details.delta.dy / (size.height / 2);
            setState(() {
              _alignment = Alignment(
                _alignment.x + dx,
                _alignment.y + dy,
              );
            });
          },
          onPanEnd: (_) {
            setState(() {
              _isDragging = false;
              _alignment = Alignment.center;
            });
          },
          child: Card(
            elevation: 8,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
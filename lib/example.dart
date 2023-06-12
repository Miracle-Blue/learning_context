import 'package:flutter/material.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  static void nextScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ExampleScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: OutlinedButton(
            onPressed: () => nextScreen(context),
            child: const Text("Example Screen"),
          ),
        ),
      ),
    );
  }
}

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ColoredWidget(
          initialColor: Colors.teal,
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: ColoredWidget(
              key: key,
              initialColor: Colors.green,
              child: const Padding(
                padding: EdgeInsets.all(40),
                child: ColorButton(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ColoredWidget extends StatefulWidget {
  final Widget child;
  final Color initialColor;

  const ColoredWidget({
    required this.child,
    required this.initialColor,
    super.key,
  });

  @override
  State<ColoredWidget> createState() => _ColoredWidgetState();
}

class _ColoredWidgetState extends State<ColoredWidget> {
  late Color color;

  @override
  void initState() {
    color = widget.initialColor;
    super.initState();
  }

  void changeColor(Color color) {
    setState(() {
      this.color = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: color,
      child: widget.child,
    );
  }
}

class ColorButton extends StatelessWidget {
  const ColorButton({super.key});

  void _onPressed(BuildContext context) {
    final state = context.findRootAncestorStateOfType<_ColoredWidgetState>();
    if (state != null) {
      state.changeColor(Colors.black);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ColoredWidget(
      initialColor: Colors.blue,
      child: Center(
        child: OutlinedButton(
          onPressed: () => _onPressed(context),
          child: const Text("Tap"),
        ),
      ),
    );
  }
}

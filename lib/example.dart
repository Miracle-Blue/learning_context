import 'package:flutter/material.dart';

final key = GlobalKey<_ColoredWidgetState>();

class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);

  static void nextScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NextScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () => nextScreen(context),
            child: const Text("Example Screen"),
          ),
        ),
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: InheritExample(
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
      ),
    );
  }
}

class InheritExample extends InheritedWidget {
  const InheritExample({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}

class ColoredWidget extends StatefulWidget {
  final Widget child;
  final Color initialColor;

  const ColoredWidget({
    Key? key,
    required this.child,
    required this.initialColor,
  }) : super(key: key);

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
    return Container(
      color: color,
      child: widget.child,
    );
  }
}

class ColorButton extends StatelessWidget {
  const ColorButton({Key? key}) : super(key: key);

  void _onPressed(BuildContext context) {
    context
        .findAncestorStateOfType<_ColoredWidgetState>()
        ?.changeColor(Colors.black);

    context
        .findRootAncestorStateOfType<_ColoredWidgetState>()
        ?.changeColor(Colors.yellow);

    key.currentState?.changeColor(Colors.red);

    // final dd = context.findRenderObject()?.runtimeType;

    // context.findAncestorWidgetOfExactType<NextScreen>()?.key;
  }

  @override
  Widget build(BuildContext context) {
    return ColoredWidget(
      initialColor: Colors.blue,
      child: Center(
        child: ElevatedButton(
          onPressed: () => _onPressed(context),
          child: const Text("Tap"),
        ),
      ),
    );
  }
}

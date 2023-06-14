import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late MediaQueryData  data;
  final FocusNode f = FocusNode();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    data = MediaQuery.of(context);
  }

  @override
  void dispose() {
    f.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (f.hasFocus) {
          FocusScope.of(context).unfocus();
        } else {
          FocusScope.of(context).requestFocus(f);
        }
      },
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  focusNode: f,
                  controller: TextEditingController()..text = "padding: ${data.padding}",
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  textAlign: TextAlign.center,
                  showCursor: false,
                ),
                TextField(
                  controller: TextEditingController()..text = "viewInsets: ${data.viewInsets}",
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  textAlign: TextAlign.center,
                  showCursor: false,
                ),
                TextField(
                  controller: TextEditingController()..text = "viewPadding: ${data.viewPadding}",
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  textAlign: TextAlign.center,
                  showCursor: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  void tap() {
    
    text2 = text1;
    setState(() {});
  }

  String text1 = 'void func';
  String text2 = 'state less';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonStateless(),
            const SizedBox(height: 20),
            ButtonStateless(),
            const SizedBox(height: 20),
            const ButtonStateless(),
          ],
        ),
      ),
    );
  }
}

class ButtonStateless extends StatelessWidget {
  const ButtonStateless({super.key});

  @override
  Widget build(BuildContext context) {
    final stateHomePage = context.findAncestorStateOfType<HomePageState>();
    return ElevatedButton(
      onPressed: () => stateHomePage?.tap(),
      child: Text(stateHomePage?.text2 ?? ''),
    );
  }
}

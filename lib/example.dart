import 'package:flutter/material.dart';

import 'inherit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: DataOwnerStateFull(),
        ),
      ),
    );
  }
}

class DataOwnerStateFull extends StatefulWidget {
  const DataOwnerStateFull({Key? key}) : super(key: key);

  @override
  State<DataOwnerStateFull> createState() => _DataOwnerStateFullState();
}

class _DataOwnerStateFullState extends State<DataOwnerStateFull> {
  var _value = 0;

  void _increment() {
    _value += 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: _increment,
          child: const Text("Tap"),
        ),
        Provider(
          value: _value,
          child: const DataConsumerStateless(),
        ),
      ],
    );
  }
}

class DataConsumerStateless extends StatelessWidget {
  const DataConsumerStateless({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //! first method
    final value = Provider.of(context, listen: true)?.value ?? 0;
    return Column(
      children: [
        Text(
          "$value",
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
        const DataConsumerStateFull(),
      ],
    );
  }
}

class DataConsumerStateFull extends StatefulWidget {
  const DataConsumerStateFull({Key? key}) : super(key: key);

  @override
  State<DataConsumerStateFull> createState() => _DataConsumerStateFullState();
}

class _DataConsumerStateFullState extends State<DataConsumerStateFull> {
  @override
  Widget build(BuildContext context) {
    //! second method
    final value = Provider.of(context)?.value ?? 0;

    return Text(
      "$value",
      style: const TextStyle(
        fontSize: 30,
      ),
    );
  }
}

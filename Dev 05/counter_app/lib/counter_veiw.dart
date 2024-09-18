import 'package:flutter/material.dart';

class CouterVeiw extends StatefulWidget {
  const CouterVeiw({super.key});

  @override
  State<CouterVeiw> createState() => _CouterVeiwState();
}

class _CouterVeiwState extends State<CouterVeiw> {
  int couter = 0;

  @override
  void initState() {
    couter = 9;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  // ignore: override_on_non_overriding_member
  void incrementCounter() {
    setState(() {
      couter++;
    });
  }

  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter View'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Counter: $couter',
              style: theme.textTheme.titleLarge,
            ),
            FilledButton(
              onPressed: () {
                incrementCounter();
              },
              child: const Text('Increment'),
            )
          ],
        ),
      ),
    );
  }
}

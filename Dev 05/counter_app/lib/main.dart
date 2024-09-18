import 'package:flutter/material.dart';

import 'counter_veiw.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: CouterVeiw()
        //  Scaffold(
        //   body: Center(
        //     child: Text('Hello World!'),
        //   ),
        // ),
        );
  }
}

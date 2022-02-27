import 'package:flutter/material.dart';

import 'screens/wrapper.dart';

void main() {
  runApp(const Laundry());
}

class Laundry extends StatelessWidget {
  const Laundry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Laundry',
      home: Wrapper(),
    );
  }
}

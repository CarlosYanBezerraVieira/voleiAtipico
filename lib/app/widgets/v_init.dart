import 'package:flutter/material.dart';

class VInitPage extends StatelessWidget {
  final void Function() callback;

  const VInitPage({super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          callback();
        },
        child: const Text('Fetch Players'),
      ),
    );
  }
}

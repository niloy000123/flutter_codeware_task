import 'package:flutter/material.dart';
import 'component/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo test"),
      ),
      body: const SafeArea(
        child: Body(),
      ),
    );
  }
}

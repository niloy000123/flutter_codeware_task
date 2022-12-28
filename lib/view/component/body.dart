import 'package:flutter/material.dart';
import 'package:flutter_codeware_task/view/component/input_outpot.dart';
import 'package:flutter_codeware_task/view/component/search.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: const [
          SearchCard(),
          SizedBox(
            height: 30,
          ),
          InputOutputCard(),
        ],
      ),
    );
  }
}

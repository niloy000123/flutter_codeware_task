// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_codeware_task/service/versions.dart';

import '../../model/android_version.dart';

class InputOutputCard extends StatefulWidget {
  const InputOutputCard({super.key});

  @override
  State<InputOutputCard> createState() => _InputOutputCard();
}

Column output = Column();

class _InputOutputCard extends State<InputOutputCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    output = inputView(VersionService.input_1());
                  });
                },
                child: const Text("Input 1")),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    output = inputView(VersionService.input_2());
                  });
                },
                child: const Text("Input 2")),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        output,
      ],
    );
  }

  Column inputView(List<dynamic> input) {
    Column column = Column(
      children: [],
    );

    for (var i = 0; i < input.length; i++) {
      //when array found
      if (input[i] is List) {
        Row row = Row(
          children: [],
        );
        for (var j = 0; j < input[i].length; j++) {
          AndroidVerison model = input[i][j];
          Widget container = Expanded(
            flex: 1,
            child: Text(
              model.title!,
              style: const TextStyle(fontSize: 13),
            ),
          );
          row.children.add(container);
        }
        column.children.add(row);
      }
      //when object found
      else {
        Row row = Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [],
        );
        int count = 0;
        for (var key in input[i].keys) {
          //if the object key is not match to the serial index
          if (count != int.parse(key)) {
            Widget container = const Expanded(
              flex: 1,
              child: Text(' '),
            );
            row.children.add(container);
            count++;
          }
          AndroidVerison model = input[i][key];
          Widget container = Expanded(
            flex: 1,
            child: Text(
              model.title!,
              style: const TextStyle(fontSize: 13),
            ),
          );
          row.children.add(container);
          count++;
        }
        column.children.add(row);
        column.children.add(const SizedBox(
          height: 10,
        ));
      }
    }
    return column;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_codeware_task/model/android_version.dart';
import 'package:flutter_codeware_task/service/versions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    findId(2);
    return Column(
      children: [
        in1(VersionService.input_1()),
        const SizedBox(
          height: 10,
        ),
        in1(VersionService.input_2())
      ],
    );
  }

  Column in1(List<dynamic> input) {
    Column column = Column(
      children: [],
    );

    for (var i = 0; i < input.length; i++) {
      if (input[i] is List) {
        Row row = Row(
          children: [],
        );
        for (var j = 0; j < input[i].length; j++) {
          AndroidVerison model = input[i][j];
          Widget container = SizedBox(
            width: 100,
            child: Text(
              model.title!,
              style: const TextStyle(fontSize: 10),
            ),
          );
          row.children.add(container);
        }
        column.children.add(row);
      } else {
        Row row = Row(
          children: [],
        );
        int count = 0;
        for (var key in input[i].keys) {
          if (count != int.parse(key)) {
            Widget container = const SizedBox(
              width: 100,
            );
            row.children.add(container);
            count++;
          }
          AndroidVerison model = input[i][key];
          Widget container = SizedBox(
            width: 100,
            child: Text(
              model.title!,
              style: const TextStyle(fontSize: 10),
            ),
          );
          row.children.add(container);
          count++;
        }
        column.children.add(row);
      }
    }
    return column;
  }

  String? findId(int id) {
    String? result = "Not Found";
    var data = VersionService.input_2();
    innerLoop:
    for (var i = 0; i < data.length; i++) {
      if (data[i] is List) {
        for (var j = 0; j < data[i].length; j++) {
          AndroidVerison model = data[i][j];
          if (model.id == id) {
            result = model.title;
            break innerLoop;
          }
        }
      } else {
        var value = data[i];
        for (var element in value.entries) {
          AndroidVerison model = element.value;

          if (model.id == id) {
            result = model.title;
            break innerLoop;
          }
        }
      }
    }
    return result;
  }
}

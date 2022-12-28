import 'package:flutter/material.dart';

import '../../model/android_version.dart';
import '../../service/versions.dart';

class SearchCard extends StatefulWidget {
  const SearchCard({super.key});

  @override
  State<SearchCard> createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  final _formKey = GlobalKey<FormState>();
  late String searchId;
  final data = VersionService.input_2();
  String result = "";
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 4,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  onSaved: (newValue) => searchId = newValue!,
                  validator: (value) {
                    if (value!.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Please input Value"),
                      ));

                      return "";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      result = findId(int.parse(searchId))!;
                      setState(() {});
                    }
                  },
                  child: const Text("Search"))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Result : $result",
            style: TextStyle(color: Colors.orange.shade500, fontSize: 17),
          )
        ],
      ),
    );
  }

  String? findId(int id) {
    String? result = "Not Found";

    innerLoop:
    for (var i = 0; i < data.length; i++) {
      //when array found
      if (data[i] is List) {
        for (var j = 0; j < data[i].length; j++) {
          AndroidVerison model = data[i][j];
          if (model.id == id) {
            result = model.title;
            break innerLoop;
          }
        }
      }
      //when object found
      else {
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

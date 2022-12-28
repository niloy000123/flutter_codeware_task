import '../model/android_version.dart';

class VersionService {
  static List<dynamic> input_1() {
    var jsonData = [
      {
        "0": {"id": 1, "title": "Gingerbread"},
        "1": {"id": 2, "title": "Jellybean"},
        "3": {"id": 3, "title": "KitKat"}
      },
      [
        {"id": 4, "title": "Lollipop"},
        {"id": 5, "title": "Pie"},
        {"id": 6, "title": "Oreo"},
        {"id": 7, "title": "Nougat"}
      ]
    ];

    return parseJson(jsonData);
  }

  static List<dynamic> input_2() {
    var jsonData = [
      {
        "0": {"id": 1, "title": "Gingerbread"},
        "1": {"id": 2, "title": "Jellybean"},
        "3": {"id": 3, "title": "KitKat"}
      },
      {
        "0": {"id": 8, "title": "Froyo"},
        "2": {"id": 9, "title": "Éclair"},
        "3": {"id": 10, "title": "Donut"}
      },
      [
        {"id": 4, "title": "Lollipop"},
        {"id": 5, "title": "Pie"},
        {"id": 6, "title": "Oreo"},
        {"id": 7, "title": "Nougat"}
      ]
    ];

    return parseJson(jsonData);
  }

  static parseJson(var jsonData) {
    List<dynamic> input = [];
    for (var i = 0; i < jsonData.length; i++) {
      //when array found
      if (jsonData[i] is List) {
        var value = jsonData[i] as List;
        var list = [];
        for (var j = 0; j < value.length; j++) {
          list.add(
              AndroidVerison(id: value[j]["id"], title: value[j]['title']));
        }
        input.add(list);
      }
      //when object found
      else {
        Map<String, AndroidVerison> obj = {};
        Map<String, Map<String, Object>> value =
            jsonData[i] as Map<String, Map<String, Object>>;
        for (var element in value.entries) {
          int id = element.value["id"] as int;
          String title = element.value["title"].toString();
          obj.addAll({element.key: AndroidVerison(id: id, title: title)});
        }
        input.add(obj);
      }
    }

    return input;
  }
}

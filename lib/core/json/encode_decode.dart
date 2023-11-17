import 'json_list.dart';
import 'json_object.dart';
import 'original_json.dart';

abstract class Decodable<T> {
  List<OriginalJson> values = [];
  List<OriginalJson> properties() {
    return [];
  }

  decode(Map json) {
    values = properties();
    for (var item in values) {
      if (json.containsKey(item.key)) {
        item.value = item.fromJson(json[item.key]);
      }
    }
  }

  T? createInstance() => null;
}

abstract class Encodable extends Decodable {
  Map toJson() {
    var json = {};
    for (var item in values) {
      if (item is Encodable) {
        json[item.key] = (item.value as Encodable).toJson();
      } else if (item is JsonObject) {
        json[item.key] = (item.value as Encodable).toJson();
      } else if (item is JsonList) {
        json[item.key] = (item.value as List).map((e) => (e as Encodable).toJson()).toList();
      } else {
        json[item.key] = item.value;
      }
    }
    return json;
  }
}
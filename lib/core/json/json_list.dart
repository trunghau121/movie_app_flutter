import 'encode_decode.dart';
import 'original_json.dart';

typedef Instance<T extends Decodable> = T Function();

class JsonList<T extends Decodable> extends OriginalJson<List<T>> {
  Instance<T> instance;
  JsonList({required String key, required this.instance, List<T>? value})
      : super(key: key, value: value);

  @override
  List<T>? fromJson(dynamic) {
    if(dynamic == null) {
      return null;
    }else if (dynamic != null && dynamic is List) {
      List<T> list = [];
      for (var item in dynamic) {
        final element = instance()..decode(item);
        list.add(element);
      }
      return list;
    } else {
      throw ArgumentError("Value is not a List");
    }
  }
}
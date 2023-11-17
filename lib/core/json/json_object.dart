import 'encode_decode.dart';
import 'original_json.dart';

class JsonObject<T extends Encodable> extends OriginalJson<T> {
  JsonObject({required String key, required T? value})
      : super(key: key, value: value);

  @override
  T? fromJson(dynamic) {
    if (dynamic != null) {
      if (value is Encodable) {
        (value as Encodable).decode(dynamic);
      } else {
        throw ArgumentError("Can not convert Object not extends from Encodable.");
      }
    } else {
      value = null;
    }
    return value;
  }
}
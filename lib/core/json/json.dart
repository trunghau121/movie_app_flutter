import 'original_json.dart';

abstract class Json<T> extends OriginalJson<T> {
  Json({required String key, T? value}) : super(key: key, value: value);

  @override
  T? fromJson(dynamic) {
    if (dynamic != null) {
      value = dynamic as T;
    } else {
      value = null;
    }
    return value;
  }
}
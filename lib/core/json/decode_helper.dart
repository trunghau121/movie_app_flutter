import 'json.dart';
import 'json_list.dart';
import 'encode_decode.dart';

class Stringer extends Json<String> {
  Stringer({required String key, String? value}) : super(key: key, value: value);
}

class Interger extends Json<int> {
  Interger({required String key, int? value}) : super(key: key, value: value);
}

class Doubler extends Json<double> {
  Doubler({required String key, double? value}) : super(key: key, value: value);
}

class Boolean extends Json<bool> {
  Boolean({required String key, bool? value}) : super(key: key, value: value);
}

// Only for primary data type
class ListJsonPrimary<P> extends Json<List<P>> {
  ListJsonPrimary({required String key, List<P>? value}) : super(key: key, value: value);
}

// Only for Object extends Encodable
class ListJsonObject<P extends Encodable> extends JsonList<P> {
  ListJsonObject({required String key, required Instance<P> instance, List<P>? value})
      : super(key: key, instance: instance, value: value);
}
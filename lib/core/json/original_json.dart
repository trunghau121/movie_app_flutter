abstract class OriginalJson<T> {
  String key;
  T? value;
  OriginalJson({required this.key, this.value});

  dynamic fromJson(dynamic) => null;
}
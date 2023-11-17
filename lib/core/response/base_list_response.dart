import 'package:movie_app_flutter/core/json/decode_helper.dart';
import '../json/encode_decode.dart';
import '../json/json_list.dart';
import '../json/original_json.dart';

class BaseListResponse<T extends Encodable> extends Encodable{
  BaseListResponse();
  final _status = Interger(key: "status");
  final _perPage = Interger(key: "per_page");
  late final ListJsonObject<T> _data;
  final _nextPageUrl = Stringer(key: "next_page_url");
  final _from = Interger(key: "from");
  final _to = Interger(key: "to");
  final _currentPage = Interger(key: "current_page");

  @override
  List<OriginalJson> properties() {
    return [
      _status,
      _perPage,
      _data,
      _nextPageUrl,
      _from,
      _to,
      _currentPage,
    ];
  }

  BaseListResponse.decodeJson(Map json, Instance<T> instance) {
    _data = ListJsonObject<T>(key: "data", instance: instance);
    values = properties();
    for (var item in values) {
      if (json.containsKey(item.key)) {
        item.value = item.fromJson(json[item.key]);
      }
    }
  }

  @override
  BaseListResponse createInstance() {
    return BaseListResponse();
  }

  int? get currentPage => _currentPage.value;

  get to => _to.value;

  get from => _from.value;

  String? get nextPageUrl => _nextPageUrl.value;

  List<T>? get data => _data.value;

  get perPage => _perPage.value;

  get status => _status.value;
}
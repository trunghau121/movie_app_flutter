import 'package:movie_app_flutter/core/json/decode_helper.dart';
import '../json/encode_decode.dart';
import '../json/json_object.dart';
import '../json/original_json.dart';

class BaseResponse<T extends Encodable> extends Encodable{
  final _status = Interger(key: "status");
  final _perPage = Interger(key: "per_page");
  final _data = JsonObject<T>(key: "data", value: null);
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

  @override
  BaseResponse createInstance() {
    return BaseResponse();
  }

  get currentPage => _currentPage.value;

  get to => _to.value;

  get from => _from.value;

  get nextPageUrl => _nextPageUrl.value;

  get data => _data.value;

  get perPage => _perPage.value;

  get status => _status.value;
}
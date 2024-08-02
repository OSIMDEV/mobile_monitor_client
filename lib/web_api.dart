import 'package:http_client_helper/http_client_helper.dart';
import 'package:mobile_monitor_client/models/post_data.dart';
import 'package:mobile_monitor_client/models/post_data_l.dart';
import 'package:shared_preferences/shared_preferences.dart';

final webService = _WebService();

final class _WebService {
  static const localhost = 'localhost';
  static const ipKey = '_ip';

  Future<String> getIP() async {
    if (localhost == _ip) {
      final sp = await SharedPreferences.getInstance();
      final value = sp.getString(ipKey);
      if (null != value) _ip = value;
    }
    return _ip;
  }

  setIP(String value) async {
    _ip = value;
    final sp = await SharedPreferences.getInstance();
    await sp.setString(ipKey, value);
  }

  String _ip;
  final String _port;

  Future<Uri> get _reqUri async =>
      Uri.parse('http://${await getIP()}:$_port/monitor/callstack');

  _WebService([
    this._ip = 'localhost',
    this._port = '8000',
  ]);

  Future<Response?> post1({
    String type = push,
    String name = '',
  }) async {
    return await post2(PostData(
      type: type,
      name: name,
    ));
  }

  Future<Response?> post2(PostData data) async {
    Response? response;
    try {
      response =
          await HttpClientHelper.post(await _reqUri, body: data.toJson());
    } catch (e) {}
    return response;
  }

  Future<Response?> postl1({
    String type = addAll,
    Iterable<String> names = const [],
  }) async {
    return await postl2(PostDataL(
      type: type,
      names: names,
    ));
  }

  Future<Response?> postl2(PostDataL data) async {
    Response? response;
    try {
      response =
          await HttpClientHelper.post(await _reqUri, body: data.toJson());
    } catch (e) {}
    return response;
  }

  Future<Response?> showToast(String info) async {
    Response? response;
    try {
      response = await HttpClientHelper.post(await _reqUri, body: {
        'type': showToastInfo,
        'info': info,
      });
    } catch (e) {}
    return response;
  }
}

const push = 'push';
const pop = 'pop';
const addAll = 'addAll';
const clear = 'clear';
const load = 'load';
const showToastInfo = 'showToast';
const none = 'none';

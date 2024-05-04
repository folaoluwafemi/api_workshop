import 'dart:convert';

import 'package:api_workshop/examples/basic/data/bored_activity_source.dart';
import 'package:api_workshop/examples/basic/model/bored_info.dart';
import 'package:http/http.dart' as http;

class HttpBoredActivitySource implements BoredActivitySource {
  @override
  Future<BoredActivity> getRandomActivity() async {
    try {
      final url = Uri.parse('https://www.boredapi.com/api/activity/');

      final http.Response response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (!(response.statusCode >= 200 && response.statusCode < 300)) {
        throw 'something';
      }

      final Map<String, dynamic> data = jsonDecode(response.body);

      return BoredActivity.fromMap(data);
    } catch (error, stackTrace) {
      print('stack trace; $stackTrace');

      /// perform magic with [e]
      rethrow;
    }
  }
}

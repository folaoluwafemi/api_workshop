import 'package:api_workshop/examples/basic/data/bored_activity_source.dart';
import 'package:api_workshop/examples/basic/model/bored_info.dart';
import 'package:dio/dio.dart';

class DioBoredActivitySource implements BoredActivitySource {
  @override
  Future<BoredActivity> getRandomActivity() async {
    try {
      final client = Dio();

      final Response response = await client.get(
        'https://www.boredapi.com/api/activity/',
      );

      final Map<String, dynamic> data =
          (response.data as Map).cast<String, dynamic>();

      return BoredActivity.fromMap(data);
    } on TypeError catch (e) {
      throw 'Wrong data';
    } on DioException catch (e) {
      rethrow;
    }
  }
}

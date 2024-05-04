import 'package:api_workshop/examples/basic/model/bored_info.dart';

abstract interface class BoredActivitySource {
  Future<BoredActivity> getRandomActivity();
}

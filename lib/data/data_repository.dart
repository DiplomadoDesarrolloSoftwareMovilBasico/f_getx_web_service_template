import 'remote/guardian_client.dart';
import 'model/news_item.dart';

class DataRepository {
  late TheGuardianClient client;
  static const apikey = "ead4c24f-a4ae-4d1a-85e6-7149b638c779";

  DataRepository() {
    client = TheGuardianClient(apikey);
  }

  Future<List<NewsItem>> getItems(String topic) async {
    return await client.getItems(topic);
  }
}

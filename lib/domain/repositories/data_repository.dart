import 'remote/guardian_client.dart';
import 'model/news_item.dart';
import '../common/configuration.dart';

class DataRepository {
  late TheGuardianClient client;

  DataRepository() {
    client = TheGuardianClient(Configuration.theGuardianDeveloperKey);
  }

  Future<List<NewsItem>> getItems(String topic) async {
    return await client.getItems(topic);
  }
}

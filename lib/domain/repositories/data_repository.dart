import '../../common/configuration.dart';
import '../../data/model/news_item.dart';
import '../../data/remote/guardian_client.dart';

class DataRepository {
  late TheGuardianClient client;

  DataRepository() {
    client = TheGuardianClient(Configuration.theGuardianDeveloperKey);
  }

  Future<List<NewsItem>> getItems(String topic) async {
    return await client.getItems(topic);
  }
}

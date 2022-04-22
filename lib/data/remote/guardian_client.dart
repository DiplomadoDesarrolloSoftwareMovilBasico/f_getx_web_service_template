import 'dart:convert';
import 'package:loggy/loggy.dart';
import '../model/news_item.dart';
import 'package:http/http.dart' as http;

class TheGuardianClient {
  static const baseUrl = "https://content.guardianapis.com";
  static const apiKeyParam = "";
  static const queryParam = "q";
  final String apikey;
  TheGuardianClient(this.apikey);

  Future<List<NewsItem>> getItems(String topic) async {
    var uri = Uri.parse("https://content.guardianapis.com/search")
        .resolveUri(Uri(queryParameters: {
      "api-key": apikey,
      "q": topic,
    }));

    logInfo('Client getItems URI ${uri.toString()}');

    try {
      final response = await http.get(uri).timeout(Duration(seconds: 1));
      if (response.statusCode == 200) {
        logInfo("Got code 200");
        var jsonResponse = json.decode(utf8.decode(response.bodyBytes));
        int itemCount = jsonResponse['response']['total'];
        logInfo("We got $itemCount items");

        if (itemCount == 0) {
          logError("get got nothing");
          return [];
        }

        List<NewsItem> output = [];
        for (var item in jsonResponse['response']['results']) {
          output.add(NewsItem.fromJson(item));
        }
        logInfo("Client return ok");
        return Future.value(output);
      } else {
        logError('Client error ${response.statusCode}');
        return Future.error([]);
      }
    } catch (e) {
      logError('Client error Timeout');
      return Future.error('Client error Timeout');
    }
  }
}

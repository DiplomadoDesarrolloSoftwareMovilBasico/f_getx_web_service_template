import 'package:f_web_service_template/data/model/news_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailPage extends StatefulWidget {
  const NewsDetailPage({Key? key}) : super(key: key);

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    NewsItem details = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(details.webTitle!),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: details.webUrl!,
            onProgress: (int progress) {
              logInfo('WebView is loading (progress : $progress%)');
            },
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(),
        ],
      ),
    );
  }
}

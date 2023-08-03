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
  late final WebViewController controller;
  late NewsItem details;
  @override
  void initState() {
    super.initState();
    details = Get.arguments;
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(details.webUrl!),
      );
  }

  @override
  Widget build(BuildContext context) {
    NewsItem details = Get.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text(details.webTitle!),
        ),
        body: WebViewWidget(
          controller: controller,
        ));
  }
}

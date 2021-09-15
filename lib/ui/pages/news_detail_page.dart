import 'package:f_web_service_template/data/model/news_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsItem details = Get.arguments;
    return Scaffold(
        body: Center(
      child: Text(details.webTitle!),
    ));
  }
}

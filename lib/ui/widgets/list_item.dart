import 'package:f_web_service_template/common/constants.dart';
import 'package:f_web_service_template/data/model/news_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItem extends StatelessWidget {
  final NewsItem news;
  ListItem(this.news);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.album),
              title: Text(news.webTitle!),
              subtitle: Text(news.sectionName!),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed(DETAIL_ROUTE, arguments: news);
              },
              child: Text("Read more"),
            )
          ],
        ),
      ),
    );
  }
}

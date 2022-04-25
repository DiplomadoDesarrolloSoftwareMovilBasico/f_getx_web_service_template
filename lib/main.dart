import 'package:f_web_service_template/domain/repositories/data_repository.dart';
import 'package:f_web_service_template/ui/controllers/news_controller.dart';
import 'package:f_web_service_template/ui/my_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import 'domain/use_case/news.dart';

void main() {
  // add reposiroty, user case and repository to DI
  Get.put(DataRepository());
  Get.put(News());
  Get.put(NewsController());

  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(
      showColors: true,
    ),
  );
  runApp(const MyApp());
}

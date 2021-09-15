import 'package:f_getx_news_reader/data/data_repository.dart';
import 'package:f_getx_news_reader/domain/controllers/news_controller.dart';
import 'package:f_getx_news_reader/domain/use_case/news.dart';
import 'package:f_getx_news_reader/ui/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:integration_test/integration_test.dart';
import 'package:loggy/loggy.dart';

Future<Widget> createHomeScreen() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(DataRepository());
  Get.put(News());
  Get.put(NewsController());
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(
      showColors: true,
    ),
  );
  return MyApp();
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Complete test", (WidgetTester tester) async {
    Widget w = await createHomeScreen();
    await tester.pumpWidget(w);

    expect(find.byKey(Key('footballNewsButton')), findsOneWidget);

    await tester.tap(find.byKey(Key('footballNewsButton')));

    await tester.pumpAndSettle();

    expect(find.byKey(Key('readMoreButton')), findsWidgets);
  });
}

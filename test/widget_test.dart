// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:f_web_service_template/data/model/news_item.dart';
import 'package:f_web_service_template/ui/controllers/news_controller.dart';
import 'package:f_web_service_template/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:mockito/mockito.dart';

class MockNewsController extends GetxService
    with Mock
    implements NewsController {
  var _news = <NewsItem>[].obs;
  var _loading = false.obs;

  @override
  List<NewsItem> get news => _news;
  @override
  bool get loading => _loading.value;

  @override
  Future<String> getNews() async {
    NewsItem newsItem = NewsItem(
        id: '0',
        type: 'type',
        sectionId: 'sectionId',
        sectionName: 'sectionName',
        webPublicationDate: 'webPublicationDate',
        webTitle: 'webTitle',
        webUrl: 'webUrl',
        apiUrl: 'apiUrl',
        isHosted: true,
        pillarId: 'pillarId',
        pillarName: 'pillarName');
    _news.add(newsItem);
    return Future.value('ok');
  }

  @override
  Future<void> reset() async {
    _news.value = [];
  }
}

Future<Widget> createHomeScreen() async {
  WidgetsFlutterBinding.ensureInitialized();
  MockNewsController mockNewsController = MockNewsController();
  Get.put<NewsController>(mockNewsController);
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(
      showColors: true,
    ),
  );
  return const GetMaterialApp(home: HomePage());
}

void main() {
  testWidgets('News widget', (WidgetTester tester) async {
    Widget w = await createHomeScreen();
    await tester.pumpWidget(w);

    expect(find.byKey(const Key('sportNewsButton')), findsOneWidget);

    await tester.tap(find.byKey(const Key('sportNewsButton')));

    await tester.pumpAndSettle();

    expect(find.byKey(const Key('readMoreButton')), findsWidgets);

    // // Therefore: (The command Offset uses Cartesian 'directions') - lets see: a) Left Dragging: Offset(-500.0, 0.0) b) Right Dragging: Offset(+500.0, 0.0) c) Up Dragging: Offset(0.0, +500.0) d) Down Dragging: Offset(0.0, -500.0)
    await tester.drag(
        find.byKey(const Key('refreshList')), const Offset(0.0, 500.0));

    await tester.pumpAndSettle();

    await tester.pumpAndSettle();

    expect(find.byKey(const Key('readMoreButton')), findsWidgets);

    await tester.drag(
        find.byKey(const Key('dragToResetGesture')), const Offset(500.0, 0.0));

    await tester.pumpAndSettle();

    await tester.pumpAndSettle();

    expect(find.byKey(const Key('readMoreButton')), findsNothing);
  });
}

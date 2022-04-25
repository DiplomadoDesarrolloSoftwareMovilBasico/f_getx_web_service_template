import 'package:f_web_service_template/domain/repositories/data_repository.dart';
import 'package:f_web_service_template/domain/use_case/news.dart';
import 'package:f_web_service_template/ui/controllers/news_controller.dart';
import 'package:f_web_service_template/ui/my_app.dart';
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

    expect(find.byKey(const Key('footballNewsButton')), findsOneWidget);

    await tester.tap(find.byKey(const Key('footballNewsButton')));

    await tester.pumpAndSettle();

    expect(find.byKey(const Key('readMoreButton')), findsWidgets);

    // Therefore: (The command Offset uses Cartesian 'directions') - lets see: a) Left Dragging: Offset(-500.0, 0.0) b) Right Dragging: Offset(+500.0, 0.0) c) Up Dragging: Offset(0.0, +500.0) d) Down Dragging: Offset(0.0, -500.0)
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

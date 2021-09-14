import 'package:f_web_service_template/ui/widgets/list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadedView extends StatelessWidget {
  const LoadedView({Key? key}) : super(key: key);

  Future _refreshList(BuildContext context) async {
    // here call showNews on the controller
  }

  @override
  Widget build(BuildContext context) {
    List<ListItem> items = [];

    // for (var news in <some state holder>.news) {
    //   items.add(ListItem(news));
    // }

    return Expanded(
      child: GestureDetector(
        onHorizontalDragEnd: (details) {
          // here call reset on the controller
        },
        child: RefreshIndicator(
          child: ListView(
            children: items,
          ),
          onRefresh: () => _refreshList(context),
        ),
      ),
    );
  }
}

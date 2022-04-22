import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

class EmptyNews extends StatelessWidget {
  const EmptyNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () {
            logInfo("getting news");
          },
          child: const Text("Sport news"),
        ),
      ],
    ));
  }
}

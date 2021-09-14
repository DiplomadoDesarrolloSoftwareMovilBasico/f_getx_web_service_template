import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () {
            print("getting news");
          },
          child: Text("Football news"),
        ),
      ],
    ));
  }
}

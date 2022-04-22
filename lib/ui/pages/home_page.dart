import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'empy_view.dart';
import 'loaded_view.dart';
import 'loading_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 22, right: 2, left: 2),
        child: Column(
          children: [
            const Image(image: AssetImage("assets/images/logo.png")),
            Container(child: Text('Logic goes here'))
          ],
        ),
      ),
    );
  }
}


// basic logic
// if (loading) { LoadingView() } else {               
//   if (isEmpty) {    
//     print('Home -> Empty list');
//     EmptyNews();
//   } else {
//     print('Home -> List with Data');
//     LoadedView();
//   }
// }
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:splashscreen/message_page.dart';
import 'package:splashscreen/wishes_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // List wishes = [
  //   "BIRTHDAY WISHES",
  //   "ANNIVERSARY WISHES",
  //   "EID WISHES",
  //   "MOTHERS DAY WISHES",
  //   "FRIENDSHIP WISHES"
  // ];

  @override
  Widget build(BuildContext context) {
    List unique = [];
    Set afterSet = {};
    for (var element in wishes) {
      afterSet.add(element.category);
    }

    unique = afterSet.toList(growable: true);
    print(unique);

    // unique = unique.toSet().toList();
    return Scaffold(
      body: GridView.builder(
        itemCount: unique.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (c, i) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 5,
                      spreadRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ]),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (() {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return MessagesPage(unique[i]);
                        },
                      ));
                    }),
                    child: Text(
                      unique[i],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'dart:math';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class DetailMessagePage extends StatelessWidget {
  String? detailMess;

  DetailMessagePage({this.detailMess});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 250,
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      detailMess!,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            IconButton(
              onPressed: () {
                Share.share(detailMess!);
              },
              iconSize: 40,
              icon: const Icon(Icons.share),
            ),
            IconButton(
              onPressed: () {
                FlutterClipboard.copy(detailMess!).whenComplete(() =>
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text("Copied"))));
              },
              iconSize: 40,
              icon: const Icon(Icons.copy),
            )
          ])
        ],
      ),
    );
  }
}

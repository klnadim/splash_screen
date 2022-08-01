import 'dart:math';

import 'package:flutter/material.dart';
import 'package:splashscreen/details_page.dart';
import 'package:splashscreen/wishes_model.dart';

class MessagesPage extends StatelessWidget {
  String? wishesTitle;

  MessagesPage(this.wishesTitle, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(wishesTitle!),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: wishes
              .where((element) => element.category == wishesTitle)
              .map((e) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.primaries[
                              Random().nextInt(Colors.primaries.length)],
                          borderRadius: const BorderRadius.horizontal(
                              left: Radius.elliptical(10, 5),
                              right: Radius.elliptical(10, 5)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 5,
                              spreadRadius: 5,
                              offset: const Offset(0, 2),
                            ),
                          ]),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return DetailMessagePage(
                                detailMess: e.messages,
                              );
                            },
                          ));
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(e.messages!),
                          ),
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

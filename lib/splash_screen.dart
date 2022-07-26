import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:splashscreen/main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MainPage(),
          ));
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    int newTime = int.parse(DateFormat('kk').format(date));

    String title = "";

    if (newTime < 12) {
      title = "Good Morning";
    } else if (newTime > 12 && newTime < 16) {
      title = "Good AfterNoon";
    } else if (newTime >= 16 && newTime < 21) {
      title = "Good Evening";
    }

    print(newTime);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello"),
      ),
      body: Center(
        child: Column(
          children: [
            Center(
              child: Text(
                title,
                style: const TextStyle(fontFamily: 'gladden', fontSize: 45),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

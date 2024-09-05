import 'package:flutter/material.dart';
import 'package:notification_and_analytics_demo/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            try {
              analytics!.logEvent(
                name: 'Click_Comment',
                parameters: {
                  'firebase': "click",
                },
              );
              print("succesfully");
            } catch (e) {
              print(e);
            }
          },
          child: Container(
              height: 50,
              margin: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(8)),
              child: const Center(
                  child: Text(
                "Click Me For Event",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ))),
        ),
      ),
    );
  }
}

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notification_and_analytics_demo/view/home_page.dart';
import 'package:notification_and_analytics_demo/view/notification.dart';
import 'package:notification_and_analytics_demo/widgest/firebase_option.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  analytics = FirebaseAnalytics.instance;

  observer = FirebaseAnalyticsObserver(
      analytics: analytics!,
      onError: (e) {
        print(e);
      });

  await notificationFn();
  runApp(const MyApp());
}

FirebaseAnalytics? analytics;
FirebaseAnalyticsObserver? observer;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

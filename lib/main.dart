import 'package:expense_tracker/firebase_options.dart';
import 'package:expense_tracker/screens/auth/signin.dart';
import 'package:expense_tracker/screens/auth/signup.dart';
import 'package:expense_tracker/screens/expenses/expense.dart';
import 'package:expense_tracker/screens/expenses/income.dart';
import 'package:expense_tracker/screens/home/home.dart';
import 'package:expense_tracker/screens/home/pages.dart';
import 'package:expense_tracker/screens/onboard/splash.dart';
import 'package:expense_tracker/screens/onboard/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


// ...

await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  await Hive.initFlutter();
  await Hive.openBox('shopping_box');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: splash(),
        routes: {
          '/signin': (context) => signin(),
          '/signup': (context) => signup(),
          '/welcome': (context) => welcome(),
          '/pages': (context) => pages(),
          '/income': (context) => income(),
          '/expense': (context) => expense(),
        });
  }
}
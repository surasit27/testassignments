import 'package:flutter/material.dart';
import 'package:testassignments/page/home.dart';
import 'package:testassignments/utils/constant.dart';

final Map<String, WidgetBuilder> map = {
  '/home': (BuildContext context) => Home(),
};

String? initlalRoute;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initlalRoute = Constant.routeHome;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constant.appName,
      routes: map,
      initialRoute: initlalRoute,
    );
  }
}

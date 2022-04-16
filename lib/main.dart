import 'package:flutter/material.dart';

import './Screens/loading_screen.dart';
import './Screens/home.dart';
import './Screens/select_region.dart';
import './Screens/loading_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoadinScreen.routeName,
      debugShowCheckedModeBanner: false,
      routes: {
        LoadinScreen.routeName: (context) => const LoadinScreen(),
        Home.routeName: (context) => const Home(),
        SelectRegion.routeName: (context) => const SelectRegion(),
        LoadingData.routeName: (context) => const LoadingData()
      },
    );
  }
}

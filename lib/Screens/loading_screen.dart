import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../APIs/regions.dart';
import './home.dart';

class LoadinScreen extends StatefulWidget {
  const LoadinScreen({Key? key}) : super(key: key);

  static const String routeName = 'Loading_route';

  @override
  State<LoadinScreen> createState() => _LoadinScreenState();
}

class _LoadinScreenState extends State<LoadinScreen> {
  void fetch() async {
    var r = RegioApi();
    await r.fetchRegions();
    await r.fetchRegion("Africa/Casablanca");
    Navigator.of(context).pushReplacementNamed(Home.routeName, arguments: r);
  }

  @override
  void initState() {
    fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'By Ennachat Redwan',
            style: TextStyle(color: Colors.blue, fontSize: 20),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: const SpinKitDualRing(
              color: Colors.blue,
              size: 50.0,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../APIs/regions.dart';
import './select_region.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextStyle textStyle(Color color, int size) {
    return TextStyle(
        color: color, fontSize: size * MediaQuery.of(context).textScaleFactor);
  }

  bool fetched = false;

  late RegioApi api = RegioApi();

  @override
  Widget build(BuildContext context) {
    if (!fetched) {
      api = ModalRoute.of(context)!.settings.arguments as RegioApi;
      fetched = true;
    }
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: (api.inthour >= 7 && api.inthour < 19)
                  ? const AssetImage('assets/images/day.jpg')
                  : const AssetImage('assets/images/night.jpg'),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                api.hour,
                style: textStyle(Colors.white, 50),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                api.location,
                style: textStyle(Colors.white, 20),
              ),
              Text(
                api.date,
                style: textStyle(Colors.white, 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'By Ennachat Redwan',
                style: textStyle(Colors.white, 15),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          RegioApi a = api;
          await Navigator.of(context)
              .pushNamed(SelectRegion.routeName, arguments: api)
              .then((value) => {
                    if (value != null) {a = value as RegioApi}
                  });
          setState(() {
            api = a;
          });
        },
        child: const Icon(Icons.location_on_rounded),
      ),
    );
  }
}

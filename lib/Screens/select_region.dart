import 'package:flutter/material.dart';

import '../Widgets/region_item.dart';
import '../APIs/regions.dart';

class SelectRegion extends StatefulWidget {
  const SelectRegion({Key? key}) : super(key: key);

  static const String routeName = '/select_region';

  @override
  State<SelectRegion> createState() => _SelectRegionState();
}

class _SelectRegionState extends State<SelectRegion> {
  List<String> regions = [];
  String region = "all";

  @override
  Widget build(BuildContext context) {
    RegioApi api = ModalRoute.of(context)!.settings.arguments as RegioApi;
    regions = api.getRegions(region);
    return Scaffold(
      appBar: AppBar(title: const Text('Select your location')),
      body: Column(children: [
        Container(
          margin: const EdgeInsets.all(8),
          child: TextField(
            onChanged: (value) {
              setState(() {
                if (value == '') {
                  region = 'all';
                } else {
                  region = value;
                }
              });
            },
            decoration: const InputDecoration(
              labelText: 'Search for a region',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 3),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 3),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemBuilder: ((context, index) =>
                  RegionItem(region: regions[index])),
              itemCount: regions.length),
        )
      ]),
    );
  }
}

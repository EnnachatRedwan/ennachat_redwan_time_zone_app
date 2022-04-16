import 'package:flutter/material.dart';

import '../APIs/regions.dart';
import '../Screens/loading_data.dart';

class RegionItem extends StatelessWidget {
  const RegionItem({Key? key, required this.region}) : super(key: key);

  final String region;

  void fetch(BuildContext context, String region) async {
    Navigator.of(context).pushNamed(LoadingData.routeName);
    var r = RegioApi();
    await r.fetchRegions();
    await r.fetchRegion(region);
    Navigator.of(context).pop();
    Navigator.of(context).pop(r);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => fetch(context, region),
      child: ListTile(
        title: Text(region),
      ),
    );
  }
}

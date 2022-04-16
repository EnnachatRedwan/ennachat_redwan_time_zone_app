import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class RegioApi {
  final List<String> _regions = [];
  late String hour;
  late String utc_offset;
  late String date;
  late String location;
  late int inthour;
  String regionsUri = "http://worldtimeapi.org/api/timezone/";

  Future<void> fetchRegions() async {
    var uri = Uri.parse(regionsUri);
    var response = await http.get(uri);
    List<dynamic> jsonResponse = [];
    jsonResponse = jsonDecode(response.body);
    if (jsonResponse.isNotEmpty) {
      for (var element in jsonResponse) {
        _regions.add(element!.toString());
      }
    }
  }

  Future<void> fetchRegion(String region) async {
    var uri = Uri.parse(regionsUri + region);
    var response = await http.get(uri);
    var jsonData = jsonDecode(response.body);
    utc_offset = jsonData["utc_offset"];
    hour = DateFormat.jm().format(
        DateTime.parse(jsonData["utc_datetime"].toString())
            .add(Duration(hours: getUtcOffset(utc_offset))));
    date = DateFormat.yMMMMd()
        .format(DateTime.parse(jsonData["utc_datetime"].toString()));
    location = region;
    inthour = int.parse(DateFormat(DateFormat.HOUR24).format(
        DateTime.parse(jsonData["utc_datetime"].toString())
            .add(Duration(hours: getUtcOffset(utc_offset)))));
  }

  int getUtcOffset(String utc) {
    String signe = utc[0];
    int value = int.parse(utc[1] + utc[2]);
    if (signe == '+') {
      return value;
    } else {
      return -value;
    }
  }

  List<String> getRegions(String sub) {
    if (sub == 'all') {
      return _regions;
    } else {
      List<String> regions = [];
      regions = _regions
          .where((element) => element.toLowerCase().contains(sub.toLowerCase()))
          .toList();
      return regions;
    }
  }
}

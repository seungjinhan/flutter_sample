import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String apiKey = '';
  static const nycLat = 40.7484445;
  static const nycLng = -73.9878531;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(51.5160895, -0.1294527),
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController gbc) {}
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    print(await searchNearBy("seoul"));
  }

  Future<List<String>> searchNearBy(String kw) async {
    var dio = Dio();
    var url = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json';
    var param = {
      'key': apiKey,
      'location': '$nycLat,$nycLng',
      'radius': '800',
      'keyword': kw,
    };

    var res = await dio.get(url, queryParameters: param);
    return res.data['results']
        .map<String>((res) => res['name'].toString())
        .toList();
  }
}

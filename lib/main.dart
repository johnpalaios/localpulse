import 'dart:developer';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart'; // Suitable for most situations
import 'package:flutter_map/plugin_api.dart'; // Only import if required functionality is not exposed by default
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

MapController _mapController = MapController();
LatLng centerLatLng = LatLng(36.7525, 3.04);

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Local Pulse',
        theme: ThemeData(
          primarySwatch: Colors.lime,
        ),
        home: const HomePage(),
        debugShowCheckedModeBanner: false);
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
        },
        ),
      body: const HomePageMap(),
    );
  }
}

class HomePageMap extends StatefulWidget {
  const HomePageMap({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageMapState();
}

class _HomePageMapState extends State<HomePageMap> {

  @override 
  void initState() {
    super.initState();
    PositionMethods._getCurrentPosition().then((_) => _mapController.move(centerLatLng, 12));
  }
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(centerLatLng.latitude, centerLatLng.longitude),
        zoom: 9.2,
      ),
      mapController: _mapController,
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.localpulse.app',
        ),
      ]
    );
  }
}

class PositionMethods {
    static Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (hasPermission == false) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation)
        .then((Position position) {
      centerLatLng = LatLng(position.latitude, position.longitude);
    }).catchError((e) {
      debugPrint(e);
    });
  }
  static Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
        return false;
    }
    return true;
  }
}






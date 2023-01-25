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
  
  void _showOverlay(BuildContext context) async {
    OverlayState? overlayState = Overlay.of(context);
    OverlayEntry overlay1;
    final _formKey = GlobalKey<FormState>();
    overlay1 = OverlayEntry(builder: (context) {
      return Scaffold(
        body: Container(
          alignment: AlignmentDirectional.centerStart,
          padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.1),
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          color: Colors.green.withOpacity(0.5),
          child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
            TextFormField(
              decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: "Enter Event's Name",
              labelText: "Event Name")
            ),
            TextFormField(
              decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: "Description",
              labelText: "Enter the Event's description"),
              maxLines: 10,
              minLines: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: "Location",
              labelText: "Enter the Event's address")
            ),
            TextFormField(
              decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: "Date",
              labelText: "mm/dd/yyyy")
            ),
            TextFormField(
              decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: "Time",
              labelText: "Enter the Event's time")
            ),
            Row(children: [
              ElevatedButton(
              onPressed: () {print("Cancel");},
              child: const Text('Cancel')
            ),
            ElevatedButton(
              
              onPressed: () {print("Submitted");},
              child: const Text('Submit')
            )],)
            
            ],
          ),
        )
      ));
    });
    overlayState?.insert(overlay1);
    // overlay1.remove();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
            _showOverlay(context);
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




//import 'dart:developer';
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart'; // Suitable for most situations
import 'package:flutter_map/plugin_api.dart'; // Only import if required functionality is not exposed by default
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

MapController _mapController = MapController();
LatLng centerLatLng = LatLng(36.7525, 3.04);
//import 'package:localpulse/add_event.dart';

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
          //primarySwatch: Colors.whit
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
  /*void _showOverlay(BuildContext context) async {
    OverlayState? overlayState = Overlay.of(context);
    OverlayEntry overlay1;
    final _formKey = GlobalKey<FormState>();
    overlay1 = OverlayEntry(builder: (context) {
      return AlertDialog(
         content: Container(
          alignment: AlignmentDirectional.centerStart,
          padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.1),
          //width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          color: Color.fromARGB(255, 9, 53, 69),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  style: TextStyle(color: Colors.white70),
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  minLines: 1,
                  decoration: const InputDecoration(
                    fillColor: Colors.white70,
                    icon: Icon(Icons.person, size: 25,color:Colors.white54),
                    contentPadding: EdgeInsets.only(left:10),
                    hintText: "Enter Event's Name",
                    labelText: "Event Name",
                    labelStyle: TextStyle(color:Colors.white38, fontSize: 12, fontWeight: FontWeight.w500 ),
                    hintStyle: TextStyle(color:Colors.white70, fontSize: 18, fontWeight: FontWeight.w500 )
                  )
                  ),
                TextFormField(
                  style: TextStyle(color: Colors.white70),
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.description, size: 25, color: Colors.white70),
                    contentPadding: EdgeInsets.only(left:10),
                    hintText: "Description",
                    hintStyle: TextStyle(color:Colors.white70, fontSize: 18, fontWeight: FontWeight.w500 ),
                    labelText: "Enter the Event's description",
                    labelStyle: TextStyle(color:Colors.white38, fontSize: 12, fontWeight: FontWeight.w500 ),
                    ),
                  maxLines: 10,
                  minLines: 5,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white70),
                  keyboardType: TextInputType.multiline,
                  maxLines: 2,
                  minLines: 1,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.location_pin, size: 25, color: Colors.white70),
                    contentPadding: EdgeInsets.only(left:10),
                    hintStyle: TextStyle(color:Colors.white70, fontSize: 18, fontWeight: FontWeight.w500 ),
                    hintText: "Location",
                    labelText: "Enter the Event's address",
                    labelStyle: TextStyle(color:Colors.white38, fontSize: 12, fontWeight: FontWeight.w500 ))),
                TextFormField(
                  style: TextStyle(color: Colors.white70),
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.date_range, size: 25, color: Colors.white70),
                    contentPadding: EdgeInsets.only(left:10),
                    hintStyle: TextStyle(color:Colors.white70, fontSize: 18, fontWeight: FontWeight.w500 ),
                    hintText: "Date",
                    labelStyle: TextStyle(color:Colors.white38, fontSize: 12, fontWeight: FontWeight.w500 ),
                    labelText: "mm/dd/yyyy")),
                TextFormField(
                  style: TextStyle(color: Colors.white70),
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.alarm, size: 25, color: Colors.white70),
                    contentPadding: EdgeInsets.only(left:10),
                    labelStyle: TextStyle(color:Colors.white38, fontSize: 12, fontWeight: FontWeight.w500 ),
                    hintStyle: TextStyle(color:Colors.white70, fontSize: 18, fontWeight: FontWeight.w500 ),
                    hintText: "Time",
                    labelText: "Enter the Event's time")),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      alignment: AlignmentDirectional.centerEnd,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      margin: const EdgeInsets.all(50),
                      child: ElevatedButton(
                        onPressed: () {
                          print("Cancelled");
                        },
                        child: const Text('Cancel'))),
                        Container(
                          alignment: AlignmentDirectional.bottomEnd,
                          margin: const EdgeInsets.all(40),
                          child: ElevatedButton(
                            onPressed: () {
                              print("Submitted");
                            },
                            child: const Text('Submit')))
                  ],
                )
              ],
            ),
          )));
  });
  overlayState?.insert(overlay1);
  // overlay1.remove();
  }*/

  
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          //leading: ,
          actions: [
            IconButton(
              onPressed: (null), 
              icon: Image.asset('assets/Icons/Photo camera.png'),
              iconSize: 48.0,
              tooltip: 'Camera',
              ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: PopupMenuButton<int>(
            elevation: 1,
            iconSize: 2,
            icon:     Image.asset('assets/Icons/Variant2.png'),// image for profile
            itemBuilder: ((context) => <PopupMenuEntry<int>>[
              const PopupMenuItem(
                child: ListTile(
                  //selectedColor: Color.fromARGB(221, 114, 151, 164) ,
                  title: Text('Events'),
                )),
                const PopupMenuItem(
                child: ListTile(
                  //selectedColor: Color.fromARGB(221, 114, 151, 164) ,
                  title: Text('Edit Profile'),
                )),
                const PopupMenuItem(
                child: ListTile(
                  //selectedColor: Color.fromARGB(221, 114, 151, 164) ,
                  title:  Text('Settings'),
                )),
                const PopupMenuItem(
                child: ListTile(
                  //selectedColor: Color.fromARGB(221, 114, 151, 164) ,
                  title: Text('Logout'),
                )),
            ]),
            //onSelected: (){},
          )
        ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add event',
        backgroundColor: const  Color.fromARGB(255, 3, 7, 30),
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
              barrierColor: const Color.fromARGB(93, 0, 0, 0),
              context: context,
               builder: (BuildContext context) {
                   //_showOverlay(context);
                   return  AlertDialog(
                    contentPadding: EdgeInsets.zero,
                    content: Container(
                      color: const Color.fromARGB(255, 12, 73, 95),                     
                      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.1),
                      //width: MediaQuery.of(context).size.width * 0.8,
                      //height: MediaQuery.of(context).size.height * 0.8,
                      
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            TextFormField(
                              style: const TextStyle(color: Colors.white70),
                              keyboardType: TextInputType.multiline,
                              maxLines: 2,
                              minLines: 1,
                              decoration: const InputDecoration(
                                fillColor: Colors.white70,
                                icon: Icon(Icons.person, size: 25,color:Colors.white54),
                                contentPadding: EdgeInsets.only(left:10),
                                hintText: "Enter Event's Name",
                                labelText: "Event Name",
                                labelStyle: TextStyle(color:Colors.white38, fontSize: 12, fontWeight: FontWeight.w500 ),
                                hintStyle: TextStyle(color:Colors.white70, fontSize: 18, fontWeight: FontWeight.w500 )
                              )
                              ),
                            TextFormField(
                              style: const TextStyle(color: Colors.white70),
                              keyboardType: TextInputType.multiline,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.description, size: 25, color: Colors.white70),
                                contentPadding: EdgeInsets.only(left:10),
                                hintText: "Description",
                                hintStyle: TextStyle(color:Colors.white70, fontSize: 18, fontWeight: FontWeight.w500 ),
                                labelText: "Enter the Event's description",
                                labelStyle: TextStyle(color:Colors.white38, fontSize: 12, fontWeight: FontWeight.w500 ),
                                ),
                              maxLines: 10,
                              minLines: 5,
                            ),
                            TextFormField(
                              style: const TextStyle(color: Colors.white70),
                              keyboardType: TextInputType.multiline,
                              maxLines: 2,
                              minLines: 1,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.location_pin, size: 25, color: Colors.white70),
                                contentPadding: EdgeInsets.only(left:10),
                                hintStyle: TextStyle(color:Colors.white70, fontSize: 18, fontWeight: FontWeight.w500 ),
                                hintText: "Location",
                                labelText: "Enter the Event's address",
                                labelStyle: TextStyle(color:Colors.white38, fontSize: 12, fontWeight: FontWeight.w500 ))),
                            TextFormField(
                              style: const TextStyle(color: Colors.white70),
                              keyboardType: TextInputType.multiline,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.date_range, size: 25, color: Colors.white70),
                                contentPadding: EdgeInsets.only(left:10),
                                hintStyle: TextStyle(color:Colors.white70, fontSize: 18, fontWeight: FontWeight.w500 ),
                                hintText: "Date",
                                labelStyle: TextStyle(color:Colors.white38, fontSize: 12, fontWeight: FontWeight.w500 ),
                                labelText: "mm/dd/yyyy")),
                            TextFormField(
                              style: const TextStyle(color: Colors.white70),
                              keyboardType: TextInputType.multiline,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.alarm, size: 25, color: Colors.white70),
                                contentPadding: EdgeInsets.only(left:10),
                                labelStyle: TextStyle(color:Colors.white38, fontSize: 12, fontWeight: FontWeight.w500 ),
                                hintStyle: TextStyle(color:Colors.white70, fontSize: 18, fontWeight: FontWeight.w500 ),
                                hintText: "Time",
                                labelText: "Enter the Event's time")),
                            Row(
                              children: [
                                Expanded (
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: TextButton(
                                //padding: EdgeInsets.zero,
                                      child: Container(
                                        width:MediaQuery.of(context).size.width,
                                        height: 30,
                                        decoration: const BoxDecoration(
                                          //borderRadius: BorderRadius.circular(10),
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                            Color.fromARGB(149, 18, 109, 142),
                                            Color.fromARGB(249, 20, 117, 152),
                                            ]
                                          )
                                        ),
                                        child: const Center(child: Text("Cancel", style: TextStyle(color:Color.fromARGB(200, 255, 255, 255), fontSize: 20, fontWeight: FontWeight.w800),)),
                                      ),
                                      onPressed: () => Navigator.pop(context,true)
                                    ),
                                  )
                                ),
                          
                                  /*if (_formKey.currentState.validate()) {
                                    _formKey.currentState.save();
                                  }*/
                                
                              //),
                           // ),
                            //),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: TextButton(
                                    //padding: EdgeInsets.zero,
                                      child: Container(
                                        width:MediaQuery.of(context).size.width,
                                        height: 30,
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                             Color.fromARGB(149, 18, 109, 142),
                                             Color.fromARGB(249, 20, 117, 152),
                                            ]
                                          )
                                        ),
                                        child: const Center(child: Text("Submit", style: TextStyle(color:Color.fromARGB(200, 255, 255, 255), fontSize: 20, fontWeight: FontWeight.w800),)),
                                      ),
                                      onPressed: () {
                                  /*if (_formKey.currentState.validate()) {
                                    _formKey.currentState.save();
                                  }*/
                                      },
                                    ),
                                  )
                                )
                              ]
                            )
                           ],
                          ),
                        )));
              }
          );
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
    PositionMethods._getCurrentPosition()
        .then((_) => _mapController.move(centerLatLng, 12));
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
        ]);
  }
}

class PositionMethods {
  static Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (hasPermission == false) return;
    await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.bestForNavigation)
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

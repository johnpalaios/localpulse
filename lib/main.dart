import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart'; // Suitable for most situations
import 'package:flutter_map/plugin_api.dart'; // Only import if required functionality is not exposed by default
import 'package:latlong2/latlong.dart';
//import 'package:localpulse/add_event.dart';

void main() {
  runApp(
    const MaterialApp(home: LocalPulse()), // use MaterialApp
  );
}
class LocalPulse extends StatefulWidget {
  const LocalPulse({Key? key}) : super(key: key);

  @override
    State<LocalPulse> createState() => _LocalPulseState();
}
class _LocalPulseState extends State<LocalPulse> {
  
  @override
  Widget build(BuildContext context) {
    return  MaterialApp( home: const   HomePage(),
  );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  //_HomePageState 
  State <HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  final mapController = MapController();
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
              tooltip: 'Camera',
              ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: PopupMenuButton<int>(
            elevation: 1,
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
       // bottomNavigationBar: () {},
        
        floatingActionButton: FloatingActionButton(
          tooltip: 'Add event',
          onPressed: () {
            showDialog(
              barrierColor: Colors.transparent,
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  iconColor: Color.fromARGB(137, 190, 44, 44),
                  contentPadding: EdgeInsets.zero,
                  content: Stack(
                    fit:StackFit.expand ,
                    //overflow: Overflow.visible,
                    children: <Widget>[
                      Positioned(
                        right: -15.0,
                        top: -15.0,
                        child: InkResponse(
                          hoverColor: Colors.blue,
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: CircleAvatar(
                            radius: 25,
                            child: Icon(Icons.close, size: 50),
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.redAccent,
                          ),
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              height: 35,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                              color: Color.fromARGB(255, 9, 53, 69),
                              border: Border(
                                  bottom: BorderSide(color: Color.fromARGB(255, 90, 87, 87).withOpacity(0.3)),
                              ),
                              ),
                              child: Center(child: Text("Edit Event", style:TextStyle(color: Colors.white54, fontWeight: FontWeight.w700, fontSize: 20, fontStyle: FontStyle.italic, fontFamily: "Helvetica"))),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Container(
                                //color: Color.fromARGB(255, 32, 20, 50),
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 9, 53, 69),
                                  border: Border.all(color: Colors.grey.withOpacity(0.2) )
                                ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex:1,
                                        child: Container(
                                          width: 25,
                                          child: Center(child: Icon(Icons.person, size: 25,color:Colors.white54)),//.withOpacity(0.8))),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  right: BorderSide(color: Colors.grey.withOpacity(0.2))
                                              )
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: TextFormField(
                                          keyboardType: TextInputType.multiline,
                                          minLines: 1,
                                          maxLines: 2,
                                          style: TextStyle(color: Colors.white70),
                                          decoration: InputDecoration(
                                              hintText: "Event Name",
                                              contentPadding: EdgeInsets.only(left:20),
                                              border: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              hintStyle: TextStyle(color:Colors.white54, fontSize: 18, fontWeight: FontWeight.w500 )
                                          ),

                                        ),
                                      )
                                    ],
                                  )
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Container(
                                //alignment: Alignment.center,
                                height: 150,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 9, 53, 69),
                                  border: Border.all(color: Colors.grey.withOpacity(0.2) )
                                ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    //mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex:1,
                                        child: Container(
                                          width: 25,
                                          child: Center(child: Icon(Icons.notes, size: 25,color:Colors.white54)),
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(255, 9, 53, 69),
                                              border: Border(
                                                  right: BorderSide(color: Colors.grey.withOpacity(0.2))
                                              )
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Center (child: TextFormField(
                                          style: TextStyle(color: Colors.white70),
                                          keyboardType: TextInputType.multiline,
                                          minLines: 1,
                                          maxLines: 5,
                                          //textAlignVertical: TextAlignVertical.bottom,
                                          //textAlign: ,
                                          decoration: InputDecoration(
                                            //alignLabelWithHint: true,
                                            hintText: "Description",
                                            contentPadding: EdgeInsets.only(left:20),
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            hintStyle: TextStyle(color:Colors.white54, fontSize: 18, fontWeight: FontWeight.w500 )
                                          ),

                                        ),
                                        )
                                      )
                                    ],
                                  )
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 9, 53, 69),
                                  border: Border.all(color: Colors.grey.withOpacity(0.2) )
                                ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex:1,
                                        child: Container(
                                          width: 25,
                                          child: Center(child: Icon(Icons.location_pin, size: 25,color:Colors.white54)),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  right: BorderSide(color: Colors.grey.withOpacity(0.2))
                                              )
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: TextFormField(
                                          keyboardType: TextInputType.multiline,
                                          minLines: 1,
                                          maxLines: 2,
                                          style: TextStyle(color: Colors.white70),
                                          //textInputAction: ,
                                          decoration: InputDecoration(
                                            isCollapsed: true,
                                            hintText: "Location",
                                            contentPadding: EdgeInsets.only(left:20),
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            hintStyle: TextStyle(color:Colors.white54, fontSize: 18, fontWeight: FontWeight.w500 )
                                          ),

                                        ),
                                      )
                                    ],
                                  )
                              ),
                            ),
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
                                        height: 50,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                            Color.fromARGB(200, 9, 53, 69),
                                            Color.fromARGB(250, 9, 53, 69),
                                            ]
                                          )
                                        ),
                                        child: Center(child: Text("Cancel", style: TextStyle(color:Color.fromARGB(200, 255, 255, 255), fontSize: 20, fontWeight: FontWeight.w800),)),
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
                                        height: 50,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                            Color.fromARGB(250, 9, 53, 69),
                                            Color.fromARGB(200, 9, 53, 69),
                                            ]
                                          )
                                        ),
                                        child: Center(child: Text("Submit", style: TextStyle(color:Color.fromARGB(200, 255, 255, 255), fontSize: 20, fontWeight: FontWeight.w800),)),
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
                      ),
                    ],
                  ),
                );
              }
            );
            
          },  
          /*onPressed: () => {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=>AddEditEventWidget() )),
          },*/
          backgroundColor: const  Color.fromARGB(255, 3, 7, 30),
          child: const Icon(Icons.add),
        ),
        body: FlutterMap(
          mapController: mapController,
          options: MapOptions(
              center: LatLng(51.509364, -0.128928),
              zoom: 12 //9.2,
          ),
          children: [
            TileLayer(
             urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
             userAgentPackageName: 'com.example.app',
            ),
          ],
        ),
          
       
    );
  }
}
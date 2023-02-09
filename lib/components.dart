import 'package:flutter/material.dart';

//To LOGO ως έχει 
class Logo extends StatelessWidget{
  const Logo({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          //padding: EdgeInsets.all(8.0),
          height: 80,
          width: 120,
          decoration: const BoxDecoration(
            color:  Color.fromARGB(255, 12, 73, 95),  
          ),
          child: const Center(
            child: Text(
              textAlign: TextAlign.center,
              "LOCAL PULSE", 
              style: TextStyle(
                fontFamily: 'Gluten',  
                color:Color.fromARGB(200, 255, 255, 255), 
                fontSize: 35, 
                //fontWeight: FontWeight.bold
              )
            )
          )
        )
      ]
    );
  }
    
}


//Το Checkbox
class TikBox extends StatefulWidget {
  const TikBox({super.key});

  @override
  State<TikBox> createState() => _TikBoxState();
}

class _TikBoxState extends State<TikBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return const Color.fromARGB(255, 20, 118, 154);
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}

enum Auto {enabled, disabled}

//seqmented button auto mode
class AutoMode extends StatefulWidget {
  const AutoMode({super.key});

  @override
  State<AutoMode> createState() => _AutoModeState();
}

class _AutoModeState extends State<AutoMode> {
  Auto autoView = Auto.disabled;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
       // MaterialState.pressed,
        MaterialState.hovered,
        //MaterialState.focused,
      };
      const Set<MaterialState> testStates = <MaterialState>{
        MaterialState.pressed,
        //MaterialState.hovered,
        MaterialState.focused,
        MaterialState.selected
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.white38;
      }
      if (states.any(testStates.contains)) {
        return const Color.fromARGB(249, 20, 117, 152);
      }
      return const Color.fromARGB(255, 12, 73, 95);
    }
    return SegmentedButton<Auto>(
      style: ButtonStyle(
        backgroundColor:  MaterialStateColor.resolveWith(getColor), 
      ),
      segments:  const <ButtonSegment<Auto>>[
        ButtonSegment<Auto>(
            value: Auto.enabled,
            label: Text(
              style: TextStyle(
                color: Colors.white,
              ),
              'On',
              selectionColor: Colors.white,
              
            ),
            icon: Icon(Icons.drive_eta, color: Colors.white60)),
        ButtonSegment<Auto>(
            value: Auto.disabled,
            label: Text(
              'Off',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            icon: Icon(Icons.drive_eta, color: Colors.white60)),
      ],
      selected: <Auto>{autoView},
      onSelectionChanged: (Set<Auto> newSelection) {
        setState(() {
          // By default there is only a single segment that can be
          // selected at one time, so its value is always the first
          // item in the selected set.
          autoView = newSelection.first;
        });
      },
    );
  }
}







//floating add event button

class AddEvent extends StatelessWidget {
  AddEvent({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
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
                                        child: const Center(
                                          child: Text("Submit", style: TextStyle(color:Color.fromARGB(200, 255, 255, 255), fontSize: 20, fontWeight: FontWeight.w800),),
                                        ),
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
      );
  }
}





import 'package:localpulse/components.dart';
import 'package:flutter/material.dart';
import 'package:localpulse/edit_profile.dart';
import 'package:localpulse/settings.dart';



class MyEventsWidget extends StatefulWidget{
  const MyEventsWidget({Key? key}) : super(key: key);
  @override
  State <MyEventsWidget>  createState() => _MyEventsWidgetState();
    
}
class _MyEventsWidgetState extends State<MyEventsWidget>{
  final List<OwnEvents>  _myeventList= /*<OwnEvents> */[];
  
  void _addNewEvent() async {
          
    OwnEvents? newEvent= await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const  AddEvent()));
      
    /*Navigator.of(context).push(
      MaterialPageRoute(builder: (context)=> AddEvent()));*/
    if (newEvent != null){

      _myeventList.add(newEvent);
      setState(() {
             
          });
     }
  }

  void _deleteEvent(int idx ) async {
    bool? deleteEv = await  showDialog<bool>(
      context: context, 
      builder: (BuildContext context) => AlertDialog(
        content:  const Text ('Delete this Event?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context,false), 
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context,true), 
            child: const Text('Delete'),
          ),
        ],
      )
    );
    if (deleteEv!){
      _myeventList.removeAt(idx);
      setState(() {
        
      });
    }

  }

  Widget _buildMyeventLiist(){
    return //Column( 
      //children: [
        ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
        /* padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.1, 
                    left: MediaQuery.of(context).size.height * 0.1,
                    right: MediaQuery.of(context).size.height * 0.1),
          
          */padding: const EdgeInsets.all(5.0),
          separatorBuilder: (context,index) =>  const Divider(),
          itemCount:  _myeventList.length ,
          itemBuilder: (context, index) {
            return ListTile(
              
              leading: IconButton(
                icon: const Icon(Icons.check_box_outline_blank_outlined),
                onPressed: () {},
                tooltip: 'Mark as completed',
              ),
              title: Text (
                _myeventList[index].title,
                style: const TextStyle(
                  decoration: TextDecoration.none
                ),
              ),
              subtitle: Text(
                _myeventList[index].date,
                style: const TextStyle(decoration: TextDecoration.none ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                      onPressed: (){},
                      tooltip: 'Edit Event', 
                      icon: const Icon(Icons.edit)
                  ),
                  IconButton(
                      onPressed: (){
                        _deleteEvent(index);
                      },
                      tooltip: 'Delete Event', 
                      icon: const Icon(Icons.delete),
                  ),
                  
                ],
              ),
                
            );
          },
    ); //]);
  }
 @override
  Widget build(BuildContext context){
    return Scaffold( 
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: PopupMenuButton<int>(
            shadowColor: const Color.fromARGB(255, 12, 73, 95),
            //elevation: 1,
            iconSize: 2,
            icon:     Image.asset('assets/Icons/Variant2.png'),// image for profile
            itemBuilder: ((context) => <PopupMenuEntry<int>>[
              PopupMenuItem(
                child: const ListTile(
                  //selectedColor: Color.fromARGB(221, 114, 151, 164) ,
                  title: Text('Events'),
                ),
                onTap :() async {
                  final navigator = Navigator.of(context);
                  await Future.delayed(Duration.zero);
                  navigator.pop();
                  navigator.push(
                    MaterialPageRoute(builder: (context) => const MyEventsWidget()),
                  );
                },
              ),
              PopupMenuItem( 
                child: const ListTile(
                  //selectedColor: Color.fromARGB(221, 114, 151, 164) ,
                  title: Text('Edit Profile'),
                ),
                onTap :() async {
                  final navigator = Navigator.of(context);
                  await Future.delayed(Duration.zero);
                  navigator.pop();
                  navigator.push(
                    MaterialPageRoute(builder: (context) => const EditProfileWidget()),
                  );
                },
              ),
              PopupMenuItem(
                child: const ListTile(
                  //selectedColor: Color.fromARGB(221, 114, 151, 164) ,
                  title:  Text('Settings'),
                ),
                onTap :() async {
                  final navigator = Navigator.of(context);
                  await Future.delayed(Duration.zero);
                  navigator.pop();
                  navigator.push(
                    MaterialPageRoute(builder: (context) => const SettingsWidget()),
                  );
                },
              ),
                PopupMenuItem(
                child: const ListTile(
                  //selectedColor: Color.fromARGB(221, 114, 151, 164) ,
                  title: Text('Logout'),
                ),
                onTap: () {
                  int count=0;
                  Navigator.popUntil(context, (route) => count++ == 2);
                },
              ),
            ]
            ),
            //onSelected: (){},
          )
      ),
      floatingActionButton: //_addNewEvent(),
          FloatingActionButton(
        tooltip: 'Add event',
        backgroundColor: const  Color.fromARGB(255, 3, 7, 30),
        child: const Icon(Icons.add),
        onPressed: () { _addNewEvent();
          /*showDialog(
              barrierColor: const Color.fromARGB(93, 0, 0, 0),
              context: context,
               builder: (BuildContext context) {
                   //_showOverlay(context);
                   return  AlertDialog(
                    contentPadding: EdgeInsets.zero,
                    content: _addNewEvent(),
                   );
               },
          );*/
        }
      ),
      body: Container(
        color: const Color.fromARGB(255, 12, 73, 95),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Logo(),
            Container(
              padding: const EdgeInsets.all(30.0),
              child: const Text(
                        textAlign: TextAlign.center,
                        "My Events", 
                        style: TextStyle(  
                          fontFamily: 'ChauPhilomeneOne',
                          letterSpacing: 5.0,
                          color:Color.fromARGB(200, 255, 255, 255), 
                          fontSize: 30, 
                          //fontWeight: FontWeight.bold
                        )
                      ),
            ),  
             _buildMyeventLiist(),              
          ]
        )
    )
    );
  }
}

 
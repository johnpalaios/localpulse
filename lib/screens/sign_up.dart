import 'package:localpulse/screens/components.dart';
import 'package:localpulse/screens/homepage.dart';
import 'package:flutter/material.dart';


class SignUpWidget extends StatefulWidget{
  const SignUpWidget({Key? key}) : super(key: key);
  @override
  State <SignUpWidget> createState() => _SignUpWidgetState(); 
  
}

class _SignUpWidgetState extends State<SignUpWidget>{
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBody: true,
      body: Container(
        color: const Color.fromARGB(255, 12, 73, 95),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Logo(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: const Alignment(30,0),
                  height: 120,
                  width: 180,
                  decoration: const BoxDecoration(
                    color:  Color.fromARGB(255, 12, 73, 95),                     
                  ),
                  child: const Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      "Sign Up",
                      style: TextStyle(
                        fontFamily: 'ChauPhilomeneOne',
                        letterSpacing: 5.0,
                        color: Color.fromARGB(200, 255, 255, 255),
                        fontSize: 40,
                      ),
                    ),
                  ),
                )
              ]  ,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: const Alignment(30,0),
                  height: 50,
                  width: 280,
                  decoration: const BoxDecoration(
                    color:  Color.fromARGB(255, 12, 73, 95),                     
                  ),
                  child: const Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      "Sign up and descover local events!",
                      style: TextStyle(
                        letterSpacing: 1.0,
                        color: Color.fromARGB(200, 255, 255, 255),
                        //fontSize: 10,
                      ),
                    ),
                  ),
                )
              ]  ,
            ),
            Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.1, 
                left: MediaQuery.of(context).size.height * 0.1,
                right: MediaQuery.of(context).size.height * 0.1
                ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      style: const TextStyle(color: Colors.white70),
                      keyboardType: TextInputType.multiline,
                      maxLines: 1,
                      decoration:  const InputDecoration(
                        fillColor: Colors.white70,
                        icon: Icon(Icons.person_2, size: 25,color:Colors.white54),
                        contentPadding: EdgeInsets.only(left:10),
                        hintText: "Tom Brown",
                        labelText: "Full Name",
                        labelStyle: TextStyle(color:Colors.white70, fontSize: 12, fontWeight: FontWeight.w500 ),
                        hintStyle: TextStyle(color:Colors.white38, fontSize: 18, fontWeight: FontWeight.w500 )
                       )
                    ),
                    TextFormField(
                      style: const TextStyle(color: Colors.white70),
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.email, size: 25, color: Colors.white70),
                        contentPadding: EdgeInsets.only(left:10),
                        hintText: "tombrown@gmail.com",
                        hintStyle: TextStyle(color:Colors.white38, fontSize: 18, fontWeight: FontWeight.w500 ),
                        labelText: "Email",
                        labelStyle: TextStyle(color:Colors.white70, fontSize: 12, fontWeight: FontWeight.w500 ),
                      ),
                      maxLines: 1,
                    ),
                    TextFormField(
                      obscureText: true,
                      obscuringCharacter: '*',
                      style: const TextStyle(color: Colors.white70),
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.key, size: 25, color: Colors.white70),
                        contentPadding: EdgeInsets.only(left:10),
                        labelText: "Password",
                        labelStyle: TextStyle(color:Colors.white70, fontSize: 12, fontWeight: FontWeight.w500 ),
                      ),
                      maxLines: 1,
                    ),
                    TextFormField(
                      obscureText: true,
                      obscuringCharacter: '*',
                      style: const TextStyle(color: Colors.white70),
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.key, size: 25, color: Colors.white70),
                        contentPadding: EdgeInsets.only(left:10),
                        labelText: "Confirm Password",
                        labelStyle: TextStyle(color:Colors.white70, fontSize: 12, fontWeight: FontWeight.w500 ),
                      ),
                      maxLines: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),

                      child: TextButton(

                         //padding: EdgeInsets.zero,
                        child: Container(
                          width:MediaQuery.of(context).size.width,
                          height: 40,
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color.fromARGB(149, 18, 109, 142),
                                Color.fromARGB(249, 20, 117, 152),
                              ]
                            )
                          ),
                          child: const Center(child: Text("Sign Up", style: TextStyle(color:Color.fromARGB(200, 255, 255, 255), fontSize: 20, fontWeight: FontWeight.w800),)),
                        ),
                        onPressed: ()async{
                          final navigator = Navigator.of(context);
                          await Future.delayed(Duration.zero);
//save ta stoixeia eisodou 
                          navigator.pop(); 
                          navigator.push(
                            MaterialPageRoute(builder: (_) => const HomePage()),
                          );
                          //Navigator.of(context).pushNamed('/homepage');
                        }
                      ),
                    ),
                  

                                  /*if (_formKey.currentState.validate()) {
                                    _formKey.currentState.save();
                                  }*/
                                
                              //),
                           // ),
                            //),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
                      child: TextButton(
                        //padding: EdgeInsets.zero,
                        child: Container(
                          width:MediaQuery.of(context).size.width,
                            height: 40,
                              decoration:  BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: const LinearGradient(
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
                        onPressed: () {
                          Navigator.of(context).pop();
                        }
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
          ],
        )
      )
    );
  }
}
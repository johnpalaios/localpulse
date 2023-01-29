import 'package:flutter/material.dart';


class Logo extends StatelessWidget{

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
            color: const Color.fromARGB(255, 12, 73, 95),  
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



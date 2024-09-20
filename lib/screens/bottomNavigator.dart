

import 'package:flutter/material.dart';

class ButtomBar extends StatefulWidget {
  const ButtomBar({super.key});

  @override
  State<ButtomBar> createState() => _ButtomBarState();
}

class _ButtomBarState extends State<ButtomBar> {
  @override
  Widget build(BuildContext context) {
    return   SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 100 ,
        
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
          ),
          child:  Center(
            child:BottomNavigationBar(
              unselectedItemColor: Colors.black,
              selectedItemColor: Colors.black,
              selectedLabelStyle: const TextStyle(
                color: Colors.blue
              ),
              unselectedLabelStyle: const TextStyle(
                color: Colors.black
              ),
              currentIndex: 1,
              elevation: 0.0,
              items: [
              BottomNavigationBarItem(icon: InkWell(
                onTap: (){

                },
                child: const Icon(Icons.circle_outlined,color: Colors.black,)),label: "Ricerca",),
              BottomNavigationBarItem(icon: InkWell(
                onTap: (){

                },
                child: const Icon(Icons.bookmark,color: Colors.blue,)),label: "Ricerca",),
              BottomNavigationBarItem(icon: InkWell(
                onTap: (){

                },
                child: const Icon(Icons.logo_dev,color: Colors.black,)),label: "Ricerca",),
              BottomNavigationBarItem(icon: InkWell(
                onTap: (){

                },
                child: const Icon(Icons.message,color: Colors.black,)),label: "Ricerca",),
              BottomNavigationBarItem(icon: InkWell(
                onTap: (){

                },
                child: const Icon(Icons.person,color: Colors.black,)),label: "Ricerca",),
            ]) ,
          ),
        )
      )   
    
    ;
  }
}
import 'package:flutter/material.dart';

import 'bottomNavigator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

List itemsName = [
  "Red Komodo 6K",
  "BlackMagic 6k Pro",
  "18-35 Sigma",
  "DJI Ronin RS3",
  "Sony FX3",
  "Apple Mac Sudio"
];

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final hieght = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: hieght*0.05,
                  child: const Text(
                    "Salvati",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: hieght*0.8,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: itemsName.length
                    ,itemBuilder: (context, index) {
                    return Dismissible(
                      background:Container(
                    color: Colors.red,
                    child:  const Padding(
                      padding: EdgeInsets.all(15),
                      child: Icon(Icons.bookmark,color: Colors.white,),
                      ),
                    ),
                  
                      key: ValueKey(index),
                      child: Container(
                         margin: const EdgeInsets.all(3),
                        height: 100,
                        width: width,
                        child: Row(
                          children: [
                             SizedBox(
                              height: 100,
                              child: Image(
                                image: AssetImage("assets/products/${index+1}.png"),
                                width: 150,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                             
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        itemsName[index],
                                        style: const TextStyle(
                                            fontSize: 17,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text(
                                        "Milano, Lambardia, Italia",
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.grey),
                                      ),
                                      const Row(
                                         mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "250€ /",
                                            style: TextStyle(
                                                fontSize: 13, color: Colors.black),
                                          ),
                                          Text(
                                            "giano",
                                            style: TextStyle(
                                                fontSize: 13, color: Colors.grey),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  const Text(
                                    "Disponibile Adessee ⦿",
                                    style:
                                        TextStyle(fontSize: 13, color: Color.fromARGB(255, 21, 146, 248)),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
          
        ),
        bottomNavigationBar: const ButtomBar()
      ),
    );
  }
}

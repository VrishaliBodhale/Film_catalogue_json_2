import 'package:flutter/material.dart';
import 'dart:convert';

import 'secondpage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jason Practise app',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],

      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.yellow,
          ),

        child: Text('Film Catalogue', style: TextStyle(
            fontWeight: FontWeight.bold , color: Colors.black, fontSize: 25.0 , fontStyle: FontStyle.italic),
        ),
        ),
        backgroundColor: Colors.black
      ),

      body: FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString('assets/jsonfiles/movies.json'),
          builder: (context, snapshot) {
            var newData = json.decode(snapshot.data.toString());
            print('DATA from my jason  ${newData}');

            return ListView.builder(
                itemCount: newData == null ? 0 : newData.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: Card (
                    color: Colors.grey[800],
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(

                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              color: Colors.grey[800],
                              height: 210,
                              width: 300,
                              //color: Colors.deepPurpleAccent,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.asset(newData[index] ['img'],
                                  height: 200, width: 200, fit: BoxFit.cover,),
                                ),
                              ),
                            ),

                            GestureDetector(
                              onTap: () {Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return SecondPage(newData[index]) ;
                                }
                              ),)    ; },
                              child: Text('${newData[index] ['name']}(${newData[index] ['year']})',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 22.0,

                                  color: Colors.yellow,
                                  fontStyle: FontStyle.italic

                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }),
    );
  }
}

import 'package:flutter/material.dart';

import 'detailpage.dart';

class SecondPage extends StatefulWidget {
  @override

  final data ;
  SecondPage(this.data) ;

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('${widget.data['name']}(${widget.data['year']})' , style: TextStyle(
            fontWeight: FontWeight.bold , color: Colors.yellow, fontSize: 25.0 , fontStyle: FontStyle.italic),),
      ),
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset(widget.data['img']),

                SizedBox(height: 10.00,),

                Text('${widget.data['description']} | ${widget.data['duration']} | ${widget.data['release date']}', style: TextStyle(fontSize: 17.0,
                    color: Colors.yellow,fontStyle: FontStyle.italic),),
                SizedBox(height: 10.00,),
                Text('${widget.data['story']}', style: TextStyle(fontSize: 17.0,
                    color: Colors.yellow,fontStyle: FontStyle.italic),),
                SizedBox(height: 10.00,),
                Text('Director: ${widget.data['director']}', style: TextStyle(fontSize: 19.0,
                    color: Colors.yellow,fontStyle: FontStyle.italic),),
                SizedBox(height: 10.00,),
                Text('Caste:', style: TextStyle(fontSize: 19.0,
                    color: Colors.yellow,fontStyle: FontStyle.italic),),
                SizedBox(height: 10.00,),

                Container(
                  height: 100,
                  child: ListView.builder(

                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) =>
                                  Detailpage( widget.data["actors"][index])));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              widget.data["actors"][index]["name"],
                              //'Note Title',
                              style: TextStyle(fontSize: 19.0,

                                  color: Colors.yellow,fontStyle: FontStyle.italic,),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: widget.data["actors"] == null ? 0 : widget
                        .data["actors"].length,

                  ),
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
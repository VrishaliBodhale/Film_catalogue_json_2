import 'package:flutter/material.dart';

class Detailpage extends StatefulWidget {
  final data;

  Detailpage(this.data);

  @override
  _DetailpageState createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(


      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          '',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.yellow,
              fontSize: 25.0,
              fontStyle: FontStyle.italic),
        ),
      ),
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                Container(
                    height: 200,
                    width: 150,
                    child: Image.asset(widget.data['imgUrl'], fit: BoxFit.cover,)),
                Text(
                  '${widget.data['name']}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                      fontSize: 25.0,
                      fontStyle: FontStyle.italic),
                ),

                SizedBox(height: 10.00,),
                Text(
                  '${widget.data['skills']}',
                  style: TextStyle(

                      color: Colors.yellow,
                      fontSize: 19.0,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 15.00,),
                Text(
                  '${widget.data['description']}',
                  style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 19.0,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 15.00,),
                Text(
                  'Known for: ${widget.data['known_for']}',
                  style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 19.0,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 15.00,),
                Text(
                  'Born: ${widget.data['birth_details']}',
                  style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 19.0,
                      fontStyle: FontStyle.italic),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}

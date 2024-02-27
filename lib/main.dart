import 'dart:convert';
import 'dart:developer';
import 'dart:io';


import 'package:demo1/second.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'musicapp.dart';

void main() {
  runApp(MaterialApp(
     routes: {
       "music_detail":(context) => first(),
      "first":(context) => first(),
       "second":(context)=>second(),
    },
    home: first(),
    debugShowCheckedModeBanner: false,
  ));
}

class first extends StatefulWidget {
  const first({super.key});

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  Future getdata() async {
    // print("object");
    var url = Uri.https('storage.googleapis.com', 'uamp/catalog.json');
    var response = await http.get(url);
    Map m = jsonDecode(response.body);
    List l = m['music'];

    log("${m}");
    return l;
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getdata();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
              "Music App",
              style: TextStyle(color: Colors.white),
            )),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: FutureBuilder(

        future: getdata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              // Map m=snapshot.data;
              // dynamic l=m['product'];
              // log("${m}");
              List m = snapshot.data;

              log("${m}");

              return ListView.builder(
                itemCount: m.length,
                itemBuilder: (context, index) {
                  print("${jsonEncode(m[index])}");

                  // product p=  Music.fromJson(l[index]);
                  Music p = Music.fromJson(m[index]);

                  print(p);
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "second",arguments: p);
                    },
                    child: ListTile(

                        title: Text(
                          "${p.title}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "${p.artist}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w200),
                        ),
                        leading: CircleAvatar(
                          child: Image(
                            image: NetworkImage("${p.image}"),
                          ),
                        )),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
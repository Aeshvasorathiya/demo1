import 'dart:ffi';

import 'package:audioplayers/audioplayers.dart';
import 'package:demo1/musicapp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:on_audio_query/on_audio_query.dart';

class second extends StatefulWidget {
  const second({super.key});


  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  double b=0;
  bool t=false;

  controller c=controller();


  @override
  Widget build(BuildContext context) {
    Music p=ModalRoute.of(context)!.settings.arguments as Music;
    return Scaffold(
      body:
      SafeArea(minimum: EdgeInsets.only(top: 5),
        child: Container(
     height: double.infinity,
     width: double.infinity,
     color: Colors.black,
     child:    Column(
           children: [
             Container(
                alignment: Alignment.center,
               margin: EdgeInsets.all(20),
               height: 400,
               width: 500,

               decoration: BoxDecoration(
               borderRadius:BorderRadius.circular(20),
                   border: Border.all(color: Colors.black),
                   image: DecorationImage(fit: BoxFit.fill,
                     image: NetworkImage("${p.image}",scale: 20)
                   )),
             ),
             Column(
               children: [
                 Text("${p.title}",),
               ],
             ),
             Column(
               children: [
                 Text("${p.artist}"),
               ],
             ),
             SizedBox(height: 10,),
            Slider( min: 0,
              max: 10,
               value: b,
               activeColor: Colors.red,inactiveColor: Colors.grey.shade800, onChanged: (value) {
               b=value!;
               setState(() {

               });
             },),


             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Container(alignment: Alignment.topLeft,
                   margin: EdgeInsets.all(10),
                   child:  Text("00:00",style: TextStyle(color: Colors.white),),
                 ),
                 Container(alignment: Alignment.topRight,
                   margin: EdgeInsets.all(10),
                   child:  Text("00:${p.duration}",style: TextStyle(color: Colors.white),),
                 ),
               ],
             ),
             Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [

                   IconButton(onPressed: () {

                   }, icon:Icon(Icons.skip_previous_sharp,size: 50,color: Colors.red,)),

                   (c.isplay)? IconButton(onPressed: () async {
                     final player = AudioPlayer();
                     await player.play(UrlSource("${p.source}"));
                     controller.player.pause();
                     c.isplay=!c.isplay;
                     setState(() {

                     });


                   } ,icon:Icon(Icons.pause,size: 50,color: Colors.red,)):IconButton(onPressed: () async {
                        final player = AudioPlayer();
                      await player.play(UrlSource("${p.source}"));
                   }, icon: Icon(Icons.play_circle)),

                   IconButton(onPressed: () {

                   }, icon:Icon(Icons.skip_next_sharp,size: 50,color: Colors.red,)),
                   // Icon(Icons.play_circle,size: 70,color: Colors.red,)
                 ]
             ),
            Expanded(child: Text("")),

            IconButton(onPressed: () {
              //You can download a single file
              FileDownloader.downloadFile(
                  url: "${p.source}",
                  name: "THE FILE NAME AFTER DOWNLOADING",//(optional)

                  onDownloadCompleted: (String path) {
                    print('FILE DOWNLOADED TO PATH: $path');
                  },
                  onDownloadError: (String error) {
                    print('DOWNLOAD ERROR: $error');

                  });
            }, icon: Icon(Icons.download_for_offline_outlined,color: Colors.white,size: 50,))
           ]
     ),

   ),
      ),

    );
  }
}

class controller
{
  bool isplay=false;
  int cur_value=0;
  static OnAudioQuery _audioQuery=OnAudioQuery();
  static AudioPlayer player=AudioPlayer();
}







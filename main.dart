import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';


import 'package:flutter/material.dart';
import 'package:charcode/html_entity.dart' as http;
import 'package:url/dog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HttpScreen(),
    );
  }
}

class HttpScreen extends StatelessWidget {
  @override

  Widget build(BuildContext context){
  
  return Scaffold(
     body: Center(
       child: FutureBuilder<Dog>(
         future: getDog(),
         builder: (context, snapshot){

           if (snapshot.hasData){
             final Dog = snapshot.data;
             return Text("message : ${Dog?.message} \n  status : ${Dog?.status}");

           } else if(snapshot.hasError) {
             return Text(snapshot.error.toString());

           }
           return CircularProgressIndicator();
         },
       )),
   );

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

Future<Dog> getDog() async {
  final url = "https://dog.ceo/api/breeds/image/random";

  final response = await http.get(url);
  
  if(response.statusCode == 200){
    final jsonDog = jsonDecode(response.body);
    return Dog.fromJson(jsonDog);


  } else{
    throw Exception();
  }

  
}
}
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:worldtime/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({ Key? key }) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String? time = 'loading';
  void setUpWorldTime() async {
    WorldTime instance = WorldTime(location: 'India',flag: 'india.pg',url: 'Asia/Kolkata');
    await instance.getTime();
    print(instance.time);
    //setState(() {
     // time=instance.time;
    //});
    Navigator.pushReplacementNamed(context, '/home',arguments: 
    {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDaytime
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUpWorldTime();
    print('hello there');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitCubeGrid(
        color: Colors.white,
        size: 50.0,
      ),),
    );
  }
}
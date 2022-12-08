import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:world_time/Screens/Services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> { 
 @override

void setupworldtime()async {
    world_time obj = world_time(location: 'Berlin', flag: 'germany', url: 'Europe/London');
    await obj.getTime();
    Navigator.of(context).pushReplacementNamed('/Home',arguments:{ 
    'location' : obj.location,
    'flag' : obj.flag,
    'time' : obj.time,
    'isDayTime' : obj.isDayTime
});

  }

  void initState() {
    super.initState();
    setupworldtime();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 1, 12),
      body: Center(
        child:SpinKitFadingCircle(
  color: Colors.white,
  size: 70.0,
)
      )
    );
  }
}
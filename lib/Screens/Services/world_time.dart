import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class world_time{
   late String location;
   late String time;
   late String flag;
   late String url;
   late bool isDayTime;
   
   world_time({required this.location, required this.flag, required this.url });

   Future<void> getTime() async{
    try {
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
   
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours:int.parse(offset) ));
      //print(now.hour);
      
      isDayTime = now.hour >= 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);

    }
    catch(e){
   //   print('caught error : $e');
      time = 'Could not get time data';
    }
  }
   
}
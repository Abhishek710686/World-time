import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:world_time/Screens/Services/world_time.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {

  List<world_time> locations = [
    world_time(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    world_time(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    world_time(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    world_time(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    world_time(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    world_time(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    world_time(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    world_time(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),];

    void UpdateTime(index) async {
      world_time instance = locations[index];

      await instance.getTime();
      Navigator.of(context).pop({
        'location' : instance.location,
        'flag' : instance.flag,
        'time' : instance.time,
        'isDayTime' :instance.isDayTime
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Location'),
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        child: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}')),
                onTap: (){
                  UpdateTime(index);
                },
              ),
            ) ;
          }
          ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data :  ModalRoute.of(context)!.settings.arguments as Map;
    //print(data);
    
    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color bgcolor = data['isDayTime'] ? Colors.blue : Colors.indigo;
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(
            'assets/$bgImage'
          ),
          fit: BoxFit.cover,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: [
              TextButton.icon(
                style:TextButton.styleFrom(primary: Colors.black),
                onPressed: () async{
                dynamic result = await Navigator.of(context).pushNamed('/Location');
                setState(() {
                  data = {
                     'location' : result['location'],
                     'flag' : result['flag'],
                     'time' : result['time'],
                     'isDayTime' : result['isDayTime']
                  };
                });

              }, icon: Icon(Icons.edit_location,color: Color.fromARGB(255, 223, 223, 223),), label:Text('Edit Location',style: TextStyle(fontSize: 15,color: Color.fromARGB(255, 223, 223, 223)),)),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(data['location'],
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 2,
                    color: Colors.white
                  ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Text(data['time'],
              style: TextStyle(
                fontSize: 65,
                color: Colors.white
              ),
              )

            ],
          ),
        ),
      )),
    );
  }
}
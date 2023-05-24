

import 'package:flutter/material.dart';
import 'music.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[500],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 30.0,
            width: 100.0,
            color: Colors.yellow,
            child: GestureDetector(
              child: const Text('Find music!'),

              onTap: (){
                setState(() {

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
                });
              },
            ),
          ),
        ],
      )
    );
  }
}

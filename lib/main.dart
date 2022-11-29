import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  const MyHomePage({Key? key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool takeOff = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Airplane Animation'),
      ),
      body: SizedBox(
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
              left: 100.0,
              right: 100.0,
              top: takeOff ? 20.0 : 600.0,
              duration: const Duration(seconds: 4),
              curve: Curves.fastLinearToSlowEaseIn,
              child: const Icon(
                  Icons.airplanemode_active,
                  color: Colors.blueGrey,
                  size: 70.0
              ),
            ),

            Container(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton.icon(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue), foregroundColor: MaterialStateProperty.all(Colors.white)),
                icon: const Icon(Icons.airplanemode_active, color: Colors.white),
                label: const Text('出發!'),
                onPressed: () => {
                  setState(() {
                    takeOff = !takeOff;
                  })
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

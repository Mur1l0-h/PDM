import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: InterruptorApp(),
  ));
}

class InterruptorApp extends StatefulWidget{
  @override
  _InterruptorAppState createState() => _InterruptorAppState();
}

class _InterruptorAppState extends State<InterruptorApp>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: estaAceso ? Colors.purple : Colors.white,
      appBar: AppBar(
        title: Text("Interruptor", 
        style: TextStyle(color: estaAceso ? Colors.white : Colors.purple,),),
        backgroundColor: estaAceso ? Colors.purple : Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(estaAceso ? Icons.lightbulb : Icons.lightbulb_outline,
                size: 100,
                color: estaAceso ? Colors.white : Colors.purple,
              ),
              ElevatedButton(onPressed: alternarLuz,
              style: ElevatedButton.styleFrom(
                backgroundColor: estaAceso ? Colors.white : Colors.purple
              ),
              child: 
                Icon(estaAceso ? Icons.switch_left : Icons.switch_right,
                 color: estaAceso ? Colors.purple : Colors.white,)
              )
            ],
          ),
        ),
        bottomNavigationBar: NavigationBar(destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.notifications_active_sharp)),
            label: "Notifications",
          ),
          NavigationDestination(
            icon: Badge(label: Text('2'), child: Icon(Icons.message_sharp)),
            label: "Messages",
          ),

        ]),

    );
    
  }


  bool estaAceso = false;
  
  void alternarLuz(){
    setState(() {
      estaAceso = !estaAceso;
    });
  }
}
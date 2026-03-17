import 'dart:async';

import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Semaforo(),
    debugShowCheckedModeBanner: false,
  ));
}

class Semaforo extends StatefulWidget{
    
    @override 
    _SemaforoState createState() => _SemaforoState();
}

class _SemaforoState extends State<Semaforo>{
  
  MaterialColor vermelho = Colors.grey;
  MaterialColor amarelo = Colors.grey;
  MaterialColor verde = Colors.grey;
    
  var contador = 0;
  Timer? _timer;

   IconData mudarIcone(){
      if(contador <=1){
        return Icons.directions_walk;
      }else{
        return Icons.pan_tool;
      }
  }

void trocarSemaforo(){
  if (_timer != null && _timer!.isActive) return;

    _timer = Timer.periodic( Duration(seconds: 1), (timer){
      
    setState(() {
        switch(contador){
          case 0:
            vermelho = Colors.red;
            Duration(seconds: 10);
            contador++;
          break;
          case 1:
            vermelho = Colors.grey;
            amarelo = Colors.yellow;
            contador++;
          break;
          case 2: 
            amarelo = Colors.grey;
            verde = Colors.green;
            contador++;
          break;
            default: 
            verde = Colors.grey;
            vermelho = Colors.red;
            contador = 0;
        }
      });
    });
  }
  
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Semáforo"),
      ),
      body: 
      Center(
        child: Column(
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: vermelho,
                shape: BoxShape.circle
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: amarelo,
                shape: BoxShape.circle
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: verde,
                shape: BoxShape.circle
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: trocarSemaforo, child: Text('Iniciar semáforo'),),
            SizedBox(height: 20,),
            Icon(mudarIcone(), size: 100,)
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Temperatura(),
    debugShowCheckedModeBanner: false,
  ));
}


class Temperatura extends StatefulWidget{
  @override
  _TempState createState() => _TempState();
}

class _TempState extends State<Temperatura>{
   
    int temperatura = 20;
    Color corFundo = Colors.blue;
    IconData icone = Icons.ac_unit;
    String status = '';

void diminuir(){
  setState(() {
    temperatura--;
    mudarEstilos();
  });
}
void aumentar(){
  setState(() {
    temperatura++;
    mudarEstilos();
  });
}

void mudarEstilos(){
  if(temperatura <= 15){
    corFundo = Colors.blue;
    icone = Icons.ac_unit;
    status = 'Frio';
  }else if(temperatura <= 30){
     corFundo = Colors.green;
     icone = Icons.wb_sunny;
      status = 'Agradável';
  }else{
    corFundo = Colors.red;
    icone = Icons.local_fire_department;
    status = "Quente";
  }
}

    @override
    Widget build(BuildContext context){
      return Scaffold(
        backgroundColor: corFundo,
        appBar: AppBar(title: Text('Controle de Temperatura'),),

        body: Center(
          child: Column(
            children: [
              Text('$temperatura °C',
              style: TextStyle(fontSize: 40),
              ),
              Icon(icone, size: 100,),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20,),
                  ElevatedButton(onPressed: diminuir, child: Text('-')),
                  ElevatedButton(onPressed: aumentar, child: Text('+')),
                ],
              ),
              Text(status)
            ],
          ),
        ),
      );
    }
}
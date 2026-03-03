import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(home: SorteadorPagina(),));
}


class SorteadorPagina extends StatefulWidget{
    @override
    _Sorteador createState() => _Sorteador();
}


class _Sorteador extends State<SorteadorPagina>{

  int numeroSorteado = 0;

  void random(){
    setState(() {
    numeroSorteado = Random().nextInt(11);
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Sorteador de números"),),
      body: Center(child: Text("Número sorteado: \n $numeroSorteado", 
      style: TextStyle(fontSize: 30),
      textAlign: TextAlign.center,),),
      floatingActionButton: FloatingActionButton(
        onPressed: random,
        child: Icon(Icons.auto_fix_high),),
      );
  }

}
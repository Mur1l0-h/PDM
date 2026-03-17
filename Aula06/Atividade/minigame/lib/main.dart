import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(MaterialApp(
    home: Minigame(),
    debugShowCheckedModeBanner: false,
  ));
}


class Minigame extends StatefulWidget{
  @override 
  _Minigamestate createState() => _Minigamestate();
}


class _Minigamestate extends State<Minigame>{
  
  IconData iconeComputador = Icons.play_arrow;
  String resultado = "Escolha sua opção";
  int pontosJogador = 0;
  int pontosComputador = 0;

  List opcoes = ["pedra", "papel", "tesoura"];

 void jogar(String escolhaUsuario){
  var numero = Random().nextInt(3);
  var escolhaComputador = opcoes[numero];
  setState(() {
    if(escolhaComputador == "pedra"){
      iconeComputador = Icons.landscape;
      }
    if(escolhaComputador == "papel"){
      iconeComputador = Icons.pan_tool;
      }
    if(escolhaComputador == "tesoura"){
      iconeComputador = Icons.content_cut;
    }

if(escolhaUsuario == escolhaComputador){
resultado = "Empate";
}
else if(
(escolhaUsuario == "pedra" && escolhaComputador == "tesoura") ||
(escolhaUsuario == "papel" && escolhaComputador == "pedra") ||
(escolhaUsuario == "tesoura" && escolhaComputador == "papel")
){
pontosJogador++;
resultado = "Você venceu!";
}
else{
pontosComputador++;
resultado = "Computador venceu!";
}

if( pontosJogador == 5 ){
  resultado = "Você ganhou o campeonato!";
  pontosComputador = 0;
  pontosJogador = 0;
}
  });
}




  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
    title: Text("Pedra Papel Tesoura"),
    ),
    body: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text("Computador"),
      Icon(
      iconeComputador,
      size: 100,
    ),
    Text(
      resultado,
      style: TextStyle(fontSize: 26),
    ),
    Text(
      "Você: $pontosJogador | PC: $pontosComputador",
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      IconButton(
        icon: Icon(Icons.landscape),
        onPressed: () => jogar("pedra"),
      ),
      IconButton(
        icon: Icon(Icons.pan_tool),
        onPressed: () => jogar("papel"),
      ),
      IconButton(
        icon: Icon(Icons.content_cut),
        onPressed: () => jogar("tesoura"),
      ),
],
)
],
),
),
);
}
}
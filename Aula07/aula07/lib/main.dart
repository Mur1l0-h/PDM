import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: TelaInicial(),
    debugShowCheckedModeBanner: false,
  ));
}


class TelaInicial extends StatelessWidget{
  
  final String nome = "Murilo";
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Inicial'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Ir para Segunda Tela"),
          onPressed: () =>{
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => SegundaTela(nome: nome))
            )
          },
        ),
      ),
    );
  }
}


class SegundaTela extends StatelessWidget{
  final String nome;
  
  SegundaTela({required this.nome});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Tela'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text('Olá $nome'),
      ),
    );
  }
}



import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Lista(),
    debugShowCheckedModeBanner: false,
  ));
}

class Lista extends StatelessWidget {
  
  Lista({super.key});

  
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Contato 1'),
            tileColor: Colors.amber,
            trailing: IconButton(icon: Icon(Icons.menu), 
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Infos(nome: "Ronaldo", numero: 12221221))
              ) ),
          ),
          SizedBox(height: 10,),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Contato 2'),
            tileColor: Colors.amber,
            trailing: IconButton(icon: Icon(Icons.menu), 
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Infos(nome: "Ronaldo 2", numero: 6767676767))
              ) ),
          ),
          SizedBox(height: 10,),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Contato 3'),
            tileColor: Colors.amber,
            trailing: IconButton(icon: Icon(Icons.menu), 
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Infos(nome: "Ronaldo 3", numero: 589647123))
              ) ),
          )
        ],
      )
    );
  }
}

class Infos extends StatelessWidget {
  
  Infos({required this.nome, required this.numero, super.key});
  
   final String nome;
   final int numero;
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Infos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nome: $nome'),
            Text('Número: $numero'),
          ],
        ),
      )
    );
  }
}



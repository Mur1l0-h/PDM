import "package:flutter/material.dart";

void main(){
  runApp(aplicacao());
}

class aplicacao extends StatelessWidget{
  
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      home:Scaffold(
        backgroundColor: Colors.white70,

        appBar: AppBar(title: Text('Lista de tarefas', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black, 
        ),
        
        body: ListView(
          children: [
            ListTile(title: Text('Flutter legal'), subtitle: Text('Ronaldo'), leading: Icon(Icons.radio_button_unchecked), trailing: Icon(Icons.delete),),
            ListTile(title: Text('Praticar dart'), leading: Icon(Icons.radio_button_unchecked), trailing: Icon(Icons.delete)),
            ListTile(title: Text('Criar um app'), leading: Icon(Icons.radio_button_unchecked), trailing: Icon(Icons.delete)),
          ],
        ),
          floatingActionButton: FloatingActionButton(
            
          onPressed: () {
            AlertDialog(
            title: Text('Alerta'),
            content: Text('Texto legal'),
            actions: [
              TextButton(onPressed: () => "",
              child: Text('Confirm'),
              ),
              TextButton(onPressed: () => "",
              child: Text('Cancel'),
              ),
            ],
            
            );
          },
          backgroundColor: Colors.black,
          elevation: 8,
          child: Icon(Icons.add_rounded,
          color: Colors.white,
          ),
        ),
      ),
      );
  }

}
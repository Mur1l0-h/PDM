import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: SalvarTextoApp()
    )
  );
}

class SalvarTextoApp extends StatefulWidget{
  @override 
  _SalvarTextoAppState createState() => _SalvarTextoAppState();
}

class _SalvarTextoAppState extends State<SalvarTextoApp>{
  
  TextEditingController controller = TextEditingController();
  List<String> textos = [];
  String textoSalvo = "";
  

  void salvarTexto() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("texto", controller.text);

    setState(() {
      textoSalvo = controller.text;
    });
  }

  void carregarTexto() async{
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      textoSalvo = prefs.getString("texto") ?? "";
    });
  }

  void adicionarTexto(){
    if(controller.text.isNotEmpty){
      setState(() {
        textos.add(controller.text);
        controller.clear();
      });
    }
    salvarTexto();
  }

  void removerTexto(int index){
    setState(() {
      textos.removeAt(index);
    });
    salvarTexto();
  }


  @override 
  void initState(){
    super.initState();
    carregarTexto();
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Salvar dados"),),
  body: Padding(
    padding: EdgeInsets.all(20),
    child: Column(
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(labelText: "Digite"),
        ),

        SizedBox(height: 10,),

        ElevatedButton(onPressed: salvarTexto, child: Text("Salvar")),

        SizedBox(height: 20,),
        
        Expanded(child: 
          textos.isEmpty 
          ? Center(child: Text("Nenhum texto adicionado"),)
          : ListView.builder(
            itemCount: textos.length,
            itemBuilder: (context, index){
              return ListTile(
                title: Text(textos[index]),
                // trailing: IconButton(
                // onPressed: () => carregarTexto(), 
                // icon: Icon(Icons.delete)),
              );
            },
          )
        ),

        Text("Salvo: $textoSalvo", style: TextStyle(fontSize: 20),)
      ],
    ),
  ),
    );
  }

}


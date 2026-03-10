import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: BotaoHumor(),
    debugShowCheckedModeBanner: false,));
  
}


class BotaoHumor extends StatefulWidget{
  
  @override 
  _BotaoHumorState createState() => _BotaoHumorState();
}

class _BotaoHumorState extends State<BotaoHumor>{
  
  int valorHumor = 0;

  void alterarValor(int valorRecebido){
    setState(() {
      valorHumor = valorRecebido;
    });
  }

IconData mudarIcone(){
      if(valorHumor == 0){
        return Icons.sentiment_satisfied_alt_rounded;
      }else if(valorHumor == 1){
        return Icons.sentiment_neutral_rounded;
      }else if(valorHumor == 2){
        return Icons.sentiment_dissatisfied_rounded;
      }else{
        return Icons.sentiment_dissatisfied_rounded;
      }
  }

MaterialColor alterarCor(){
  if(valorHumor == 0){
        return Colors.amber;
      }else if(valorHumor == 1){
        return Colors.blue;
      }else if(valorHumor == 2){
        return Colors.red;
      }else{
        return Colors.red;
      }
}


@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: alterarCor(),
      appBar: AppBar(
        title: Text('Botão do humor'),
        backgroundColor: alterarCor(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              mudarIcone(),
              size: 100,
            ),
          // Row(
          //   children: [
              
          //   ],
          // ),
            ElevatedButton(onPressed: () {alterarValor(0);},
              child: Text('Feliz'),
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: () {alterarValor(1);},
              child: Text('Neutro')
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: () {alterarValor(2);},
              child: Text('Bravo')
            )
            
          ],
        ),
      ),
      
    );
  }

}
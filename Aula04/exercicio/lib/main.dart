import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(PaginaRemovedor());
}

class PaginaRemovedor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TodoList());
  }
}

class TodoList extends StatefulWidget {
  @override
  State<TodoList> createState() => _TodoState();
}

class _TodoState extends State<TodoList> {
  final List<String> lista = [];
  final TextEditingController listController = TextEditingController();

  void adicionarTarefa() {
    if (listController.text.trim().isEmpty) {
      return;
    }
      setState(() {
        lista.add(listController.text);
      });
      listController.clear();
  }

  void removerTarefa(int index) {
    setState(() {
      lista.removeAt(index);
    });
  }

  @override
  void dispose() {
    listController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Tarefas')),
      body: Column(
        children: [
          TextField(
            controller: listController,
            decoration: const InputDecoration(
            hintText: 'Digite sua tarefa',
            border: OutlineInputBorder(),
            
            ),
            onSubmitted: (_) => adicionarTarefa(),
          ),
          SizedBox(height: 10,),
          ElevatedButton(
            onPressed: adicionarTarefa,
            child: const Text('Adicionar'),
          ),
          Expanded(
            child: lista.isEmpty ? 
            Center(
              child: Text('Nenhuma tarefa adicionada'),
            ) : ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(lista[index]),
                  trailing: IconButton(
                    onPressed: () => removerTarefa(index),
                    icon: const Icon(Icons.delete),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

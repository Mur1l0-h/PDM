import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(AppCadastroInicial());
}

class AppCadastroInicial extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppCadastro(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppCadastro extends StatefulWidget{
  @override
  State<AppCadastro> createState() => _AppCadastroState();
}

class _AppCadastroState extends State<AppCadastro>{
  List<Map<String, dynamic>> tarefas = [];
  TextEditingController listController = TextEditingController();
  
  final _formKey = GlobalKey<FormState>();
  final TextEditingController tituloController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();

  Future<Database> criarBanco() async{
    final caminho = await getDatabasesPath();
    final path = join(caminho, "tarefasDb.db");

    return openDatabase(
      path, 
      onCreate: (db, version){
        return db.execute(
          "CREATE TABLE tarefas(id INTEGER PRIMARY KEY AUTOINCREMENT, titulo TEXT, descricao TEXT)"
        );
      },
      version: 1,
    );
  }

  Future<void> inserirTarefa(String titulo, String descricao) async {
    final db = await criarBanco();

    await db.insert(
      "tarefas", {"titulo": titulo, "descricao": descricao}
      );

      await carregarTarefas();
  }

  Future<void> carregarTarefas() async{
    final db = await criarBanco();
    final lista = await db.query("tarefas");

    setState(() {
      tarefas = lista;
    });
  }

Future<void> atualizarTarefa(int id, String novoTitulo, String novaDescricao) async {
    final db = await criarBanco(); // Keeping your exact database logic!

    await db.update(
      "tarefas", 
      {"titulo": novoTitulo, "descricao": novaDescricao},
      where: "id = ?", 
      whereArgs: [id]
    );

    await carregarTarefas(); // Refresh the list
  }

  Future<void> excluirTarefa(int id) async{
    final db = await criarBanco();

    await db.delete("tarefas", where: "id = ?", whereArgs: [id]);

    carregarTarefas();
  }

  @override 
  void initState() {
    super.initState();
    carregarTarefas();
  }

void mostrarDialogoEdicao(BuildContext context ,Map<String, dynamic> tarefa) {
    // Fill controllers with the existing data
    TextEditingController editTituloController = TextEditingController(text: tarefa['titulo']);
    TextEditingController editDescricaoController = TextEditingController(text: tarefa['descricao']);
    final editFormKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text("Editar Tarefa"),
          content: Form(
            key: editFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min, // Prevents dialog from taking whole screen
              children: [
                TextFormField(
                  controller: editTituloController,
                  decoration: const InputDecoration(labelText: "Novo Título"),
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Insira um título";
                    return null;
                  },
                ),
                TextFormField(
                  controller: editDescricaoController,
                  decoration: const InputDecoration(labelText: "Nova Descrição"),
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Insira uma descrição";
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext), // Close without saving
              child: const Text("Cancelar"),
            ),
            ElevatedButton(
              onPressed: () async {
                if (editFormKey.currentState!.validate()) {
                  // Call our new update method
                  await atualizarTarefa(
                    tarefa['id'], 
                    editTituloController.text, 
                    editDescricaoController.text
                  );
                  
                  if (!context.mounted) return;
                  
                  Navigator.pop(dialogContext); // Close the dialog
                  
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Tarefa atualizada com sucesso!"))
                  );
                }
              },
              child: const Text("Salvar"),
            ),
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de tarefas"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
        
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: tituloController,
                decoration: InputDecoration(labelText: "Título da tarefa"),
                validator: (value){
                  if (value == null || value.isEmpty){
                    return "Insira um título";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16,),

              TextFormField(
                controller: descricaoController,
                decoration: InputDecoration(labelText: "Descrição da tarefa"),
                validator: (value){
                  if (value == null || value.isEmpty){
                    return "Insira uma descrição";
                  }
                  return null;
                },
              ),
              SizedBox(height: 24,),
              ElevatedButton(
                
                onPressed: () async { 
                  if(_formKey.currentState!.validate()){
                    
                    await inserirTarefa(tituloController.text, descricaoController.text);
                    
                    tituloController.clear();
                    descricaoController.clear();
                    
                    if (!context.mounted) return; 
                    
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Tarefa salva com sucesso!"))
                    );
                  }
                }, 
                child: Text("Salvar tarefa")
              ),
                Expanded(
                  child: tarefas.isEmpty ? 
                  Center(
                    child: Text("Nenhuma tarefa adicionada"),
                  ) : ListView.builder(
                        itemCount: tarefas.length,
                        itemBuilder: (context, index) {
                          // Extract the specific task for this row
                          final tarefa = tarefas[index]; 

                         return ListTile(
                          title: Text(
                            tarefa['titulo'] ?? "Sem título", 
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(tarefa['descricao'] ?? "Sem descrição"),
                          
                          // You can keep this so tapping the row still works, or remove it!
                          onTap: () => mostrarDialogoEdicao(context, tarefa),
                          
                          // 1. We replace the single IconButton with a Row
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min, // 2. CRITICAL: Prevents the Row from taking infinite space
                            children: [
                              // Botão de Editar
                              IconButton(
                                onPressed: () => mostrarDialogoEdicao(context, tarefa),
                                icon: const Icon(Icons.edit, color: Colors.blue),
                              ),
                              // Botão de Excluir
                              IconButton(
                                onPressed: () => excluirTarefa(tarefa['id']), 
                                icon: const Icon(Icons.delete, color: Colors.red),
                              ),
                            ],
                          ),
                        );
                    },
                  ),
                )
            ],
          )
          ),
        ),
    );
  }
}
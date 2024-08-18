import 'package:flutter/material.dart';
import 'package:todo_sqlite/models/task.dart';
import 'package:todo_sqlite/service/database_service.dart';

class AnaEkran extends StatefulWidget {
  const AnaEkran({super.key, required String baslik, required String aciklama});

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  // DATABASE TANIMLAMA
  // ignore: unused_field
  final DatabaseService _databaseService = DatabaseService.instance;
  String? _task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("YAPILACAKLAR")),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
        ],
      ),
      floatingActionButton: _addTaskButton(),
      body: _tasksList(),
    );
  }

  Widget _addTaskButton() {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("Görev Ekle"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  onChanged: (value) {
                    setState(() {
                      _task = value;
                    });
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Açıklama'),
                ),
                MaterialButton(
                  color: Theme.of(context).colorScheme.primary,
                  onPressed: () {
                    if (_task == null || _task == "") return;
                    _databaseService.addTask(_task!);
                    setState(() {
                      _task = null;
                    });
                    Navigator.pop(
                      context,
                    );
                  },
                  child: const Text(
                    "Ekle",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
      child: const Icon(
        Icons.add,
      ),
    );
  }

  // SQL İŞLEMLERİ
  Widget _tasksList() {
    return FutureBuilder(
        future: _databaseService.getTasks(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              Task task = snapshot.data![index];
              return ListTile(
                onLongPress: () {
                  _databaseService.deleteTask(
                    task.id,
                  );
                  setState(() {});
                },
                title: Text(
                  task.content,
                ),
                trailing: Checkbox(
                  value: task.status == 1,
                  onChanged: (value) {
                    _databaseService.updateTaskStatus(
                        task.id, value == true ? 1 : 0);
                    setState(() {});
                  },
                ),
              );
            },
          );
        });
  }

  /* 
  Widget gorevListesi() {
    // Görev listesi widget'ı
    return ListView.builder(
      itemCount: 5, // Örnek için sabit bir sayı verildi
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: ListTile(
            title: const Text("Örnek Başlık"),
            subtitle: const Text("Örnek Açıklama"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    // Düzenleme işlemi
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    // Silme işlemi
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  */

  /*
  void gorevEkle(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Yeni Öğe Ekle"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: baslikController,
                decoration: const InputDecoration(hintText: 'Başlık'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: aciklamaController,
                decoration: const InputDecoration(hintText: 'Açıklama'),
                maxLines: 3,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Yeni görev ekleme işlemi
                Navigator.of(context).pop();
              },
              child: const Text("Ekle"),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("İptal"),
            ),
          ],
        );
      },
    );
  }
  */
}

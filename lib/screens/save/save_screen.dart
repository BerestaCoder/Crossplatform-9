import 'dart:math';

import 'package:flutter/material.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({super.key});

  @override
  State<SaveScreen> createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  Text _saveSlotTextOne = Text("Пустой слот");
  Text _saveSlotTextTwo = Text("Пустой слот");

  // Future API
  void _saveSlotOne() {
    setState(() {
      _saveSlotTextOne = Text("Ждём...");
    });
    Future<bool> messageFuture = getRandomBool();
    messageFuture.then((result){
      setState(() {
        if (result)
          _saveSlotTextOne = Text("Успешно сохранено", style: TextStyle(color: Colors.green));
        else
          _saveSlotTextOne = Text("Ошибка сохранения", style: TextStyle(color: Colors.red));
      });
    });
  }
  // await
  Future<void> _saveSlotTwo() async {
    setState(() {
      _saveSlotTextTwo = Text("Ждём...");
    });
    bool result = await getRandomBool();
    setState(() {
      if (result)
        _saveSlotTextTwo = Text("Успешно сохранено", style: TextStyle(color: Colors.green));
      else
        _saveSlotTextTwo = Text("Ошибка сохранения", style: TextStyle(color: Colors.red));
    });
  }
  // Возвращает истину или ложь, иммитируя загрузку сохранения
  Future<bool> getRandomBool() {
    return Future.delayed(Duration(seconds: 3), () => Random().nextBool());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Асинхронное программирование"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
                child: ListTile(
                  title: const Text("Сохранение 1"),
                  subtitle: _saveSlotTextOne,
                  trailing: IconButton(
                    icon: const Icon(Icons.save),
                    onPressed: () => _saveSlotOne(),
                  ),
                )
            ),
            Card(
                child: ListTile(
                  title: const Text("Сохранение 2"),
                  subtitle: _saveSlotTextTwo,
                  trailing: IconButton(
                    icon: const Icon(Icons.save),
                    onPressed: () => _saveSlotTwo(),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
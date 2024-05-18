import 'package:crossplatform9/screens/basket/basket_screen.dart';
import 'package:crossplatform9/screens/left_right/left_image_screen.dart';
import 'package:crossplatform9/screens/list/list_screen.dart';
import 'package:crossplatform9/screens/save/save_screen.dart';
import 'package:crossplatform9/tools/platform_checker.dart';
import 'package:crossplatform9/tools/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({super.key});
  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  void _saveProfileSettings(String newName, String newAge){
    setState(() {
      UserWidget.of(context).name = newName;
      UserWidget.of(context).age = int.parse(newAge);
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    //String name = UserWidget.of(context).name;
    //int age = UserWidget.of(context).age;

    final nameController = TextEditingController();
    final ageController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Домащняя страница'),
      ),
      body: Center(
          child: SizedBox(
            width: 400,
            height: 400,
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Имя',
                  ),
                  controller: nameController,
                ),
                const SizedBox(height: 10,),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Возраст',
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  controller: ageController,
                ),
                const SizedBox(height: 30,),
                ElevatedButton(onPressed: () => _saveProfileSettings(nameController.text, ageController.text), child: Text("Сохранить"))
              ],
            ),
          )
      ),
    );
  }
}
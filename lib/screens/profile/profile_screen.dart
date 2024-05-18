import 'package:crossplatform9/screens/basket/basket_screen.dart';
import 'package:crossplatform9/screens/left_right/left_image_screen.dart';
import 'package:crossplatform9/screens/list/list_screen.dart';
import 'package:crossplatform9/screens/profile/profile_settings_screen.dart';
import 'package:crossplatform9/screens/save/save_screen.dart';
import 'package:crossplatform9/tools/platform_checker.dart';
import 'package:crossplatform9/tools/save.dart';
import 'package:crossplatform9/tools/user.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _openProfileSettingsScreen(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileSettingsScreen()));
  }
  Save _save1 = GetIt.I<Save>(instanceName: 'save_1');
  Save _save2 = GetIt.I<Save>(instanceName: 'save_2');
  
  @override
  Widget build(BuildContext context) {
    String name = UserWidget.of(context).name;
    int age = UserWidget.of(context).age;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Профиль'),
      ),
      body: Center(
        child: SizedBox(
          width: 400,
          child: Column(
            children: [
              Card(
                 child: ListTile(
                   title: Text(name),
                   subtitle: Text("$age лет"),
                   trailing: IconButton(
                     icon: const Icon(Icons.draw),
                     onPressed: () => _openProfileSettingsScreen(),
                     tooltip: "Изменить информацию о пользователе",
                   ),
                 )
              ),
              const SizedBox(height: 10,),
              Text("Сохранение 1:${_save1.getStateinText()}"),
              const SizedBox(height: 10,),
              Text("Сохранение 2:${_save2.getStateinText()}")
            ],
          ),
        ),
      )
    );
  }
}
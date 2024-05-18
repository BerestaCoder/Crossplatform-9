import 'package:crossplatform9/screens/basket/basket_screen.dart';
import 'package:crossplatform9/screens/left_right/left_image_screen.dart';
import 'package:crossplatform9/screens/list/list_screen.dart';
import 'package:crossplatform9/screens/profile/profile_screen.dart';
import 'package:crossplatform9/screens/save/save_screen.dart';
import 'package:crossplatform9/tools/platform_checker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GetIt getIt = GetIt.instance;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    getIt
        .isReady<AppModel>()
        .then((_) => getIt<AppModel>().addListener(update));

    super.initState();
  }

  PlatformChecker pl = new PlatformChecker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Домащняя страница'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              pl.isDesktopInterface() ? const Text("Приложение запущено на компьютере") : const Text("Приложение запущено на телефоне"),
              const SizedBox(height: 40),
              SizedBox(
                width: 200,
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // =========== Профиль
                    ElevatedButton(
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen())),
                        child: const Row(
                          children: [
                            Icon(Icons.account_circle),
                            Text("Профиль"),
                          ],
                        )
                    ),
                    // =========== Корзина
                    ElevatedButton(
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const BasketScreen())),
                        child: const Row(
                          children: [
                            Icon(Icons.shopping_basket_outlined),
                            Text("Корзина"),
                          ],
                        )
                    ),
                    // =========== Сохранения
                    ElevatedButton(
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SaveScreen())),
                        child: const Row(
                          children: [
                            Icon(Icons.save),
                            Text("Сохранение"),
                          ],
                        )
                    ),
                    // =========== Сохранения
                    ElevatedButton(
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LeftImageScreen())),
                        child: const Row(
                          children: [
                            Icon(Icons.image),
                            Text("Картинки"),
                          ],
                        )
                    ),
                    // =========== Списки
                    ElevatedButton(
                        onPressed: () => context.go('/list_screen'),
                        child: const Row(
                          children: [
                            Icon(Icons.list),
                            Text("Разные списки"),
                          ],
                        )
                    ),
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}
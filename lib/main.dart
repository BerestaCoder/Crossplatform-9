import 'package:crossplatform9/screens/list/list_screen.dart';
import 'package:crossplatform9/screens/home_screen.dart';
import 'package:crossplatform9/tools/user.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UserWidget(
      name: "Иванов Иван Иванович",
      age: 25,
      child: MaterialApp.router(
        routerConfig: _router,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'list_screen',
          builder: (BuildContext context, GoRouterState state) {
            return const ListScreen();
          },
        ),
      ],
    ),
  ],
);
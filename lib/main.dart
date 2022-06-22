import 'package:adopt_app/pages/SignUp.dart';
import 'package:adopt_app/pages/addPet.dart';
import 'package:adopt_app/pages/home_page.dart';
import 'package:adopt_app/providers/authProvider.dart';
import 'package:adopt_app/providers/pets_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<PetsProvider>(create: (_) => PetsProvider()),
        ChangeNotifierProvider<authProvider>(create: (_) => authProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }

  final _router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomePage(),),
      GoRoute(path: '/SignUp', builder: (context, state) => const SignUp(),),
      GoRoute(path: '/AddPet', builder: (context, state) => const addPet(),),

    ],
  );
}

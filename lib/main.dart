import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tekstil_cad/pages/home_page.dart';
import 'package:tekstil_cad/route_generator.dart';
import 'package:tekstil_cad/view_models/model_viewmodel.dart';
import 'package:tekstil_cad/view_models/user_viewmodel.dart';
import 'package:tekstil_cad/locator.dart';

void main() {
  setupLocator();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ModelViewModel()),
    ChangeNotifierProvider(create: (_) => UserViewModel()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tekstil Cad',
      theme: ThemeData(
         colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: const Color.fromARGB(255, 34, 126, 167),
    ),
      ),
      home: const MyHomePage(),
      onGenerateRoute: RouteGenerator.rotaOlustur,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    UserViewModel _userModel =
        Provider.of<UserViewModel>(context, listen: false);
    _userModel.userGetir();
    return const HomePage();
  }
}

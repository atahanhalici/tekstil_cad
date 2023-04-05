import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tekstil_cad/view_models/model_viewmodel.dart';
import 'package:tekstil_cad/widgets/bottom_navi.dart';
import 'package:tekstil_cad/locator.dart';

void main() {
  setupLocator();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ModelViewModel()),
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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
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
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const Center(),
            Positioned(
                left: 25,
                width: MediaQuery.of(context).size.width - 50,
                bottom: 20,
                child: const BottomNavigationBars())
          ],
        ),
      ),
    );
  }
}

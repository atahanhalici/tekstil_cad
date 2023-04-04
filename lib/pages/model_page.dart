import 'package:babylonjs_viewer/babylonjs_viewer.dart';
import 'package:flutter/material.dart';

class ModelPage extends StatelessWidget {
  const ModelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Lowpoly Jacket")),
        body: Center(child: BabylonJSViewer(src: 'assets/jacket.glb')));
  }
}

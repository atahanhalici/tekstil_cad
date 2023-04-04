import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ModelPage extends StatelessWidget {
  const ModelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Model Viewer")),
      body: ModelViewer(
        src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
      ),
    );
  }
}

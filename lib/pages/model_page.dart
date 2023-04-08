import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:provider/provider.dart';
import 'package:tekstil_cad/models/3d_model.dart';
import 'package:tekstil_cad/view_models/model_viewmodel.dart';

class ModelPage extends StatefulWidget {
  final Model model;
  const ModelPage({Key? key, required this.model}) : super(key: key);

  @override
  State<ModelPage> createState() => _ModelPageState();
}

class _ModelPageState extends State<ModelPage> {
  Color _seciliRenk = Colors.white;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: _seciliRenk,
          appBar: AppBar(
            title: Text(
              "Tekstil Cad",
              style: TextStyle(
                  color: _seciliRenk == Colors.white
                      ? Colors.black
                      : Colors.white),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(
                color:
                    _seciliRenk == Colors.white ? Colors.black : Colors.white),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height < 500 ? 250 : 500,
                  child: Center(
                      child: ModelViewer(
                          ar: true,
                          backgroundColor: Colors.transparent,
                          autoRotate: true,
                          autoPlay: false,
                          src: widget.model
                              .link) /*BabylonJSViewer(src: 'assets/jacket.glb')*/
                      ),
                ),
                Container(
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /*const SizedBox(
                          height: 15,
                        ),*/
                        Text(
                          widget.model.adi,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.model.aciklama,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 13),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Arkaplan Rengi:",
                                style: TextStyle(color: Colors.white),
                              ),
                              DropdownButton<Color>(
                                  dropdownColor: Colors.black,
                                  elevation: 0,
                                  underline: Container(
                                    height: 0,
                                  ),
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.white,
                                  ),
                                  hint: const Text(
                                    "Arkaplan Rengi",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  items: const [
                                    DropdownMenuItem(
                                      child: Text(
                                        "Beyaz",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      value: Colors.white,
                                    ),
                                    DropdownMenuItem(
                                      child: Text(
                                        "Siyah",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      value: Colors.black,
                                    ),
                                    DropdownMenuItem(
                                      child: Text(
                                        "Kırmızı",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      value: Colors.red,
                                    ),
                                    DropdownMenuItem(
                                      child: Text(
                                        "Mavi",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      value: Colors.blue,
                                    ),
                                    DropdownMenuItem(
                                      child: Text(
                                        "Sarı",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      value: Colors.yellow,
                                    ),
                                    DropdownMenuItem(
                                      child: Text(
                                        "Yeşil",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      value: Colors.green,
                                    ),
                                  ],
                                  value: _seciliRenk,
                                  onChanged: (Color? yeni) {
                                    setState(() {
                                      _seciliRenk = yeni!;
                                    });
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

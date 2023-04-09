import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tekstil_cad/pages/login_page.dart';
import 'package:tekstil_cad/pages/model_page.dart';
import 'package:tekstil_cad/pages/my_models_page.dart';
import 'package:tekstil_cad/pages/profile_page.dart';
import 'package:tekstil_cad/view_models/model_viewmodel.dart';

class BottomNavigationBars extends StatelessWidget {
  final int sayi;
  const BottomNavigationBars({Key? key, required this.sayi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ModelViewModel _model = Provider.of<ModelViewModel>(context, listen: false);

    return SizedBox(
      height: 80,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width - 50,
            child: Container(
              height: 55,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap: () {
                        if (sayi == 0) {
                          _model.modelleriGetir();
                          Navigator.pushNamed(context, "/modellerim");
                        } else if (sayi != 0 && sayi != 1) {
                          _model.modelleriGetir();
                          Navigator.pushReplacementNamed(context, '/modellerim',
                              arguments: {});
                        }
                      },
                      child: Container(
                          color: Colors.transparent,
                          padding: const EdgeInsets.all(15),
                          child: const Icon(Icons.dehaze))),
                  const Icon(
                    Icons.home,
                    color: Colors.transparent,
                  ),
                  GestureDetector(
                      onTap: () {
                        if (sayi == 0) {
                          Navigator.pushNamed(context, "/profil");
                        } else if (sayi != 0 && sayi != 2) {
                          Navigator.pushReplacementNamed(context, '/profil',
                              arguments: {});
                        }
                      },
                      child: Container(
                          color: Colors.transparent,
                          padding: const EdgeInsets.all(15),
                          child: const Icon(Icons.person)))
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (sayi != 0) {
                Navigator.popUntil(
                    context, (route) => route.settings.name == "/");
              }
            },
            child: Container(
              height: 65,
              decoration: const BoxDecoration(
                  color: Colors.black, shape: BoxShape.circle),
              // child: Icon(Icons.home),
            ),
          ),
          Positioned(
            left: (MediaQuery.of(context).size.width - 80) / 2,
            child: GestureDetector(
              onTap: () {
                if (sayi != 0) {
                  Navigator.popUntil(
                      context, (route) => route.settings.name == "/");
                }
              },
              child: const SizedBox(
                  height: 65,
                  child: Icon(
                    Icons.home,
                    size: 30,
                    color: Colors.white,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

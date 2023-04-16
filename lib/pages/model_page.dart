import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:provider/provider.dart';
import 'package:tekstil_cad/models/model.dart';
import 'package:tekstil_cad/view_models/theme_viewmodel.dart';

// ignore: must_be_immutable
class ModelPage extends StatefulWidget {
  final Model model;
  Color seciliRenk;
  ModelPage({Key? key, required this.model, required this.seciliRenk})
      : super(key: key);

  @override
  State<ModelPage> createState() => _ModelPageState();
}

class _ModelPageState extends State<ModelPage> {
  @override
  Widget build(BuildContext context) {
    ThemeViewModel _themeModel =
        Provider.of<ThemeViewModel>(context, listen: true);
    /*Color _seciliRenk =
        _themeModel.state == ThemeMod.dark ? Colors.black : Colors.white;*/
    return SafeArea(
      child: Scaffold(
          backgroundColor: widget.seciliRenk,
          appBar: AppBar(
            title: Text(widget.model.adi,
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        color: widget.seciliRenk == Colors.white
                            ? Colors.black
                            : Colors.white),
                    fontWeight: FontWeight.w500)),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(
                color: widget.seciliRenk == Colors.white
                    ? Colors.black
                    : Colors.white),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height <
                            MediaQuery.of(context).size.width
                        ? MediaQuery.of(context).size.height - 56
                        : MediaQuery.of(context).size.height < 700
                            ? 500
                            : MediaQuery.of(context).size.height < 800
                                ? 575
                                : MediaQuery.of(context).size.height < 900
                                    ? 650
                                    : MediaQuery.of(context).size.height < 1000
                                        ? 720
                                        : MediaQuery.of(context).size.height <
                                                1100
                                            ? 875
                                            : MediaQuery.of(context)
                                                        .size
                                                        .height <
                                                    1300
                                                ? 1000
                                                : 1200,
                    child: Center(
                        child: ModelViewer(
                            ar: true,
                            backgroundColor: Colors.transparent,
                            autoRotate: true,
                            autoPlay: false,
                            src: widget.model.link)
                        /*BabylonJSViewer(src: 'assets/jacket.glb')*/
                        )),
                Visibility(
                  visible: MediaQuery.of(context).size.height >
                          MediaQuery.of(context).size.width
                      ? true
                      : false,
                  child: Container(
                    //height: 220,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 34, 126, 167),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: MediaQuery.of(context).size.width / 8,
                          height: 3,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20),
                          child: Wrap(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            direction: Axis.horizontal,
                            children: [
                              /*const SizedBox(
                                height: 15,
                              ),*/
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(widget.model.adi,
                                      style: GoogleFonts.ptSans(
                                        textStyle: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25),
                                      )),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(widget.model.aciklama,
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            color: Colors.white, fontSize: 13),
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 40,
                                child: Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text('arkaplanrengi'.tr() + " :",
                                          style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                                color: Colors.white),
                                          )),
                                      DropdownButton<Color>(
                                          dropdownColor: const Color.fromARGB(
                                              255, 24, 24, 24),
                                          elevation: 0,
                                          underline: Container(
                                            height: 0,
                                          ),
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.white,
                                          ),
                                          hint: Text(
                                            'arkaplanrengi',
                                            style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ).tr(),
                                          items: [
                                            DropdownMenuItem(
                                              child: Text('beyaz',
                                                  style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                        color: Colors.white),
                                                  )).tr(),
                                              value: Colors.white,
                                            ),
                                            DropdownMenuItem(
                                              child: Text('siyah',
                                                  style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                        color: Colors.white),
                                                  )).tr(),
                                              value: Colors.black,
                                            ),
                                            DropdownMenuItem(
                                              child: Text("kirmizi",
                                                  style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                        color: Colors.white),
                                                  )).tr(),
                                              value: Colors.red,
                                            ),
                                            DropdownMenuItem(
                                              child: Text("mavi",
                                                  style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                        color: Colors.white),
                                                  )).tr(),
                                              value: Colors.blue,
                                            ),
                                            DropdownMenuItem(
                                              child: Text("sari",
                                                  style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                        color: Colors.white),
                                                  )).tr(),
                                              value: Colors.yellow,
                                            ),
                                            DropdownMenuItem(
                                              child: Text("yesil",
                                                  style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                        color: Colors.white),
                                                  )).tr(),
                                              value: Colors.green,
                                            ),
                                          ],
                                          value: widget.seciliRenk,
                                          onChanged: (Color? yeni) {
                                            setState(() {
                                              widget.seciliRenk = yeni!;
                                            });
                                          }),
                                    ],
                                  ),
                                ),
                              ),
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

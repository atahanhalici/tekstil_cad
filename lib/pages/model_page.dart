import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:tekstil_cad/models/model.dart';

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
            title: Text(widget.model.adi,
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        color: _seciliRenk == Colors.white
                            ? Colors.black
                            : Colors.white),
                    fontWeight: FontWeight.w500)),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(
                color:
                    _seciliRenk == Colors.white ? Colors.black : Colors.white),
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
                                          : MediaQuery.of(context).size.height <
                                                  1300
                                              ? 1000
                                              : 1200,
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
                Visibility(
                  visible: MediaQuery.of(context).size.height >
                          MediaQuery.of(context).size.width
                      ? true
                      : false,
                  child: Container(
                    //height: 220,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 34, 126, 167),
                      borderRadius:const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:const Offset(0, -5), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: MediaQuery.of(context).size.width / 8,
                          height: 3,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
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
                                      Text("Arkaplan Rengi:",
                                          style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                                color: Colors.white),
                                          )),
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
                                          hint: Text(
                                            "Arkaplan Rengi",
                                            style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          items: [
                                            DropdownMenuItem(
                                              child: Text("Beyaz",
                                                  style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                        color: Colors.white),
                                                  )),
                                              value: Colors.white,
                                            ),
                                            DropdownMenuItem(
                                              child: Text("Siyah",
                                                  style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                        color: Colors.white),
                                                  )),
                                              value: Colors.black,
                                            ),
                                            DropdownMenuItem(
                                              child: Text("Kırmızı",
                                                  style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                        color: Colors.white),
                                                  )),
                                              value: Colors.red,
                                            ),
                                            DropdownMenuItem(
                                              child: Text("Mavi",
                                                  style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                        color: Colors.white),
                                                  )),
                                              value: Colors.blue,
                                            ),
                                            DropdownMenuItem(
                                              child: Text("Sarı",
                                                  style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                        color: Colors.white),
                                                  )),
                                              value: Colors.yellow,
                                            ),
                                            DropdownMenuItem(
                                              child: Text("Yeşil",
                                                  style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                        color: Colors.white),
                                                  )),
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

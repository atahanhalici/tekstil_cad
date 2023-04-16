import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tekstil_cad/view_models/theme_viewmodel.dart';
import 'package:tekstil_cad/view_models/user_viewmodel.dart';
import 'package:tekstil_cad/widgets/bottom_navi.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserViewModel _userModel =
        Provider.of<UserViewModel>(context, listen: true);
    ThemeViewModel _themeModel =
        Provider.of<ThemeViewModel>(context, listen: true);
    List ozellikler = ['ozellik1'.tr(), 'ozellik2'.tr(), 'ozellik3'.tr()];
    List resimler = [
      "assets/inceleyin.jpg",
      "assets/erisin.jpg",
      "assets/kalip.jpeg"
    ];
    var _zaman = TimeOfDay.now();
    var selamlama = _zaman.hour >= 6 && _zaman.hour < 12
        ? 'gunaydin'.tr()
        : _zaman.hour >= 12 && _zaman.hour < 18
            ? 'merhaba'.tr()
            : _zaman.hour >= 18 && _zaman.hour < 22
                ? 'iyiaksamlar'.tr()
                : 'iyigeceler'.tr();
    return SafeArea(
      child: Scaffold(
        backgroundColor: _themeModel.state == ThemeMod.dark
            ? const Color.fromARGB(255, 24, 24, 24)
            : Colors.white,
        body: _themeModel.states == States.bos
            ? _themeModel.state == ThemeMod.dark
                ? Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: SizedBox()),
                      Image.asset(
                        "assets/logo_koyu.jpg",
                        fit: BoxFit.cover,
                      ),
                      Expanded(child: SizedBox()),
                      SizedBox(
                        height: 50,
                        child: AnimatedTextKit(
                            totalRepeatCount: 1,
                            isRepeatingAnimation: true,
                            animatedTexts: [
                              TypewriterAnimatedText(
                                  "Sizin İçin Her Şeyi Hazırlıyoruz",
                                  textStyle: GoogleFonts.ptSans(
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  speed: const Duration(milliseconds: 70),
                                  cursor: ""),
                            ]),
                      ),
                    ],
                  ))
                : Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: SizedBox()),
                      Image.asset(
                        "assets/logo.jpeg",
                        fit: BoxFit.cover,
                      ),
                      Expanded(child: SizedBox()),
                      SizedBox(
                        height: 50,
                        child: AnimatedTextKit(
                            totalRepeatCount: 1,
                            isRepeatingAnimation: true,
                            animatedTexts: [
                              TypewriterAnimatedText(
                                  "Sizin İçin Her Şeyi Hazırlıyoruz",
                                  textStyle: GoogleFonts.ptSans(
                                      textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  speed: const Duration(milliseconds: 70),
                                  cursor: ""),
                            ]),
                      ),
                    ],
                  ))
            : Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Center(
                            child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: SizedBox(
                                    height: MediaQuery.of(context).size.height >
                                            MediaQuery.of(context).size.width
                                        ? MediaQuery.of(context).size.height *
                                            0.3
                                        : MediaQuery.of(context).size.height *
                                            0.5,
                                    width: MediaQuery.of(context).size.width,
                                    child: Image.asset(
                                      "assets/video.gif",
                                      fit: BoxFit.cover,
                                    ))),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          _userModel.state == ViewState.geldi
                              ? _themeModel.states == States.ilk
                                  ? AnimatedTextKit(
                                      totalRepeatCount: 1,
                                      isRepeatingAnimation: true,
                                      animatedTexts: [
                                          TypewriterAnimatedText(
                                              selamlama +
                                                  ' ' +
                                                  _userModel.user.adi,
                                              textStyle: GoogleFonts.ptSans(
                                                  textStyle: TextStyle(
                                                      color:
                                                          _themeModel.state ==
                                                                  ThemeMod.dark
                                                              ? Colors.white
                                                              : Colors.black,
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              speed: const Duration(
                                                  milliseconds: 40),
                                              cursor: ""),
                                        ])
                                  : _themeModel.states == States.geldi
                                      ? Text(
                                          selamlama + ' ' + _userModel.user.adi,
                                          style: GoogleFonts.ptSans(
                                              textStyle: TextStyle(
                                                  color: _themeModel.state ==
                                                          ThemeMod.dark
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold)),
                                        )
                                      : Container()
                              : _themeModel.states == States.ilk
                                  ? Text("TekstilCad",
                                      style: GoogleFonts.ptSans(
                                          textStyle: TextStyle(
                                              color: _themeModel.state ==
                                                      ThemeMod.dark
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold)))
                                  : Container(),
                          _themeModel.states == States.ilk
                              ? SizedBox(
                                  height: MediaQuery.of(context).size.width > 280 &&
                                          MediaQuery.of(context).size.width <
                                              290
                                      ? 160
                                      : MediaQuery.of(context).size.width >= 290 &&
                                              MediaQuery.of(context).size.width <
                                                  318
                                          ? 145
                                          : MediaQuery.of(context).size.width >= 318 &&
                                                  MediaQuery.of(context).size.width <
                                                      357
                                              ? 130
                                              : MediaQuery.of(context).size.width >= 357 &&
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width <
                                                          434
                                                  ? 110
                                                  : MediaQuery.of(context).size.width >= 434 &&
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width <
                                                              530
                                                      ? 90
                                                      : MediaQuery.of(context)
                                                                      .size
                                                                      .width >=
                                                                  530 &&
                                                              MediaQuery.of(context)
                                                                      .size
                                                                      .width <
                                                                  700
                                                          ? 70
                                                          : MediaQuery.of(context).size.width >= 700 && MediaQuery.of(context).size.width < 1000
                                                              ? 55
                                                              : MediaQuery.of(context).size.width >= 1000 && MediaQuery.of(context).size.width < 1965
                                                                  ? 40
                                                                  : MediaQuery.of(context).size.width >= 1965
                                                                      ? 20
                                                                      : 200,
                                  child: AnimatedTextKit(
                                    totalRepeatCount: 1,
                                    isRepeatingAnimation: false,
                                    animatedTexts: [
                                      TypewriterAnimatedText("aciklama".tr(),
                                          textStyle: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: _themeModel.state ==
                                                      ThemeMod.dark
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: 12,
                                            ),
                                          ),
                                          speed:
                                              const Duration(milliseconds: 30),
                                          cursor: "")
                                    ],
                                  ),
                                )
                              : _themeModel.states == States.geldi
                                  ? Text("aciklama".tr(),
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color:
                                              _themeModel.state == ThemeMod.dark
                                                  ? Colors.white
                                                  : Colors.black,
                                          fontSize: 12,
                                        ),
                                      ))
                                  : Container(),
                          const SizedBox(
                            height: 20,
                          ),
                          GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 3,
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 500,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20,
                                      mainAxisExtent: 300),
                              itemBuilder: (context, index) {
                                return Container(
                                    decoration: BoxDecoration(
                                        color:
                                            _themeModel.state == ThemeMod.dark
                                                ? Colors.white24
                                                : const Color.fromARGB(
                                                    255, 24, 24, 24),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15, left: 15, right: 15),
                                          child: SizedBox(
                                              height: 220,
                                              child:
                                                  Image.asset(resimler[index])),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: Text(ozellikler[index],
                                              style: GoogleFonts.robotoSlab(
                                                  textStyle: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500))),
                                        )
                                      ],
                                    ));
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "TekstilCad",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.ptSans(
                                  textStyle: TextStyle(
                                      color: _themeModel.state == ThemeMod.dark
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              "- Created by FABA -",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.ptSans(
                                textStyle: TextStyle(
                                    color: _themeModel.state == ThemeMod.dark
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 100,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      left: 25,
                      width: MediaQuery.of(context).size.width - 50,
                      bottom: 20,
                      child: const BottomNavigationBars(
                        sayi: 0,
                      ))
                ],
              ),
      ),
    );
  }
}

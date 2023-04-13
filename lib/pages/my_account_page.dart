import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tekstil_cad/models/user.dart';
import 'package:tekstil_cad/view_models/theme_viewmodel.dart';
import 'package:tekstil_cad/view_models/user_viewmodel.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeViewModel _themeModel =
        Provider.of<ThemeViewModel>(context, listen: true);
    Color _yaziRenk =
        _themeModel.state == ThemeMod.dark ? Colors.white : Colors.black;
    UserViewModel _userModel =
        Provider.of<UserViewModel>(context, listen: true);
    User user = _userModel.user;
    return SafeArea(
      child: Scaffold(
        backgroundColor: _themeModel.state == ThemeMod.dark
            ? const Color.fromARGB(255, 24, 24, 24)
            : Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.width <
                              MediaQuery.of(context).size.height
                          ? MediaQuery.of(context).size.height - 505
                          : MediaQuery.of(context).size.height - 225,
                      width: MediaQuery.of(context).size.width,
                      child: _themeModel.state == ThemeMod.dark
                          ? Image.asset(
                              "assets/logo_koyu.jpg",
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              "assets/logo.jpeg",
                              fit: BoxFit.cover,
                            )),
                  Positioned(
                    left: 15,
                    top: 15,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        defaultTargetPlatform == TargetPlatform.iOS
                            ? Icons.arrow_back_ios
                            : Icons.arrow_back,
                        color: _yaziRenk,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 34, 126, 167),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  height: 505,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("hesabim",
                              style: GoogleFonts.ptSans(
                                textStyle: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )).tr(),
                          const SizedBox(
                            height: 10,
                          ),
                          row("ad".tr(), user.adi),
                          const SizedBox(
                            height: 10,
                          ),
                          row("soyad".tr(), user.soyadi),
                          const SizedBox(
                            height: 10,
                          ),
                          row("kullanici_id".tr(), user.kullanici_id),
                          const SizedBox(
                            height: 10,
                          ),
                          row("sirket".tr(), user.sirket),
                          const SizedBox(
                            height: 10,
                          ),
                          row("mail".tr(), user.mail),
                          const SizedBox(
                            height: 40,
                          ),
                          Center(
                            child: SizedBox(
                              width: (MediaQuery.of(context).size.width - 60),
                              height: 40,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 24, 24, 24),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                onPressed: () {},
                                child: Text("bilgiguncelle",
                                    style: GoogleFonts.ptSans(
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )).tr(),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width - 50) /
                                        3,
                                child: TextButton(
                                    onPressed: () {},
                                    child: Text("hakkimizda",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.ptSans(
                                          textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )).tr()),
                              ),
                              SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width - 50) /
                                        3,
                                child: TextButton(
                                    onPressed: () {},
                                    child: Text("SSS",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.ptSans(
                                          textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )).tr()),
                              ),
                              SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width - 50) /
                                        3,
                                child: TextButton(
                                    onPressed: () {},
                                    child: Text("gizlilik",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.ptSans(
                                          textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )).tr()),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text("© 2023 TekstilCad",
                                style: GoogleFonts.ptSans(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                          Center(
                            child: Text("tumhaklarisakli",
                                style: GoogleFonts.ptSans(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )).tr(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  row(String ozellik, String metin) {
    return Row(
      //crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8, top: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              ozellik + " :",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8, top: 10),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              metin,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ),
      ],
    );
  }
}

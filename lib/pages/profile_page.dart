import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tekstil_cad/pages/my_account_page.dart';
import 'package:tekstil_cad/widgets/bottom_navi.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("profil",
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                )).tr(),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme: const IconThemeData(color: Colors.black),
          ),
          body: Stack(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ProfileMenu(
                        text: "hesabim".tr(),
                        icon: Icons.person,
                        press: () {
                          defaultTargetPlatform == TargetPlatform.android
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const MyAccount();
                                    },
                                  ),
                                )
                              : Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) {
                                      return const MyAccount();
                                    },
                                  ),
                                );
                        },
                      ),
                      ProfileMenu(
                        text: "ayarlar".tr(),
                        icon: Icons.settings,
                        press: () {
                          Navigator.pushNamed(context, '/ayarlar',
                              arguments: {});
                        },
                      ),
                      ProfileMenu(
                        text: "yardimmerkezi".tr(),
                        icon: Icons.question_answer,
                        press: () {},
                      ),
                      ProfileMenu(
                        text: "cikisyap".tr(),
                        icon: Icons.logout,
                        press: () {
                          _cikis(context);
                        },
                      ),
                      const SizedBox(
                        height: 80,
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
                    sayi: 2,
                  ))
            ],
          )),
    );
  }

  // ignore: non_constant_identifier_names
  ProfileMenu(
      {required String text,
      required IconData icon,
      required void Function()? press}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: const Color(0xFFF5F6F9),
        ),
        onPressed: press,
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 20),
            Expanded(
                child: Text(text,
                    style: GoogleFonts.ptSans(
                      textStyle: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ))),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  _cikis(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'cikisyap'.tr(),
            style: GoogleFonts.ptSans(
              textStyle: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'cikisyapemin'.tr(),
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'hayir'.tr(),
                style: GoogleFonts.ptSans(
                  textStyle: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'evet'.tr(),
                style: GoogleFonts.ptSans(
                  textStyle: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
                Navigator.pushReplacementNamed(context, '/login',
                    arguments: {});
              },
            ),
          ],
        );
      },
    );
  }
}

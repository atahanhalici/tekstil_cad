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
            title: Text("Profil",
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                )),
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
                        text: "Hesabım",
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
                        text: "Ayarlar",
                        icon: Icons.settings,
                        press: () {},
                      ),
                      ProfileMenu(
                        text: "Yardım Merkezi",
                        icon: Icons.question_answer,
                        press: () {},
                      ),
                      ProfileMenu(
                        text: "Çıkış Yap",
                        icon: Icons.logout,
                        press: () {},
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
}

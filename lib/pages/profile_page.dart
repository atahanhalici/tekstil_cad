import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tekstil_cad/pages/my_account_page.dart';
import 'package:tekstil_cad/view_models/user_viewmodel.dart';
import 'package:tekstil_cad/widgets/bottom_navi.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserViewModel _userModel =
        Provider.of<UserViewModel>(context, listen: true);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Profil",
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme: const IconThemeData(color: Colors.black),
          ),
          body: Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
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
                                      return MyAccount();
                                    },
                                  ),
                                )
                              : Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) {
                                      return MyAccount();
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
                      SizedBox(
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

  ProfileMenu(
      {required String text,
      required IconData icon,
      required void Function()? press}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Color(0xFFF5F6F9),
        ),
        onPressed: press,
        child: Row(
          children: [
            Icon(icon),
            SizedBox(width: 20),
            Expanded(
                child: Text(
              text,
              style: TextStyle(color: Colors.black),
            )),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

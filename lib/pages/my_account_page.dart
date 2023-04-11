import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tekstil_cad/models/user.dart';
import 'package:tekstil_cad/pages/login_page.dart';
import 'package:tekstil_cad/view_models/user_viewmodel.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserViewModel _userModel =
        Provider.of<UserViewModel>(context, listen: true);
    User user = _userModel.user;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.width <
                              MediaQuery.of(context).size.height
                          ? MediaQuery.of(context).size.height - 480
                          : MediaQuery.of(context).size.height - 200,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
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
                      child: Icon(defaultTargetPlatform == TargetPlatform.iOS
                          ? Icons.arrow_back_ios
                          : Icons.arrow_back),
                    ),
                  ),
                  Positioned(
                    left: 45,
                    top: 15,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginPage();
                            },
                          ),
                        );
                      },
                      child: Icon(defaultTargetPlatform == TargetPlatform.iOS
                          ? Icons.arrow_back_ios
                          : Icons.arrow_back),
                    ),
                  )
                ],
              ),
              Container(
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  height: 480,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Hesabım",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          row("Ad", user.adi),
                          const SizedBox(
                            height: 10,
                          ),
                          row("Soyad", user.soyadi),
                          const SizedBox(
                            height: 10,
                          ),
                          row("Kullanıcı Id", user.kullanici_id),
                          const SizedBox(
                            height: 10,
                          ),
                          row("Şirket", user.sirket),
                          const SizedBox(
                            height: 10,
                          ),
                          row("E-Mail", user.mail),
                          const SizedBox(
                            height: 40,
                          ),
                          Center(
                            child: SizedBox(
                              width: (MediaQuery.of(context).size.width - 60),
                              height: 40,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                onPressed: () {},
                                child: const Text(
                                  "Bilgilerini Güncelle",
                                  style: TextStyle(color: Colors.white),
                                ),
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
                                    child: const Text(
                                      "Hakkımızda",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ),
                              SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width - 50) /
                                        3,
                                child: TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Sıkça Sorulan Sorular",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ),
                              SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width - 50) /
                                        3,
                                child: TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Gizlilik Sözleşmesi",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Center(
                            child: Text(
                              "© 2023 TekstilCad",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          const Center(
                            child: Text(
                              "Tüm Hakları Saklıdır",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
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
              style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
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
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ),
      ],
    );
  }
}

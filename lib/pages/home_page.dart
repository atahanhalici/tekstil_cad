import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tekstil_cad/view_models/user_viewmodel.dart';
import 'package:tekstil_cad/widgets/bottom_navi.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserViewModel _userModel =
        Provider.of<UserViewModel>(context, listen: true);
    List ozellikler = [
      "Kalıplarınızı İnceleyin",
      "İstediğiniz Yerden Erişin",
      "Profilinize Ulaşın"
    ];
    return SafeArea(
      child: Scaffold(
        body: Stack(
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
                                  ? MediaQuery.of(context).size.height * 0.3
                                  : MediaQuery.of(context).size.height * 0.5,
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
                        ? AnimatedTextKit(
                            totalRepeatCount: 1,
                            isRepeatingAnimation: true,
                            animatedTexts: [
                                TypewriterAnimatedText(
                                    "Merhaba " + _userModel.user.adi,
                                    textStyle: GoogleFonts.ptSans(
                                        textStyle: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold)),
                                    speed: const Duration(milliseconds: 40),
                                    cursor: ""),
                              ])
                        : Text("TekstilCad",
                            style: GoogleFonts.ptSans(
                                textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold))
                            /*TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),*/
                            ),
                    AnimatedTextKit(
                        totalRepeatCount: 1,
                        isRepeatingAnimation: false,
                        animatedTexts: [
                          TypewriterAnimatedText(
                              "Tekstil Cad Mobil ile kalıp tasarımlarınızı istediğiniz anda ve istediğiniz yerde saniyeler içerisinde görüntüleme imkanına sahipsiniz. Tasarımlarınızı 3 Boyutlu olarak inceleyebilmek ve daha fazlası için alttaki menüyü kullanabilirsiniz. Ayrıca detaylı eğitime tekrar erişebilmek adına profilinizden uygulama rehberini inceleyebilirsiniz.",
                              textStyle: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                              speed: const Duration(milliseconds: 30),
                              cursor: "")
                        ]),
                    const SizedBox(
                      height: 10,
                    ),
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
                                  color: const Color.fromARGB(255, 24, 24, 24),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, left: 15, right: 15),
                                    child: SizedBox(
                                        height: 220,
                                        child:
                                            Image.asset("assets/kalip.jpeg")),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Text(ozellikler[index],
                                        style: GoogleFonts.robotoSlab(
                                            textStyle: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500))),
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
                            textStyle: const TextStyle(
                                color: Colors.black,
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
                          textStyle: const TextStyle(
                              color: Colors.black,
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

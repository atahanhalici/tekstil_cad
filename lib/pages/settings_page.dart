import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tekstil_cad/view_models/theme_viewmodel.dart';

class SettingsPage extends StatefulWidget {
  bool dark;
  SettingsPage({Key? key, required this.dark}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    ThemeViewModel _themeModel =
        Provider.of<ThemeViewModel>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: _themeModel.state == ThemeMod.dark
            ? const Color.fromARGB(255, 24, 24, 24)
            : Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
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
                        child: _themeModel.state == ThemeMod.dark
                            ? Image.asset(
                                "assets/logo_koyu.jpg",
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                "assets/logo.jpeg",
                                fit: BoxFit.cover,
                              )),
                  ),
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
                        color:
                            widget.dark == true ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
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
                          Row(
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 8, top: 10),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "dil".tr() + " :",
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 8, top: 10),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: DropdownButton<String>(
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
                                        'dil'.tr(),
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ),
                                      items: [
                                        DropdownMenuItem(
                                          child: Text('turkce'.tr(),
                                              style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    color: Colors.white),
                                              )),
                                          value: "Türkçe",
                                        ),
                                        DropdownMenuItem(
                                          child: Text('ingilizce'.tr(),
                                              style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    color: Colors.white),
                                              )),
                                          value: "İngilizce",
                                        ),
                                      ],
                                      value: "dil".tr() == "Dil"
                                          ? "Türkçe"
                                          : "İngilizce",
                                      onChanged: (String? yeni) {
                                        if (yeni == "Türkçe" ||
                                            yeni == "Turkish") {
                                          if ("dil".tr() != "Dil") {
                                            context.setLocale(
                                                const Locale('tr', 'TR'));
                                            Navigator.popUntil(
                                                context,
                                                (route) =>
                                                    route.settings.name == "/");
                                            Navigator.pushReplacementNamed(
                                                context, '/',
                                                arguments: {});
                                            Navigator.pushNamed(
                                                context, "/profil");
                                            defaultTargetPlatform ==
                                                    TargetPlatform.android
                                                ? Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) {
                                                        return SettingsPage(
                                                          dark: widget.dark,
                                                        );
                                                      },
                                                    ),
                                                  )
                                                : Navigator.push(
                                                    context,
                                                    CupertinoPageRoute(
                                                      builder: (context) {
                                                        return SettingsPage(
                                                          dark: widget.dark,
                                                        );
                                                      },
                                                    ),
                                                  );
                                          }
                                        } else if (yeni == "İngilizce" ||
                                            yeni == "English") {
                                          if ("dil".tr() != "Language") {
                                            context.setLocale(
                                                const Locale('en', 'US'));
                                            Navigator.popUntil(
                                                context,
                                                (route) =>
                                                    route.settings.name == "/");
                                            Navigator.pushReplacementNamed(
                                                context, '/',
                                                arguments: {});
                                            Navigator.pushNamed(
                                                context, "/profil");
                                            defaultTargetPlatform ==
                                                    TargetPlatform.android
                                                ? Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) {
                                                        return SettingsPage(
                                                          dark: widget.dark,
                                                        );
                                                      },
                                                    ),
                                                  )
                                                : Navigator.push(
                                                    context,
                                                    CupertinoPageRoute(
                                                      builder: (context) {
                                                        return SettingsPage(
                                                          dark: widget.dark,
                                                        );
                                                      },
                                                    ),
                                                  );
                                          }
                                        }
                                      }),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 8, top: 10),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "karanlikmod".tr() + " :",
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ),
                              Switch(
                                  value: widget.dark,
                                  activeColor: Colors.white,
                                  onChanged: (bool value) {
                                    if (value == true) {
                                      widget.dark = value;
                                      _themeModel.themeDark();
                                      Navigator.popUntil(
                                          context,
                                          (route) =>
                                              route.settings.name == "/");
                                      Navigator.pushReplacementNamed(
                                          context, '/',
                                          arguments: {});
                                      Navigator.pushNamed(context, "/profil");
                                      defaultTargetPlatform ==
                                              TargetPlatform.android
                                          ? Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return SettingsPage(
                                                    dark: widget.dark,
                                                  );
                                                },
                                              ),
                                            )
                                          : Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                builder: (context) {
                                                  return SettingsPage(
                                                    dark: widget.dark,
                                                  );
                                                },
                                              ),
                                            );
                                    } else {
                                      widget.dark = value;
                                      _themeModel.themeLight();
                                      Navigator.popUntil(
                                          context,
                                          (route) =>
                                              route.settings.name == "/");
                                      Navigator.pushReplacementNamed(
                                          context, '/',
                                          arguments: {});
                                      Navigator.pushNamed(context, "/profil");
                                      defaultTargetPlatform ==
                                              TargetPlatform.android
                                          ? Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return SettingsPage(
                                                    dark: widget.dark,
                                                  );
                                                },
                                              ),
                                            )
                                          : Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                builder: (context) {
                                                  return SettingsPage(
                                                    dark: widget.dark,
                                                  );
                                                },
                                              ),
                                            );
                                    }
                                  })
                            ],
                          ),
                          const SizedBox(
                            height: 80,
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _gizli = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/login_background.jpg'),
              fit: BoxFit.cover,
            )),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height < 700
                          ? 50
                          : MediaQuery.of(context).size.height < 800
                              ? 150
                              : MediaQuery.of(context).size.height < 900
                                  ? 250
                                  : MediaQuery.of(context).size.height < 1000
                                      ? 350
                                      : MediaQuery.of(context).size.height <
                                              1100
                                          ? 450
                                          : MediaQuery.of(context).size.height <
                                                  1200
                                              ? 550
                                              : 650,
                      left: 50,
                    ),
                    child: Text('girisyap',
                        style: GoogleFonts.robotoSlab(
                          textStyle: const TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        )).tr(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      right: 0,
                      bottom: 20,
                      left: 20,
                    ),
                    child: LayerOne(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool isChecked = false;
  // ignore: non_constant_identifier_names
  Widget LayerThree(BuildContext context) {
    const Color checkbox = Color.fromARGB(255, 34, 126, 167);

    const Color hintText = Color(0xFFB4B4B4);

    return Container(
      height: 500,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(
        left: 30,
        right: 30,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('mail',
              style: GoogleFonts.ptSans(
                textStyle: const TextStyle(
                    // fontFamily: 'Poppins-Medium',
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              )).tr(),
          TextField(
            decoration: InputDecoration(
                focusColor: const Color.fromARGB(255, 34, 126, 167),
                border: const UnderlineInputBorder(),
                hintText: 'mail'.tr(),
                hintStyle: GoogleFonts.ptSans(
                  textStyle: const TextStyle(color: hintText),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Text('sifre',
              style: GoogleFonts.ptSans(
                textStyle: const TextStyle(
                    // fontFamily: 'Poppins-Medium',
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              )).tr(),
          TextField(
            obscureText: _gizli,
            decoration: InputDecoration(
              focusColor: const Color.fromARGB(255, 34, 126, 167),
              border: const UnderlineInputBorder(),
              hintText: 'sifre'.tr(),
              hintStyle: GoogleFonts.ptSans(
                textStyle: const TextStyle(color: hintText),
              ),
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _gizli = !_gizli;
                    });
                  },
                  icon: !_gizli
                      ? const Icon(Icons.visibility, color: Colors.grey)
                      : const Icon(Icons.visibility_off, color: Colors.grey)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text('sifremiunuttum'.tr(),
                textAlign: TextAlign.end,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      color: Color.fromARGB(255, 34, 126, 167),
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                      // fontFamily: 'Poppins-Medium',
                      ),
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: checkbox,
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                    child: Text('benihatirla'.tr(),
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: Color.fromARGB(255, 34, 126, 167),
                              fontSize: 16,
                              // fontFamily: 'Poppins-Medium',
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                ],
              ),
              Container(
                // width: 99,
                // height: 35,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 34, 126, 167),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  child: Text('girisyap'.tr(),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            //fontFamily: 'Poppins-Medium',
                            fontWeight: FontWeight.w400),
                      )),
                ),
              ),
            ],
          ),
          Row(
            //crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8, top: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "dil".tr() + " :",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
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
                  child: DropdownButton<String>(
                      dropdownColor: Colors.white,
                      elevation: 0,
                      underline: Container(
                        height: 0,
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      hint: Text(
                        'dil'.tr(),
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(color: Colors.black),
                        ),
                      ),
                      items: [
                        DropdownMenuItem(
                          child: Text('turkce'.tr(),
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(color: Colors.black),
                              )),
                          value: "Türkçe",
                        ),
                        DropdownMenuItem(
                          child: Text('ingilizce'.tr(),
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(color: Colors.black),
                              )),
                          value: "İngilizce",
                        ),
                      ],
                      value: "dil".tr() == "Dil" ? "Türkçe" : "İngilizce",
                      onChanged: (String? yeni) {
                        if (yeni == "Türkçe" || yeni == "Turkish") {
                          if ("dil".tr() != "Dil") {
                            context.setLocale(const Locale('tr', 'TR'));
                          }
                        } else if (yeni == "İngilizce" || yeni == "English") {
                          if ("dil".tr() != "Language") {
                            context.setLocale(const Locale('en', 'US'));
                          }
                        }
                      }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget LayerOne(BuildContext context) {
    const Color layerOneBg = Color(0x80FFFFFF);
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: layerOneBg,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60.0),
          bottomLeft: Radius.circular(60.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 30),
        child: LayerTwo(context),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget LayerTwo(BuildContext context) {
    const Color layerTwoBg = Color(0xFFE9FFF6);
    return Container(
      width: 399,
      decoration: const BoxDecoration(
        color: layerTwoBg,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60.0),
          //bottomRight: Radius.circular(60.0),
          bottomLeft: Radius.circular(60.0),
        ),
      ),
      child: LayerThree(context),
    );
  }
}

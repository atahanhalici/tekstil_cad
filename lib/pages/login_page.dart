import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _gizli = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/login/arkaplan.jpg'),
            fit: BoxFit.cover,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(
                  top: 200,
                  left: 50,
                ),
                child: Text(
                  'Giriş Yap',
                  style: TextStyle(
                      fontSize: 48,
                      // fontFamily: 'Poppins-Medium',
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  right: 0,
                  bottom: 0,
                  left: 20,
                ),
                child: LayerOne(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isChecked = false;
  Widget LayerThree(BuildContext context) {
    const Color forgotPasswordText = Color(0xFF024335);
    const Color signInButton = Color(0xFF024335);

    const Color checkbox = Color(0xFF024335);

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
          const Text(
            'E-Mail',
            style: TextStyle(
                // fontFamily: 'Poppins-Medium',
                fontSize: 24,
                fontWeight: FontWeight.w500),
          ),
          const TextField(
            decoration: InputDecoration(
              focusColor: Colors.orange,
              border: UnderlineInputBorder(),
              hintText: 'E-Mail',
              hintStyle: TextStyle(color: hintText),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Şifre',
            style: TextStyle(
                // fontFamily: 'Poppins-Medium',
                fontSize: 24,
                fontWeight: FontWeight.w500),
          ),
          TextField(
            obscureText: _gizli,
            decoration: InputDecoration(
              focusColor: Colors.orange,
              border: const UnderlineInputBorder(),
              hintText: 'Şifre',
              hintStyle: const TextStyle(color: hintText),
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
            child: const Text(
              'Şifremi Unuttum',
              textAlign: TextAlign.end,
              style: TextStyle(
                  color: Colors.orangeAccent,
                  fontSize: 16,
                  // fontFamily: 'Poppins-Medium',
                  fontWeight: FontWeight.w600),
            ),
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
                    child: const Text(
                      'Beni Hatırla',
                      style: TextStyle(
                          color: Colors.orangeAccent,
                          fontSize: 16,
                          //fontFamily: 'Poppins-Medium',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              Container(
                width: 99,
                height: 35,
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Giriş Yap',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        //fontFamily: 'Poppins-Medium',
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

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

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tekstil_cad/pages/model_page.dart';
import 'package:tekstil_cad/view_models/model_viewmodel.dart';
import 'package:tekstil_cad/view_models/theme_viewmodel.dart';
import 'package:tekstil_cad/widgets/bottom_navi.dart';

class MyModelsPage extends StatelessWidget {
  const MyModelsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeViewModel _themeModel =
        Provider.of<ThemeViewModel>(context, listen: true);
    ModelViewModel _model = Provider.of<ModelViewModel>(context, listen: true);
    Color _yaziRenk =
        _themeModel.state == ThemeMod.dark ? Colors.white : Colors.black;
    return SafeArea(
      child: Scaffold(
        backgroundColor: _themeModel.state == ThemeMod.dark
            ? const Color.fromARGB(255, 24, 24, 24)
            : Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("modellerim",
              style: GoogleFonts.montserrat(
                textStyle:
                    TextStyle(color: _yaziRenk, fontWeight: FontWeight.w500),
              )).tr(),
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: _yaziRenk),
        ),
        body: Stack(
          children: [
            Center(
              child: _model.state == ViewState.geliyor
                  ? const CircularProgressIndicator()
                  : _model.state == ViewState.geldi
                      ? kaliplarim(_model, context, _yaziRenk, _themeModel)
                      : const Text("HATA"),
            ),
            Positioned(
                left: 25,
                width: MediaQuery.of(context).size.width - 50,
                bottom: 20,
                child: const BottomNavigationBars(
                  sayi: 1,
                ))
          ],
        ),
      ),
    );
  }

  Container kaliplarim(ModelViewModel _model, BuildContext context,
      Color _yaziRenk, ThemeViewModel _themeModel) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text("modellerimaciklama",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.ptSans(
                      textStyle: TextStyle(
                          color: _yaziRenk,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    )).tr()),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text("modellerimdetay",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: _yaziRenk,
                        fontSize: 14,
                      ),
                    )).tr()),
            const SizedBox(
              height: 20,
            ),
            GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _model.asd.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 255,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    mainAxisExtent: 260),
                itemBuilder: (context, index) {
                  // CrossAxisAlignment.center;
                  return GestureDetector(
                    onTap: () {
                      /* Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PuanKazan(
                                  kampanya: _kampanyalar.asd[index],
                                )),
                      );*/
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ModelPage(
                                  model: _model.asd[index],
                                  seciliRenk: _themeModel.state == ThemeMod.dark
                                      ? Colors.black
                                      : Colors.white,
                                )),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: _themeModel.state == ThemeMod.dark
                              ? Colors.white24
                              : const Color.fromARGB(255, 24, 24, 24),
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        //  decoration: BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    // height: 200,
                                    width: 177,
                                    child: SizedBox(
                                      height: 140,
                                      width: 120,
                                      child: FadeInImage.assetNetwork(
                                        placeholder: 'assets/logo.jpeg',
                                        image: _model.asd[index].resim,
                                        fit: BoxFit.cover,
                                        placeholderFit: BoxFit.cover,
                                      ),
                                    )),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 3, horizontal: 5),
                                child: SizedBox(
                                  child: Text(
                                      //"URUN",
                                      _model.asd[index].adi,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.ptSans(
                                          textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold))),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 3, horizontal: 5),
                                child: SizedBox(
                                  child: Text(_model.asd[index].aciklama,
                                      textAlign: TextAlign.start,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                        fontSize: 11,
                                        color: Colors.white,
                                      ))),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}

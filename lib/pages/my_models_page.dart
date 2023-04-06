import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tekstil_cad/pages/model_page.dart';
import 'package:tekstil_cad/view_models/model_viewmodel.dart';
import 'package:tekstil_cad/widgets/bottom_navi.dart';
import 'package:video_player/video_player.dart';

class MyModelsPage extends StatelessWidget {
 const MyModelsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ModelViewModel _model = Provider.of<ModelViewModel>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Kalıplarım"),
          elevation: 0,
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Center(
              child: _model.state == ViewState.geliyor
                  ? CircularProgressIndicator()
                  : _model.state == ViewState.geldi
                      ? kaliplarim(_model)
                      : Text("HATA"),
            ),
            Positioned(
                left: 25,
                width: MediaQuery.of(context).size.width - 50,
                bottom: 20,
                child: const BottomNavigationBars())
          ],
        ),
      ),
    );
  }

  Container kaliplarim(ModelViewModel _model) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Tüm Kalıplarınız Burada Listelenmektedir.",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                "Dilediğiniz tasarıma dokunarak 3 Boyutlu bir şekilde inceleyebilirsiniz!",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
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
                                )),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.brown,
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
                                        placeholder: 'assets/def.png',
                                        image: _model.asd[index].resim,
                                        fit: BoxFit.cover,
                                        placeholderFit: BoxFit.contain,
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
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 3, horizontal: 5),
                                child: SizedBox(
                                  child: Text(_model.asd[index].aciklama,
                                      textAlign: TextAlign.start,
                                      maxLines: 4,
                                      // overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 11,
                                        color: Colors.white,
                                      )),
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

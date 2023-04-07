import 'package:flutter/material.dart';
import 'package:tekstil_cad/widgets/bottom_navi.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController controller;

  @override
  void initState() {
    loadVideoPlayer();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  loadVideoPlayer() {
    controller = VideoPlayerController.asset('assets/video.mp4');
    controller.setVolume(0);
    controller.play();
    controller.setLooping(true);
    controller.addListener(() {
      setState(() {});
    });
    controller.initialize().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child:
                          SizedBox(height: 230, child: VideoPlayer(controller)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Merhaba User",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Tekstil Cad Mobil ile kalıp tasarımlarınızı istediğiniz anda ve istediğiniz yerde saniyeler içerisinde görüntüleme imkanına sahipsiniz. Tasarımlarınızı 3 Boyutlu olarak inceleyebilmek ve daha fazlası için alttaki menüyü kullanabilirsiniz. Ayrıca detaylı eğitime tekrar erişebilmek adına profilinizden uygulama rehberini inceleyebilirsiniz.",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        padding:
                            const EdgeInsets.only(top: 15, left: 15, right: 15),
                        height: 274,
                        decoration: BoxDecoration(
                            color: Colors.brown,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Column(
                          children: [
                            SizedBox(
                                height: 220,
                                child: Image.asset("assets/kalip.jpeg")),
                            const Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Text("Kalıplarınızı İnceleyin",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            )
                          ],
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        padding:
                            const EdgeInsets.only(top: 15, left: 15, right: 15),
                        height: 274,
                        decoration: BoxDecoration(
                            color: Colors.brown,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Column(
                          children: [
                            SizedBox(
                                height: 220,
                                child: Image.asset("assets/kalip.jpeg")),
                            const Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Text("Kalıplarınızı İncelermiş Gibi Yapın",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            )
                          ],
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const Text(
                        "TekstilCad",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const Text(
                        "- Created by FABA -",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
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
                child: const BottomNavigationBars())
          ],
        ),
      ),
    );
  }
}

import 'package:tekstil_cad/models/3d_model.dart';

class DatabaseService {
  List<Model> modeller = [];
  Future<List<Model>> modelleriGetir() async {
    modeller.clear();
    await Future.delayed(const Duration(seconds: 1));
    modeller.add(Model(
        adi: "Ceket",
        aciklama:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
        resim:
            "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/22786630999417.563c2e55095a0.jpg",
        link: "assets/jacket.glb"));
    modeller.add(Model(
        adi: "Ceket",
        aciklama:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
        resim:
            "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/22786630999417.563c2e55095a0.jpg",
        link: "assets/asd.glb"));
    modeller.add(Model(
        adi: "Ceket",
        aciklama:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
        resim:
            "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/22786630999417.563c2e55095a0.jpg",
        link: "assets/bsd.glb"));
    modeller.add(Model(
        adi: "Ceket",
        aciklama:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
        resim:
            "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/22786630999417.563c2e55095a0.jpg",
        link: "assets/csd.glb"));
    modeller.add(Model(
        adi: "Ceket",
        aciklama:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
        resim:
            "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/22786630999417.563c2e55095a0.jpg",
        link: "assets/dsd.glb"));
    modeller.add(Model(
        adi: "Ceket",
        aciklama:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
        resim:
            "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/22786630999417.563c2e55095a0.jpg",
        link: "assets/esd.glb"));
    modeller.add(Model(
        adi: "Ceket",
        aciklama:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
        resim:
            "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/22786630999417.563c2e55095a0.jpg",
        link: "assets/fsd.glb"));
    modeller.add(Model(
        adi: "Ceket",
        aciklama:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
        resim:
            "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/22786630999417.563c2e55095a0.jpg",
        link: "assets/gsd.glb"));
    modeller.add(Model(
        adi: "Ceket",
        aciklama:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
        resim:
            "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/22786630999417.563c2e55095a0.jpg",
        link: "assets/hsd.glb"));
    modeller.add(Model(
        adi: "Ceket",
        aciklama:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
        resim:
            "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/22786630999417.563c2e55095a0.jpg",
        link: "assets/ısd.glb"));

    return modeller;
  }
}

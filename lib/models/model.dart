class Model {
  String adi;
  String aciklama;
  String resim;
  String link;

  Model({
    required this.adi,
    required this.aciklama,
    required this.resim,
    required this.link,
  });
  Map<String, dynamic> toMap() {
    return {'adi': adi, 'resim': resim, 'aciklama': aciklama, 'link': link};
  }

  Model.fromMap(Map<String, dynamic> map)
      : adi = map["adi"],
        resim = map["resim"],
        aciklama = map["aciklama"],
        link = map["link"];

  @override
  String toString() {
    return "Mesaj {adi: $adi, resim: $resim,aciklama: $aciklama,link: $link}";
  }
}

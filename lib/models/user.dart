class User {
  String adi;
  String soyadi;
  String sirket;
  String mail;
  String kullanici_id;

  User({
    required this.adi,
    required this.soyadi,
    required this.sirket,
    required this.mail,
    required this.kullanici_id,
  });
  Map<String, dynamic> toMap() {
    return {
      'adi': adi,
      'soyadi': soyadi,
      'sirket': sirket,
      'mail': mail,
      'kullanici_id': kullanici_id
    };
  }

  User.fromMap(Map<String, dynamic> map)
      : adi = map["adi"],
        soyadi = map["soyadi"],
        sirket = map["sirket"],
        mail = map["mail"],
        kullanici_id = map["kullanici_id"];

  @override
  String toString() {
    return "Mesaj {adi: $adi, soyadi: $soyadi,sirket: $sirket,mail: $mail,kullanici_id: $kullanici_id}";
  }
}

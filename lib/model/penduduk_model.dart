class Penduduk_Model {
  String nama;
  String alamat;
  String? foto;

  Penduduk_Model({
    required this.nama,
    required this.alamat,
    this.foto,
  });

  factory Penduduk_Model.fromJson(Map<String, dynamic> json) => Penduduk_Model(
        nama: json["nama"],
        alamat: json['alamat'],
        foto: json['foto'],
      );
  Map<String, dynamic> toJson() => {
        "nama": nama,
        "alamat": alamat,
        "foto": foto,
      };
}

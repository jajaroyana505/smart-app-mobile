class Penduduk_Model {
  String id;
  String nama;
  String alamat;
  String foto;

  Penduduk_Model({
    required this.id,
    required this.nama,
    required this.alamat,
    required this.foto,
  });

  factory Penduduk_Model.fromJson(Map<String, dynamic> json) => Penduduk_Model(
      id: json["id"],
      nama: json["nama"],
      alamat: json['alamat'],
      foto: json['foto']);
  Map<String, dynamic> toJson() => {
        "nama": nama,
        "alamat": alamat,
        "foto": foto,
      };
}

class Surat_Model {
  String nik;
  String jenis;
  String keperluan;
  String tanggal;
  String status;

  Surat_Model({
    required this.nik,
    required this.jenis,
    required this.keperluan,
    required this.tanggal,
    required this.status,
  });

  factory Surat_Model.fromJson(Map<String, dynamic> json) => Surat_Model(
        nik: json['nik'],
        jenis: json['jenis'],
        keperluan: json['keperluan'],
        tanggal: json['tanggal'],
        status: json['status'],
      );
  Map<String, dynamic> toJson() => {
        "nik": nik,
        "jenis": jenis,
        "keperluan": keperluan,
        "tanggal": tanggal,
        "status": status,
      };
}

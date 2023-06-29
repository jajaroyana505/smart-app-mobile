class User_model {
  String nama;

  User_model({required this.nama});

  factory User_model.createUser(Map<String, dynamic> object) {
    return User_model(nama: object['nama']);
  }
}

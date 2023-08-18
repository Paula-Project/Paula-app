class UsuarioAPI {
  String name;
  String username;
  int progress;
  late String? gender;
  late String? birthdate;
  late int? age;
  late String token;
  late int id;

  UsuarioAPI(
    this.name,
    this.username,
    this.progress, {
    this.id = -1,
    this.token = '',
    this.gender = 'other',
    this.age = 0,
    this.birthdate = "0000-00-00",
  });
}

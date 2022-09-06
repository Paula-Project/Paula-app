class UsuarioAPI {
  String _name;
  String _username;
  String _gender;
  String _birthdate;
  int _age;
  late String token;
  late int id;

  UsuarioAPI(
      this._name, this._username, this._gender, this._age, this._birthdate,
      {this.id = -1, this.token = ''});
}

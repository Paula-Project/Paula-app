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

  int get age => _age;

  set age(int value) {
    _age = value;
  }

  String get birthdate => _birthdate;

  set birthdate(String value) {
    _birthdate = value;
  }

  String get gender => _gender;

  set gender(String value) {
    _gender = value;
  }

  String get username => _username;

  set username(String value) {
    _username = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}

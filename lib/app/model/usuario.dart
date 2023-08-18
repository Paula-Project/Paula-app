import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Usuario extends ChangeNotifier {
  String _name;
  String _username;
  String _gender;
  DateTime _birthdate;
  String _password;
  late int _age;

  Usuario(this._name, this._username, this._gender, this._password,
      this._birthdate) {
    _age = calcAge();
  }

  int calcAge() {
    DateTime hoje = DateTime.now();
    int idade = hoje.year - _birthdate.year;
    if (hoje.month < _birthdate.month) {
      idade--;
    } else if (hoje.month == _birthdate.month) {
      if (hoje.day < _birthdate.day) {
        idade--;
      }
    }
    return idade;
  }

  int get age => _age;

  set age(int value) {
    _age = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  DateTime get birthdate => _birthdate;

  set birthdate(DateTime value) {
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

  Map<String, dynamic> mapJson() {
    return {
      'username': _username,
      'password': _password,
      'gender': _gender,
      'name': _name,
      'birthdate': DateFormat('yyyy-MM-dd').format(_birthdate),
      'age': _age,
      'progress': 0,
    };
  }
}

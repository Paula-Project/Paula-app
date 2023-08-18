int calcAge(DateTime date) {
  DateTime today = DateTime.now();
  int idade = today.year - date.year;
  if (today.month < date.month) {
    idade--;
  } else if (today.month == date.month) {
    if (today.day < date.day) {
      idade--;
    }
  }
  return idade;
}

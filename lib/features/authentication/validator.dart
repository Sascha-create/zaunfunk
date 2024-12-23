String? isValidUsername(String? value) {
  if (value == null) {
    return "kein Nutzername angegeben";
  }
  if (value.length < 2) return "Nutzername mehr als 2 Zeichen";
  if (value.length > 20) return "Nutzername maximal 20 Zeichen";

  return null;
}

// Inspired by dart_fast and https://stackoverflow.com/a/50663835
String? isEmailValid(String? value) {
  if (value == null) return "keine Email angegeben";
  if (RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value)) {
    return null;
  } else {
    return "Keine gültige Email angegeben";
  }
}

String? isValidPassword(String? value) {
  // null muss geprüft immer werden
  if (value == null) return "kein Passwort angegeben";
  if (value.length < 5) return "Passwort mehr als 5 Zeichen";
  if (value.length > 20) return "Passwort maximal 20 Zeichen";
  return null;
}

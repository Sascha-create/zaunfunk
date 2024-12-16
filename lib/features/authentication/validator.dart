String? isValidUsername(String? value) {
    if (value == null) {
      return "kein Nutzername angegeben";
    }
    if (value.length < 2) return "Nutzername mehr als 2 Zeichen";
    if (value.length > 20) return "Nutzername maximal 20 Zeichen";

    return null;
  }

  String? isEmailValid(String? value) {
    if (value == null) return "keine Email";
    if (value.length < 7) return "Email zu kurz";
    if (value.length > 30) return "Email zu lang";
    if (value.contains(",")) return "Darf kein , enthalten";
    if (value.contains("@")) return null;
    if (value.contains(".")) return null;
    return null;
  }

  String? isValidPassword(String? value) {
    // null muss geprüft immer werden
    if (value == null) return "kein Passwort angegeben";
    if (value.length < 5) return "Passwort mehr als 5 Zeichen";
    if (value.length > 20) return "Passwort maximal 20 Zeichen";
    return null;
  }


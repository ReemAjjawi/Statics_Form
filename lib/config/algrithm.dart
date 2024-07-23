String typeUserFunction(int age, bool gender, bool read) {
  int agebool = (age > 40) ? 1 : 0;
  if (agebool == 1 && gender == true && read == true) {
    return "Postgraduate";
  } else if (agebool == 0 && gender == true && read == true) {
    return "Postgraduate";
  } else if (agebool == 1 && gender == true && read == false) {
    return "University";
  } else if (agebool == 1 && gender == false && read == true) {
    return "University";
  } else if (agebool == 0 && gender == false && read == true) {
    return "Bac";
  } else if (agebool == 0 && gender == true && read == false) {
    return "Bac";
  } else {
    return "General";
  }
}
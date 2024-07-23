String typyuserfunchen(int age, bool gendr, bool read) {
  int agebool = (age > 40) ? 1 : 0;
  if (agebool == 1 && gendr == true && read == true) {
    return "Postgraduate";
  } else if (agebool == 0 && gendr == true && read == true) {
    return "Postgraduate";
  } else if (agebool == 1 && gendr == true && read == false) {
    return "university";
  } else if (agebool == 1 && gendr == false && read == true) {
    return "university";
  } else if (agebool == 0 && gendr == false && read == true) {
    return "chlorine";
  } else if (agebool == 0 && gendr == true && read == false) {
    return "chlorine";
  } else {
    return "General";
  }
}
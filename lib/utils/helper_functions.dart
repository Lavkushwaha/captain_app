class HelperFunctions {
  HelperFunctions._();

  static String getDateTime(DateTime dt) {
    return "${dt.day}/${dt.month}/${dt.year} ";
    // return "${now.day}-${now.month}-${now.year} ";
  }
}

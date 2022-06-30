class Localization {
  static String getFlag(String code) {
    switch (code) {
      case 'en':
        return "English: ${String.fromCharCode(0x1F1FA)}${String.fromCharCode(0x1F1F8)}";
      case 'id':
      default:
        return "Indonesia: ${String.fromCharCode(0x1F1EE)}${String.fromCharCode(0x1F1E9)}";
    }
  }
}
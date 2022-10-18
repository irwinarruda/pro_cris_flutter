class IsNetworkImage {
  static bool execute(String url) {
    return url.startsWith('http://') || url.startsWith('https://');
  }
}

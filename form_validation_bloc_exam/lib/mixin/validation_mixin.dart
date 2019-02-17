class ValidationMixin {
  String validEmail(v) {
    if (!v.contains('@')) {
      return 'wrong email type';
    }
    return null;
  }

  String validPw(v) {
    if (v.length < 4) {
      return 'over 4 char';
    }
    return null;
  }
}

class ValidationMixin{
  String? validateUsername(String? value){
    if(value == null) return "Username cannot be empty.";
    final alphanumeric = RegExp(r'^[a-zA-Z0-9\-]{1,32}$');

    if(alphanumeric.hasMatch(value)) return null;
    else return "Username can only contain uppercase, lowercase characters, hyphens, underscores and digits.";
  }
}
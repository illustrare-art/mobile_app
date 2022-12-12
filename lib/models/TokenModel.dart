
class TokenModel {
  String accessToken;
  String idToken;

  TokenModel({
    required this.accessToken,
    required this.idToken
  });

  Map<String, dynamic> toJson(){
    return <String, dynamic> {
      "access_token": accessToken,
      "id_token": idToken
    };
  }
}

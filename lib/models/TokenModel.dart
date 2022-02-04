
class TokenModel {
  String accessToken;

  TokenModel(this.accessToken);

  Map<String, dynamic> toJson(){
    return <String, dynamic> {
      'access_token': accessToken,
    };
  }
}

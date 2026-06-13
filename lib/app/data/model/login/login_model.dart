class LoginResponse {

  String? tempId;
  String? accessToken;
  String? refreshToken;

  LoginResponse({
    this.tempId,
    this.accessToken,
    this.refreshToken,
  });

  factory LoginResponse.fromJson(
      Map<String, dynamic> json) {

    return LoginResponse(
      tempId: json['temp_id'],
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }
}
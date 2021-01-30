
class UserTest {
  final String token; // GroupName
  final String expiresIn; // GroupName
  final String refreshToken; // GroupName
  final String refreshExpriresIn; // GroupName

  UserTest({
    this.token, this.expiresIn, this.refreshToken, this.refreshExpriresIn,
  });

  factory UserTest.fromJson(Map<String, dynamic> json) => UserTest(
    token:json["token"],
    expiresIn: json["expiresIn"],
    refreshToken: json["refreshToken"],
    refreshExpriresIn:json["refreshExpriresIn"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "expiresIn": expiresIn,
    "refreshToken":refreshToken,
    "refreshExpriresIn": refreshExpriresIn
  };

  @override
  String toString() {
    return "token: " + token +" expiresIn: "+ expiresIn;
  }
}

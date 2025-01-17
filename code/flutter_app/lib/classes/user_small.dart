class UserSmall {
  const UserSmall({
    required this.username,
    required this.pictureURI
  });

  final String username;
  final String pictureURI;

  factory UserSmall.fromJson(Map<String, dynamic> json){
    return UserSmall(
      username: json['username'],
      pictureURI: json['pictureURI'],
    );
  }
}
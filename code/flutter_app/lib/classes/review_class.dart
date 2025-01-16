class ReviewClass{
  const ReviewClass({
    required this.reviewId,
    required this.userName,
    required this.postDate,
    required this.userPictureUri,
    required this.rating,
    this.commentary = ""
  });
  final int reviewId;
  final String userName;
  final String userPictureUri;
  final DateTime postDate;
  final double rating;
  final String commentary;

  factory ReviewClass.fromJson(Map<String, dynamic> json){
    return ReviewClass(
      reviewId: json['reviewId'],
      userName: json['userName'],
      userPictureUri: json['userPictureUri'],
      postDate: DateTime.parse(json['postDate']),
      rating: json['rating'],
      commentary: json['commentary']
    );
  }
}
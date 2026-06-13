class FilterModel {

  List<String> price;
  List<String> stars;
  List<String> tags;
  List<String> userRating;

  FilterModel({
    required this.price,
    required this.stars,
    required this.tags,
    required this.userRating,
  });

  Map<String, dynamic> toJson() {
    return {
      "price": price,
      "stars": stars,
      "tags": tags,
      "userRating": userRating,
    };
  }
}
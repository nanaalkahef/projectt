class produect {
  final int id;
  final String title;
  final dynamic price;
  final String description;
  final String image;
  final RatingModle rating;
  final String category;

  produect(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.image,
      required this.category,
      required this.rating});
  factory produect.fromJson(jsonData) {
    return produect(
        id: jsonData['id'],
        title: jsonData['title'],
        price: jsonData['price'],
        description: jsonData['description'],
        image: jsonData['image'],
        category: jsonData['category'],
        rating: RatingModle.fromJson(jsonData['rating']));
  }
}

class RatingModle {
  final num rate;
  final int count;

  RatingModle({
    required this.rate,
    required this.count,
  });
  factory RatingModle.fromJson(jsonData) {
    return RatingModle(rate: jsonData['rate'], count: jsonData['count']);
  }
}
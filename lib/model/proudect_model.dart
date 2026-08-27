class ProudectModel {
  final int id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String image;
  final RatingModel rate;

  ProudectModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rate,
  });

  factory ProudectModel.fromjson(jsonData) {
    return ProudectModel(
      id: jsonData['id'],
      title: jsonData['title'],
      price: jsonData['price'],
      description: jsonData['description'],
      category: jsonData['category'],
      image: jsonData['image'],
      rate: RatingModel.fromjson(jsonData['rating']),
    );
  }
}

class RatingModel {
  final dynamic rate;
  final int count;
  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromjson(jsonData) {
    if (jsonData['rate'] != null) {
      return RatingModel(rate: jsonData['rate'], count: jsonData['count']);
    } else {
      return RatingModel(rate: 0, count: 0);
    }
  }
}

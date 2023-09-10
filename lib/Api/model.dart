import 'dart:convert';

List<SamplePosts> samplePostsFromJson(String str) => List<SamplePosts>.from(json.decode(str).map((x) => SamplePosts.fromJson(x)));

String samplePostsToJson(List<SamplePosts> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SamplePosts {
    SamplePosts({
        required this.price,
        required this.id,
        required this.title,
        required this.category,
        required this.image
    });
    String image;
    dynamic price;
    int id;
    String title;
    String category;

    factory SamplePosts.fromJson(Map<String, dynamic> json) => SamplePosts(
        image: json["image"],
        price: json["price"],
        id: json["id"],
        title: json["title"],
        category: json["category"],
    );

    Map<String, dynamic> toJson() => {
        "userId": price,
        "image":image,
        "id": id,
        "title": title,
        "body": category,
    };
}
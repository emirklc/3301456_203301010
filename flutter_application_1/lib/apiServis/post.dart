// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    required this.name,
    required this.id,
  
    this.body,
  });

  String name;
  int id;

  String? body;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        name: json["name"],
        id: json["id"],
      
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
       
        "body": body,
      };
}
import 'package:flutter/rendering.dart';
//3
class post {
  late int Id ;
  late int userId ;
  String title ;
  String body ;
  post({
    required this.Id, required this.userId, required this.body, required this.title
});
  factory post.fromJson(Map<String,dynamic> json){
    return post(Id:json['id'],
      userId: json['userId'],
      title: json['title'],
      body: json['body']
      );
  }
}
import 'dart:convert';

import 'package:flutter_testing/model/posts_model.dart';
import 'package:flutter_testing/res/app_urls.dart';
import 'package:http/http.dart' as http;

class PostsRepository {
  final http.Client client;
  PostsRepository(this.client);

  Future<List<PostsModel>> getPosts()async{
    final response = await client.get(Uri.parse(AppUrls.posts));
    if(response.statusCode == 200){
      List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((json) => PostsModel.fromJson(json)).toList();
    }
    throw Exception('Error Occurred');
  }
}
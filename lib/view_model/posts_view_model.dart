import 'package:flutter/material.dart';
import 'package:flutter_testing/repository/posts_repository.dart';
import 'package:http/http.dart';

class PostsViewModel with ChangeNotifier{
  final _repo = PostsRepository(Client());
  List _posts = [];
  List get posts => _posts;

  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool value){
    _loading = value;
    notifyListeners();
  }
  void fetchPosts() async{
    setLoading(true);
   _posts = await _repo.getPosts();
   notifyListeners();
    setLoading(false);
  }
}
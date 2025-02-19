import 'package:flutter/material.dart';
import 'package:flutter_testing/view_model/posts_view_model.dart';
import 'package:provider/provider.dart';

class PostsView extends StatefulWidget {
  const PostsView({super.key});

  @override
  State<PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<PostsViewModel>(context, listen: false).fetchPosts();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<PostsViewModel>(
       builder: (context, vm, child) {
         return Scaffold(
           body: Center(
             child: ListView.builder(
               itemCount: vm.posts.length,
               itemBuilder: (context, index) {
                 final post = vm.posts[index];
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(post.title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(post.body),
      ),
    );
             },),
           ),
         );
       },
    );
  }
}

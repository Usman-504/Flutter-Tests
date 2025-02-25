import 'package:flutter/material.dart';
import 'package:flutter_testing/model/posts_model.dart';

class PostsView extends StatefulWidget {
  final Future<List<PostsModel>> futurePosts;
  const PostsView({super.key, required this.futurePosts});

  @override
  State<PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<PostsModel>>(future: widget.futurePosts, builder: (context, snapshot) {
          if(snapshot.hasData){
            final List<PostsModel> posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(post.title!, style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(post.body!),
                  ),
                );
              },);
          }
          else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },)


      ),
    );
  }
}

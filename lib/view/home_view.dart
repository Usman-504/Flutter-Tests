import 'package:flutter/material.dart';
import 'package:flutter_testing/repository/posts_repository.dart';
import 'package:flutter_testing/view/posts_view.dart';
import 'package:flutter_testing/view_model/home_view_model.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_)=> HomeViewModel(),
        child: Consumer<HomeViewModel>(
            builder: (context, vm, child) {
              return Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(vm.count.toString()),
                      ElevatedButton(
                          onPressed: (){
                            vm.incrementCount();
                          }, child: const Text('Increment') ),
                      ElevatedButton(
                          onPressed: (){
                            vm.decrementCount();
                          }, child: const Text('Decrement') ),
                      ElevatedButton(
                          onPressed: (){
Navigator.push(context, MaterialPageRoute(builder: (context) =>  PostsView(futurePosts: PostsRepository(Client()).getPosts(),),));
                          }, child: const Text('Posts') ),
                    ],
                  ),
                ),
              );
            },

        ));
  }
}

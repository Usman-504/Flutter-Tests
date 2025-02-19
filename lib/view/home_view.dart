import 'package:flutter/material.dart';
import 'package:flutter_testing/view/posts_view.dart';
import 'package:flutter_testing/view_model/home_view_model.dart';
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
                          }, child: Text('Increment') ),
                      ElevatedButton(
                          onPressed: (){
                            vm.decrementCount();
                          }, child: Text('Decrement') ),
                      ElevatedButton(
                          onPressed: (){
Navigator.push(context, MaterialPageRoute(builder: (context) => PostsView(),));
                          }, child: Text('Posts') ),
                    ],
                  ),
                ),
              );
            },

        ));
  }
}

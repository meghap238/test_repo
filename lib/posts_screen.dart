import 'package:flutter/material.dart';
import 'package:new_test/api_integration.dart';
import 'package:new_test/wigdet.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: ApiIntegration().getApiData(),
          builder: (context, snapshot) {
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return  ListTile(
                  leading: AllWidgets.textWidget(data:  snapshot.data?[index].id.toString() ?? ''),
                  title: AllWidgets.textWidget(data:  snapshot.data?[index].title ?? ''),
                  subtitle: AllWidgets.textWidget(data:  snapshot.data?[index].body ?? ''),
                );
              },
              itemCount: snapshot.data?.length,
            );
          },),
    );
  }
}

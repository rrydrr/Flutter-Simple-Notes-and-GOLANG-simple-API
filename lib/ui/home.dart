import 'package:flutter/material.dart';
import 'package:flutternotes/card/card.dart';
import 'package:flutternotes/model/notesModel.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  Home({Key? key}) : super (key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  Future<List<Posts>> fetchPosts() async {
    final response = await http.get(Uri.parse('http://172.16.4.75:8080/notes')); // TODO : CHANGE URI
    print(response.statusCode);
    print(response.body);

    if(response.statusCode == 200) {
      var getPostsData = json.decode(response.body) as List;
      var listPosts = getPostsData.map((i) => Posts.fromJson(i)).toList();
      return listPosts;
    } else {
      throw Exception('Failed to load posts');
    }
  }

  late Future<List<Posts>> futurePosts;

  @override
  void initState() {
    futurePosts = fetchPosts();
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Note List'),
      centerTitle: true,
    ),
    body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: FutureBuilder<List<Posts>>(
          future: futurePosts,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  var post = (snapshot.data as List<Posts>)[index];
                  return Column(
                    children: [
                      NotesCard(
                        posts: Posts(
                          id: post.id,
                          title: post.title,
                          note: post.note,
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: (snapshot.data as List<Posts>).length,
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    ),
  );
}
}


import 'package:flutter/material.dart';
import 'package:flutternotes/model/notesModel.dart';

class DetailPage extends StatelessWidget {
  final Posts posts;
  const DetailPage({Key? key, required this.posts}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            Text('id: ${posts.id}'),
            Text('Title: {$posts.title}'),
            const SizedBox(
              height: 20,
            ),
            const Text('Note : '),
            Text(posts.note),
          ],
        ),
      ),
    );
  }
}
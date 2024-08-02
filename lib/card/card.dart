import 'package:flutter/material.dart';
import 'package:flutternotes/card/detailPage.dart';
import 'package:flutternotes/model/notesModel.dart';

class NotesCard extends StatelessWidget {
  const NotesCard({Key? key, required this.posts}) : super(key: key);
  final Posts posts;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: ((context) {
              return DetailPage(posts: posts);
            })
          )
        );
      },
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              posts.title,
              style: const TextStyle(
                //text style
              ),  
            ),
            const SizedBox(
              height: 10,
            ),
            Text(posts.note),
          ],
        ),
      ),
    );
  }
}
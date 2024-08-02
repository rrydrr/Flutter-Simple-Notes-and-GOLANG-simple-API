class Posts {
  int id;
  String title;
  String note;

  Posts({required this.id, required this.title, required this.note});

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(id: json['id'], title: json['title'], note: json['note']);
  }
}
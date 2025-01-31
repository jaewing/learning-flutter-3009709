class ChatMessageEntity {
  String text;
  String? imageUrl;
  String id;
  int createdAt;
  Author author;

  ChatMessageEntity(
      {required this.text,
      required this.id,
      required this.createdAt,
      this.imageUrl,
      required this.author});

  factory ChatMessageEntity.fromJson(Map<String, dynamic> json){
    return ChatMessageEntity(
        text: json['text'],
        id: json['id'],
        createdAt: json['createdAt'],
        /// Author is a class within a class, which
        /// is why we handle this differently.
        /// Matches structure of JSON file.
        author: Author.fromJson(json['author'])
    );
  }
}

class Author {
  String userName;

  Author({required this.userName});

  /// Here we create a named constructor. "factory"
  /// keyword, I am uncertain the importance of.
  factory Author.fromJson(Map<String, dynamic> json){
    return Author(userName: json['username']);
  }
}

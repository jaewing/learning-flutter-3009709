class ChatMessageEntity{
  String text;
  String? imageUrl;
  String id;
  int createdAt;
  Author author;

  ChatMessageEntity({
    required this.text,
    required this.id,
    required this.createdAt,
    this.imageUrl,
    required this.author,
  });
}


/// Move this to another file for modularity
/// for app implementation.
/// Best practice is to have one class definition
/// per Dart file.
class Author{
  String userName;

  Author({required this.userName});
}
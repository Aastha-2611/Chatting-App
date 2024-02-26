class ChatUser {
  ChatUser(
      {required this.name,
      required this.about,
      required this.createdAt,
      required this.email,
      required this.id,
      required this.image,
      required this.isOnline,
      required this.lastActive,
      required this.pushToken});

  late final String name;
  late final String about;
  late final String image;
  late final String createdAt;
  late final String email;
  late final String lastActive;
  late final bool isOnline;
  late final String id;
  late final String pushToken;

  ChatUser.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    about = json['about'] ?? '';
    image = json['image'] ?? '';
    createdAt = json['createdAt'] ?? '';
    email = json['email'] ?? '';
    lastActive = json['lastActive'] ?? '';
    isOnline = json['isOnline'] ?? '';
    id = json['id'] ?? '';
    pushToken = json['pushToken'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image'] = image;
    data['name'] = name;
    data['about'] = about;
    data['createdAt'] = createdAt;
    data['email'] = email;
    data['lastActive'] = lastActive;
    data['isOnline'] = isOnline;
    data['id'] = id;
    data['pushToken'] = pushToken;
    return data;
  }
}

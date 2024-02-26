import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:v_chat/main.dart';
import 'package:v_chat/models/user_fields.dart';

class ChatUserCard extends StatefulWidget {
  final ChatUser chatUser;
  const ChatUserCard({super.key, required this.chatUser});
  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.5,
      margin: EdgeInsets.symmetric(horizontal: mq.width * 0.03, vertical: 4),
      child: InkWell(
        onTap: () {},
        child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(mq.height * 0.3),
              child: CachedNetworkImage(
                width: mq.height * .05,
                height: mq.height * .05,
                imageUrl: widget.chatUser.image,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) =>
                    Icon(CupertinoIcons.person),
              ),
            ),
            title: Text(widget.chatUser.name),
            subtitle: Text(
              widget.chatUser.about,
              maxLines: 1,
            ),
            trailing: Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(6)),
            )),
      ),
    );
  }
}

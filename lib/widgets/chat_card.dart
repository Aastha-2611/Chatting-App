import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:v_chat/main.dart';

class ChatUserCard extends StatefulWidget {
  const ChatUserCard({super.key});

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
          leading: CircleAvatar(
            child: Icon(CupertinoIcons.person),
          ),
          title: Text('demo user'),
          subtitle: Text(
            'demo subtitle',
            maxLines: 1,
          ),
          trailing: Text(
            'time',
            style: TextStyle(
              color: Colors.grey[800],
            ),
          ),
        ),
      ),
    );
  }
}

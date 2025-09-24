import 'package:chatter/core/theme.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages', style: Theme.of(context).textTheme.titleLarge),
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: Colors.white,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text('Recent', style: Theme.of(context).textTheme.bodySmall),
          ),
          Container(
            height: 100,
            padding: EdgeInsets.all(5),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildRecentContact('Junaid', context),
                _buildRecentContact('Barry', context),
                _buildRecentContact('Frank', context),
                _buildRecentContact('John', context),
                _buildRecentContact('Hank', context),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: DefaultColors.messageListPage,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                )
              ),
              child: ListView(
                children: [
                  _buildMessageTile('Junaid', 'junaid@gmail.com', '13.22'),
                  _buildMessageTile('Barry', 'barry@gmail.com', '12.07'),
                  _buildMessageTile('Frank', 'frank@gmail.com', '09.11'),
                  _buildMessageTile('John', 'john@gmail.com', '09.07'),
                  _buildMessageTile('Hank', 'hank@gmail.com', '08.35'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildMessageTile(String name, String message, String time) {
  return ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    leading: CircleAvatar(
      radius: 30,
      backgroundImage: NetworkImage(''),
    ),
    title: Text(
      name,
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    subtitle: Text(
      message,
      style: TextStyle(color: Colors.grey),
      overflow: TextOverflow.ellipsis,
    ),
    trailing: Text(
      time,
      style: TextStyle(color: Colors.grey),
    ),
  );
}

Widget _buildRecentContact(String name, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      children: [
        CircleAvatar(radius: 30, backgroundImage: NetworkImage('')),
        SizedBox(height: 5),
        Text(name, style: Theme.of(context).textTheme.bodyMedium),
      ],
    ),
  );
}

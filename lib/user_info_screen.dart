import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lesson38/models/user_info_model.dart';

import 'models/all_user_foto_model.dart';

class UserInfoScreen extends StatefulWidget {
  final String id;

  const UserInfoScreen({super.key, required this.id});

  @override
  State<UserInfoScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<UserInfoScreen> {
  AllUserInfoModel userInfoModel = AllUserInfoModel();
  AllUserFotoModel userFotoModel = AllUserFotoModel();
  @override
  void initState() {
    gerUserInfo(widget.id);
    getUserFoto(widget.id);
    super.initState();
  }

  gerUserInfo(String id) async {
    var url = Uri.https('jsonplaceholder.typicode.com', '/comments/$id');

    var response = await http.get(url);

    print('userinfostatusCode == ${response.statusCode}');
    print('userresponse == ${response.body}');

    if (response.statusCode == 200) {
      userInfoModel = AllUserInfoModel.fromJson(json.decode(response.body));
      setState(() {});
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  getUserFoto(String id) async {
    var userFotoUrl = Uri.https('jsonplaceholder.typicode.com', '/photos/$id');
    var response = await http.get(userFotoUrl);

    if (response.statusCode == 200) {
      userFotoModel = AllUserFotoModel.fromJson(json.decode(response.body));
      setState(() {});
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Icon(Icons.person),
        ),
        title: const Text('User'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close, size: 30),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.person, color: Colors.blue),
                    SizedBox(width: 10),
                    Text(
                      'Name:',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  userInfoModel.name.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Album:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                userFotoModel.url != null
                    ? Image.network(
                        userFotoModel.url!,
                        height: 200,
                        fit: BoxFit.cover,
                      )
                    : const Text('Photo not available'),
                const SizedBox(height: 8),
                Text(
                  userFotoModel.title?.toString() ?? "No message",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Comments:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  userInfoModel.body?.toString() ?? "No message",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

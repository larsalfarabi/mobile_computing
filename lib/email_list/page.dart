import 'package:flutter/material.dart';

class EmailList extends StatefulWidget {
  const EmailList({super.key});

  @override
  State<EmailList> createState() => _EmailListState();
}

class _EmailListState extends State<EmailList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Email List"),
        bottom: const TabBar(
          tabs: [
            Tab(icon: Icon(Icons.email)),
            Tab(icon: Icon(Icons.inbox)),
            Tab(icon: Icon(Icons.star)),
          ],
        ),
      ),
      body: const TabBarView(
        children: [
          Center(
            child: Text("Inbox"),
          ),
          Center(
            child: Text("Starred"),
          ),
          Center(
            child: Text("All Mail"),
          ),
        ],
      ),
    );
  }
}

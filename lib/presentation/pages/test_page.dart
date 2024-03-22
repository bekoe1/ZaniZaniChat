// import 'dart:async';
// import 'dart:convert';
// import 'dart:developer';
//
// import 'package:bloc_test_app/data/dto/incoming_message_dto.dart';
// import 'package:bloc_test_app/data/repo/message_repo.dart';
// import 'package:bloc_test_app/data/repo/web_socket_repo.dart';
// import 'package:flutter/material.dart';
// import 'package:web_socket_channel/io.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';
//
// class TestPage extends StatefulWidget {
//   TestPage({super.key});
//
//   @override
//   State<TestPage> createState() => _TestPageState();
// }
//
// class _TestPageState extends State<TestPage> {
//   final messageController = TextEditingController();
//   final List<String> messages = [];
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     WebSocketRepo().connect();
//     super.initState();
//   }
//
//   void loadMessages()async {
//     final _messages = //todo fetchMethod in api controller
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Placeholder();
//   }
// }

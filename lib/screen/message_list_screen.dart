import 'dart:developer';
import 'package:chat_app1/screen/donate_select.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:chat_app1/model/message_model.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

import 'Exitpage.dart';
import 'chat_bubble.dart';

class MessageListScreen extends StatefulWidget {
  const MessageListScreen({Key? key}) : super(key: key);

  @override
  State<MessageListScreen> createState() => _MessageListScreenState();
}

class _MessageListScreenState extends State<MessageListScreen> {
  int user = 0;

  @override
  void initState() {
    super.initState();
    user = 0;
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Me', textAlign: TextAlign.center),
        backgroundColor: Colors.lightGreen.shade300,
      ),
      body: StreamBuilder<List<MessageModel>>(
        stream: streamMessages(),
        builder: (context, asyncSnapshot) {
          if (!asyncSnapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else if (asyncSnapshot.hasError) {
            return const Center(
              child: Text('오류가 발생했습니다.'),
            );
          } else {
            List<MessageModel> messages = asyncSnapshot.data!;
            return ListView.builder(
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                bool isFromMe = user % 2 == 0;
                user++;
                return Container(
                  margin: EdgeInsets.fromLTRB(5, 5, 5, 5), // Adjusted margin
                  child: MyChatBubble(
                    color: Colors.grey.shade300,
                    alignment: isFromMe ? Alignment.topRight : Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: Text(
                        messages[index].content,
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                    isFromMe: isFromMe,
                  ),
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: getInputWidget(),
    );
  }

  Widget getInputWidget() {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, -2),
            blurRadius: 3,
          ),
        ],
        color: Theme.of(context).bottomAppBarColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                onSubmitted: (_) {
                  _onPressedSendButton();
                },
                decoration: InputDecoration(
                  labelStyle: TextStyle(fontSize: 15),
                  labelText: "내용을 입력하세요..",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.black26,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            RawMaterialButton(
              onPressed: _onPressedSendButton,
              constraints: BoxConstraints(
                minWidth: 0,
                minHeight: 0,
              ),
              elevation: 2,
              fillColor: Theme.of(context).colorScheme.primary,
              shape: CircleBorder(),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Icon(Icons.send),
              ),
            ),
            SizedBox(width: 10),
            RawMaterialButton(
              onPressed: _onPressedExitButton,
              constraints: BoxConstraints(
                minWidth: 0,
                minHeight: 0,
              ),
              elevation: 2,
              fillColor: Theme.of(context).colorScheme.primary,
              shape: CircleBorder(),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Icon(Icons.close),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onPressedExitButton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DonateSelect()),
    );
  }

  void _onPressedSendButton() {
    try {
      MessageModel messageModel = MessageModel(
        content: controller.text,
        sender: user.toString(),
        sendDate: Timestamp.now(),
        id: '',
      );

      FirebaseFirestore firestore = FirebaseFirestore.instance;
      firestore
          .collection('chatrooms/YLCoRBj59XRsDdav2YV1/messages')
          .add(messageModel.toMap());
      controller.clear(); // 입력 필드 초기화
      FocusScope.of(context).unfocus(); // 키보드 내리기
    } catch (ex) {
      log('error)', error: ex.toString(), stackTrace: StackTrace.current);
    }
  }

  Stream<List<MessageModel>> streamMessages() {
    try {
      final Stream<QuerySnapshot> snapshots = FirebaseFirestore.instance
          .collection('chatrooms/YLCoRBj59XRsDdav2YV1/messages')
          .orderBy('sendDate')
          .snapshots();

      return snapshots.map((querySnapshot) {
        List<MessageModel> messages = [];
        querySnapshot.docs.forEach((element) {
          messages.add(
            MessageModel.fromMap(
              id: element.id,
              map: element.data() as Map<String, dynamic>,
            ),
          );
        });
        return messages;
      });
    } catch (ex) {
      log('error)', error: ex.toString(), stackTrace: StackTrace.current);
      return Stream.error(ex.toString());
    }
  }
}

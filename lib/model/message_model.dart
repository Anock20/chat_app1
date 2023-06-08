import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String id;
  final String content;
  final String sender; // Added sender field
  final Timestamp sendDate;

  MessageModel({
    required this.id,
    required this.content,
    required this.sender,
    Timestamp? sendDate,
  }) : sendDate = sendDate ?? Timestamp(0, 0);

  factory MessageModel.fromMap({
    required String id,
    required Map<String, dynamic> map,
  }) {
    return MessageModel(
      id: id,
      content: map['content'] ?? '',
      sender: map['sender'] ?? '',
      sendDate: map['sendDate'] ?? Timestamp(0, 0),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'sender': sender,
      'sendDate': sendDate,
    };
  }
}

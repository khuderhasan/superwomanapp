import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String senderId;
  final String senderName;
  final String recieverId;
  final String message;
  final Timestamp createdAt;

  MessageModel({
    required this.senderId,
    required this.senderName,
    required this.recieverId,
    required this.message,
    required this.createdAt,
  });
  factory MessageModel.fromMap(Map<String, dynamic> json) => MessageModel(
      senderId: json['senderId'],
      senderName: json['senderName'],
      recieverId: json['recieverName'],
      message: json['message'],
      createdAt: json['createdAt']);

  Map<String, dynamic> toMap() => {
        "senderId": senderId,
        "senderName": senderName,
        "recieverId": recieverId,
        "message": message,
        "createdAt": createdAt
      };
}

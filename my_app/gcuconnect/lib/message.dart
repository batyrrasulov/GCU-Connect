
class Message {
  final int messageId;
  final int senderId;
  final int receiverId;
  final String content;
  final DateTime messageDate;

  Message({
    required this.messageId,
    required this.senderId,
    required this.receiverId,
    required this.content,
    required this.messageDate,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
  return Message(
    messageId: json['messageId'] as int, 
    senderId: json['senderId']['userId'] as int, 
    receiverId: json['receiverId']['userId'] as int, 
    content: json['content'] as String,
    messageDate: DateTime.parse(json['message_date']), 
  );
}

  Map<String, dynamic> toJson() {
    return {
      'messageId': messageId,
      'senderId': senderId,
      'receiverId': receiverId,
      'content': content,
      'messageDate': messageDate.toIso8601String(),
    };
  }
}

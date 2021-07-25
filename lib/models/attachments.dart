class Attachments {
  String attachments;
  Attachments({this.attachments});
  factory Attachments.fromJson(Map<String, dynamic> jsonData) {
    return Attachments(attachments: jsonData['attachments']);
  }
  @override
  String toString() {
    return 'attachments: $attachments';
  }
}

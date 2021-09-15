class NewsItem {
  String? id;
  String? type;
  String? sectionId;
  String? sectionName;
  String? webPublicationDate;
  String? webTitle;
  String? webUrl;
  String? apiUrl;
  bool? isHosted;
  String? pillarId;
  String? pillarName;

  NewsItem(
      {required this.id,
      required this.type,
      required this.sectionId,
      required this.sectionName,
      required this.webPublicationDate,
      required this.webTitle,
      required this.webUrl,
      required this.apiUrl,
      required this.isHosted,
      required this.pillarId,
      required this.pillarName});

  NewsItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    sectionId = json['sectionId'];
    sectionName = json['sectionName'];
    webPublicationDate = json['webPublicationDate'];
    webTitle = json['webTitle'];
    webUrl = json['webUrl'];
    apiUrl = json['apiUrl'];
    isHosted = json['isHosted'];
    pillarId = json['pillarId'];
    pillarName = json['pillarName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['sectionId'] = this.sectionId;
    data['sectionName'] = this.sectionName;
    data['webPublicationDate'] = this.webPublicationDate;
    data['webTitle'] = this.webTitle;
    data['webUrl'] = this.webUrl;
    data['apiUrl'] = this.apiUrl;
    data['isHosted'] = this.isHosted;
    data['pillarId'] = this.pillarId;
    data['pillarName'] = this.pillarName;
    return data;
  }
}

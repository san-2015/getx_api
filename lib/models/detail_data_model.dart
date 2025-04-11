class DetailDataModel {
  final String name;
  final String title;
  final String text;
  final String img;
  final String time;
  final String prize;

  DetailDataModel({
    required this.name,
    required this.title,
    required this.text,
    required this.img,
    required this.time,
    required this.prize,
  });

  // Factory constructor to create a DataModel from JSON
  factory DetailDataModel.fromJson(Map<String, dynamic> json) {
    return DetailDataModel(
      name: json['name'],
      title: json['title'],
      text: json['text'],
      img: json['img'],
      time: json['time'],
      prize: json['prize'],
    );
  }

  // Method to convert a DataModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'title': title,
      'text': text,
      'img': img,
      'time': time,
      'prize': prize,
    };
  }
}

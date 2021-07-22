class City {
  int? id;
  String? name;

  City({
    this.id,
    this.name,
  });

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.name;

    return data;
  }
}

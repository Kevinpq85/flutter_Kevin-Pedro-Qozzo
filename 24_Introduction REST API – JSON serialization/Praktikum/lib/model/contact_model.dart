class Contact {
  int? id;
  String? name;
  String? phone;

  Contact({this.id, this.name, this.phone});

  Contact.fromJson(Map<String, dynamic> json) {
    id = DateTime.now().millisecondsSinceEpoch;
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    return data;
  }
}

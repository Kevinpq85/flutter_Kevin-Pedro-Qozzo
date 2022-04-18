class Contact{
  int? id;
  String name;
  String phone;

  Contact({this.id, required this.name, required this.phone});

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json["id"],
      name: json["name"],
      phone: json["phone"]
    );
  }
  Map<String, dynamic> toJson() => {
     'id' : id,
     'name': name,
     'phone': phone,
  };
}
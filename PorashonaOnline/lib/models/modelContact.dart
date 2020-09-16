class ContactInfo {
  String name;
  String numbers;

  ContactInfo({this.name, this.numbers});
  ContactInfo.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        numbers = json['numbers'];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'numbers': numbers,
    };
  }
}

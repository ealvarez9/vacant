class User {
  int id;
  String name;
  String username;
  String email;
  String phone;

  User(int id, String name, String email) {
    this.id         = id;
    this.name       = name;
    this.username   = username;
    this.email      = email;
    this.phone      = phone;
  }

  User.fromJson(Map json)
      : id      = json['id'],
        name    = json['name'],
        username= json['username'],
        email   = json['email'],
        phone   = json['phone'];

  Map toJson() {
    return {
    'id': id, 
    'name': name, 
    'username':username, 
    'phone': phone,
    'email': email
    };
  }
}
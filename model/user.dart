class User {
  final String id;
  final String name;
  final int age;
  final String imageURL;

  User({required this.id, required this.name, required this.age, required this.imageURL});

  //the fromMap method must have id
  factory User.fromMap(String id, Map<String, dynamic> map) {
    return User(
      id: id,
      name: map['name'] ?? '',
      age: map['age'] ?? 0,
      imageURL: map['imageURL'] ?? '',
    );
  }
  
}
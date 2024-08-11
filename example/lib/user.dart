class UserExample {
  final int? id;
  final int? itemId;
  final String? username;
  final String? email;
  final String? name;
  final String? surname;
  final String? gender;
  final int? age;

  UserExample({
    this.id,
    this.itemId,
    this.username,
    this.email,
    this.name,
    this.surname,
    this.gender,
    this.age,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      if (itemId != null) '_id': itemId,
      if (username != null) 'username': username,
      if (email != null) 'email': email,
      if (name != null) 'name': name,
      if (surname != null) 'surname': surname,
      if (gender != null) 'gender': gender,
      if (age != null) 'age': age,
      if (id != null) 'id': id,
    };
  }

  factory UserExample.fromJson(Map<String, dynamic> map) {
    return UserExample(
      id: int.tryParse(map['id'].toString()),
      itemId: int.tryParse(map['_id'].toString()),
      username: map['username'] as String?,
      email: map['email'] as String?,
      name: map['name'] as String?,
      surname: map['surname'] as String?,
      gender: map['gender'] as String?,
      age: int.tryParse(map['age'].toString()),
    );
  }
}

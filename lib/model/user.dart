class User {
  final int member_id;
  final String img;
  final String name;
  final String subtitle;
  final String email;

  User({
    required this.member_id,
    required this.img,
    required this.name,
    required this.subtitle,
    required this.email,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      member_id: map['member_id'],
      img: map['img'],
      name: map['name'],
      subtitle: map['subtitle'],
      email: map['email'],
    );
  }
}

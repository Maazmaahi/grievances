// User model
class User {
  final int? id;
  final String mobileNumber;
  final String name;
  final String email;
  final String profilePicture;
  final String role;

  User({
    this.id,
    required this.mobileNumber,
    required this.name,
    required this.email,
    required this.profilePicture,
    required this.role,
  });

  // Convert User object to Map (for SQLite)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'mobileNumber': mobileNumber,
      'name': name,
      'email': email,
      'profilePicture': profilePicture,
      'role': role,
    };
  }

  // Convert Map to User object (for reading from SQLite)
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      mobileNumber: map['mobileNumber'],
      name: map['name'],
      email: map['email'],
      profilePicture: map['profilePicture'],
      role: map['role'],
    );
  }
}

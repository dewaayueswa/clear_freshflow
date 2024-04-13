class User {
  final String name;
  final String email;
  final String phoneNumber;
  final String address;
  final String password;
  final int points;
  final String orderHistory;
  final String chatHistory;

  User({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.password,
    required this.points,
    required this.orderHistory,
    required this.chatHistory,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phone_number'] as String,
      address: json['address'] as String,
      password: json['password'] as String,
      points: json['points'] as int,
      orderHistory: json['order_history'] as String,
      chatHistory: json['chat_history'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phone_number': phoneNumber,
        'address': address,
        'password': password,
        'points': points,
        'order_history': orderHistory,
        'chat_history': chatHistory,
      };
}

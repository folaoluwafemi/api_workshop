import 'package:equatable/equatable.dart';

class BoredActivity with EquatableMixin {
  final String activity;
  final String type;
  final int participants;
  final double price;

  const BoredActivity({
    required this.activity,
    required this.type,
    required this.participants,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'activity': activity,
      'type': type,
      'participants': participants,
      'price': price,
    };
  }

  factory BoredActivity.fromMap(Map<String, dynamic> map) {
    return BoredActivity(
      activity: map['activity'] as String,
      type: map['type'] as String,
      participants: map['participants'] as int,
      price: map['price'] as double,
    );
  }

  @override
  List<Object?> get props => [activity, type, participants, price];
}

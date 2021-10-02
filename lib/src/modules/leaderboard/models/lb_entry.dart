import 'dart:convert';

class LB_Entry {
  final String displayName;
  final int points;
  final String uid;
  LB_Entry({
    required this.displayName,
    required this.points,
    required this.uid,
  });

  LB_Entry copyWith({
    String? displayName,
    int? points,
    String? uid,
  }) {
    return LB_Entry(
      displayName: displayName ?? this.displayName,
      points: points ?? this.points,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'displayName': displayName,
      'points': points,
      'uid': uid,
    };
  }

  factory LB_Entry.fromMap(Map<String, dynamic> map) {
    return LB_Entry(
      displayName: map['displayName'],
      points: map['points']?.toInt(),
      uid: map['uid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LB_Entry.fromJson(String source) =>
      LB_Entry.fromMap(json.decode(source));

  @override
  String toString() =>
      'LB_Entry(displayName: $displayName, points: $points, uid: $uid)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LB_Entry &&
        other.displayName == displayName &&
        other.points == points &&
        other.uid == uid;
  }

  @override
  int get hashCode => displayName.hashCode ^ points.hashCode ^ uid.hashCode;
}

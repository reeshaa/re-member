import 'dart:convert';

class Profile_Entry {
  final int answersCount;
  final int questionsCount;
  final int points;
  final String displayName;
  final String uid;

  Profile_Entry(
      {required this.answersCount,
      required this.displayName,
      required this.points,
      required this.questionsCount,
      required this.uid});

  Profile_Entry copyWith({
    int? answersCount,
    int? questionsCount,
    int? points,
    String? displayName,
    String? uid,
  }) {
    return Profile_Entry(
      answersCount: answersCount ?? this.answersCount,
      questionsCount: questionsCount ?? this.questionsCount,
      points: points ?? this.points,
      displayName: displayName ?? this.displayName,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'answersCount': answersCount,
      'questionsCount': questionsCount,
      'points': points,
      'displayName': displayName,
      'uid': uid,
    };
  }

  factory Profile_Entry.fromMap(Map<String, dynamic> map) {
    return Profile_Entry(
      answersCount: map['answersCount'].toInt(),
      questionsCount: map['questionsCount'].toInt(),
      points: map['points'].toInt(),
      displayName: map['displayName'],
      uid: map['uid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile_Entry.fromJson(String source) =>
      Profile_Entry.fromMap(json.decode(source));

  @override
  String toString() =>
      "Profile_Entry('answersCount': $answersCount,'questionsCount': $questionsCount,'points': $points,'displayName': $displayName,'uid': $uid)";

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Profile_Entry &&
        other.answersCount == answersCount &&
        other.questionsCount == questionsCount &&
        other.displayName == displayName &&
        other.points == points &&
        other.uid == uid;
  }

  @override
  int get hashCode =>
      answersCount.hashCode ^
      questionsCount.hashCode ^
      displayName.hashCode ^
      points.hashCode ^
      uid.hashCode;
}

import 'dart:convert';

import 'package:flutter/foundation.dart';

class Community {
  final String communityDescription;
  final String communityId;
  final String communityName;
  final List<ForumQuestion> forumQuestions;
  final String imageURL;
  final int participantsCount;
  final List<dynamic> subtopics;
  final List<dynamic> resources;
  Community({
    required this.communityDescription,
    required this.communityId,
    required this.communityName,
    required this.forumQuestions,
    required this.imageURL,
    required this.participantsCount,
    required this.subtopics,
    required this.resources,
  });

  Community copyWith({
    String? communityDescription,
    String? communityId,
    String? communityName,
    List<ForumQuestion>? forumQuestions,
    String? imageURL,
    int? participantsCount,
    List<dynamic>? subtopics,
    List<dynamic>? resources,
  }) {
    return Community(
      communityDescription: communityDescription ?? this.communityDescription,
      communityId: communityId ?? this.communityId,
      communityName: communityName ?? this.communityName,
      forumQuestions: forumQuestions ?? this.forumQuestions,
      imageURL: imageURL ?? this.imageURL,
      participantsCount: participantsCount ?? this.participantsCount,
      subtopics: subtopics ?? this.subtopics,
      resources: resources ?? this.resources,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'communityDescription': communityDescription,
      'communityId': communityId,
      'communityName': communityName,
      'forumQuestions': forumQuestions.map((x) => x.toMap()).toList(),
      'imageURL': imageURL,
      'participantsCount': participantsCount,
      'subtopics': subtopics,
      'resources': resources,
    };
  }

  factory Community.fromMap(Map<String, dynamic> map) {
    return Community(
      communityDescription: map['communityDescription'],
      communityId: map['communityId'],
      communityName: map['communityName'],
      forumQuestions: List<ForumQuestion>.from(
          map['forumQuestions']?.map((x) => ForumQuestion.fromMap(x))),
      imageURL: map['imageURL'],
      participantsCount: map['participantsCount']?.toInt(),
      subtopics: List<dynamic>.from(map['subtopics']),
      resources: List<dynamic>.from(map['resources']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Community.fromJson(String source) =>
      Community.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Community(communityDescription: $communityDescription, communityId: $communityId, communityName: $communityName, forumQuestions: $forumQuestions, imageURL: $imageURL, participantsCount: $participantsCount, subtopics: $subtopics, resources: $resources)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Community &&
        other.communityDescription == communityDescription &&
        other.communityId == communityId &&
        other.communityName == communityName &&
        listEquals(other.forumQuestions, forumQuestions) &&
        other.imageURL == imageURL &&
        other.participantsCount == participantsCount &&
        listEquals(other.subtopics, subtopics) &&
        listEquals(other.resources, resources);
  }

  @override
  int get hashCode {
    return communityDescription.hashCode ^
        communityId.hashCode ^
        communityName.hashCode ^
        forumQuestions.hashCode ^
        imageURL.hashCode ^
        participantsCount.hashCode ^
        subtopics.hashCode ^
        resources.hashCode;
  }
}

class ForumQuestion {
  final String communityId;
  final String ownerUid;
  final String postedBy;
  final String qid;
  final String question;
  ForumQuestion({
    required this.communityId,
    required this.ownerUid,
    required this.postedBy,
    required this.qid,
    required this.question,
  });

  ForumQuestion copyWith({
    String? communityId,
    String? ownerUid,
    String? postedBy,
    String? qid,
    String? question,
  }) {
    return ForumQuestion(
      communityId: communityId ?? this.communityId,
      ownerUid: ownerUid ?? this.ownerUid,
      postedBy: postedBy ?? this.postedBy,
      qid: qid ?? this.qid,
      question: question ?? this.question,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'communityId': communityId,
      'ownerUid': ownerUid,
      'postedBy': postedBy,
      'qid': qid,
      'question': question,
    };
  }

  factory ForumQuestion.fromMap(Map<String, dynamic> map) {
    return ForumQuestion(
      communityId: map['communityId'],
      ownerUid: map['ownerUid'],
      postedBy: map['postedBy'],
      qid: map['qid'],
      question: map['question'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ForumQuestion.fromJson(String source) =>
      ForumQuestion.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ForumQuestion(communityId: $communityId, ownerUid: $ownerUid, postedBy: $postedBy, qid: $qid, question: $question)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ForumQuestion &&
        other.communityId == communityId &&
        other.ownerUid == ownerUid &&
        other.postedBy == postedBy &&
        other.qid == qid &&
        other.question == question;
  }

  @override
  int get hashCode {
    return communityId.hashCode ^
        ownerUid.hashCode ^
        postedBy.hashCode ^
        qid.hashCode ^
        question.hashCode;
  }
}

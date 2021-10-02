import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:re_member/src/modules/communities/model/forum_question.dart';

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

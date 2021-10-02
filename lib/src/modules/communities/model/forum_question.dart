import 'dart:convert';

import 'package:flutter/foundation.dart';

class ForumQuestion {
  final List<Answer>? answers;
  final String communityId;
  final String ownerUid;
  final String postedBy;
  final String qid;
  final String question;
  ForumQuestion({
    required this.answers,
    required this.communityId,
    required this.ownerUid,
    required this.postedBy,
    required this.qid,
    required this.question,
  });

  ForumQuestion copyWith({
    List<Answer>? answers,
    String? communityId,
    String? ownerUid,
    String? postedBy,
    String? qid,
    String? question,
  }) {
    return ForumQuestion(
      answers: answers ?? this.answers,
      communityId: communityId ?? this.communityId,
      ownerUid: ownerUid ?? this.ownerUid,
      postedBy: postedBy ?? this.postedBy,
      qid: qid ?? this.qid,
      question: question ?? this.question,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'answers': answers?.map((x) => x.toMap()).toList(),
      'communityId': communityId,
      'ownerUid': ownerUid,
      'postedBy': postedBy,
      'qid': qid,
      'question': question,
    };
  }

  factory ForumQuestion.fromMap(Map<String, dynamic> map) {
    return ForumQuestion(
      answers: map['answers'] == null
          ? null
          : List<Answer>.from(map['answers'].map((x) => Answer.fromMap(x))),
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
    return 'ForumQuestion(answers: $answers, communityId: $communityId, ownerUid: $ownerUid, postedBy: $postedBy, qid: $qid, question: $question)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ForumQuestion &&
        listEquals(other.answers, answers) &&
        other.communityId == communityId &&
        other.ownerUid == ownerUid &&
        other.postedBy == postedBy &&
        other.qid == qid &&
        other.question == question;
  }

  @override
  int get hashCode {
    return answers.hashCode ^
        communityId.hashCode ^
        ownerUid.hashCode ^
        postedBy.hashCode ^
        qid.hashCode ^
        question.hashCode;
  }
}

class Answer {
  final String answer;
  final String answerId;
  final String communityId;
  final String ownerUid;
  final String postedBy;
  Answer({
    required this.answer,
    required this.answerId,
    required this.communityId,
    required this.ownerUid,
    required this.postedBy,
  });

  Answer copyWith({
    String? answer,
    String? answerId,
    String? communityId,
    String? ownerUid,
    String? postedBy,
  }) {
    return Answer(
      answer: answer ?? this.answer,
      answerId: answerId ?? this.answerId,
      communityId: communityId ?? this.communityId,
      ownerUid: ownerUid ?? this.ownerUid,
      postedBy: postedBy ?? this.postedBy,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'answer': answer,
      'answerId': answerId,
      'communityId': communityId,
      'ownerUid': ownerUid,
      'postedBy': postedBy,
    };
  }

  factory Answer.fromMap(Map<String, dynamic> map) {
    return Answer(
      answer: map['answer'],
      answerId: map['answerId'],
      communityId: map['communityId'],
      ownerUid: map['ownerUid'],
      postedBy: map['postedBy'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Answer.fromJson(String source) => Answer.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Answer(answer: $answer, answerId: $answerId, communityId: $communityId, ownerUid: $ownerUid, postedBy: $postedBy)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Answer &&
        other.answer == answer &&
        other.answerId == answerId &&
        other.communityId == communityId &&
        other.ownerUid == ownerUid &&
        other.postedBy == postedBy;
  }

  @override
  int get hashCode {
    return answer.hashCode ^
        answerId.hashCode ^
        communityId.hashCode ^
        ownerUid.hashCode ^
        postedBy.hashCode;
  }
}

import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LessonFeedbackRecord extends FirestoreRecord {
  LessonFeedbackRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "feedback" field.
  String? _feedback;
  String get feedback => _feedback ?? '';
  bool hasFeedback() => _feedback != null;

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  bool hasRating() => _rating != null;

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  void _initializeFields() {
    _feedback = snapshotData['feedback'] as String?;
    _rating = castToType<int>(snapshotData['rating']);
    _userId = snapshotData['user_id'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('lesson_feedback');

  static Stream<LessonFeedbackRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LessonFeedbackRecord.fromSnapshot(s));

  static Future<LessonFeedbackRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LessonFeedbackRecord.fromSnapshot(s));

  static LessonFeedbackRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LessonFeedbackRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LessonFeedbackRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LessonFeedbackRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LessonFeedbackRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LessonFeedbackRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLessonFeedbackRecordData({
  String? feedback,
  int? rating,
  DocumentReference? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'feedback': feedback,
      'rating': rating,
      'user_id': userId,
    }.withoutNulls,
  );

  return firestoreData;
}

class LessonFeedbackRecordDocumentEquality
    implements Equality<LessonFeedbackRecord> {
  const LessonFeedbackRecordDocumentEquality();

  @override
  bool equals(LessonFeedbackRecord? e1, LessonFeedbackRecord? e2) {
    return e1?.feedback == e2?.feedback &&
        e1?.rating == e2?.rating &&
        e1?.userId == e2?.userId;
  }

  @override
  int hash(LessonFeedbackRecord? e) =>
      const ListEquality().hash([e?.feedback, e?.rating, e?.userId]);

  @override
  bool isValidKey(Object? o) => o is LessonFeedbackRecord;
}

import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Stores data for user lessons such as if a chapter has been completed, quiz
/// results, etc.
class LessonsRecord extends FirestoreRecord {
  LessonsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "chapter1_is_complete" field.
  bool? _chapter1IsComplete;
  bool get chapter1IsComplete => _chapter1IsComplete ?? false;
  bool hasChapter1IsComplete() => _chapter1IsComplete != null;

  // "chapter2_is_complete" field.
  bool? _chapter2IsComplete;
  bool get chapter2IsComplete => _chapter2IsComplete ?? false;
  bool hasChapter2IsComplete() => _chapter2IsComplete != null;

  // "chapter3_is_complete" field.
  bool? _chapter3IsComplete;
  bool get chapter3IsComplete => _chapter3IsComplete ?? false;
  bool hasChapter3IsComplete() => _chapter3IsComplete != null;

  // "chapter4_is_complete" field.
  bool? _chapter4IsComplete;
  bool get chapter4IsComplete => _chapter4IsComplete ?? false;
  bool hasChapter4IsComplete() => _chapter4IsComplete != null;

  // "chapter5_is_complete" field.
  bool? _chapter5IsComplete;
  bool get chapter5IsComplete => _chapter5IsComplete ?? false;
  bool hasChapter5IsComplete() => _chapter5IsComplete != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _chapter1IsComplete = snapshotData['chapter1_is_complete'] as bool?;
    _chapter2IsComplete = snapshotData['chapter2_is_complete'] as bool?;
    _chapter3IsComplete = snapshotData['chapter3_is_complete'] as bool?;
    _chapter4IsComplete = snapshotData['chapter4_is_complete'] as bool?;
    _chapter5IsComplete = snapshotData['chapter5_is_complete'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('lessons')
          : FirebaseFirestore.instance.collectionGroup('lessons');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('lessons').doc(id);

  static Stream<LessonsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LessonsRecord.fromSnapshot(s));

  static Future<LessonsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LessonsRecord.fromSnapshot(s));

  static LessonsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LessonsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LessonsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LessonsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LessonsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LessonsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLessonsRecordData({
  bool? chapter1IsComplete,
  bool? chapter2IsComplete,
  bool? chapter3IsComplete,
  bool? chapter4IsComplete,
  bool? chapter5IsComplete,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'chapter1_is_complete': chapter1IsComplete,
      'chapter2_is_complete': chapter2IsComplete,
      'chapter3_is_complete': chapter3IsComplete,
      'chapter4_is_complete': chapter4IsComplete,
      'chapter5_is_complete': chapter5IsComplete,
    }.withoutNulls,
  );

  return firestoreData;
}

class LessonsRecordDocumentEquality implements Equality<LessonsRecord> {
  const LessonsRecordDocumentEquality();

  @override
  bool equals(LessonsRecord? e1, LessonsRecord? e2) {
    return e1?.chapter1IsComplete == e2?.chapter1IsComplete &&
        e1?.chapter2IsComplete == e2?.chapter2IsComplete &&
        e1?.chapter3IsComplete == e2?.chapter3IsComplete &&
        e1?.chapter4IsComplete == e2?.chapter4IsComplete &&
        e1?.chapter5IsComplete == e2?.chapter5IsComplete;
  }

  @override
  int hash(LessonsRecord? e) => const ListEquality().hash([
        e?.chapter1IsComplete,
        e?.chapter2IsComplete,
        e?.chapter3IsComplete,
        e?.chapter4IsComplete,
        e?.chapter5IsComplete
      ]);

  @override
  bool isValidKey(Object? o) => o is LessonsRecord;
}

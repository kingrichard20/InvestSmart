import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// A collection of user accounts and relevant information
class UserAccountsRecord extends FirestoreRecord {
  UserAccountsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "chapter1_is_completed" field.
  bool? _chapter1IsCompleted;
  bool get chapter1IsCompleted => _chapter1IsCompleted ?? false;
  bool hasChapter1IsCompleted() => _chapter1IsCompleted != null;

  // "chapter2_is_completed" field.
  bool? _chapter2IsCompleted;
  bool get chapter2IsCompleted => _chapter2IsCompleted ?? false;
  bool hasChapter2IsCompleted() => _chapter2IsCompleted != null;

  // "chapter3_is_completed" field.
  bool? _chapter3IsCompleted;
  bool get chapter3IsCompleted => _chapter3IsCompleted ?? false;
  bool hasChapter3IsCompleted() => _chapter3IsCompleted != null;

  // "chapter4_is_completed" field.
  bool? _chapter4IsCompleted;
  bool get chapter4IsCompleted => _chapter4IsCompleted ?? false;
  bool hasChapter4IsCompleted() => _chapter4IsCompleted != null;

  // "chapter5_is_completed" field.
  bool? _chapter5IsCompleted;
  bool get chapter5IsCompleted => _chapter5IsCompleted ?? false;
  bool hasChapter5IsCompleted() => _chapter5IsCompleted != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _chapter1IsCompleted = snapshotData['chapter1_is_completed'] as bool?;
    _chapter2IsCompleted = snapshotData['chapter2_is_completed'] as bool?;
    _chapter3IsCompleted = snapshotData['chapter3_is_completed'] as bool?;
    _chapter4IsCompleted = snapshotData['chapter4_is_completed'] as bool?;
    _chapter5IsCompleted = snapshotData['chapter5_is_completed'] as bool?;
    _phoneNumber = snapshotData['phone_number'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_Accounts');

  static Stream<UserAccountsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserAccountsRecord.fromSnapshot(s));

  static Future<UserAccountsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserAccountsRecord.fromSnapshot(s));

  static UserAccountsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserAccountsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserAccountsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserAccountsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserAccountsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserAccountsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserAccountsRecordData({
  String? email,
  String? displayName,
  String? uid,
  DateTime? createdTime,
  String? photoUrl,
  bool? chapter1IsCompleted,
  bool? chapter2IsCompleted,
  bool? chapter3IsCompleted,
  bool? chapter4IsCompleted,
  bool? chapter5IsCompleted,
  String? phoneNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'uid': uid,
      'created_time': createdTime,
      'photo_url': photoUrl,
      'chapter1_is_completed': chapter1IsCompleted,
      'chapter2_is_completed': chapter2IsCompleted,
      'chapter3_is_completed': chapter3IsCompleted,
      'chapter4_is_completed': chapter4IsCompleted,
      'chapter5_is_completed': chapter5IsCompleted,
      'phone_number': phoneNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserAccountsRecordDocumentEquality
    implements Equality<UserAccountsRecord> {
  const UserAccountsRecordDocumentEquality();

  @override
  bool equals(UserAccountsRecord? e1, UserAccountsRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.chapter1IsCompleted == e2?.chapter1IsCompleted &&
        e1?.chapter2IsCompleted == e2?.chapter2IsCompleted &&
        e1?.chapter3IsCompleted == e2?.chapter3IsCompleted &&
        e1?.chapter4IsCompleted == e2?.chapter4IsCompleted &&
        e1?.chapter5IsCompleted == e2?.chapter5IsCompleted &&
        e1?.phoneNumber == e2?.phoneNumber;
  }

  @override
  int hash(UserAccountsRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.uid,
        e?.createdTime,
        e?.photoUrl,
        e?.chapter1IsCompleted,
        e?.chapter2IsCompleted,
        e?.chapter3IsCompleted,
        e?.chapter4IsCompleted,
        e?.chapter5IsCompleted,
        e?.phoneNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is UserAccountsRecord;
}

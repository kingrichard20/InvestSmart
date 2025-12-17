import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HoldingsRecord extends FirestoreRecord {
  HoldingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ticker" field.
  String? _ticker;
  String get ticker => _ticker ?? '';
  bool hasTicker() => _ticker != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "asset_type" field.
  String? _assetType;
  String get assetType => _assetType ?? '';
  bool hasAssetType() => _assetType != null;

  // "quantity" field.
  String? _quantity;
  String get quantity => _quantity ?? '';
  bool hasQuantity() => _quantity != null;

  // "average_cost" field.
  String? _averageCost;
  String get averageCost => _averageCost ?? '';
  bool hasAverageCost() => _averageCost != null;

  // "total_cost" field.
  String? _totalCost;
  String get totalCost => _totalCost ?? '';
  bool hasTotalCost() => _totalCost != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _ticker = snapshotData['ticker'] as String?;
    _name = snapshotData['name'] as String?;
    _assetType = snapshotData['asset_type'] as String?;
    _quantity = snapshotData['quantity'] as String?;
    _averageCost = snapshotData['average_cost'] as String?;
    _totalCost = snapshotData['total_cost'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('holdings')
          : FirebaseFirestore.instance.collectionGroup('holdings');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('holdings').doc(id);

  static Stream<HoldingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HoldingsRecord.fromSnapshot(s));

  static Future<HoldingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HoldingsRecord.fromSnapshot(s));

  static HoldingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HoldingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HoldingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HoldingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HoldingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HoldingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHoldingsRecordData({
  String? ticker,
  String? name,
  String? assetType,
  String? quantity,
  String? averageCost,
  String? totalCost,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ticker': ticker,
      'name': name,
      'asset_type': assetType,
      'quantity': quantity,
      'average_cost': averageCost,
      'total_cost': totalCost,
    }.withoutNulls,
  );

  return firestoreData;
}

class HoldingsRecordDocumentEquality implements Equality<HoldingsRecord> {
  const HoldingsRecordDocumentEquality();

  @override
  bool equals(HoldingsRecord? e1, HoldingsRecord? e2) {
    return e1?.ticker == e2?.ticker &&
        e1?.name == e2?.name &&
        e1?.assetType == e2?.assetType &&
        e1?.quantity == e2?.quantity &&
        e1?.averageCost == e2?.averageCost &&
        e1?.totalCost == e2?.totalCost;
  }

  @override
  int hash(HoldingsRecord? e) => const ListEquality().hash([
        e?.ticker,
        e?.name,
        e?.assetType,
        e?.quantity,
        e?.averageCost,
        e?.totalCost
      ]);

  @override
  bool isValidKey(Object? o) => o is HoldingsRecord;
}

import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransactionsRecord extends FirestoreRecord {
  TransactionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "transaction_type" field.
  String? _transactionType;
  String get transactionType => _transactionType ?? '';
  bool hasTransactionType() => _transactionType != null;

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
  double? _quantity;
  double get quantity => _quantity ?? 0.0;
  bool hasQuantity() => _quantity != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "total_amount" field.
  double? _totalAmount;
  double get totalAmount => _totalAmount ?? 0.0;
  bool hasTotalAmount() => _totalAmount != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _transactionType = snapshotData['transaction_type'] as String?;
    _ticker = snapshotData['ticker'] as String?;
    _name = snapshotData['name'] as String?;
    _assetType = snapshotData['asset_type'] as String?;
    _quantity = castToType<double>(snapshotData['quantity']);
    _price = castToType<double>(snapshotData['price']);
    _totalAmount = castToType<double>(snapshotData['total_amount']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('transactions')
          : FirebaseFirestore.instance.collectionGroup('transactions');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('transactions').doc(id);

  static Stream<TransactionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransactionsRecord.fromSnapshot(s));

  static Future<TransactionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TransactionsRecord.fromSnapshot(s));

  static TransactionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransactionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransactionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransactionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransactionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransactionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransactionsRecordData({
  DateTime? timestamp,
  String? transactionType,
  String? ticker,
  String? name,
  String? assetType,
  double? quantity,
  double? price,
  double? totalAmount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'timestamp': timestamp,
      'transaction_type': transactionType,
      'ticker': ticker,
      'name': name,
      'asset_type': assetType,
      'quantity': quantity,
      'price': price,
      'total_amount': totalAmount,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransactionsRecordDocumentEquality
    implements Equality<TransactionsRecord> {
  const TransactionsRecordDocumentEquality();

  @override
  bool equals(TransactionsRecord? e1, TransactionsRecord? e2) {
    return e1?.timestamp == e2?.timestamp &&
        e1?.transactionType == e2?.transactionType &&
        e1?.ticker == e2?.ticker &&
        e1?.name == e2?.name &&
        e1?.assetType == e2?.assetType &&
        e1?.quantity == e2?.quantity &&
        e1?.price == e2?.price &&
        e1?.totalAmount == e2?.totalAmount;
  }

  @override
  int hash(TransactionsRecord? e) => const ListEquality().hash([
        e?.timestamp,
        e?.transactionType,
        e?.ticker,
        e?.name,
        e?.assetType,
        e?.quantity,
        e?.price,
        e?.totalAmount
      ]);

  @override
  bool isValidKey(Object? o) => o is TransactionsRecord;
}

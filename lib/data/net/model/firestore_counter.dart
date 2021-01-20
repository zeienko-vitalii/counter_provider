import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreCounter {
  FireStoreCounter({this.id, this.count});

  final String id;
  final int count;

  bool get isEmpty => count == null;

  bool get isNotEmpty => count != null;

  bool get isAboveZero => isNotEmpty && count > 0;

  FireStoreCounter.copy(FireStoreCounter copy)
      : id = copy?.id,
        count = copy?.count;

  FireStoreCounter.fromQueryDocumentSnapshot(QueryDocumentSnapshot snapshot)
      : id = snapshot?.id,
        count = snapshot?.data() == null ? null : snapshot?.data()['count'];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'count': count,
      };
}

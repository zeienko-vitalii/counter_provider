import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counter_provider/data/net/datasource/datasource.dart';
import 'package:counter_provider/data/net/model/firestore_counter.dart';

/// Singleton class that implements [DataSource] interface using Firebase source
class FireStoreImpl extends DataSource {
  factory FireStoreImpl() => _singleton;

  FireStoreImpl._();

  final CollectionReference _counterCollectionReference = FirebaseFirestore.instance.collection('counter');
  static final FireStoreImpl _singleton = FireStoreImpl._();

  @override
  Future<FireStoreCounter> getCounter() {
    return _counterCollectionReference.get().then((QuerySnapshot value) {
      // if there is no prev value - add initial counter
      if ((value?.size ?? 0) == 0) {
        final FireStoreCounter initialCounter = FireStoreCounter(count: 0);
        return _counterCollectionReference.add(initialCounter.toJson()).then(
              (DocumentReference value) => FireStoreCounter(id: value.id, count: 0),
            );
      }
      return FireStoreCounter.fromQueryDocumentSnapshot((value.docs?.isNotEmpty ?? false) ? value.docs[0] : null);
    });
  }

  @override
  Future<FireStoreCounter> updateCounter(FireStoreCounter counter) {
    return _counterCollectionReference.doc(counter?.id).update(counter?.toJson()).then((_) => counter);
  }
}

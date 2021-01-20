import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counter_provider/data/net/datasource/datasource.dart';
import 'package:counter_provider/data/net/model/firestore_counter.dart';

class FireStoreImpl extends DataSource {
  final CollectionReference _counter = FirebaseFirestore.instance.collection('counter');

  @override
  Future<FireStoreCounter> getCounter() {
    return _counter.get().then((QuerySnapshot value) {
      print(value);
      if ((value?.size ?? 0) == 0) {
        return _counter.add(FireStoreCounter(count: 0).toJson()).then((DocumentReference value) {
          print(value);
          return FireStoreCounter.copy(FireStoreCounter(id: value.id, count: 0));
        });
      }
      return FireStoreCounter.fromQueryDocumentSnapshot((value.docs?.isNotEmpty ?? false) ? value.docs[0] : null);
    });
  }

  @override
  Future<void> updateCounter(FireStoreCounter counter) {
    return _counter.doc(counter?.id).update(counter?.toJson()).then((_) {});
  }
}

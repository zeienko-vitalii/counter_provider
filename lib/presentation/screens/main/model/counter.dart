import 'package:counter_provider/data/net/datasource/datasource.dart';
import 'package:counter_provider/data/net/firestore_impl/firestore_impl.dart';
import 'package:counter_provider/data/net/model/firestore_counter.dart';
import 'package:flutter/foundation.dart';

class Counter with ChangeNotifier {
  FireStoreCounter get count => _count;
  FireStoreCounter _count;

  final DataSource _dataSource = FireStoreImpl();

  Future<void> init() async {
    _count = await _dataSource.getCounter();
    notifyListeners();
  }

  Future<void> increment() async {
    final FireStoreCounter incremented = FireStoreCounter(
      id: _count.id,
      count: _count?.count == null ? null : (_count.count + 1),
    );
    await _dataSource.updateCounter(incremented);
    _count = incremented;
    notifyListeners();
  }

  Future<void> decrement() async {
    if (_count?.isAboveZero ?? false) {
      final FireStoreCounter decremented = FireStoreCounter(
        id: _count.id,
        count: _count?.count == null ? null : (_count.count - 1),
      );
      await _dataSource.updateCounter(decremented);
      _count = decremented;
      notifyListeners();
    }
  }
}

import 'package:counter_provider/data/net/datasource/datasource.dart';
import 'package:counter_provider/data/net/firestore_impl/firestore_impl.dart';
import 'package:counter_provider/data/net/model/firestore_counter.dart';
import 'package:flutter/foundation.dart';

class Counter with ChangeNotifier {
  FireStoreCounter get count => _count;
  FireStoreCounter _count;

  bool get isError => _isError;
  bool _isError = false;
  final DataSource _dataSource = FireStoreImpl();

  Future<void> init() async {
    try {
      _count = await _dataSource.getCounter();
      _updateIsError(false);
    } catch (ex) {
      _updateIsError(true);
    }
    notifyListeners();
  }

  Future<void> increment() async {
    if (_count == null) return;
    final FireStoreCounter incremented = FireStoreCounter(
      id: _count.id,
      count: _count.count == null ? null : (_count.count + 1),
    );
    try {
      _count = await _dataSource.updateCounter(incremented);
      _updateIsError();
    } catch (ex) {
      _updateIsError(true);
    }
    notifyListeners();
  }

  Future<void> decrement() async {
    if (_count == null) return;
    if (_count.isAboveZero) {
      final FireStoreCounter decremented = FireStoreCounter(
        id: _count.id,
        count: _count.count == null ? null : (_count.count - 1),
      );
      try {
        _count = await _dataSource.updateCounter(decremented);
        _updateIsError();
      } catch (ex) {
        _updateIsError(true);
      }

      notifyListeners();
    }
  }

  void _updateIsError([bool isError = false]) {
    _isError = isError;
  }
}

import 'package:counter_provider/data/net/datasource/datasource.dart';
import 'package:counter_provider/data/net/firestore_impl/firestore_impl.dart';
import 'package:counter_provider/data/net/model/firestore_counter.dart';
import 'package:flutter/foundation.dart';

/// Model's data that is listened to by main widget 
class Counter with ChangeNotifier {
  
  /// Counter that is used for displying on UI
  FireStoreCounter get count => _count;
  FireStoreCounter _count;

  /// It's true in case if any error occurred
  bool get isError => _isError;
  bool _isError = false;

  /// Firebase data source 
  final DataSource _dataSource = FireStoreImpl();

  /// Fetches counter or initializes new one on Firestore with value of 0
  Future<void> init() async {
    try {
      _count = await _dataSource.getCounter();
    } catch (ex) {
      _updateIsError(true);
    }
    notifyListeners();
  }

  /// Increments counter and notifies listeners
  Future<void> increment() async {
    if (_count == null) return;
    _updateCounter(_count.count + 1);
  }
  
  /// Decrements counter and notifies listeners
  Future<void> decrement() async {
    if (_count == null) return;
    if (_count.isAboveZero) {
      _updateCounter(_count.count - 1);
    }
  }

  /// Updates counter with [counter] value and notifies listeners
  Future<void> _updateCounter(int counter) async {
    try {
      _count = await _dataSource.updateCounter(
        FireStoreCounter(id: _count.id, count: _count.count == null ? null : counter),
      );
      _updateIsError();
    } catch (ex) {
      _updateIsError(true);
    }
    notifyListeners();
  }

  void _updateIsError([bool isError = false]) {
    _isError = isError;
  }
}

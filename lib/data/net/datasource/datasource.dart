
import 'package:counter_provider/data/net/model/firestore_counter.dart';

/// Describes abstract functionality
abstract class DataSource {
  Future<FireStoreCounter> getCounter();
  Future<void> updateCounter(FireStoreCounter counter);
}
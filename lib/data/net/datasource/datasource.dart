
import 'package:counter_provider/data/net/model/firestore_counter.dart';

/// Describes abstract functionality
abstract class DataSource {
  /// Fetches counter. In case if there is no counter yet in db it initializes new one with value of 0 
  Future<FireStoreCounter> getCounter();
  /// Updates counter
  Future<FireStoreCounter> updateCounter(FireStoreCounter counter);
}

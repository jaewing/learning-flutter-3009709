import 'package:flutter/foundation.dart';

class Counter with ChangeNotifier, DiagnosticableTreeMixin {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  /// Makes 'Counter' readable inside the Flutter devtools by listening to all
  /// of its properties.
  ///
  /// Corresponds to also extending DiagnosticableTreeMixin.
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties){
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));
  }
}
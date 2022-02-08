import 'package:author_hub/models/pointer.dart';

import 'data_types.dart';

export 'data_types.dart';

class GenericDataModel {
  GenericDataModel();

  late DataType type;
  late String id;
  // key attributes of an author.
  // late A? attributes;
  List<Pointer>? relationships;

  List<Pointer>? getPointer({required DataType ofType}) {
    if (relationships != null) {
      return relationships?.where((element) => element.type == ofType).toList();
    }
  }

  /// In the json data each of the pointers are wrapped with a data list or data element.
  /// These functions remove those elements and directly construct the pointers.
  static List<Pointer>? returnPointers(Map<String, dynamic>? json) {
    if (json != null) {
      List<Pointer> pointers = [];
      // if multi-pointer add all to list.
      json.forEach((k, v) {
        var rawPointer = v['data'];
        if (rawPointer is List) {
          for (var pointer in rawPointer) {
            pointers.add(Pointer.fromJson(pointer));
          }
          // if single pointer add to list
        } else {
          pointers.add(Pointer.fromJson(v['data']));
        }
      });
      return pointers;
    }
  }
}

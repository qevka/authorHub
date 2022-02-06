import 'package:json_annotation/json_annotation.dart';

import 'data_types.dart';

part 'pointer.g.dart';

@JsonSerializable()
class Pointer {
  Pointer();

  late DataType? type;
  late String id;
  String? get dataEndPoint {
    if (type != null) {
      return type!.url + "/$id";
    }
  }

  factory Pointer.fromJson(Map<String, dynamic> json) => _$PointerFromJson(json);
  Map<String, dynamic> toJson() => _$PointerToJson(this);
}

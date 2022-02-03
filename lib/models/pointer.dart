import 'package:json_annotation/json_annotation.dart';

import 'enums/data_types.dart';

part 'pointer.g.dart';

@JsonSerializable()
class Pointer {
  Pointer();

  late DataType type;
  late String id;

  factory Pointer.fromJson(Map<String, dynamic> json) => _$PointerFromJson(json);
  Map<String, dynamic> toJson() => _$PointerToJson(this);
}

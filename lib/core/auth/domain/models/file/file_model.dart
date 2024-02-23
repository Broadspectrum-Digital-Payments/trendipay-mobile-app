
import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_model.freezed.dart';
part 'file_model.g.dart';


@freezed
class FileModel with _$FileModel {
  const factory FileModel({
    final String? externalId,
    final String? name,
    final String? url,
  }) = _FileModel;

  factory FileModel.fromJson(Map<String, dynamic> json) =>
      _$FileModelFromJson(json);
}



class FileList {
  FileList({required this.list});
  final List<FileModel> list;

  factory FileList.fromJson(List parsedJson) {
    final list = parsedJson.map((obj) => FileModel.fromJson(obj) ).toList();
    return FileList(list: list);
  }

}
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class FileModel {
  final String name;
  final Uint8List bytes;
  final String ext;
  final String mimeType;
  final String savePath;
  FileModel({
    required this.name,
    required this.bytes,
    required this.ext,
    required this.mimeType,
    required this.savePath,
  });

  FileModel copyWith({
    String? name,
    Uint8List? bytes,
    String? ext,
    String? mimeType,
    String? savePath,
  }) {
    return FileModel(
      name: name ?? this.name,
      bytes: bytes ?? this.bytes,
      ext: ext ?? this.ext,
      mimeType: mimeType ?? this.mimeType,
      savePath: savePath ?? this.savePath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'bytes': bytes,
      'ext': ext,
      'mimeType': mimeType,
      'savePath': savePath
    };
  }

  factory FileModel.fromMap(Map<String, dynamic> map) {
    return FileModel(
      name: map['name'] as String,
      bytes: Uint8List.fromList(List<int>.from(map['bytes'] as List<dynamic>)),
      ext: map['ext'] as String,
      mimeType: map['mimeType'] as String,
      savePath: map['savePath'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FileModel.fromJson(String source) =>
      FileModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

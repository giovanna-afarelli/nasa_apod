// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:nasa_apod/app/domain/entities/apod.dart';

class ApodModel extends Apod {
  ApodModel({
    super.resource,
    super.title,
    super.url,
    super.hdurl,
    super.mediaType,
    super.explanation,
    super.thumbnailUrl,
  });

  ApodModel copyWith({
    String? resource,
    String? title,
    String? url,
    String? hdurl,
    String? mediaType,
    String? explanation,
    String? thumbnailUrl,
  }) {
    return ApodModel(
      resource: resource ?? this.resource,
      title: title ?? this.title,
      url: url ?? this.url,
      hdurl: hdurl ?? this.hdurl,
      mediaType: mediaType ?? this.mediaType,
      explanation: explanation ?? this.explanation,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'resource': resource,
      'title': title,
      'url': url,
      'hdurl': hdurl,
      'mediaType': mediaType,
      'explanation': explanation,
      'thumbnailUrl': thumbnailUrl,
    };
  }

  factory ApodModel.fromMap(Map<String, dynamic> map) {
    return ApodModel(
      resource: map['resource'] as String?,
      title: map['title'] as String?,
      url: map['url'] as String?,
      hdurl: map['hdurl'] as String?,
      mediaType: map['mediaType'] as String?,
      explanation: map['explanation'] as String?,
      thumbnailUrl: map['thumbnailUrl'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory ApodModel.fromJson(String source) =>
      ApodModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ApodModel(resource: $resource, title: $title, url: $url, hdurl: $hdurl, mediaType: $mediaType, explanation: $explanation, thumbnailUrl: $thumbnailUrl)';
  }

  @override
  bool operator ==(covariant ApodModel other) {
    if (identical(this, other)) return true;

    return other.resource == resource &&
        other.title == title &&
        other.url == url &&
        other.hdurl == hdurl &&
        other.mediaType == mediaType &&
        other.explanation == explanation &&
        other.thumbnailUrl == thumbnailUrl;
  }

  @override
  int get hashCode {
    return resource.hashCode ^
        title.hashCode ^
        url.hashCode ^
        hdurl.hashCode ^
        mediaType.hashCode ^
        explanation.hashCode ^
        thumbnailUrl.hashCode;
  }
}

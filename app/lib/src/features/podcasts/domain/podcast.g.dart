// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'podcast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Podcast _$$_PodcastFromJson(Map<String, dynamic> json) => _$_Podcast(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$$_PodcastToJson(_$_Podcast instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
    };

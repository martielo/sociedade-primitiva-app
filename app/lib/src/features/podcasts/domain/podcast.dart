import 'package:freezed_annotation/freezed_annotation.dart';

part 'podcast.freezed.dart';
part 'podcast.g.dart';

typedef PodcastId = String;

@freezed
sealed class Podcast with _$Podcast {
  const factory Podcast({
    required PodcastId id,
    required String title,
    required String description,
    required String imageUrl,
  }) = _Podcast;

  factory Podcast.fromJson(Map<String, dynamic> json) =>
      _$PodcastFromJson(json);
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sociedade_primitiva_app/src/features/podcasts/domain/podcast.dart';

part 'podcast_repository.g.dart';

class PodcastRepository {
  PodcastRepository(this._firestore);
  final FirebaseFirestore _firestore;

  static String podcastsPath() => 'podcasts';
  static String podcastPath(PodcastId id) => 'podcasts/$id';

  Future<Podcast?> fetchPodcast(PodcastId id) async {
    final ref = _podcastRef(id);
    final snapshot = await ref.get();
    return snapshot.data();
  }

  DocumentReference<Podcast> _podcastRef(PodcastId id) =>
      _firestore.doc(podcastPath(id)).withConverter(
            fromFirestore: (doc, _) => Podcast.fromJson(doc.data()!),
            toFirestore: (Podcast podcast, options) => podcast.toJson(),
          );
}

@Riverpod(keepAlive: true)
PodcastRepository podcastRepository(PodcastRepositoryRef ref) {
  return PodcastRepository(FirebaseFirestore.instance);
}

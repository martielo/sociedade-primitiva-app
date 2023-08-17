import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sociedade_primitiva_app/src/features/podcasts/data/podcast_repository.dart';

import 'test_podcasts.dart';

void main() {
  late FakeFirebaseFirestore fakeFirebaseFirestore;
  late PodcastRepository podcastRepository;
  late CollectionReference collection;
  setUp(() {
    return Future(() async {
      fakeFirebaseFirestore = FakeFirebaseFirestore();
      podcastRepository = PodcastRepository(fakeFirebaseFirestore);
      collection =
          fakeFirebaseFirestore.collection(PodcastRepository.podcastsPath());
      // populate collection
      for (final podcast in kTestPodcats) {
        await collection.doc(podcast.id).set(podcast.toJson());
      }
    });
  });
  group('PodcastRepository', () {
    test('fetchProduct(1) returns first item', () async {
      final podcast = await podcastRepository.fetchPodcast('1');
      expect(podcast, kTestPodcats[0]);
    });
    test('fetchProduct(1000) returns null', () async {
      final podcast = await podcastRepository.fetchPodcast('1000');
      expect(podcast, null);
    });
  });
}

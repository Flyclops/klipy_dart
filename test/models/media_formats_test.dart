import 'package:klipy_dart/klipy_dart.dart';
import 'package:test/test.dart';

void main() {
  final testGif = {
    'url': 'url/to/gif',
    'dims': [10, 20],
    'duration': 1,
    'size': 1,
  };

  final testGifTransparent = {
    'url': 'url/to/gifTransparent',
    'dims': [20, 30],
    'duration': 2,
    'size': 2,
  };

  final testLoopedMp4 = {
    'url': 'url/to/loopedmp4',
    'dims': [30, 40],
    'duration': 3,
    'size': 3,
  };

  final testMediumGif = {
    'url': 'url/to/mediumgif',
    'dims': [40, 50],
    'duration': 4,
    'size': 4,
  };

  final testMp4 = {
    'url': 'url/to/mp4',
    'dims': [50, 60],
    'duration': 5,
    'size': 5,
  };

  final testNanoGif = {
    'url': 'url/to/nanogif',
    'dims': [60, 70],
    'duration': 6,
    'size': 6,
  };

  final testNanoGifTransparent = {
    'url': 'url/to/nanoGifTransparent',
    'dims': [70, 80],
    'duration': 7,
    'size': 7,
  };

  final testNanoMp4 = {
    'url': 'url/to/nanomp4',
    'dims': [80, 90],
    'duration': 8,
    'size': 8,
  };

  final testNanoWebm = {
    'url': 'url/to/nanoWebm',
    'dims': [90, 100],
    'duration': 9,
    'size': 9,
  };

  final testNanoWebpTransparent = {
    'url': 'url/to/nanoWebpTransparent',
    'dims': [100, 110],
    'duration': 10,
    'size': 10,
  };

  final testPreview = {
    'url': 'url/to/preview',
    'dims': [110, 120],
    'duration': 11,
    'size': 11,
  };

  final testTinyGif = {
    'url': 'url/to/tinygif',
    'dims': [120, 130],
    'duration': 12,
    'size': 12,
  };

  final testTinyGifTransparent = {
    'url': 'url/to/tinyGifTransparent',
    'dims': [130, 140],
    'duration': 13,
    'size': 13,
  };

  final testTinyMp4 = {
    'url': 'url/to/tinymp4',
    'dims': [140, 150],
    'duration': 14,
    'size': 14,
  };

  final testTinyWebm = {
    'url': 'url/to/tinyWebm',
    'dims': [150, 160],
    'duration': 15,
    'size': 15,
  };

  final testTinyWebpTransparent = {
    'url': 'url/to/tinyWebpTransparent',
    'dims': [160, 170],
    'duration': 16,
    'size': 16,
  };

  final testWebm = {
    'url': 'url/to/webm',
    'dims': [170, 180],
    'duration': 17,
    'size': 17,
  };

  final testWebpTransparent = {
    'url': 'url/to/testWebpTransparent',
    'dims': [180, 190],
    'duration': 18,
    'size': 18,
  };

  group('MediaFormats >', () {
    test('.fromJson()', () {
      final json = {
        KlipyMediaFormat.gif: testGif,
        KlipyMediaFormat.gifTransparent: testGifTransparent,
        KlipyMediaFormat.loopedMp4: testLoopedMp4,
        KlipyMediaFormat.mediumGif: testMediumGif,
        KlipyMediaFormat.mp4: testMp4,
        KlipyMediaFormat.nanoGif: testNanoGif,
        KlipyMediaFormat.nanoGifTransparent: testNanoGifTransparent,
        KlipyMediaFormat.nanoMp4: testNanoMp4,
        KlipyMediaFormat.nanoWebm: testNanoWebm,
        KlipyMediaFormat.nanoWebpTransparent: testNanoWebpTransparent,
        KlipyMediaFormat.preview: testPreview,
        KlipyMediaFormat.tinyGif: testTinyGif,
        KlipyMediaFormat.tinyGifTransparent: testTinyGifTransparent,
        KlipyMediaFormat.tinyMp4: testTinyMp4,
        KlipyMediaFormat.tinyWebm: testTinyWebm,
        KlipyMediaFormat.tinyWebpTransparent: testTinyWebpTransparent,
        KlipyMediaFormat.webm: testWebm,
        KlipyMediaFormat.webpTransparent: testWebpTransparent,
      };

      final mediaFormats = KlipyMediaFormats.fromJson(json);
      expect(mediaFormats.gif?.toJson(), testGif);
      expect(mediaFormats.gifTransparent?.toJson(), testGifTransparent);
      expect(mediaFormats.loopedMp4?.toJson(), testLoopedMp4);
      expect(mediaFormats.mediumGif?.toJson(), testMediumGif);
      expect(mediaFormats.mp4?.toJson(), testMp4);
      expect(mediaFormats.nanoGif?.toJson(), testNanoGif);
      expect(mediaFormats.nanoGifTransparent?.toJson(), testNanoGifTransparent);
      expect(mediaFormats.nanoMp4?.toJson(), testNanoMp4);
      expect(mediaFormats.nanoWebm?.toJson(), testNanoWebm);
      expect(
        mediaFormats.nanoWebpTransparent?.toJson(),
        testNanoWebpTransparent,
      );
      expect(mediaFormats.preview?.toJson(), testPreview);
      expect(mediaFormats.tinyGif?.toJson(), testTinyGif);
      expect(mediaFormats.tinyGifTransparent?.toJson(), testTinyGifTransparent);
      expect(mediaFormats.tinyMp4?.toJson(), testTinyMp4);
      expect(mediaFormats.tinyWebm?.toJson(), testTinyWebm);
      expect(
        mediaFormats.tinyWebpTransparent?.toJson(),
        testTinyWebpTransparent,
      );
      expect(mediaFormats.webm?.toJson(), testWebm);
      expect(mediaFormats.webpTransparent?.toJson(), testWebpTransparent);
    });

    test('.toJson()', () {
      final mediaFormats = KlipyMediaFormats(
        gif: KlipyMediaObject.fromJson(testGif),
        gifTransparent: KlipyMediaObject.fromJson(testGifTransparent),
        loopedMp4: KlipyMediaObject.fromJson(testLoopedMp4),
        mediumGif: KlipyMediaObject.fromJson(testMediumGif),
        mp4: KlipyMediaObject.fromJson(testMp4),
        nanoGif: KlipyMediaObject.fromJson(testNanoGif),
        nanoGifTransparent: KlipyMediaObject.fromJson(testNanoGifTransparent),
        nanoMp4: KlipyMediaObject.fromJson(testNanoMp4),
        nanoWebm: KlipyMediaObject.fromJson(testNanoWebm),
        nanoWebpTransparent: KlipyMediaObject.fromJson(testNanoWebpTransparent),
        preview: KlipyMediaObject.fromJson(testPreview),
        tinyGif: KlipyMediaObject.fromJson(testTinyGif),
        tinyGifTransparent: KlipyMediaObject.fromJson(testTinyGifTransparent),
        tinyMp4: KlipyMediaObject.fromJson(testTinyMp4),
        tinyWebm: KlipyMediaObject.fromJson(testTinyWebm),
        tinyWebpTransparent: KlipyMediaObject.fromJson(testTinyWebpTransparent),
        webm: KlipyMediaObject.fromJson(testWebm),
        webpTransparent: KlipyMediaObject.fromJson(testWebpTransparent),
      );
      final json = mediaFormats.toJson();
      expect(json, {
        KlipyMediaFormat.gif: testGif,
        KlipyMediaFormat.gifTransparent: testGifTransparent,
        KlipyMediaFormat.loopedMp4: testLoopedMp4,
        KlipyMediaFormat.mediumGif: testMediumGif,
        KlipyMediaFormat.mp4: testMp4,
        KlipyMediaFormat.nanoGif: testNanoGif,
        KlipyMediaFormat.nanoGifTransparent: testNanoGifTransparent,
        KlipyMediaFormat.nanoMp4: testNanoMp4,
        KlipyMediaFormat.nanoWebm: testNanoWebm,
        KlipyMediaFormat.nanoWebpTransparent: testNanoWebpTransparent,
        KlipyMediaFormat.preview: testPreview,
        KlipyMediaFormat.tinyGif: testTinyGif,
        KlipyMediaFormat.tinyGifTransparent: testTinyGifTransparent,
        KlipyMediaFormat.tinyMp4: testTinyMp4,
        KlipyMediaFormat.tinyWebm: testTinyWebm,
        KlipyMediaFormat.tinyWebpTransparent: testTinyWebpTransparent,
        KlipyMediaFormat.webm: testWebm,
        KlipyMediaFormat.webpTransparent: testWebpTransparent,
      });
    });
  });
}

import 'package:klipy_dart/klipy_dart.dart';
import 'package:test/test.dart';

void main() {
  final testBgColor = '#FFFFFF';
  final testContentDescription = 'A GIF of dominos falling';
  final testCreated = 1633072800.0;
  final testFlags = ['sticker', 'static'];
  final testHasAudio = true;
  final testHasCaption = true;
  final testId = '12345';
  final testItemUrl = 'https://tenor.com/view/dominos-falling-gif-12345';
  final testMedia = KlipyMediaFormats();
  final testTags = ['funny', 'meme'];
  final testTitle = 'Dominos Falling GIF';
  final testUrl = 'https://tenor.com/view/dominos-falling-gif-12345';
  final testSource = 'Emojis';

  group('KlipyResultsObject >', () {
    test('.fromJson()', () {
      final json = {
        'bg_color': testBgColor,
        'content_description': testContentDescription,
        'created': testCreated,
        'flags': testFlags,
        'hasaudio': testHasAudio,
        'hascaption': testHasCaption,
        'id': testId,
        'itemurl': testItemUrl,
        'media_formats': testMedia.toJson(),
        'tags': testTags,
        'title': testTitle,
        'url': testUrl,
        'source': testSource,
      };
      final result = KlipyResultsObject.fromJson(json);
      expect(result.bgColor, testBgColor);
      expect(result.contentDescription, testContentDescription);
      expect(result.created, testCreated);
      expect(result.flags, testFlags);
      expect(result.hasAudio, testHasAudio);
      expect(result.hasCaption, testHasCaption);
      expect(result.id, testId);
      expect(result.itemUrl, testItemUrl);
      expect(result.media.toJson(), testMedia.toJson());
      expect(result.tags, testTags);
      expect(result.title, testTitle);
      expect(result.url, testUrl);
      expect(result.source, testSource);
    });

    test('.toJson()', () {
      final result = KlipyResultsObject(
        bgColor: testBgColor,
        contentDescription: testContentDescription,
        created: testCreated,
        flags: testFlags,
        hasAudio: testHasAudio,
        hasCaption: testHasCaption,
        id: testId,
        itemUrl: testItemUrl,
        media: testMedia,
        tags: testTags,
        title: testTitle,
        url: testUrl,
        source: testSource,
      );
      final json = result.toJson();

      expect(json, {
        'bg_color': testBgColor,
        'content_description': testContentDescription,
        'created': testCreated,
        'flags': testFlags,
        'hasaudio': testHasAudio,
        'hascaption': testHasCaption,
        'id': testId,
        'itemurl': testItemUrl,
        'media_formats': testMedia.toJson(),
        'tags': testTags,
        'title': testTitle,
        'url': testUrl,
        'source': testSource,
      });
    });

    test('.copyWith()', () {
      final originalResult = KlipyResultsObject(
        bgColor: testBgColor,
        contentDescription: testContentDescription,
        created: testCreated,
        flags: testFlags,
        hasAudio: testHasAudio,
        hasCaption: testHasCaption,
        id: testId,
        itemUrl: testItemUrl,
        media: testMedia,
        tags: testTags,
        title: testTitle,
        url: testUrl,
      );

      // Test copying with no changes
      final unchangedResult = originalResult.copyWith();
      expect(unchangedResult.bgColor, testBgColor);
      expect(unchangedResult.contentDescription, testContentDescription);
      expect(unchangedResult.created, testCreated);
      expect(unchangedResult.flags, testFlags);
      expect(unchangedResult.hasAudio, testHasAudio);
      expect(unchangedResult.hasCaption, testHasCaption);
      expect(unchangedResult.id, testId);
      expect(unchangedResult.itemUrl, testItemUrl);
      expect(unchangedResult.media, testMedia);
      expect(unchangedResult.tags, testTags);
      expect(unchangedResult.title, testTitle);
      expect(unchangedResult.url, testUrl);
      expect(unchangedResult.source, null);

      // Test copying with some changes
      final newBgColor = '#000000';
      final newTitle = 'New Title';
      final newTags = ['new', 'tags'];
      final newCreated = 1633072900.0;
      final newHasAudio = false;
      final newSource = 'Stickers';

      final modifiedResult = originalResult.copyWith(
        bgColor: newBgColor,
        title: newTitle,
        tags: newTags,
        created: newCreated,
        hasAudio: newHasAudio,
        source: newSource,
      );

      // Check changed fields
      expect(modifiedResult.bgColor, newBgColor);
      expect(modifiedResult.title, newTitle);
      expect(modifiedResult.tags, newTags);
      expect(modifiedResult.created, newCreated);
      expect(modifiedResult.hasAudio, newHasAudio);
      expect(modifiedResult.source, newSource);

      // Check unchanged fields
      expect(modifiedResult.contentDescription, testContentDescription);
      expect(modifiedResult.flags, testFlags);
      expect(modifiedResult.hasCaption, testHasCaption);
      expect(modifiedResult.id, testId);
      expect(modifiedResult.itemUrl, testItemUrl);
      expect(modifiedResult.media, testMedia);
      expect(modifiedResult.url, testUrl);

      // Test copying with null values (should not change the field)
      final nullBgColorResult = originalResult.copyWith(bgColor: null);
      expect(nullBgColorResult.bgColor, testBgColor); // Should remain unchanged

      // Test that original object is not modified
      expect(originalResult.bgColor, testBgColor);
      expect(originalResult.title, testTitle);
    });
  });
}

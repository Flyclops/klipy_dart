import 'package:klipy_dart/klipy_dart.dart';
import 'package:test/test.dart';

void main() {
  final testSearchTerm = 'dominoes';
  final testPath = '?apiKey=1234&country=US&locale=en_US';
  final testImage =
      'https://static.klipy.com/ii/d7aec6f6f171607374b2065c836f92f4/18/ce/u2T4lKAV.gif';
  final testName = 'Dominos Falling GIF';

  group('KlipyCategory >', () {
    test('.fromJson()', () {
      final json = {
        'image': testImage,
        'name': testName,
        'path': testPath,
        'searchterm': testSearchTerm,
      };
      final category = KlipyCategoryObject.fromJson(json);
      expect(category.image, testImage);
      expect(category.name, testName);
      expect(category.path, testPath);
      expect(category.searchTerm, testSearchTerm);
    });

    test('.toJson()', () {
      final category = KlipyCategoryObject(
        image: testImage,
        name: testName,
        path: testPath,
        searchTerm: testSearchTerm,
      );
      final json = category.toJson();

      expect(json, {
        'image': testImage,
        'name': testName,
        'path': testPath,
        'searchterm': testSearchTerm,
      });
    });
  });
}

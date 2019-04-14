import 'dart:io' as Io;
import 'dart:io';
import 'dart:math';
import 'package:image/image.dart';
import 'package:test/test.dart';

void main() {
  List<int> bytes = new Io.File('test/res/jpg/oblique.jpg').readAsBytesSync();
  Image img = decodeJpg(bytes);

  group('rectify', () {
    test('basic test', () {
      Image out = rectify(
          img, Point(16, 32), Point(79, 39), Point(16, 151), Point(108, 141));
      File fp = new File('out/jpg/oblique.jpg');
      fp.createSync(recursive: true);
      fp.writeAsBytesSync(writeJpg(out));
    });
  });
}

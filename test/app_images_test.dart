import 'dart:io';

import 'package:json_placeholder_app/resources/resources.dart';
import 'package:test/test.dart';

void main() {
  test('app_images assets test', () {
    expect(File(AppImages.kotletiKlassicheskie2480300x233).existsSync(), true);
    expect(File(AppImages.otbivnaya).existsSync(), true);
    expect(File(AppImages.plovSoSvininoi480).existsSync(), true);
  });
}

import 'dart:io';

import 'package:week_menu/resources/resources.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('app_images assets test', () {
    expect(File(AppImages.dranikiSMyasom).existsSync(), true);
    expect(
        File(AppImages.gerkulesovayaKashaNaVodeVkusno15217941115Max)
            .existsSync(),
        true);
    expect(File(AppImages.kotletiKlassicheskie2480300x233).existsSync(), true);
    expect(File(AppImages.otbivnaya).existsSync(), true);
    expect(File(AppImages.plovSoSvininoi480).existsSync(), true);
  });
}

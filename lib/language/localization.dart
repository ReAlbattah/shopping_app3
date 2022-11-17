import 'package:get/get.dart';

import '../language/ar.dart';
import '../language/en.dart';

import '../utils/myString.dart';

class LocaliztionApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ene: en,
        ara: ar,
      };
}

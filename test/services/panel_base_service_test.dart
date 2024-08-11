import 'package:flutter_test/flutter_test.dart';
import 'package:panel/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('PanelBaseServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}

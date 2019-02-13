import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cat_box_exam/main.dart';

void main() {
  testWidgets('load cats', (WidgetTester tester) async {
    await tester.pumpWidget(CatBoxApp());

    expect(find.text('Cats'), findsOneWidget);
    expect(find.text('Dogs'), findsNothing);
  });
}

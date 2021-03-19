// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:comics/pages/ComicWidget.dart';
import 'package:comics/pages/ExtendedComicPage.dart';
import 'package:comics/widgets/ExtenedComicWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:comics/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
   /* final likeButton= find.byKey(ValueKey("like_button"));
    final dislikeButton= find.byKey(ValueKey("dislike_button"));
    
    await tester.pumpWidget(MaterialApp(home:ExtendedComicWidget()));
    await tester.tap(likeButton);


    // Verify that our counter starts at 0.
    

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });*/
});
}

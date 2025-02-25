import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/view/home_view.dart';
import 'package:flutter_testing/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('HomeView Widget Test', (WidgetTester tester) async {

    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (_) => HomeViewModel(),
          child: const HomeView(),
        ),
      ),
    );


    expect(find.text('0'), findsOneWidget);


    await tester.tap(find.text('Increment'));
    await tester.pump();


    expect(find.text('1'), findsOneWidget);


    await tester.tap(find.text('Decrement'));
    await tester.pump();


    expect(find.text('0'), findsOneWidget);


    expect(find.text('Posts'), findsOneWidget);
  });
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:sentra/data/api/api_service.dart';
import 'package:sentra/presentation/provider/search_art_provider.dart';
// ignore: avoid_relative_lib_imports
import '../lib/presentation/widgets/widget_search.dart';

Widget searchArt() => ChangeNotifierProvider<SearchArtProvider?>(
  create: (context) => SearchArtProvider(searchApiService: ApiService()),
  child: const MaterialApp(
    home: Scaffold(
      body: SearchWidget(),
    ),
  ),
);

void main() {
  group('Test Widget Search Art page', () {
    testWidgets('Testing untuk menampilkan Container', (WidgetTester tester) async {
      await tester.pumpWidget(searchArt());
      expect(find.byType(Container), findsOneWidget);
    });
    testWidgets("Testing widget icon search", (WidgetTester tester) async {
      await tester.pumpWidget(searchArt());
      expect(find.byIcon(Icons.search), findsOneWidget);
    });
    testWidgets("Testing widget teks field", ( WidgetTester tester) async {
      await tester.pumpWidget(searchArt());
      var textField = find.byType(TextField);
      expect(textField, findsOneWidget);
      await tester.enterText(textField, 'Tari Kecak');
      expect(find.text('Tari Kecak', skipOffstage: false), findsOneWidget);
      if (kDebugMode) {
        print('Tari Kecak');
      }
    });
    testWidgets("Testing widget SafeArea", (WidgetTester tester) async {
      await tester.pumpWidget(searchArt());
      expect(find.byType(SafeArea), findsOneWidget);
    });
  });
}

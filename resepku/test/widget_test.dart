import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:resepku/pages/home_page.dart';
import 'package:resepku/providers/favorite_provider.dart';
import 'package:resepku/widgets/identity_footer.dart';

void main() {
  testWidgets('ResepKu menampilkan daftar resep dan footer identitas',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => FavoriteProvider(),
        child: MaterialApp(
          builder: (context, child) => IdentityFooter(child: child!),
          home: const HomePage(),
        ),
      ),
    );

    expect(find.text('ResepKu'), findsOneWidget);
    expect(find.text('Classic Margherita Pizza'), findsOneWidget);
    expect(find.text('$kNim • $kNama'), findsOneWidget);
  });
}

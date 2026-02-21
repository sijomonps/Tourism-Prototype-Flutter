import 'package:flutter_test/flutter_test.dart';
import 'package:kuttikanam_tourism/main.dart';

void main() {
  testWidgets('App renders home screen', (WidgetTester tester) async {
    await tester.pumpWidget(const KuttikanamTourismApp());
    expect(find.text('Kuttikanam'), findsOneWidget);
  });
}

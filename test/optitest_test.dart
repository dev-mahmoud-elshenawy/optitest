import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:optitest/optitest.dart';

void main() {
  group('TestKey', () {
    test('composes type prefix and identifier', () {
      expect(TestKey.button('login_submit').value, 'btn_login_submit');
      expect(TestKey.input('email').value, 'inp_email');
      expect(TestKey.listItem('activity_date_0').value, 'itm_activity_date_0');
    });

    test('appends state suffix when provided', () {
      final key = TestKey.button('profile_save', state: ElementState.disabled);
      expect(key.value, 'btn_profile_save_disabled');
    });

    test('strips leading slash from identifier', () {
      expect(TestKey.button('/login').value, 'btn_login');
    });

    test('truncates values longer than 40 characters', () {
      final key = TestKey.button('x' * 50);
      expect(key.value.length, 40);
    });

    test('exposes ValueKey backed by value', () {
      final key = TestKey.button('login_submit');
      expect(key.key, const ValueKey<String>('btn_login_submit'));
    });

    test('equality is based on type, identifier, and state', () {
      expect(
        TestKey.button('a'),
        equals(TestKey.button('a')),
      );
      expect(
        TestKey.button('a', state: ElementState.active),
        isNot(equals(TestKey.button('a'))),
      );
    });
  });

  group('Testable', () {
    testWidgets('applies ValueKey and Semantics identifier', (tester) async {
      final testKey = TestKey.button('login_submit');

      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: Testable(
            testId: testKey,
            child: const SizedBox(width: 10, height: 10),
          ),
        ),
      );

      expect(find.byKey(testKey.key), findsOneWidget);

      final semantics = tester.getSemantics(find.byKey(testKey.key));
      expect(semantics.identifier, 'btn_login_submit');
    });
  });
}

import 'package:flutter/widgets.dart';

import 'test_key.dart';

/// Wraps any widget with a stable [ValueKey] and [Semantics.identifier]
/// so it can be located reliably by Appium / Flutter Driver / integration
/// tests.
///
/// ```dart
/// Testable(
///   testId: TestKey.button('login_submit'),
///   child: AppButton(title: 'Submit', onTap: () {}),
/// )
/// // Appium key → btn_login_submit
/// ```
class Testable extends StatelessWidget {
  final TestKey testId;
  final Widget child;

  const Testable({
    super.key,
    required this.testId,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      identifier: testId.value,
      child: KeyedSubtree(
        key: testId.key,
        child: child,
      ),
    );
  }
}

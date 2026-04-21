/// Optional state suffix for automation keys.
///
/// Appended to the [TestKey] value when set — e.g. a disabled submit button
/// becomes `btn_profile_save_disabled`. Useful when Appium needs to assert
/// UI state distinctions on the same widget.
enum ElementState {
  active('active'),
  disabled('disabled'),
  error('error'),
  loading('loading'),
  empty('empty'),
  selected('selected');

  final String value;

  const ElementState(this.value);
}

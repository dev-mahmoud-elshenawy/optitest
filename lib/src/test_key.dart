import 'package:flutter/foundation.dart';

import 'enums/element_state.dart';
import 'enums/element_type.dart';

/// Generates unique, deterministic keys for QC automation (Appium / Semantics).
///
/// Composition: `<type-prefix>_<id>[_<state>]` — truncated at 40 chars.
///
/// ```dart
/// TestKey.button('login_submit')          // → btn_login_submit
/// TestKey.input('login_email')            // → inp_login_email
/// TestKey.button('profile_save',
///   state: ElementState.disabled)         // → btn_profile_save_disabled
/// ```
@immutable
class TestKey {
  final ElementType type;
  final String identifier;
  final ElementState? state;

  const TestKey._(this.type, this.identifier, this.state);

  // ---------------------------------------------------------------------------
  // Static factories — the public API
  // ---------------------------------------------------------------------------

  static TestKey button(String id, {ElementState? state}) =>
      TestKey._(ElementType.button, id, state);

  static TestKey input(String id, {ElementState? state}) =>
      TestKey._(ElementType.input, id, state);

  static TestKey text(String id, {ElementState? state}) =>
      TestKey._(ElementType.text, id, state);

  static TestKey image(String id, {ElementState? state}) =>
      TestKey._(ElementType.image, id, state);

  static TestKey icon(String id, {ElementState? state}) =>
      TestKey._(ElementType.icon, id, state);

  static TestKey checkbox(String id, {ElementState? state}) =>
      TestKey._(ElementType.checkbox, id, state);

  static TestKey radio(String id, {ElementState? state}) =>
      TestKey._(ElementType.radio, id, state);

  static TestKey dropdown(String id, {ElementState? state}) =>
      TestKey._(ElementType.dropdown, id, state);

  static TestKey toggle(String id, {ElementState? state}) =>
      TestKey._(ElementType.toggle, id, state);

  static TestKey link(String id, {ElementState? state}) =>
      TestKey._(ElementType.link, id, state);

  static TestKey list(String id, {ElementState? state}) =>
      TestKey._(ElementType.list, id, state);

  static TestKey listItem(String id, {ElementState? state}) =>
      TestKey._(ElementType.listItem, id, state);

  static TestKey tab(String id, {ElementState? state}) =>
      TestKey._(ElementType.tab, id, state);

  static TestKey dialog(String id, {ElementState? state}) =>
      TestKey._(ElementType.dialog, id, state);

  static TestKey message(String id, {ElementState? state}) =>
      TestKey._(ElementType.message, id, state);

  static TestKey loader(String id, {ElementState? state}) =>
      TestKey._(ElementType.loader, id, state);

  static TestKey navigation(String id, {ElementState? state}) =>
      TestKey._(ElementType.navigation, id, state);

  static TestKey header(String id, {ElementState? state}) =>
      TestKey._(ElementType.header, id, state);

  static TestKey footer(String id, {ElementState? state}) =>
      TestKey._(ElementType.footer, id, state);

  static TestKey card(String id, {ElementState? state}) =>
      TestKey._(ElementType.card, id, state);

  static TestKey screen(String id, {ElementState? state}) =>
      TestKey._(ElementType.screen, id, state);

  static TestKey bottomSheet(String id, {ElementState? state}) =>
      TestKey._(ElementType.bottomSheet, id, state);

  static TestKey toast(String id, {ElementState? state}) =>
      TestKey._(ElementType.toast, id, state);

  static TestKey picker(String id, {ElementState? state}) =>
      TestKey._(ElementType.picker, id, state);

  static TestKey badge(String id, {ElementState? state}) =>
      TestKey._(ElementType.badge, id, state);

  static TestKey searchBar(String id, {ElementState? state}) =>
      TestKey._(ElementType.searchBar, id, state);

  static TestKey slider(String id, {ElementState? state}) =>
      TestKey._(ElementType.slider, id, state);

  static TestKey map(String id, {ElementState? state}) =>
      TestKey._(ElementType.map, id, state);

  static TestKey webView(String id, {ElementState? state}) =>
      TestKey._(ElementType.webView, id, state);

  static TestKey stepper(String id, {ElementState? state}) =>
      TestKey._(ElementType.stepper, id, state);

  static TestKey qrCode(String id, {ElementState? state}) =>
      TestKey._(ElementType.qrCode, id, state);

  // ---------------------------------------------------------------------------
  // Key generation
  // ---------------------------------------------------------------------------

  /// The stringified automation key. Truncated to 40 chars to stay within
  /// common Appium/Semantics limits.
  String get value {
    final id =
        identifier.startsWith('/') ? identifier.substring(1) : identifier;
    final raw = state != null
        ? '${type.prefix}_${id}_${state!.value}'
        : '${type.prefix}_$id';
    return raw.length > 40 ? raw.substring(0, 40) : raw;
  }

  /// Flutter [ValueKey] backed by [value] — usable directly on any widget.
  ValueKey<String> get key => ValueKey<String>(value);

  @override
  String toString() => value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TestKey &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          identifier == other.identifier &&
          state == other.state;

  @override
  int get hashCode => Object.hash(type, identifier, state);
}

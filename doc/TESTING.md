<h1 align="center">✅ Testing Best Practices</h1>

<p align="center">
  <strong>Rules of thumb that keep your automation suite green as the UI evolves.</strong>
</p>

<p align="center">
  <a href="./USAGE.md">📘 Usage</a> ·
  <a href="./KEYS.md">🔑 Keys</a> ·
  <a href="./APPIUM.md">🤖 Appium</a>
</p>

---

## 🎯 1. Tag by Intent, Not Layout

```dart
// ✅ Survives redesigns, RTL flips, responsive reflows
Testable(testId: TestKey.button('save_profile'), child: SaveButton())

// ❌ Breaks the first time the designer moves the button
Testable(testId: TestKey.button('bottom_right_green'), child: SaveButton())
```

> 💡 Your test should describe *what* the user does, not *where* the button sits.

---

## 🏷 2. Namespace Per Screen or Feature

Two screens with a "submit" button should **never** share an id.

```dart
TestKey.button('onboarding_login_submit')  // Onboarding login screen
TestKey.button('modal_login_submit')       // Re-auth modal
```

**Convention:** `<screen>_<action>` or `<feature>_<element>_<action>`.

---

## 🔁 3. Index Dynamic Lists

Every cell gets a unique, predictable tag:

```dart
ListView.builder(
  itemBuilder: (_, i) => Testable(
    testId: TestKey.listItem('order_$i'),
    child: OrderCard(order: orders[i]),
  ),
)
```

> 🔍 For selector tests ("tap the 3rd order"), your framework iterates or pattern-matches `itm_order_.*`.

---

## 🎭 4. Use State Suffixes for Assertions

State suffixes let a test verify UI state **without** extra attribute queries.

```dart
final state = enabled ? ElementState.active : ElementState.disabled;
Testable(
  testId: TestKey.button('submit', state: state),
  child: SubmitButton(enabled: enabled),
)
```

Your Appium test asserts `btn_submit_disabled` **exists** before tapping — fails fast if the button is still enabled.

---

## ✂️ 5. Keep Identifiers Short

Keys cap at 40 chars. Favor concise, searchable identifiers.

| ✅ Do | ❌ Avoid |
|---|---|
| `TestKey.button('login_submit')` | `TestKey.button('the_main_login_page_submit_button_element')` |
| `TestKey.input('email')` | `TestKey.input('user_email_text_field_widget')` |

---

## 🗂 6. Centralize IDs for Large Modules

Extract a constants file per feature:

```dart
// lib/module/auth/automation_ids.dart
class AuthTestIds {
  static final countryPicker = TestKey.button('login_country_picker');
  static final phoneInput    = TestKey.input('login_phone');
  static final continueBtn   = TestKey.button('login_continue');
}
```

✅ **Benefits:**

- 🎯 Single source of truth
- 🔄 Safe rename refactors
- 🤖 Appium page objects import the same file via codegen

---

## 🧘 7. Don't Over-Tag

Only tag elements the tests **interact with** or **assert against**.

### ✅ Good candidates

- Buttons, inputs, toggles, sliders
- List items (indexed)
- Key status text ("Welcome, Alice")
- Modal roots, dialog roots, toast roots

### ⏭️ Skip

- Plain `Row` / `Column` / `Padding` wrappers
- Icons inside a button you already tagged
- Loading placeholders that disappear before the test sees them

---

## 📋 Quick Checklist

- [ ] 🎯 Tagged by **intent**, not layout
- [ ] 🏷 Namespaced per **screen / feature**
- [ ] 🔁 Dynamic lists **indexed**
- [ ] 🎭 State variants use **state suffixes**
- [ ] ✂️ IDs stay **under 40 chars**
- [ ] 🗂 Large features have a **constants file**
- [ ] 🧘 Only interactive / asserted widgets are tagged

---

<p align="center">
  <a href="./USAGE.md">📘 Back to Usage Guide →</a>
</p>

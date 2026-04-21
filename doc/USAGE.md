<h1 align="center">📘 Usage Guide</h1>

<p align="center">
  <strong>Every pattern you need to tag a Flutter UI for automation.</strong>
</p>

<p align="center">
  <a href="./KEYS.md">🔑 Keys</a> ·
  <a href="./APPIUM.md">🤖 Appium</a> ·
  <a href="./TESTING.md">✅ Testing</a>
</p>

---

## 🎯 The Core Idiom

Wrap any widget with `Testable`, feed it a `TestKey`:

```dart
Testable(
  testId: TestKey.button('login_submit'),
  child: ElevatedButton(onPressed: onSubmit, child: Text('Submit')),
)
```

> 💡 `Testable` applies both a stable `ValueKey` **and** a `Semantics.identifier` — so the same tag works in Flutter tests *and* in native Appium drivers on iOS, Android, and web.

---

## 🧩 Common Patterns

### 🔘 Inputs · Buttons · Icons

```dart
Testable(testId: TestKey.input('login_email'),     child: EmailField())
Testable(testId: TestKey.button('login_continue'), child: ContinueButton())
Testable(testId: TestKey.icon('open_map'),         child: MapIcon())
Testable(testId: TestKey.checkbox('terms_accept'), child: TermsCheckbox())
```

---

### 📋 Lists — Indexed Items

Every cell gets a unique, predictable tag:

```dart
ListView.builder(
  itemBuilder: (context, i) => Testable(
    testId: TestKey.listItem('order_$i'),
    child: OrderCard(order: orders[i]),
  ),
)
```

> 🔁 Produces `itm_order_0`, `itm_order_1`, `itm_order_2`, …

---

### 🎛 State-Aware Variants

Differentiate the same widget across states — priceless for assertions.

```dart
Testable(
  testId: TestKey.button('submit', state: ElementState.disabled),
  child: SubmitButton(enabled: false),
)
// → btn_submit_disabled
```

✅ **Available states:**

| State | Suffix | When |
|---|---|---|
| `active` | `active` | Enabled / focused |
| `disabled` | `disabled` | Greyed-out |
| `error` | `error` | Validation failed |
| `loading` | `loading` | Async in progress |
| `empty` | `empty` | Zero-state |
| `selected` | `selected` | Chosen in a group |

---

### 🪟 Bottom Sheets · Dialogs · Toasts

```dart
Testable(testId: TestKey.bottomSheet('confirm_book'), child: ConfirmBookSheet())
Testable(testId: TestKey.dialog('delete_account'),    child: DeleteDialog())
Testable(testId: TestKey.toast('copied'),             child: CopiedToast())
```

---

### 🔘 Radio Groups · Dropdowns

```dart
Testable(testId: TestKey.radio('method_sms'),      child: SmsOption())
Testable(testId: TestKey.radio('method_whatsapp'), child: WhatsAppOption())
Testable(testId: TestKey.dropdown('country'),      child: CountryDropdown())
```

---

### ⚡ Raw Key — Skip the Wrapper

When you only need the `Key`:

```dart
TextField(key: TestKey.input('login_email').key)
```

> ⚠️ This path exposes the `ValueKey` to Flutter but **does not** set the `Semantics.identifier`. For Appium, prefer the full `Testable` wrapper.

---

## 🧮 Composition Rules

```text
<type-prefix>_<identifier>[_<state>]
```

| Part | Source | Example |
|---|---|---|
| `type` | 3-char prefix from [`ElementType`](./KEYS.md) | `btn`, `inp`, `itm` |
| `identifier` | Your chosen name (snake_case recommended) | `login_submit` |
| `state` | Optional `ElementState` suffix | `disabled` |

> ✂️ Auto-truncated to **40 chars** to stay within common Appium / Semantics driver limits.

---

## ❌ Anti-Patterns

| ❌ Don't | ✅ Do instead |
|---|---|
| `TestKey.button('button1')` | `TestKey.button('login_submit')` — intent, not position |
| Same id in two screens | Namespace: `onboarding_login_submit` vs `modal_login_submit` |
| Re-using a list id statically | Index it: `TestKey.listItem('order_$i')` |
| Encoding layout in the id | `btn_bottom_right` breaks on RTL / responsive reflow |

---

<p align="center">
  <a href="./KEYS.md">🔑 Key Reference →</a>
</p>

<h1 align="center">🤖 Appium Integration</h1>

<p align="center">
  <strong>How OptiTest keys surface to native Appium drivers on every platform.</strong>
</p>

<p align="center">
  <a href="./USAGE.md">📘 Usage</a> ·
  <a href="./KEYS.md">🔑 Keys</a> ·
  <a href="./TESTING.md">✅ Testing</a>
</p>

---

## 🧬 How It Works

`Testable` writes **two** things into the widget tree:

1. 🔑 A Flutter `ValueKey` — used by `flutter_test`, `integration_test`, Flutter Driver.
2. 🧭 A `Semantics.identifier` — Flutter's accessibility tree exposes this to the OS.

Flutter's accessibility engine mirrors the identifier into each platform's native automation surface:

| 📱 Platform | 🌐 Surface | 🎯 Appium Locator |
|---|---|---|
| **Android** | `AccessibilityNodeInfo.viewIdResourceName` | `accessibility id` |
| **iOS** | `UIAccessibilityIdentifier` | `accessibility id` |
| **Web** | `aria-label` on the semantics DOM | `css`, `xpath`, `accessibility id` |

> 💡 Same key — `btn_login_submit` — works everywhere. No per-platform locator hacks.

---

## ⚙️ Driver Setup

Ensure semantics are enabled before tests run. On real devices this is automatic; on emulators / simulators keep accessibility services enabled.

```dart
// In your test harness or app bootstrap
WidgetsFlutterBinding.ensureInitialized();
SemanticsBinding.instance.ensureSemantics();
```

---

## 🎯 Locator Examples

### 🍎 iOS — XCUITest / `appium-xcuitest-driver`

```js
await driver.findElement('accessibility id', 'btn_login_submit');
```

### 🤖 Android — UiAutomator2 / `appium-uiautomator2-driver`

```js
await driver.findElement('accessibility id', 'btn_login_submit');
```

### 🌊 WebdriverIO — Cross-Platform

```js
const submit = await $('~btn_login_submit'); // ~ = accessibility id
await submit.click();
```

### 🧪 Flutter Driver / `integration_test`

```dart
await tester.tap(find.byKey(TestKey.button('login_submit').key));
```

---

## 🔍 Debugging

| ❓ Symptom | 🧭 Where to Look |
|---|---|
| **Key not found** | Run `flutter run --profile` + accessibility inspector (Android: `uiautomatorviewer`, iOS: Xcode Accessibility Inspector) |
| **Wrong widget hit** | `Testable` wraps with `KeyedSubtree` — remove any duplicate `Key` on the child |
| **Identifier truncated** | Keys cap at 40 chars — shorten the identifier or split namespaces |
| **Appium sees no semantics tree** | Confirm `SemanticsBinding.instance.ensureSemantics()` ran at startup |

---

## 💎 Pro Tips

> 🎯 **Tag by intent** (`btn_save`) not layout (`btn_bottom_right`). Intent survives redesigns.

> 🏷 **Namespace per screen.** `login_submit` vs `signup_submit` beats a generic `submit`.

> 🔁 **Interpolate indices** for dynamic lists: `TestKey.listItem('order_$index')`.

> 🎭 **Use state suffixes** to assert UI state directly — `btn_submit_disabled` lets a test confirm the button really *is* disabled before acting on it.

---

<p align="center">
  <a href="./TESTING.md">✅ Testing Best Practices →</a>
</p>

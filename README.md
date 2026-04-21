<h1 align="center">🧪 OptiTest</h1>

<p align="center">
  <strong>Stable automation identity for every Flutter widget.</strong><br/>
  One wrapper · deterministic keys · native semantics — Appium-ready out of the box.
</p>

<p align="center">
  <a href="https://pub.dev/packages/optitest"><img src="https://img.shields.io/pub/v/optitest?style=flat-square&color=blue&label=pub&logo=flutter&logoColor=white" alt="Pub"/></a>
  <img src="https://img.shields.io/badge/Dependencies-Zero-brightgreen?style=flat-square&logo=dart&logoColor=white" alt="Zero deps"/>
  <a href="./LICENSE"><img src="https://img.shields.io/badge/License-MIT-yellow?style=flat-square&logo=opensourceinitiative&logoColor=white" alt="License"/></a>
</p>

<p align="center">
  <a href="https://pub.dev/packages/opticore"><img src="https://img.shields.io/pub/v/opticore?style=flat-square&color=blue&label=opticore&logo=flutter&logoColor=white" alt="OptiCore"/></a>
  <a href="https://www.npmjs.com/package/optikit"><img src="https://img.shields.io/npm/v/optikit?style=flat-square&color=red&label=optikit&logo=npm&logoColor=white" alt="OptiKit"/></a>
</p>

<p align="center">
  <a href="https://www.buymeacoffee.com/m.elshenawy">
    <img src="https://img.shields.io/badge/Buy%20Me%20A%20Coffee-Support%20My%20Work-FFDD00?style=for-the-badge&logo=buymeacoffee&logoColor=0D1117" alt="Buy Me A Coffee"/>
  </a>
</p>

---

## 🔥 Why OptiTest?

Appium suites shatter the moment keys are ad-hoc or layouts shift. **OptiTest gives every widget one deterministic, namespaced tag** — readable by Flutter tests *and* native drivers on iOS, Android, and web.

```dart
Testable(
  testId: TestKey.button('login_submit'),
  child: SubmitButton(),
)
// Appium locator → btn_login_submit
```

| ⚡ | Feature |
|---|---|
| ✅ | **30 element types** — `button`, `input`, `listItem`, `bottomSheet`, `qrCode`, … |
| ✅ | **State suffixes** — `disabled`, `loading`, `error`, `selected` |
| ✅ | **Native semantics** — same tag on Android, iOS, web — no extra wiring |
| ✅ | **Zero dependencies** — pure Flutter, no codegen, no reflection |
| ✅ | **40-char safe** — auto-truncated to stay inside Appium limits |

---

## 🚀 Install

```bash
flutter pub add optitest
```

## ⚡ One-Minute Example

```dart
import 'package:optitest/optitest.dart';

Column(
  children: [
    Testable(
      testId: TestKey.input('login_email'),
      child: TextField(decoration: InputDecoration(labelText: 'Email')),
    ),
    Testable(
      testId: TestKey.button('login_submit', state: ElementState.loading),
      child: FilledButton(onPressed: null, child: Text('Loading…')),
    ),
  ],
)
// → inp_login_email
// → btn_login_submit_loading
```

Full working sample in [`example/`](./example).

---

## 📖 Documentation

| Guide | What's inside |
|---|---|
| 📘 **[Usage Guide](./doc/USAGE.md)** | Every pattern — inputs, lists, state variants, anti-patterns |
| 🔑 **[Key Reference](./doc/KEYS.md)** | All 30 element types, prefixes, state suffixes |
| 🤖 **[Appium Integration](./doc/APPIUM.md)** | Locators for iOS, Android, WebdriverIO, Flutter Driver |
| ✅ **[Testing Best Practices](./doc/TESTING.md)** | Tag by intent, namespace per screen, index lists |

---

## 🧩 Part of the `opti*` Toolkit

| Package | Purpose |
|---|---|
| 🏗 **[OptiCore](https://pub.dev/packages/opticore)** | BLoC micro-framework |
| ⚡ **[OptiKit CLI](https://www.npmjs.com/package/optikit)** | Scaffolding & builds |
| 🧪 **[OptiTest](https://pub.dev/packages/optitest)** | Automation identity *(this package)* |

---

## 🐛 Issues & Contributions

Found a bug or want a new element type? Open an issue on **[GitHub](https://github.com/dev-mahmoud-elshenawy/optitest/issues)** — PRs welcome.

---

## 👤 Author

<div align="center">

Built with ❤️ by **[Mahmoud El Shenawy](https://github.com/dev-mahmoud-elshenawy)**

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?logo=linkedin&logoColor=white&style=flat-square)](https://www.linkedin.com/in/dev-mahmoud-elshenawy)
[![GitHub](https://img.shields.io/badge/GitHub-181717?logo=github&logoColor=white&style=flat-square)](https://github.com/dev-mahmoud-elshenawy)
[![Medium](https://img.shields.io/badge/Medium-000000?logo=medium&logoColor=white&style=flat-square)](https://medium.com/@dev-mahmoud-elshenawy)

</div>

---

## 📜 License

[MIT](./LICENSE) — free for personal and commercial use.

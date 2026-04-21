# 📌 Changelog

All notable changes to **OptiTest** are documented here. Most recent release at the top.

## 🔄 Versioning Strategy

Follows **[Semantic Versioning](https://semver.org)**:

- 🚀 **MAJOR** — breaking API changes
- 🌟 **MINOR** — backward-compatible features
- 🛠 **PATCH** — backward-compatible fixes

---

### 🎯 [1.0.0] — Initial Release

- 🆕 **New Features**:
  - `Testable` widget — applies a stable `ValueKey` + `Semantics.identifier` for Appium, Flutter Driver, and integration tests
  - `TestKey` — 30 element factories (`button`, `input`, `radio`, `listItem`, `bottomSheet`, …) producing deterministic keys
  - `ElementType` enum — 3-char prefix per element kind, collision-free
  - `ElementState` enum — optional state suffix (`disabled`, `error`, `loading`, `selected`, …)
  - 40-character auto-truncation to stay within Appium / Semantics driver limits

- 📚 **Documentation**:
  - Usage guide, key reference, Appium integration, and testing best practices under [`doc/`](./doc)
  - Working [`example/`](./example) demonstrating login-style flow with `Testable`

- ⚙️ **Infrastructure**:
  - Zero runtime dependencies outside the Flutter SDK
  - MIT licensed, pub.dev ready

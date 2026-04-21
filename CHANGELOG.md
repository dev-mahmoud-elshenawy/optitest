# Changelog

All notable changes to **OptiTest** will be documented here.

## 1.0.0 — Initial Release

- `Testable` widget — wraps any child with a stable `ValueKey` and a `Semantics.identifier` for Appium / Flutter Driver / integration tests.
- `TestKey` with 30 element factories (`button`, `input`, `radio`, `listItem`, …) producing deterministic keys.
- `ElementType` enum — 3-char prefix per element kind, collision-free.
- `ElementState` enum — optional state suffix (`disabled`, `error`, `loading`, …).
- 40-character truncation to stay within Appium/Semantics driver limits.
- Zero runtime dependencies outside the Flutter SDK.

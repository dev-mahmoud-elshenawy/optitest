# OptiTest Example

A minimal demo showing `Testable` and `TestKey` usage in a login-style screen.

## Run it

```bash
cd example
flutter pub get
flutter run
```

## What to look for

| Widget | Key exposed to Appium |
|---|---|
| App bar title | `hdr_login_title` |
| Email field | `inp_login_email` |
| Submit button (idle) | `btn_login_submit` |
| Submit button (loading) | `btn_login_submit_loading` |

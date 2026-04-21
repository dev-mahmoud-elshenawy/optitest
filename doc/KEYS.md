<h1 align="center">🔑 Key Reference</h1>

<p align="center">
  <strong>All 30 element types and optional state suffixes.</strong>
</p>

<p align="center">
  <a href="./USAGE.md">📘 Usage</a> ·
  <a href="./APPIUM.md">🤖 Appium</a> ·
  <a href="./TESTING.md">✅ Testing</a>
</p>

---

## 🧬 Anatomy of a Key

```text
<type-prefix>_<identifier>[_<state>]
```

<table>
  <tr><td align="center">📐 <b>Max length</b></td><td>40 chars (auto-truncated)</td></tr>
  <tr><td align="center">🔤 <b>Casing</b></td><td>snake_case identifiers recommended</td></tr>
  <tr><td align="center">🧭 <b>Scope</b></td><td>Namespace per screen / feature</td></tr>
</table>

---

## 🎨 Element Types

### 📝 Input & Action

| Type | Prefix | Typical Use | Example |
|---|---|---|---|
| 🔘 `button` | `btn` | Tap targets | `btn_login_submit` |
| ⌨️ `input` | `inp` | Text / form fields | `inp_login_email` |
| ☑️ `checkbox` | `chk` | Boolean toggles | `chk_terms_accept` |
| 🔘 `radio` | `rad` | Single-choice group | `rad_login_method_sms` |
| ⬇️ `dropdown` | `ddl` | Select / picker menus | `ddl_country` |
| 🎚 `toggle` | `tog` | Switches | `tog_dark_mode` |
| 🎛 `slider` | `sld` | Range / value | `sld_volume` |
| 🔗 `link` | `lnk` | Inline navigation | `lnk_forgot_password` |

### 🖼 Display

| Type | Prefix | Typical Use | Example |
|---|---|---|---|
| 🅰️ `text` | `txt` | Labels, headings | `txt_welcome_title` |
| 🖼 `image` | `img` | Photos, illustrations | `img_hero_banner` |
| ✨ `icon` | `icn` | SVG / icon widgets | `icn_back_arrow` |
| 🏷 `badge` | `bdg` | Counter / status | `bdg_notifications` |
| 💬 `message` | `msg` | Inline status text | `msg_error_offline` |
| 🔄 `loader` | `ldr` | Spinners, shimmers | `ldr_page_loading` |

### 📐 Layout & Navigation

| Type | Prefix | Typical Use | Example |
|---|---|---|---|
| 📱 `screen` | `scr` | Screen-level anchors | `scr_home` |
| 🧭 `navigation` | `nav` | Nav bars, drawers | `nav_bottom_home` |
| 🎯 `header` | `hdr` | Page / section headers | `hdr_profile` |
| 🧱 `footer` | `ftr` | Bottom sticky areas | `ftr_checkout` |
| 🗂 `tab` | `tab` | Tab bar entries | `tab_profile` |
| 🎴 `card` | `crd` | Content cards | `crd_order_summary` |

### 📦 Collections

| Type | Prefix | Typical Use | Example |
|---|---|---|---|
| 📋 `list` | `lst` | List containers | `lst_orders` |
| 🧾 `listItem` | `itm` | Individual rows | `itm_order_0` |

### 🪟 Overlays

| Type | Prefix | Typical Use | Example |
|---|---|---|---|
| 🪟 `dialog` | `dlg` | Alert / confirm dialogs | `dlg_confirm_delete` |
| 🎪 `bottomSheet` | `bsh` | Modal sheets | `bsh_confirm_book` |
| 🍞 `toast` | `tst` | Snack bars, banners | `tst_copied` |

### 🧰 Specialized

| Type | Prefix | Typical Use | Example |
|---|---|---|---|
| 📅 `picker` | `pkr` | Date / time / country | `pkr_country` |
| 🔍 `searchBar` | `src` | Search inputs | `src_market` |
| 🗺 `map` | `map` | Map widgets | `map_location` |
| 🌐 `webView` | `wbv` | Embedded web | `wbv_terms` |
| 🪜 `stepper` | `stp` | Step indicators | `stp_checkout` |
| ⬛ `qrCode` | `qrc` | QR images | `qrc_booking` |

---

## 🎛 State Suffixes

Append via the `state:` parameter. Optional — but powerful for assertions.

| 🎭 State | Suffix | 🧭 When to Use |
|---|---|---|
| 🟢 `active` | `active` | Explicitly enabled / focused |
| 🔒 `disabled` | `disabled` | Greyed-out / non-interactive |
| 🔴 `error` | `error` | Validation failed / error style |
| 🔄 `loading` | `loading` | Async work in progress |
| 📭 `empty` | `empty` | No data / zero-state |
| ✅ `selected` | `selected` | Current selection in a group |

### Example

```dart
TestKey.button('submit', state: ElementState.disabled).value
// → btn_submit_disabled
```

> 💡 A state suffix lets your Appium test assert the UI is actually in that state — not just fish for the widget.

---

<p align="center">
  <a href="./APPIUM.md">🤖 Appium Integration →</a>
</p>

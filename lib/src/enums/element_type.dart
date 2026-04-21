/// Element types for QC automation keys.
///
/// Each type has a short prefix (3 chars) used when composing the final
/// Appium key via [TestKey] — e.g. `ElementType.button` → `btn_<id>`.
enum ElementType {
  button('btn'),
  text('txt'),
  input('inp'),
  image('img'),
  icon('icn'),
  checkbox('chk'),
  radio('rad'),
  dropdown('ddl'),
  toggle('tog'),
  link('lnk'),
  list('lst'),
  listItem('itm'),
  tab('tab'),
  dialog('dlg'),
  message('msg'),
  loader('ldr'),
  navigation('nav'),
  header('hdr'),
  footer('ftr'),
  card('crd'),
  screen('scr'),
  bottomSheet('bsh'),
  toast('tst'),
  picker('pkr'),
  badge('bdg'),
  searchBar('src'),
  slider('sld'),
  map('map'),
  webView('wbv'),
  stepper('stp'),
  qrCode('qrc');

  final String prefix;

  const ElementType(this.prefix);
}

// Reading language for generated content. A reader picks a language; the article
// and quiz are (re)generated in it and cached, keyed by lang alongside
// depth/level/format. English is the default and the language of the authored
// masters. The set is the ten most-spoken world languages.

export interface Lang {
  code: string; // BCP-47 / ISO 639-1
  englishName: string; // used to instruct the generator ("Write in Russian")
  nativeName: string; // shown in the switcher
  rtl?: boolean; // right-to-left script
}

export const LANGS: Lang[] = [
  { code: "en", englishName: "English", nativeName: "English" },
  { code: "zh", englishName: "Mandarin Chinese (Simplified)", nativeName: "中文" },
  { code: "hi", englishName: "Hindi", nativeName: "हिन्दी" },
  { code: "es", englishName: "Spanish", nativeName: "Español" },
  { code: "fr", englishName: "French", nativeName: "Français" },
  { code: "ar", englishName: "Arabic", nativeName: "العربية", rtl: true },
  { code: "bn", englishName: "Bengali", nativeName: "বাংলা" },
  { code: "pt", englishName: "Portuguese", nativeName: "Português" },
  { code: "ru", englishName: "Russian", nativeName: "Русский" },
  { code: "ur", englishName: "Urdu", nativeName: "اردو", rtl: true },
];

export const DEFAULT_LANG = "en";
export const LANG_COOKIE = "periergia_lang";

const BY_CODE = new Map(LANGS.map((l) => [l.code, l]));

// Normalize any input (cookie, header, pref) to a supported language code.
export function normalizeLang(code: string | null | undefined): string {
  if (!code) return DEFAULT_LANG;
  const c = code.trim().toLowerCase().split("-")[0];
  return BY_CODE.has(c) ? c : DEFAULT_LANG;
}

export function getLang(code: string | null | undefined): Lang {
  return BY_CODE.get(normalizeLang(code)) ?? LANGS[0];
}

export function isRtl(code: string | null | undefined): boolean {
  return !!getLang(code).rtl;
}

// ── UI chrome strings ─────────────────────────────────────────────────────
// Hand-authored translations of the static interface labels (the ones that
// aren't generated content). key → { langCode: string }. Missing entries fall
// back to English. Node/article text is translated by the generator, not here.
const MESSAGES: Record<string, Record<string, string>> = {
  depth: { en: "Depth", zh: "深度", hi: "गहराई", es: "Profundidad", fr: "Profondeur", ar: "العمق", bn: "গভীরতা", pt: "Profundidade", ru: "Глубина", ur: "گہرائی" },
  level: { en: "Level", zh: "级别", hi: "स्तर", es: "Nivel", fr: "Niveau", ar: "المستوى", bn: "স্তর", pt: "Nível", ru: "Уровень", ur: "سطح" },
  skim: { en: "Skim", zh: "略读", hi: "सरसरी", es: "Vistazo", fr: "Survol", ar: "تصفّح", bn: "এক নজর", pt: "Panorâmica", ru: "Обзор", ur: "سرسری" },
  definition: { en: "Definition", zh: "定义", hi: "परिभाषा", es: "Definición", fr: "Définition", ar: "تعريف", bn: "সংজ্ঞা", pt: "Definição", ru: "Определение", ur: "تعریف" },
  medium: { en: "Medium", zh: "中等", hi: "मध्यम", es: "Medio", fr: "Moyen", ar: "متوسط", bn: "মাঝারি", pt: "Médio", ru: "Средний", ur: "درمیانہ" },
  detailed: { en: "Detailed", zh: "详细", hi: "विस्तृत", es: "Detallado", fr: "Détaillé", ar: "مفصّل", bn: "বিস্তারিত", pt: "Detalhado", ru: "Подробный", ur: "تفصیلی" },
  research: { en: "Research", zh: "研究级", hi: "शोध", es: "Investigación", fr: "Recherche", ar: "بحثي", bn: "গবেষণা", pt: "Pesquisa", ru: "Научный", ur: "تحقیقی" },
  easy: { en: "Easy", zh: "简单", hi: "आसान", es: "Fácil", fr: "Facile", ar: "سهل", bn: "সহজ", pt: "Fácil", ru: "Просто", ur: "آسان" },
  advanced: { en: "Advanced", zh: "进阶", hi: "उन्नत", es: "Avanzado", fr: "Avancé", ar: "متقدّم", bn: "উন্নত", pt: "Avançado", ru: "Продвинутый", ur: "اعلیٰ" },
  expert: { en: "Expert", zh: "专家", hi: "विशेषज्ञ", es: "Experto", fr: "Expert", ar: "خبير", bn: "বিশেষজ্ঞ", pt: "Especialista", ru: "Эксперт", ur: "ماہر" },
  testYourself: { en: "Test yourself", zh: "自我测验", hi: "स्वयं परखें", es: "Ponte a prueba", fr: "Testez-vous", ar: "اختبر نفسك", bn: "নিজেকে যাচাই করুন", pt: "Teste-se", ru: "Проверь себя", ur: "خود کو آزمائیں" },
  yourTurn: { en: "your turn", zh: "该你了", hi: "आपकी बारी", es: "tu turno", fr: "à vous", ar: "دورك", bn: "আপনার পালা", pt: "sua vez", ru: "ваш ход", ur: "آپ کی باری" },
  reveal: { en: "Reveal answer", zh: "显示答案", hi: "उत्तर दिखाएँ", es: "Ver respuesta", fr: "Voir la réponse", ar: "إظهار الإجابة", bn: "উত্তর দেখান", pt: "Ver resposta", ru: "Показать ответ", ur: "جواب دکھائیں" },
  tryAnother: { en: "Try another", zh: "换一题", hi: "दूसरा आज़माएँ", es: "Otra", fr: "Une autre", ar: "جرّب أخرى", bn: "আরেকটি", pt: "Outra", ru: "Другой", ur: "دوسرا آزمائیں" },
  composing: { en: "Composing…", zh: "生成中…", hi: "तैयार हो रहा है…", es: "Componiendo…", fr: "Composition…", ar: "جارٍ الإنشاء…", bn: "তৈরি হচ্ছে…", pt: "A compor…", ru: "Составление…", ur: "تیار ہو رہا ہے…" },
  onThisPage: { en: "On this page", zh: "本页内容", hi: "इस पृष्ठ पर", es: "En esta página", fr: "Sur cette page", ar: "في هذه الصفحة", bn: "এই পৃষ্ঠায়", pt: "Nesta página", ru: "На этой странице", ur: "اس صفحے پر" },
};

// Translate a UI key into the given language, falling back to English.
export function t(lang: string | null | undefined, key: string): string {
  const l = normalizeLang(lang);
  const row = MESSAGES[key];
  if (!row) return key;
  return row[l] ?? row.en ?? key;
}

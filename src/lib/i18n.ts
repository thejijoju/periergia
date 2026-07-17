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

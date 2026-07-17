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

// ── Subject names ─────────────────────────────────────────────────────────
// The 37 top-level subjects, translated by hand (they're finite and highly
// visible — homepage pills, sidebar, breadcrumbs). Keyed by slug → langCode.
// Deeper topic titles are NOT here (they'd be batch-translated later).
// (hi/bn/ur worth a native review.)
const SUBJECT_NAMES: Record<string, Record<string, string>> = {
  mathematics: { zh: "数学", hi: "गणित", es: "Matemáticas", fr: "Mathématiques", ar: "الرياضيات", bn: "গণিত", pt: "Matemática", ru: "Математика", ur: "ریاضی" },
  physics: { zh: "物理学", hi: "भौतिकी", es: "Física", fr: "Physique", ar: "الفيزياء", bn: "পদার্থবিজ্ঞান", pt: "Física", ru: "Физика", ur: "طبیعیات" },
  chemistry: { zh: "化学", hi: "रसायन विज्ञान", es: "Química", fr: "Chimie", ar: "الكيمياء", bn: "রসায়ন", pt: "Química", ru: "Химия", ur: "کیمیا" },
  biology: { zh: "生物学", hi: "जीव विज्ञान", es: "Biología", fr: "Biologie", ar: "الأحياء", bn: "জীববিজ্ঞান", pt: "Biologia", ru: "Биология", ur: "حیاتیات" },
  "earth-and-environmental-science": { zh: "地球与环境科学", hi: "पृथ्वी एवं पर्यावरण विज्ञान", es: "Ciencias de la Tierra y el Medio Ambiente", fr: "Sciences de la Terre et de l’environnement", ar: "علوم الأرض والبيئة", bn: "ভূ ও পরিবেশ বিজ্ঞান", pt: "Ciências da Terra e do Ambiente", ru: "Науки о Земле и окружающей среде", ur: "ارضی و ماحولیاتی سائنس" },
  "astronomy-and-space": { zh: "天文与太空", hi: "खगोल विज्ञान एवं अंतरिक्ष", es: "Astronomía y Espacio", fr: "Astronomie et espace", ar: "علم الفلك والفضاء", bn: "জ্যোতির্বিজ্ঞান ও মহাকাশ", pt: "Astronomia e Espaço", ru: "Астрономия и космос", ur: "فلکیات و خلا" },
  "computer-science": { zh: "计算机科学", hi: "कंप्यूटर विज्ञान", es: "Informática", fr: "Informatique", ar: "علوم الحاسوب", bn: "কম্পিউটার বিজ্ঞান", pt: "Ciência da Computação", ru: "Информатика", ur: "کمپیوٹر سائنس" },
  "engineering-and-technology": { zh: "工程与技术", hi: "इंजीनियरिंग एवं प्रौद्योगिकी", es: "Ingeniería y Tecnología", fr: "Ingénierie et technologie", ar: "الهندسة والتكنولوجيا", bn: "প্রকৌশল ও প্রযুক্তি", pt: "Engenharia e Tecnologia", ru: "Инженерия и технологии", ur: "انجینئرنگ و ٹیکنالوجی" },
  "medicine-and-health": { zh: "医学与健康", hi: "चिकित्सा एवं स्वास्थ्य", es: "Medicina y Salud", fr: "Médecine et santé", ar: "الطب والصحة", bn: "চিকিৎসা ও স্বাস্থ্য", pt: "Medicina e Saúde", ru: "Медицина и здоровье", ur: "طب و صحت" },
  psychology: { zh: "心理学", hi: "मनोविज्ञान", es: "Psicología", fr: "Psychologie", ar: "علم النفس", bn: "মনোবিজ্ঞান", pt: "Psicologia", ru: "Психология", ur: "نفسیات" },
  "sociology-and-anthropology": { zh: "社会学与人类学", hi: "समाजशास्त्र एवं मानवविज्ञान", es: "Sociología y Antropología", fr: "Sociologie et anthropologie", ar: "علم الاجتماع والأنثروبولوجيا", bn: "সমাজবিজ্ঞান ও নৃবিজ্ঞান", pt: "Sociologia e Antropologia", ru: "Социология и антропология", ur: "عمرانیات و بشریات" },
  "political-science-and-international-relations": { zh: "政治学与国际关系", hi: "राजनीति विज्ञान एवं अंतर्राष्ट्रीय संबंध", es: "Ciencias Políticas y Relaciones Internacionales", fr: "Sciences politiques et relations internationales", ar: "العلوم السياسية والعلاقات الدولية", bn: "রাষ্ট্রবিজ্ঞান ও আন্তর্জাতিক সম্পর্ক", pt: "Ciência Política e Relações Internacionais", ru: "Политология и международные отношения", ur: "سیاسیات و بین الاقوامی تعلقات" },
  economics: { zh: "经济学", hi: "अर्थशास्त्र", es: "Economía", fr: "Économie", ar: "الاقتصاد", bn: "অর্থনীতি", pt: "Economia", ru: "Экономика", ur: "معاشیات" },
  finance: { zh: "金融", hi: "वित्त", es: "Finanzas", fr: "Finance", ar: "التمويل", bn: "ফাইন্যান্স", pt: "Finanças", ru: "Финансы", ur: "مالیات" },
  "business-and-management": { zh: "商业与管理", hi: "व्यवसाय एवं प्रबंधन", es: "Negocios y Gestión", fr: "Commerce et gestion", ar: "الأعمال والإدارة", bn: "ব্যবসা ও ব্যবস্থাপনা", pt: "Negócios e Gestão", ru: "Бизнес и менеджмент", ur: "کاروبار و انتظام" },
  law: { zh: "法学", hi: "विधि", es: "Derecho", fr: "Droit", ar: "القانون", bn: "আইন", pt: "Direito", ru: "Право", ur: "قانون" },
  history: { zh: "历史学", hi: "इतिहास", es: "Historia", fr: "Histoire", ar: "التاريخ", bn: "ইতিহাস", pt: "História", ru: "История", ur: "تاریخ" },
  geography: { zh: "地理学", hi: "भूगोल", es: "Geografía", fr: "Géographie", ar: "الجغرافيا", bn: "ভূগোল", pt: "Geografia", ru: "География", ur: "جغرافیہ" },
  philosophy: { zh: "哲学", hi: "दर्शनशास्त्र", es: "Filosofía", fr: "Philosophie", ar: "الفلسفة", bn: "দর্শন", pt: "Filosofia", ru: "Философия", ur: "فلسفہ" },
  "religion-and-theology": { zh: "宗教与神学", hi: "धर्म एवं धर्मशास्त्र", es: "Religión y Teología", fr: "Religion et théologie", ar: "الدين واللاهوت", bn: "ধর্ম ও ধর্মতত্ত্ব", pt: "Religião e Teologia", ru: "Религия и богословие", ur: "مذہب و الٰہیات" },
  "languages-and-linguistics": { zh: "语言与语言学", hi: "भाषाएँ एवं भाषाविज्ञान", es: "Lenguas y Lingüística", fr: "Langues et linguistique", ar: "اللغات واللسانيات", bn: "ভাষা ও ভাষাবিজ্ঞান", pt: "Línguas e Linguística", ru: "Языки и лингвистика", ur: "زبانیں و لسانیات" },
  "literature-and-writing": { zh: "文学与写作", hi: "साहित्य एवं लेखन", es: "Literatura y Escritura", fr: "Littérature et écriture", ar: "الأدب والكتابة", bn: "সাহিত্য ও রচনা", pt: "Literatura e Escrita", ru: "Литература и письмо", ur: "ادب و تحریر" },
  "visual-arts": { zh: "视觉艺术", hi: "दृश्य कला", es: "Artes Visuales", fr: "Arts visuels", ar: "الفنون البصرية", bn: "চাক্ষুষ কলা", pt: "Artes Visuais", ru: "Изобразительное искусство", ur: "بصری فنون" },
  music: { zh: "音乐", hi: "संगीत", es: "Música", fr: "Musique", ar: "الموسيقى", bn: "সঙ্গীত", pt: "Música", ru: "Музыка", ur: "موسیقی" },
  "performing-arts": { zh: "表演艺术", hi: "प्रदर्शन कला", es: "Artes Escénicas", fr: "Arts du spectacle", ar: "الفنون الأدائية", bn: "পরিবেশন কলা", pt: "Artes Cênicas", ru: "Исполнительские искусства", ur: "پرفارمنگ آرٹس" },
  "design-and-architecture": { zh: "设计与建筑", hi: "डिज़ाइन एवं वास्तुकला", es: "Diseño y Arquitectura", fr: "Design et architecture", ar: "التصميم والعمارة", bn: "ডিজাইন ও স্থাপত্য", pt: "Design e Arquitetura", ru: "Дизайн и архитектура", ur: "ڈیزائن و فنِ تعمیر" },
  "media-and-communication": { zh: "媒体与传播", hi: "मीडिया एवं संचार", es: "Medios y Comunicación", fr: "Médias et communication", ar: "الإعلام والاتصال", bn: "মিডিয়া ও যোগাযোগ", pt: "Media e Comunicação", ru: "Медиа и коммуникация", ur: "میڈیا و ابلاغ" },
  "education-and-learning": { zh: "教育与学习", hi: "शिक्षा एवं अधिगम", es: "Educación y Aprendizaje", fr: "Éducation et apprentissage", ar: "التعليم والتعلم", bn: "শিক্ষা ও শিখন", pt: "Educação e Aprendizagem", ru: "Образование и обучение", ur: "تعلیم و سیکھنا" },
  "practical-and-life-skills": { zh: "实用与生活技能", hi: "व्यावहारिक एवं जीवन कौशल", es: "Habilidades Prácticas y para la Vida", fr: "Compétences pratiques et de vie", ar: "المهارات العملية والحياتية", bn: "ব্যবহারিক ও জীবন দক্ষতা", pt: "Competências Práticas e de Vida", ru: "Практические и жизненные навыки", ur: "عملی و زندگی کی مہارتیں" },
  classics: { zh: "古典学", hi: "क्लासिक्स", es: "Clásicas", fr: "Lettres classiques", ar: "الدراسات الكلاسيكية", bn: "ক্লাসিকস", pt: "Estudos Clássicos", ru: "Классические науки", ur: "کلاسیکی علوم" },
  neuroscience: { zh: "神经科学", hi: "तंत्रिका विज्ञान", es: "Neurociencia", fr: "Neurosciences", ar: "علم الأعصاب", bn: "স্নায়ুবিজ্ঞান", pt: "Neurociência", ru: "Нейронаука", ur: "اعصابی سائنس" },
  statistics: { zh: "统计学", hi: "सांख्यिकी", es: "Estadística", fr: "Statistiques", ar: "الإحصاء", bn: "পরিসংখ্যান", pt: "Estatística", ru: "Статистика", ur: "شماریات" },
  "africana-studies": { zh: "非洲研究", hi: "अफ़्रीकाना अध्ययन", es: "Estudios Africanos", fr: "Études africaines", ar: "الدراسات الأفريقية", bn: "আফ্রিকানা স্টাডিজ", pt: "Estudos Africanos", ru: "Африканские исследования", ur: "افریقی مطالعات" },
  "asian-studies": { zh: "亚洲研究", hi: "एशियाई अध्ययन", es: "Estudios Asiáticos", fr: "Études asiatiques", ar: "الدراسات الآسيوية", bn: "এশীয় অধ্যয়ন", pt: "Estudos Asiáticos", ru: "Азиатские исследования", ur: "ایشیائی مطالعات" },
  "gender-studies": { zh: "性别研究", hi: "लैंगिक अध्ययन", es: "Estudios de Género", fr: "Études de genre", ar: "دراسات النوع الاجتماعي", bn: "জেন্ডার স্টাডিজ", pt: "Estudos de Género", ru: "Гендерные исследования", ur: "صنفی مطالعات" },
  "folklore-and-mythology": { zh: "民俗与神话", hi: "लोककथा एवं पुराण", es: "Folclore y Mitología", fr: "Folklore et mythologie", ar: "الفولكلور والأساطير", bn: "লোককাহিনি ও পুরাণ", pt: "Folclore e Mitologia", ru: "Фольклор и мифология", ur: "لوک داستان و اساطیر" },
  film: { zh: "电影", hi: "फ़िल्म", es: "Cine", fr: "Cinéma", ar: "السينما", bn: "চলচ্চিত্র", pt: "Cinema", ru: "Кино", ur: "فلم" },
};

// Translated subject name, falling back to the English name we already have.
export function subjectName(lang: string | null | undefined, slug: string, english: string): string {
  const l = normalizeLang(lang);
  if (l === "en") return english;
  return SUBJECT_NAMES[slug]?.[l] ?? english;
}

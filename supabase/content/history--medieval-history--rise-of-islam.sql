-- The Rise of Islam and the Caliphates — canonical master article, co-written and human-reviewed.
-- history/medieval-history/the-islamic-world/the-rise-of-islam-and-the-caliphates @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- Arabia before Islam, Muhammad and the problem of sources, the
-- conquests, Sunni and Shia, the Umayyads and Abbasids, learning in
-- Baghdad and the 'golden age' debate, rival caliphates, and the fate of
-- the caliphate.
--
-- {{image: Title | caption}} markers resolve to real Wikipedia images at read
-- time via /api/resolve-images (see src/components/Reader.tsx). A curated,
-- human-reviewed quiz is inserted at the bottom (generated = true).
--
-- Every other depth/level/mode for this node is a cached distillation DERIVED
-- from this master (see src/lib/generate.ts), so when the master body changes
-- those rows are stale. The upsert only touches the row when something actually
-- differs, and the delete below fires only in that case — dropping the derived
-- caches so the next request re-distills from the updated master. Replaying an
-- unchanged file is a complete no-op.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'history/medieval-history/the-islamic-world/the-rise-of-islam-and-the-caliphates',
    'research',
    'advanced',
    'read',
    $islam_master$> **Islam** began in the early seventh century in western Arabia, with the preaching of Muhammad in the trading town of Mecca. Within a century of his death in 632, Muslim rulers governed an empire from Spain and Morocco to Central Asia and the Indus valley, larger than Rome's had ever been. The empire fragmented, but the civilization it created endured, with a shared religion, law, and learned language, Arabic, that became a centre of science, philosophy, and commerce for the whole of Afro-Eurasia. This chapter covers Arabia before Islam, the life of Muhammad and the problem of sources, the conquests and why they succeeded, the split between Sunni and Shia, the Umayyad and Abbasid caliphates, the flowering of learning in Baghdad and its debated "golden age", the rival caliphates of Córdoba and Cairo, and the fate of the caliphate as an institution.

## Arabia Before Islam

In late antiquity, the Arabian peninsula lay between the two great powers of the age, the Roman empire and Sasanian Persia, which fought each other and used Arab allies as buffer states. Most of Arabia was desert, home to nomadic and semi-nomadic tribes, with oasis towns and, in the southwest, in Yemen, an old civilization of irrigated agriculture and kingdoms. Christians and Jews lived in many parts of Arabia, and Aksum, as an earlier chapter described, ruled Yemen for a time in the sixth century.

**Mecca**, in the Hijaz region of western Arabia, was a town of the Quraysh tribe, centred on the **Kaaba**, a cube-shaped shrine that was a site of pilgrimage for many Arab tribes. Older accounts portrayed Mecca as a great centre of international trade in spices and luxuries; the historian Patricia Crone, in *Meccan Trade and the Rise of Islam* (1987), challenged this picture, arguing that Mecca's trade was regional and modest. The question of Mecca's economic role remains debated.

## Muhammad and the Problem of Sources

According to Muslim tradition, **Muhammad** was born in Mecca around 570, orphaned young, and became a merchant. Around 610, while meditating in a cave near Mecca, he began to receive revelations, which he understood as messages from God delivered by the angel Gabriel. He preached that there is only one God, Allah, the same God worshipped by Jews and Christians, that people would be judged after death, and that they should submit (*islam*) to God, care for the poor, and reject the idols worshipped at the Kaaba.

Opposition from Mecca's leaders grew, and in 622 Muhammad and his followers migrated to the oasis town of Yathrib, later called **Medina** ("the city [of the Prophet]"). This migration, the **Hijra**, marks the beginning of the Islamic calendar. In Medina Muhammad became the leader of a community including Muslims, Arab tribes, and Jewish clans, governed by an agreement known as the Constitution of Medina. After years of warfare with the Meccans, including the battle of Badr in 624, Muhammad took Mecca in 630 almost without fighting, cleared the Kaaba of idols, and made it the centre of Muslim worship. He died in Medina in 632.

The historian faces difficult problems with the sources. The **Qur'an**, Muslims believe, is the word of God revealed to Muhammad. According to tradition, it was compiled into a standard text under the third caliph, Uthman, around 650. Some early manuscripts support an early date; leaves of a Qur'an in Birmingham's library were radiocarbon-dated in 2015 to between 568 and 645. But the Qur'an contains few details of Muhammad's life. The main narrative source, the biography (*sira*) of the Prophet by **Ibn Ishaq**, was written more than a century after Muhammad's death and survives in a later edition, and the collections of the Prophet's sayings and deeds (*hadith*) were compiled in the ninth century.

In the 1970s some Western scholars, such as John Wansbrough and, in *Hagarism* (1977), Patricia Crone and Michael Cook, argued that the traditional account was largely a later construction and that Islam took shape only gradually, outside Arabia. Most historians now take a more moderate view: the Qur'an is an early text close to Muhammad's lifetime, and the core of the traditional account, a prophet in western Arabia who founded a community and died in 632, is supported by early non-Muslim sources, such as a Greek Christian text from around 634 that mentions a prophet appearing among the Arabs. But many details of the traditional narrative are later and must be used critically, as with any source.

```checkpoint
q: Why must historians use the traditional biography of Muhammad critically?
a*: Because the main biography, by Ibn Ishaq, was written more than a century after his death and survives in a later edition, and the hadith collections are later still.
a: Because no Muslim sources about him exist.
x: Many Muslim sources exist, including the Qur'an, the sira, and hadith; the issue is their dates and purposes.
a: Because Muhammad is not mentioned in any non-Muslim source.
x: Early non-Muslim sources, such as a Greek Christian text from about 634, mention a prophet among the Arabs.
a: Because the Qur'an was written in the twentieth century.
x: Early Qur'an manuscripts have been radiocarbon-dated to the seventh century.
hint: Compare the dates of the sources with the dates of Muhammad's life.
why: Sources written long after events reflect the concerns of their own time, so historians treat them critically while recognising the Qur'an as an early text.
---
q: What does the Hijra of 622 mark?
a: Muhammad's first revelation.
x: According to tradition, the first revelation came around 610.
a: Muhammad's death.
x: Muhammad died in 632.
a*: Muhammad's migration from Mecca to Medina, which marks the beginning of the Islamic calendar.
a: The conquest of Mecca.
x: Mecca was taken in 630.
hint: The Islamic calendar's years are labelled AH.
why: The migration to Medina made Muhammad leader of a community and is the starting point of Islamic dating.
```

## The Conquests

After Muhammad's death, his close companion **Abu Bakr** was chosen as his successor, *khalifa*, or **caliph**. He crushed rebellions by Arab tribes that had broken away (the Ridda wars) and launched campaigns beyond Arabia. Under the second caliph, **Umar** (634–644), Arab armies achieved astonishing victories: they defeated the Romans at the Yarmuk in 636, conquered Syria and Palestine, took Jerusalem around 637–638, defeated the Sasanians at al-Qadisiyya and Nahavand, as the chapter on Persia described, and conquered Egypt between 639 and 642. Within a century, armies had crossed North Africa, entered Spain in 711, reached Sindh in the Indus valley in 711–712, and crossed into Central Asia.

Why were the conquests so successful? Historians point to several factors:

- **Exhausted empires.** Rome and Persia had just fought the devastating war of 602–628 and had been weakened by plague.
- **Arab military strengths.** Mobile armies, unified by a new religion and the promise of reward in this world and the next, led by capable commanders.
- **Light rule.** The conquerors generally did not force conversion. They settled in new garrison cities, such as Kufa and Basra in Iraq and Fustat in Egypt, and left local communities, Christian, Jewish, and Zoroastrian, largely to govern themselves, as protected peoples (*dhimmis*) paying a special tax (*jizya*). For many subjects, especially Christians persecuted by the Byzantine church for their beliefs, Arab rule was at first no worse than Roman or Persian rule.

Conversion to Islam was slow. The historian **Richard Bulliet**, using the adoption of Muslim names in biographical dictionaries, estimated that the majority of the population of Iran, for example, did not become Muslim until the ninth or tenth century, two to three centuries after the conquest.

## Sunni and Shia

The question of who should lead the community split the Muslims. The third caliph, **Uthman** (644–656), was assassinated. The fourth, **Ali** (656–661), Muhammad's cousin and son-in-law, faced civil war: at the Battle of the Camel in 656 he defeated a coalition that included Muhammad's widow **Aisha**, and he fought **Muawiya**, the governor of Syria and a relative of Uthman. Ali was assassinated in 661, and Muawiya founded the Umayyad dynasty.

The supporters of Ali, the *shi'at Ali*, "party of Ali", held that leadership should have passed to Ali and his descendants. In 680 Ali's son **Husayn** rose against the Umayyads and was killed with his small band of followers at **Karbala** in Iraq. Husayn's martyrdom, commemorated every year on the day of Ashura, became central to **Shia** identity. The majority, who came to be called **Sunni**, accepted the historical caliphs. The split, originally political, developed over centuries into distinct traditions of law, theology, and religious authority.

```checkpoint
q: Which factor best explains why the Arab conquests succeeded so quickly?
a: The Arabs forced every conquered person to convert immediately.
x: Conversion was not forced and was slow, taking centuries in many regions.
a*: The Roman and Persian empires were exhausted by their war of 602–628 and by plague, while the Arab armies were mobile, unified, and ruled conquered peoples relatively lightly.
a: The Arabs had gunpowder weapons.
x: Gunpowder weapons did not exist in the seventh century.
a: The Byzantine emperor invited the Arabs to rule Syria.
x: The Byzantines fought the Arabs, losing at the Yarmuk in 636.
hint: Consider the state of the old empires and the conquerors' policies.
why: A combination of the old empires' weakness, Arab military strengths, and tolerant rule explains the speed and durability of the conquests.
---
q: What was the original basis of the Sunni–Shia division?
a: A disagreement over whether to pray five times a day.
x: Both traditions practise daily prayer; the division began over leadership.
a: A dispute about the language of the Qur'an.
x: Both traditions accept the same Qur'an in Arabic.
a: A war between Arabs and Persians.
x: The division was within the Muslim community over leadership, not an ethnic war.
a*: A dispute over who should lead the Muslim community after Muhammad, with the Shia supporting Ali and his descendants.
hint: What does "shi'at Ali" mean?
why: The split began as a political dispute over succession, sealed by the martyrdom of Husayn at Karbala, and later developed into distinct religious traditions.
```

## The Umayyads and the Abbasids

The **Umayyad** caliphs (661–750) ruled from **Damascus** in Syria. Under **Abd al-Malik** (685–705), the state became more distinctly Islamic and Arab: Arabic replaced Greek and Persian as the language of administration, new coins carried Qur'anic inscriptions instead of images of rulers, and the **Dome of the Rock** in Jerusalem, completed around 691–692, proclaimed the new faith with inscriptions from the Qur'an.

Umayyad rule favoured Arabs, and non-Arab converts to Islam (*mawali*), especially in Iran, resented their second-class status. In 747 a revolution began in Khurasan in eastern Iran, under black banners, led by Abu Muslim on behalf of the **Abbasids**, a family descended from Muhammad's uncle. In 750 the Abbasids overthrew the Umayyads and killed most of the family.

The Abbasid caliphs moved the centre of power east. In 762 the caliph al-Mansur founded **Baghdad** on the Tigris, near the old Sasanian capital, as a round city with the caliph's palace at its centre. Within decades it was one of the largest cities in the world. Abbasid government drew heavily on Persian traditions of court and bureaucracy. The reign of **Harun al-Rashid** (786–809), later idealised in *The Thousand and One Nights*, came to symbolise Abbasid splendour.

## Learning in Baghdad: A "Golden Age"?

Under the Abbasids, scholars translated large numbers of Greek, Persian, Syriac, and Sanskrit works into Arabic, in what historians call the **translation movement**. Philosophy, medicine, mathematics, astronomy, and geography were translated, studied, and developed. The caliph **al-Ma'mun** (813–833) is credited with supporting a "House of Wisdom" (*Bayt al-Hikma*) in Baghdad; historians such as Dimitri Gutas have argued that this was mainly a palace library, and that the movement was driven by a wide range of patrons and practical needs, not by one institution.

The results were remarkable:

- **Al-Khwarizmi**, working in Baghdad around 820, wrote a book on solving equations whose title gave us the word **algebra**, and his name, Latinised, gave us **algorithm**. He also helped spread Indian numerals with place value and zero.
- **Ibn al-Haytham** (about 965–1040), working in Cairo, wrote the *Book of Optics*, which showed that vision results from light entering the eye and pioneered experimental method.
- **Ibn Sina** (Avicenna, 980–1037), from Bukhara, wrote *The Canon of Medicine*, a standard medical textbook in Europe and the Islamic world for six centuries, and influential works of philosophy.
- **Al-Biruni** (973–after 1050) wrote on astronomy, geography, and a pioneering study of India.
- **Ibn Rushd** (Averroes, 1126–1198), a judge in Córdoba, wrote commentaries on Aristotle that shaped European scholasticism.

These scholars included Muslims, Christians, Jews, and others, and their work, translated into Latin in Spain and Sicily from the twelfth century, was essential to the revival of learning in Latin Europe.

Many textbooks call this period the **Islamic Golden Age** and describe a decline after the Mongol sack of Baghdad in 1258. Historians now challenge both halves of that story. Science continued to flourish long afterwards, for instance at the observatory at Maragha in Iran, founded in 1259, and in the work of the fourteenth-century Damascus astronomer Ibn al-Shatir, whose planetary models closely resemble those Copernicus used two centuries later. The "golden age then decline" narrative was partly a creation of European orientalists, and of some later Muslim reformers, explaining why the Islamic world had fallen behind Europe in the modern period.

{{image: House of Wisdom | A thirteenth-century illustration of scholars in an Abbasid library, from a manuscript of al-Hariri's Maqamat.}}

```checkpoint
q: Why do historians question the idea of an Islamic "Golden Age" followed by decline after 1258?
a: Because no science was produced in the Islamic world before 1258.
x: Science flourished under the Abbasids; the critique concerns the supposed decline afterwards.
a: Because the Mongols adopted Islamic science immediately and nothing changed.
x: The Mongol conquests caused real destruction, but scientific work continued in new centres.
a*: Because science continued to flourish after 1258, as at the Maragha observatory and in Ibn al-Shatir's astronomy, and the narrative was partly shaped by later European and reformist agendas.
a: Because Islamic scholars only copied Greek works without adding anything.
x: Scholars such as al-Khwarizmi, Ibn al-Haytham, and Ibn Sina made major original contributions.
hint: Look at what happened at Maragha and Damascus after 1258.
why: Evidence of continued scientific achievement undermines a simple rise-and-decline story shaped by later perspectives.
---
q: What is al-Khwarizmi remembered for?
a*: A book on solving equations whose title gave us "algebra", with his own name giving us "algorithm".
a: Writing The Canon of Medicine.
x: That was Ibn Sina.
a: Proving that vision is caused by light entering the eye.
x: That was Ibn al-Haytham.
a: Founding the city of Baghdad.
x: Baghdad was founded by the caliph al-Mansur in 762.
hint: Think of two mathematical words.
why: Al-Khwarizmi's work on equations and numerals shaped mathematics in both the Islamic world and Europe.
```

## Rival Caliphates and the Fate of the Caliphate

The Abbasid empire did not stay united. A surviving Umayyad prince escaped to Spain and founded an emirate in **al-Andalus**; in 929 his descendant **Abd al-Rahman III** declared himself caliph in **Córdoba**, which became one of the greatest cities of Europe. Historians debate the idea of *convivencia*, peaceful coexistence of Muslims, Christians, and Jews in al-Andalus: there was real cultural exchange and many periods of tolerance, but also inequality and violence. In 909 the **Fatimids**, a dynasty of Ismaili Shia Muslims, declared a rival caliphate in North Africa; they conquered Egypt and founded **Cairo** in 969, with the mosque-university of al-Azhar.

The Abbasid caliphs themselves gradually lost power. From the ninth century, they relied on armies of Turkish slave soldiers, as the chapter on slavery describes, who often controlled them. In 945 the Buyids, a Shia dynasty from Iran, took Baghdad and ruled in the caliph's name; in 1055 the Sunni **Seljuk Turks** replaced them, and their leader took the title of **sultan**, "authority". The caliph remained a religious figurehead.

In 1258 the Mongols under Hülegü sacked Baghdad and killed the last Abbasid caliph, according to tradition by rolling him in a carpet and trampling him with horses, to avoid shedding royal blood. A line of Abbasid "shadow caliphs" continued under the Mamluk sultans in Cairo. After the Ottomans conquered Egypt in 1517, the Ottoman sultans eventually claimed the caliphate, until the new Turkish Republic abolished it in 1924. The caliphate as an idea, the political unity of all Muslims under a single leader, has had a long afterlife, invoked by reformers and, recently, by extremist movements such as the so-called Islamic State.

## Further exploration

- **Hugh Kennedy, *The Prophet and the Age of the Caliphates* (3rd ed., 2016).** A standard history of the early Islamic period.
- **Fred M. Donner, *Muhammad and the Believers: At the Origins of Islam* (2010).** A reinterpretation of Islam's origins and early community.
- **Jonathan Berkey, *The Formation of Islam* (2003).** Religion and society in the Near East, 600–1800.
- **Jim Al-Khalili, *Pathfinders: The Golden Age of Arabic Science* (2010).** An accessible account of science in the Islamic world.
- **Dimitri Gutas, *Greek Thought, Arabic Culture* (1998).** The translation movement and its causes.$islam_master$,
    true,
    true
  )
  on conflict (node_id, depth, level, format) do update
    set body = excluded.body, generated = excluded.generated, reviewed = excluded.reviewed
    where content.body is distinct from excluded.body
       or content.generated is distinct from excluded.generated
       or content.reviewed is distinct from excluded.reviewed
  returning node_id
)
delete from content
where node_id in (select node_id from master)
  and not (depth = 'research' and level = 'advanced' and format = 'read');

-- Curated, human-reviewed quiz — same set served at every level.
with q as (
  select $islam_quiz$[
    {"type": "mcq", "prompt": "What was the Hijra?", "options": ["Muhammad's first revelation", "The conquest of Mecca", "The compilation of the Qur'an", "Muhammad's migration from Mecca to Medina in 622, the start of the Islamic calendar"], "answerIndex": 3, "explanation": "The migration made Muhammad leader of a community in Medina and marks year 1 of the Islamic calendar.", "id": "q1"},
    {"type": "mcq", "prompt": "What happened at Karbala in 680?", "options": ["Ali's son Husayn and his followers were killed by Umayyad forces, an event central to Shia identity", "The Abbasids overthrew the Umayyads", "The Arabs defeated the Byzantines", "Baghdad was founded"], "answerIndex": 0, "explanation": "Husayn's martyrdom, commemorated on Ashura, became a defining moment for the Shia.", "id": "q2"},
    {"type": "mcq", "prompt": "What did Richard Bulliet's study of names suggest about conversion to Islam?", "options": ["Everyone converted within a year of the conquests", "No one in Iran ever converted", "Conversion was slow; for example, Iran's population became majority Muslim only around the ninth or tenth century", "Conversion was forced by law"], "answerIndex": 2, "explanation": "Bulliet used the adoption of Muslim names to estimate a gradual conversion curve over centuries.", "id": "q3"},
    {"type": "mcq", "prompt": "Who founded Cairo in 969?", "options": ["The Abbasids", "The Umayyads of Córdoba", "The Fatimids, an Ismaili Shia dynasty", "The Seljuk Turks"], "answerIndex": 2, "explanation": "The Fatimids declared a rival caliphate and founded Cairo with the mosque of al-Azhar.", "id": "q4"},
    {"type": "open", "prompt": "Why did the Arab conquests succeed so quickly, and why did conversion to Islam take so long?", "rubric": "A strong answer explains Roman and Persian exhaustion after 602–628 and plague, Arab mobility, unity, and leadership, and light rule through garrison cities, dhimmi status, and the jizya; it then explains slow conversion (no forced conversion, tax and status incentives, Bulliet's evidence of a gradual curve over two to three centuries), drawing out the connection between tolerant rule and slow conversion.", "id": "q5"},
    {"type": "open", "prompt": "Evaluate the idea of an Islamic 'Golden Age' followed by decline after 1258.", "rubric": "A strong answer describes the translation movement and the achievements of al-Khwarizmi, Ibn al-Haytham, Ibn Sina, al-Biruni, and Ibn Rushd, and debates about the House of Wisdom (Gutas). It then challenges the decline narrative with evidence of continued science (Maragha, Ibn al-Shatir) and explains how the narrative was shaped by European orientalists and later reformers, reaching a reasoned judgement.", "id": "q6"}
  ]$islam_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/medieval-history/the-islamic-world/the-rise-of-islam-and-the-caliphates', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

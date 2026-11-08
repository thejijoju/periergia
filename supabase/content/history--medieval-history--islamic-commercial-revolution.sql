-- The Islamic Commercial Revolution (800–1200) — canonical master article, co-written and human-reviewed.
-- history/medieval-history/the-islamic-world/the-islamic-commercial-revolution-800-1200 @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- Routes and cities, commercial and financial institutions, dinars and
-- dirhams, the Cairo Geniza merchants, goods and labour including the Zanj,
-- and the debate over influence on Europe.
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
    'history/medieval-history/the-islamic-world/the-islamic-commercial-revolution-800-1200',
    'research',
    'advanced',
    'read',
    $commerce_master$> **The Islamic commercial revolution** of roughly 800 to 1200 joined the Mediterranean and the Indian Ocean, North and sub-Saharan Africa, Central and South Asia into a single trading world for the first time. Under the caliphates and their successor states, merchants developed bills of exchange, cheques, investment partnerships, and inns for travellers; gold dinars and silver dirhams circulated from Scandinavia to China; and cities such as Baghdad, Cairo, and Córdoba grew into some of the largest in the world. This chapter describes the routes, institutions, money, merchants, goods, and labour of this commercial world, which some historians call a globalization before globalization, and asks how far it shaped the later commercial revolution of Europe.

## A World Joined Together

The Arab conquests, as the previous chapter described, brought under one political and religious order lands that had been divided for centuries between the Roman and Persian empires. Even after the caliphate fragmented, a shared religion, a shared language of learning and law, Arabic, and shared commercial and legal practices allowed merchants to move and trade across political borders with relative ease.

Trade ran along several great networks at once:

- **The Mediterranean**, linking al-Andalus, North Africa, Egypt, Syria, Sicily, and, increasingly, the Italian ports.
- **The Indian Ocean**, linking the Persian Gulf and the Red Sea with India, Sri Lanka, Southeast Asia, China, and the East African coast, using the monsoon winds.
- **The trans-Saharan routes**, linking North Africa with the gold-producing lands of West Africa, as the chapter on Ghana and Mali describes.
- **The overland routes** of Central Asia, the Silk Roads, linking Iran with China and the steppe.
- **The northern river routes** through Russia, by which Scandinavian traders, the Rus', brought furs, amber, and slaves to the Islamic world in exchange for silver.

The Abbasid capital **Baghdad**, founded in 762, sat at the centre of this world, on the Tigris near the head of the Persian Gulf. Its markets drew goods from China, India, Africa, and Europe. **Cairo**, founded by the Fatimids in 969, and the older city of Fustat beside it became the hub of trade between the Mediterranean and the Indian Ocean through the Red Sea. **Córdoba** in al-Andalus was among the largest cities in Europe.

## Commercial and Financial Institutions

Long-distance trade requires ways to move money without carrying it, to share risk and pool capital, and to trust distant partners. Merchants in the Islamic world developed or refined a set of institutions that did these things:

- **The suftaja**, a bill of exchange: a merchant paid money in one city and received a written order to collect the equivalent in another, avoiding the danger of carrying coin.
- **The sakk**, a written order to pay, from which the English word **cheque** may ultimately derive.
- **The qirad** (also called *mudaraba*), a partnership in which an investor provided capital and a travelling merchant provided labour, with profits shared and losses borne by the investor. It closely resembled the later Italian **commenda**, and many historians, such as Abraham Udovitch, think the Italian form was influenced by it.
- **The funduq** (*khan* or caravanserai), an inn and warehouse where travelling merchants could lodge, store goods, and trade. The word passed into Italian as *fondaco*, the name for the trading houses of foreign merchants in Venice.

Trade was regulated by **Islamic commercial law**, which set rules for contracts, partnerships, sales, and credit, and condemned interest (*riba*), though merchants used legal devices to provide for profit on credit. In the markets, an official called the **muhtasib** enforced *hisba*, the duty to command good and forbid wrong, by inspecting weights and measures, prices, and the quality of goods.

```checkpoint
q: What problem did the suftaja solve for merchants?
a*: It let merchants transfer funds between cities without physically carrying coin, reducing the risk of theft.
a: It allowed merchants to avoid all taxes.
x: The suftaja concerned transferring money, not avoiding taxes.
a: It guaranteed that every voyage would be profitable.
x: No instrument could guarantee profit; partnerships like the qirad shared risk instead.
a: It replaced all coinage with paper money.
x: Coinage remained central; the suftaja was a bill of exchange, not paper currency.
hint: Think about the dangers of carrying gold across a desert.
why: Bills of exchange allowed safer long-distance commerce, an innovation later widespread in European banking.
---
q: How did the qirad partnership work?
a: Both partners contributed equal money and labour and shared all losses equally.
x: In the qirad, one partner provided capital and the other labour, and losses fell on the investor.
a: It was a loan with a fixed rate of interest.
x: Islamic law condemned interest; the qirad shared profits instead.
a*: An investor provided capital and a travelling merchant provided labour, sharing profits, with losses borne by the investor.
a: It was a government monopoly on trade.
x: The qirad was a private partnership, not a state monopoly.
hint: Compare it with the Italian commenda.
why: The qirad pooled capital and labour while sharing risk, a model closely resembling, and possibly influencing, the Italian commenda.
```

## Gold Dinars and Silver Dirhams

The caliphate's coins became world currencies. The gold **dinar** (from the Roman *denarius*) and the silver **dirham** (from the Greek *drachma*), reformed by Abd al-Malik in the 690s without images, were minted in large numbers and trusted far beyond the Islamic world. Hoards of tens of thousands of Abbasid and Samanid dirhams have been found in Russia and Scandinavia, brought north by Rus' and Viking traders; one hoard from the Swedish island of Gotland contains about 14,000 Islamic coins. Islamic coins have also been found in Britain, East Africa, and China. Some Christian rulers copied them: around 774 King Offa of Mercia in England issued a gold coin copying an Abbasid dinar, complete with an Arabic inscription he probably could not read.

## The Merchants of the Geniza

The best evidence for how merchants lived and traded in this world comes from an extraordinary source. In the synagogue of Fustat in Old Cairo, the local Jewish community kept a **geniza**, a storeroom where texts containing the name of God were placed rather than destroyed. Over centuries, they deposited almost every kind of writing there: religious texts, but also business letters, contracts, court records, accounts, marriage agreements, and shopping lists, mostly from the tenth to the thirteenth centuries. In 1896 the scholar **Solomon Schechter** brought much of the **Cairo Geniza** to Cambridge; its fragments, perhaps 400,000 in all, are now spread across libraries worldwide.

The historian **S. D. Goitein** used these documents in his six-volume *A Mediterranean Society* (1967–1993) to reconstruct the daily life of Jewish merchants and their Muslim and Christian partners across the Mediterranean and Indian Ocean. The letters show merchants relying on networks of friends and relatives rather than formal contracts alone, sharing information about prices, ships, and politics, and trading in partnership across religious lines. One merchant, **Abraham Ben Yiju**, a Jewish trader from Tunisia, lived for years in Mangalore on the southwestern coast of India in the twelfth century, trading between India and Aden, and had a family with an Indian woman he had freed from slavery; the novelist Amitav Ghosh retold his story in *In an Antique Land* (1992).

## Goods and Labour

The goods of this world included **textiles**, the most important manufactured goods, such as Egyptian linens, Iraqi silks, and Indian cottons; **spices** and **pepper** from India and Southeast Asia; **gold** from West Africa; **paper**; dyes, metals, and timber; and **enslaved people**. Many words for goods entered European languages from Arabic in this period, including sugar, cotton, muslin (from Mosul), and damask (from Damascus).

**Paper** made a particularly important journey. According to a well-known story, Chinese prisoners captured at the battle of Talas in 751 taught papermaking to the Muslims of Samarkand. The story may be legend, but paper mills were operating in Baghdad by the 790s, and paper spread across the Islamic world, transforming administration, scholarship, and book culture centuries before it became common in Europe.

The historian Andrew Watson argued for an **"Arab agricultural revolution"**, in which crops such as sugar cane, cotton, citrus fruits, rice, and new irrigation techniques spread westward through the Islamic world. The scale and novelty of this revolution have been debated, but the diffusion of crops was real.

This commercial world rested on many kinds of labour: caravan workers and camel drivers, sailors and porters, craftsmen in urban workshops, and enslaved people. In the marshes of southern Iraq, tens of thousands of enslaved East Africans, known as the **Zanj**, were forced to clear salt from the land for plantations. In 869 they rose in a great revolt that lasted fourteen years and took the city of Basra before the Abbasids crushed it. The commercial revolution, like later ones, had victims as well as beneficiaries.

```checkpoint
q: Why is the Cairo Geniza such a valuable source?
a: Because it contains the official records of the Fatimid caliphs.
x: The Geniza is mostly the private and community records of the Jewish community of Fustat, not the caliphs' archive.
a*: Because it preserved huge numbers of everyday documents, such as business letters, contracts, and accounts, revealing the daily lives of merchants.
a: Because it contains the earliest copies of the Qur'an.
x: The Geniza held mainly Jewish religious and secular documents, not Qur'an manuscripts.
a: Because it was written entirely by European visitors to Egypt.
x: The documents were written mainly by members of the local Jewish community and their correspondents.
hint: What did the community put in the storeroom, and why?
why: The Geniza preserved ordinary documents that would normally have been thrown away, giving a rare view of medieval commercial and social life.
---
q: What was the Zanj revolt?
a: A revolt of Viking traders in Russia.
x: The Zanj were enslaved East Africans in southern Iraq, not Vikings.
a: A rebellion of Italian merchants against Venice.
x: The revolt took place in Abbasid Iraq.
a: A peaceful strike by Baghdad's paper makers.
x: The revolt was a long armed rebellion, not a strike.
a*: A great revolt beginning in 869 of enslaved East Africans forced to work in the marshes of southern Iraq, which lasted fourteen years.
hint: The rebels took the city of Basra.
why: The Zanj revolt reveals the enslaved labour underpinning parts of the commercial economy.
```

## Prefiguring Europe?

From the eleventh and twelfth centuries, Italian merchants of Venice, Genoa, Pisa, and Amalfi became major participants in Mediterranean trade, buying spices, silk, and other goods in Alexandria, Acre, and Constantinople. Their commercial techniques, such as the commenda, bills of exchange, and later banking, insurance, and double-entry bookkeeping, are often seen as the beginnings of European capitalism.

Historians debate how far these techniques came from the Islamic world. Many were clearly paralleled or anticipated there, and Italian merchants learned from Muslim and Jewish partners and adopted Arabic words, practices, and numerals; the Italian mathematician **Fibonacci**, who grew up in a Pisan trading post in Algeria, introduced Indian-Arabic numerals to Europe in 1202 in a book designed for merchants. The economist **Timur Kuran**, in *The Long Divergence* (2011), has argued that features of Islamic commercial law, such as partnership rules that ended at a partner's death and inheritance laws that divided estates, later hindered the growth of large, long-lived companies in the Islamic world, while European law developed the business corporation. His argument is debated, but it focuses attention on why a world that led in commercial institutions around 1000 did not produce the large corporations of later European capitalism.

## Further exploration

- **S. D. Goitein, *A Mediterranean Society* (abridged ed. by Jacob Lassner, 1999).** The world of the Cairo Geniza merchants.
- **Jessica L. Goldberg, *Trade and Institutions in the Medieval Mediterranean* (2012).** A study of Geniza merchants' business practices.
- **Maya Shatzmiller, *Labour in the Medieval Islamic World* (1994).** The work behind the commercial economy.
- **Timur Kuran, *The Long Divergence: How Islamic Law Held Back the Middle East* (2011).** A debated argument about Islamic law and economic development.
- **Amitav Ghosh, *In an Antique Land* (1992).** A literary reconstruction of a Geniza merchant's life in India.$commerce_master$,
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
  select $commerce_quiz$[
    {"type": "mcq", "prompt": "What was the funduq?", "options": ["An inn and warehouse for travelling merchants", "A gold coin", "A type of ship", "A court of law"], "answerIndex": 0, "explanation": "Funduqs, or caravanserais, lodged merchants and stored goods; the word passed into Italian as fondaco.", "id": "q1"},
    {"type": "mcq", "prompt": "Where have hoards of tens of thousands of Islamic silver dirhams been found?", "options": ["Only in Arabia", "Only in China", "In the Americas", "In Russia and Scandinavia, brought north by Rus' and Viking traders"], "answerIndex": 3, "explanation": "Silver from the Islamic world flowed north in exchange for furs and slaves; one Gotland hoard holds about 14,000 Islamic coins.", "id": "q2"},
    {"type": "mcq", "prompt": "Who used the Cairo Geniza to reconstruct the world of medieval Mediterranean merchants?", "options": ["Ibn Khaldun", "Henri Pirenne", "S. D. Goitein", "Richard Bulliet"], "answerIndex": 2, "explanation": "Goitein's six-volume A Mediterranean Society drew on Geniza letters and contracts.", "id": "q3"},
    {"type": "mcq", "prompt": "What did Timur Kuran argue in The Long Divergence?", "options": ["That Islamic law encouraged large corporations", "That features of Islamic commercial and inheritance law later hindered the growth of large, long-lived companies in the Islamic world", "That Islamic trade never existed", "That Europe invented the bill of exchange"], "answerIndex": 1, "explanation": "Kuran's debated argument focuses on partnership and inheritance rules and the absence of the business corporation.", "id": "q4"},
    {"type": "open", "prompt": "What made the Islamic world between 800 and 1200 a 'globalization before globalization'?", "rubric": "A strong answer explains the joining of the Mediterranean, Indian Ocean, trans-Saharan, Silk Road, and northern river networks under a shared religion, language, and law; institutions (suftaja, sakk, qirad, funduq, hisba); dinars and dirhams found from Scandinavia to China; merchant diasporas revealed by the Geniza (Ben Yiju); goods including textiles, spices, gold, paper, and enslaved people; and great cities such as Baghdad, Cairo, and Córdoba.", "id": "q5"},
    {"type": "open", "prompt": "How far did the Islamic commercial revolution shape Europe's later commercial revolution?", "rubric": "A strong answer discusses parallels and likely influences (qirad and commenda, funduq and fondaco, bills of exchange, Arabic loanwords, Fibonacci's 1202 introduction of Indian-Arabic numerals for merchants, Italian participation in Mediterranean trade), weighs the debate, and considers Kuran's argument about why the Islamic world did not develop corporations. It reaches a reasoned conclusion about influence versus parallel development.", "id": "q6"}
  ]$commerce_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/medieval-history/the-islamic-world/the-islamic-commercial-revolution-800-1200', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

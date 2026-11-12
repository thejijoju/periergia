-- Women and Gender in World History — canonical master article, co-written and human-reviewed.
-- history/thematic-history/women-and-gender-in-world-history @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
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
    'history/thematic-history/women-and-gender-in-world-history',
    'research',
    'advanced',
    'read',
    $mn_womengender_master$> **Half of humanity, and how studying it changed history itself.** Since the 1960s historians have set out to recover women's lives, and then to ask a larger question: how societies defined what it means to be a woman or a man, and how those definitions organised power. This chapter follows both projects across five thousand years and every continent: the founding of women's history and the turn to gender history; Gerda Lerner's argument that patriarchy was made in history; women rulers from Hatshepsut to Wu Zetian and Njinga; women in religion; households, marriage and property; the European witch-hunts; gender under empire; masculinities and people who lived outside a two-gender pattern; the uneven global timing of the vote; and the intersectional critiques that reshaped the field, ending with the struggles of the 2020s.

## From Women's History to Gender History

The Austrian-born historian **Gerda Lerner** taught the first regular college course in women's history in 1963 and founded the first American graduate degree in the field, at Sarah Lawrence College, offered from 1972. After 1970 the field exploded alongside the new social history. Deborah Gray White's *Ar'n't I a Woman?* (1985), on enslaved women in the plantation South, brought women into the history of race and slavery. Joan Kelly asked in 1977 "Did Women Have a Renaissance?", questioning whether a standard period applied to women at all.

**Gender history** grew out of women's history but asks a different question: how differences between the sexes were perceived and arranged in different times and places, usually on the assumption that they are socially constructed rather than fixed by nature. Its charter was Joan Wallach Scott's essay "Gender: A Useful Category of Historical Analysis" (1986). In paraphrase, Scott defined gender in two parts: it rests on perceived differences between the sexes, and it is also a primary way of signifying relationships of power. The second part was the radical one, because, as William Sewell noted, it claimed that gender mattered in all areas of history, not only in women's history. The chapters on What is History? and Social History set it in context. When Scott first presented it at a seminar in 1985, she recalled, the audience "were, to a man, appalled". Joan Hoff accused it of everything from "nihilism" to "obeisance to patriarchy"; Linda Kerber found it "dazzling". Joanne Meyerowitz credited it with a significant part in the profession's shift from social to cultural history.

Gender history also opened the way to the history of men as men, a specialty from the 1990s. Gail Bederman warned that one kind of "men's history" built on women's history, while another would "mostly ignore women's history findings and methodology". The two fields are now usually seen as partners: one keeps women visible as actors, the other shows how the line between the sexes was drawn and used.

## Was Patriarchy Made in History?

Lerner's *The Creation of Patriarchy* (1986) gave the field one of its boldest arguments. Patriarchy, she wrote, "has a beginning in history" and so "can be ended by historical process". She treated its creation in the ancient Near East as a process of some 2,500 years, from about 3100 to about 600 BCE. In her account, men appropriated women's sexual and reproductive capacities; archaic states had an interest in the patriarchal family; men learned to dominate other groups by first dominating women, and slavery began with the enslavement of women from conquered peoples. Laws divided "respectable" from "non-respectable" women, a division marked by veiling, and goddesses gave way to a single male god. Lerner also argued, uncomfortably, that women took part in their own subordination, for self-preservation or for the advantages of class.

Catharine Stimpson compared the book's boldness to Simone de Beauvoir's *The Second Sex*. Critics pressed on its evidence: Virginia Hunter questioned parts of her evidence. Geetanjali Gangoli asked how far a framework built on Western history applies elsewhere, and concluded that it largely does. Others looked to economics. Drawing on Ester Boserup's *Woman's Role in Economic Development* (1970), the anthropologist Jack Goody linked dowry to plough agriculture and private property, where farming was largely men's work, and bridewealth to hoe cultivation, where women did most of the farm work and the groom's family compensated the bride's kin for her labour. Sylvia Yanagisako and others dispute the theory.

## Rulers, Regents and Priestesses

Women have held power in every era, usually as exceptions. **Enheduanna**, daughter of Sargon of Akkad, was EN-priestess of the moon god Nanna at Ur around 2300 BCE. She is celebrated as the earliest known named author, credited with hymns including *The Exaltation of Inanna*. But her authorship is debated: every surviving manuscript dates from at least six centuries after her lifetime, and Miguel Civil suggested that "Enheduanna" may name an office rather than a person, while William Hallo defended her authorship. Her case shows how much the "firsts" of women's history depend on contested evidence.

{{image: Hatshepsut | A statue of Hatshepsut, who ruled Egypt in her own right in the fifteenth century BCE.}}

**Hatshepsut** of Egypt first ruled as regent for her young stepson Thutmose III, who came to the throne around 1479 BCE, then took the full royal titles by about 1472 BCE and reigned until about 1458 BCE. She was not the first woman to rule Egypt in her own right: Sobekneferu of the Twelfth Dynasty came before her. Later her images and names were chiselled off monuments; Donald Redford saw political necessity rather than hatred behind the erasure.

In China, **Wu Zetian** (624–705) is the only undisputed female sovereign and the only woman to reign as emperor (*huangdi*) in her own right. Consort of the Tang emperor Gaozong, she held effective power from about 665, proclaimed her own Zhou dynasty in 690, and was forced out in a palace coup in 705. In West Central Africa, **Njinga Mbande** ruled Ndongo and Matamba from the 1620s until 1663; in the 1630s she took male titles and dress, and her opponents tried to use her gender against her. The chapter on Women in African History tells her story fully.

Power could also run through the household. In the Ottoman Empire, the period from about 1534 to 1715 is known as the "Sultanate of Women", when harem women led by the sultan's mother, the *valide sultan*, wielded great political influence. Leslie Peirce argues that this power was not a corruption of the dynasty but a predictable product of its structure: royal women trained princes, acted as regents and shaped the culture of sovereignty through ceremony, building and patronage.

## Women and the Sacred

Religion both confined women and gave them some of their few paths to learning and authority. Lerner argued that in the West patriarchy "severed the connection between women and the Divine". Yet the record is mixed. The Buddhist *Therīgāthā*, verses attributed to early nuns, some dating to the late third century BCE, is called the earliest known collection of women's literature anywhere, though the tradition also subordinated nuns to monks. The Theravada nuns' order, long lapsed, began to be revived in 1996, though not all Theravada authorities accept it.

In Han China, **Ban Zhao** completed her brother's *Book of Han* and wrote *Lessons for Women*, which urged humility but also argued that girls should be educated; readers still disagree whether it is proto-feminist or a manual of subordination. In Alexandria, the philosopher **Hypatia** was murdered by a Christian mob in 415. In early Islam, the merchant **Khadija** employed Muhammad, proposed marriage to him, and is credited as the first convert; **Aisha** is credited with narrating over 2,000 hadiths. For Christian women the convent offered scholarship: the abbess Hildegard of Bingen was named a Doctor of the Church in 2012, and the nun Sor Juana Inés de la Cruz of New Spain defended women's right to education in her reply of 1691 to a bishop's rebuke; under pressure from church authorities she gave up writing around 1693–94.

Seclusion and veiling are often treated as Islamic, but many scholars argue they are older. Upper-class women's movement was restricted in the Babylonian, Persian and Byzantine empires, and Muslims are thought to have adopted the practice after conquering Iraq in the seventh century. Under the Mughals, purdah spread to upper-class Hindus, though lower-class women did not observe it strictly. Leila Ahmed's *Women and Gender in Islam* (1992) argues in this spirit that later misogyny was not originally or only Muslim but came from Islam's encounter with urban Middle Eastern norms that already existed.

```checkpoint
q: What did Gerda Lerner argue in The Creation of Patriarchy (1986)?
a*: That patriarchy was created over about 2,500 years in the ancient Near East, and so, having a beginning in history, could be ended by historical process.
a: That male dominance is rooted in biology and has existed unchanged since the first humans.
x: Lerner argued the opposite: that misogyny has historical rather than biological causes.
a: That patriarchy was invented by European capitalism in the seventeenth century.
x: Lerner placed its creation in the archaic states of the ancient Near East, from about 3100 to 600 BCE.
a: That women played no part in their own subordination.
x: Lerner argued, controversially, that women took part in it, for self-preservation or class advantage.
hint: Think of where and when she located its origins.
why: Lerner's claim that patriarchy is historical, not natural, is the basis of her hope that it can end.
---
q: Why was Hatshepsut not the first woman to rule Egypt in her own right?
a: Because Wu Zetian had already ruled as a woman sovereign.
x: Wu Zetian ruled China in the seventh century CE, long after Hatshepsut.
a: Because she never took the royal titles herself.
x: She took the full royal titulary by about 1472 BCE.
a*: Because Sobekneferu of the Twelfth Dynasty had done so earlier.
a: Because her stepson Thutmose III was always the real ruler.
x: She ruled first as his regent and then as king in her own right until about 1458 BCE.
hint: Look further back than the New Kingdom.
why: "Firsts" in women's history need checking; Hatshepsut was the second confirmed woman to rule Egypt in her own right.
```

## Households, Marriage and Property

For most of history most women's work was done in and around households. In 1965 John Hajnal identified a "Western European marriage pattern" west of a line from roughly St Petersburg to Trieste: women married late, in their mid-twenties, many never married, and couples set up their own households; further east, early marriage and extended households were the norm. Across Eurasia, from Japan to Ireland, families often passed property to daughters as dowry, while in parts of Africa, East Asia, the Middle East and Melanesia bridewealth flowed the other way. In Islamic law the *mahr* is a gift from groom to bride, distinct from dowry. Law could give women more than outsiders expected: most Ottoman women could use the courts, buy, sell and inherit property, and bring divorce claims, rights European visitors found unusual. India banned dowry in 1961, yet dowry deaths persist.

Did capitalism help or harm women? Alice Clark argued that seventeenth-century English capitalism lowered women's status by stripping away their productive role in the household. Ivy Pinchbeck thought it created the conditions for emancipation. Louise Tilly and Joan Scott, in *Women, Work, and Family* (1978), traced a move from a household economy to a "family wage economy" and then a family consumer economy, and stressed continuity in women's status.

Status could also be written on the body. Chinese footbinding probably began among court dancers in the tenth century, spread among Song elites and, by the nineteenth century, affected an estimated 40–50 per cent of Chinese women, with large regional differences. The chapter on Ming-Qing History discusses the debate over it, including Dorothy Ko's reading of it as Confucian civility and Laurel Bossen and Hill Gates's economic argument.

## The Witch-Hunts

Between about 1400 and 1775 around 100,000 people were prosecuted for witchcraft in Europe and British America, and between 40,000 and 60,000 were executed, almost all in Europe. The estimates have names: about 40,000 (Scarre and Callow), about 45,000 (Levack), 40,000–50,000 (Hutton), and 50,000–60,000 (Behringer and Roper). The often-repeated "nine million" is a myth, going back to Gottfried Christian Voigt in 1784. The peak came between 1560 and 1630, especially in parts of the Holy Roman Empire, and accusations usually came from neighbours.

Gender was central but not simple. Roughly 80 per cent of those convicted were women, most of them over forty, and the *Malleus Maleficarum* (1486) argued that women were more open to demonic temptation through the weaknesses of their sex. But in Iceland, Finland, Estonia and Russia most of the accused were men. The thesis of Barbara Ehrenreich and Deirdre English (1972–73), that the victims were healers and midwives, has not held up: cunning folk were a minority of the accused. Silvia Federici's *Caliban and the Witch* (2004) argues that the hunts reshaped women's roles to serve emerging capitalism. Salem in 1692 is treated in the chapter on Colonial North America. Nor was witch-hunting only European: lynch mobs reportedly killed more than 3,000 alleged witches in Tanzania between 2005 and 2011.

## Empire, Rescue and Colonial Gender

Conquest was gendered from the start. **Malintzin**, a Nahua woman known to the Spanish as Doña Marina, was one of twenty enslaved women given to the Spaniards in 1519 and became Cortés's interpreter and adviser. In Mexico she has been seen as traitor, victim and mother of the nation; Camilla Townsend tries to see her choices through Indigenous eyes.

Colonial rulers often justified their power by claiming to protect colonised women. The British ban on *sati*, the burning of widows, in Bengal in 1829 is told in the chapter on Modern South Asia. Lata Mani's study of the debate drew a sharp conclusion.

```quote
They were, rather, the ground for a complex and competing set of struggles over Indian society and definitions of Hindu tradition.
Lata Mani · Contentious Traditions: The Debate on Sati in Colonial India · 1998
```

The women who burned, Mani argued, "were neither subjects nor even the primary objects of concern" in the debate. Gayatri Chakravorty Spivak's "Can the Subaltern Speak?" (1988) analysed British abolitionist rhetoric as a civilising mission that claimed to rescue women while ignoring their voices, and Chandra Talpade Mohanty's "Under Western Eyes" (1984) criticised Western feminists for constructing a single, victimised "Third World woman".

Empire also remade masculinity and gender variance. Mrinalini Sinha's *Colonial Masculinity* (1995) shows how the figures of the "manly Englishman" and the "effeminate Bengali" ran through four colonial controversies between 1883 and 1891. From the 1850s British officials treated South Asia's *hijras*, a gender community, as a breach of public decency, and in 1871 placed them under the Criminal Tribes Act. (This *hijra* is a different word from the *hijra*, or migration, of Muhammad from Mecca in 622.) Jessica Hinchy argues that the criminalisation also drew on elite Indian attitudes.

## Masculinities, Sexualities and More Than Two

The sociologist **Raewyn Connell** coined "hegemonic masculinity": there are many masculinities in a hierarchy, and the dominant form rests on the domination of women, a hierarchy among men and the stigmatising of homosexuality. John Tosh urged historians to study men's behaviour and family life, not only ideals. Michel Foucault's *History of Sexuality* (1976) argued that the man who committed sodomy, once seen as a sinner, became in the nineteenth century a member of a new "species", the homosexual: sexual identity itself has a history. Medieval debates about desire and marriage are explored in the chapter on Sex, Love, and Marriage in the Middle Ages.

Many societies recognised more than two genders, but historians handle the evidence with care. "Third gender" is a broad modern label, often applied from outside, to very different roles, and recognition does not mean high status; some such roles developed in reaction to the devaluation of women. In April 2014 India's Supreme Court recognised hijras and others as a third gender in law, as Nepal, Pakistan and Bangladesh also do. Among the Bugis of Sulawesi, Indonesia, five genders are recognised, including the revered *bissu* priests; whether some of these are "third genders" is disputed. In the Balkans, "sworn virgins", people assigned female at birth who vowed chastity and lived as men, could head households; the custom, tied to customary law, was described by outside observers from the nineteenth century. In North America, **two-spirit** is a modern umbrella term adopted in 1990 at an Indigenous gathering near Winnipeg to replace the anthropologists' word *berdache*. It does not appear in the historical record, it is not meant to replace specific terms such as Lakota *winkte* or Navajo *nádleehí*, and not all Native cultures had such roles.

```checkpoint
q: What does current scholarship say about the European witch-hunts?
a: That about nine million women were burned as witches.
x: The "nine million" figure goes back to Voigt in 1784 and is a myth; estimates of executions are 40,000–60,000.
a*: That about 40,000–60,000 people were executed, around 80 per cent of the convicted were women, but men were most of the accused in Iceland, Finland, Estonia and Russia.
a: That the victims were mainly midwives and traditional healers.
x: Historians found that cunning folk were a minority of the accused; the 1973 healer thesis has not held up.
a: That the hunts were confined to the Middle Ages.
x: They ran from about 1400 to 1775, peaking between 1560 and 1630.
hint: Think of named estimates rather than popular figures.
why: The witch-hunts were deeply gendered, but numbers, victims and patterns varied across Europe.
---
q: Why do historians handle the term "two-spirit" with care when writing about the past?
a: Because it was invented by European anthropologists in the nineteenth century.
x: The anthropologists' term was "berdache", which two-spirit was adopted to replace.
a: Because it is a translation of a single ancient term used by all Native peoples.
x: It is an umbrella term, not meant to replace specific terms such as Lakota winkte or Navajo nádleehí.
a: Because every Native American society had exactly the same role for such people.
x: Not all Native cultures had such roles, and those that did differed.
a*: Because it is a modern pan-Indian term adopted in 1990 and does not appear in the historical record.
hint: When was the term adopted?
why: Modern labels can illuminate past gender diversity but should not be read back as if they were historical terms.
```

## The Vote and Its Global Timing

The campaign for women's suffrage is often told as a Western story, but its timing was global and uneven, with early or short-lived cases from the Corsican Republic (1755–1769), at least in local elections, to the Pitcairn Islands (1838).

New Zealand, then a self-governing British colony, became the first self-governing country in which all women, Māori included, could vote in parliamentary elections in September 1893, after petitions led by Kate Sheppard; but its women could not stand for parliament until 1919. South Australia gave women the right to stand in 1895, a first for the modern world. Finland introduced women's suffrage in 1906 and in 1907 elected the world's first women MPs, 19 of 200. The chapter on The Interwar Period follows the wave of enfranchisement after 1918. The stragglers are telling: Switzerland granted the federal vote only in 1971, and its canton of Appenzell Innerrhoden was forced by a Federal Supreme Court ruling in 1990 to let women vote locally (they first did so in 1991). In 1900 no woman had ever been elected to a national legislature; by 2015 women made up about 22 per cent of legislators.

Women's rights also became international business. The United Nations held its first conference devoted to women in Mexico City in 1975, where Cold War divisions showed: the United States stressed legal and political rights, the Soviet bloc women as nurturers working for peace. At the parallel NGO Tribune the Bolivian miners' leader Domitila Barrios de Chungara drew attention by speaking for mineworkers' struggles. CEDAW, the UN convention against discrimination against women, followed in 1979, and at Beijing in 1995, 189 governments adopted a Platform for Action.

```quote
If there is one message that echoes forth from this conference, let it be that human rights are women's rights and women's rights are human rights, once and for all.
Hillary Rodham Clinton · Address to the Fourth World Conference on Women, Beijing · 5 September 1995
```

Historians also question the familiar story of feminist "waves". The collection *No Permanent Waves* (2010), edited by Nancy Hewitt, argues that the metaphor cannot capture overlapping movements and erases activism by women who were not white or Western.

## Intersections and Critiques

The category "woman" itself has been questioned. In 1989 the legal scholar **Kimberlé Crenshaw** coined "intersectionality", drawing on a 1976 case in which Black women auto workers could not prove race or sex discrimination separately. The idea had precursors, among them the Combahee River Collective, organised in Boston in 1974, which wrote of "interlocking oppressions". The Nigerian scholar Oyèrónkẹ́ Oyěwùmí argued that among the Oyo-Yoruba seniority, not gender, organised society; the chapter on Women in African History weighs that claim and its critics. These critiques ask historians not to assume that women everywhere shared one experience.

## Recent Struggles

The history continues. In October 2017 the #MeToo hashtag, building on a phrase Tarana Burke had used around 2006, trended in at least 85 countries. On 24 June 2022 the United States Supreme Court in *Dobbs v. Jackson Women's Health Organization* overruled *Roe v. Wade*, as the chapter on Modern American History: the United States in the Twentieth Century describes. Since taking Kabul on 15 August 2021, the Taliban have barred girls in Afghanistan from school beyond the sixth grade (about age 12) and women from universities; the UN has said the policy may amount to gender apartheid. In Iran, the death of Mahsa (Jina) Amini on 16 September 2022, three days after her arrest for allegedly wearing her hijab improperly, set off protests under the Kurdish slogan "Woman, Life, Freedom", as the chapter on The Making of the Modern Middle East relates.

## Further exploration

- **Gerda Lerner, *The Creation of Patriarchy* (1986).** The classic argument that patriarchy was created in the ancient Near East and is therefore historical, not natural.
- **Merry E. Wiesner-Hanks, *Gender in History* (2001; 2nd ed. 2011 as *Gender in History: Global Perspectives*).** A concise global survey from the Palaeolithic to the present.
- **Joan Wallach Scott, *Gender and the Politics of History* (1988; rev. ed. 1999).** Includes "Gender: A Useful Category of Historical Analysis".
- **Leila Ahmed, *Women and Gender in Islam: Historical Roots of a Modern Debate* (1992).** Gender in the Middle East from antiquity to modern Egypt.
- **Lata Mani, *Contentious Traditions: The Debate on Sati in Colonial India* (1998).** How colonial and Indian elites argued over women without hearing them.
- **Leslie P. Peirce, *The Imperial Harem: Women and Sovereignty in the Ottoman Empire* (1993).** Royal women as a structural part of Ottoman sovereignty.
- **R. W. Connell, *Masculinities* (1995).** The influential account of multiple masculinities and "hegemonic masculinity".$mn_womengender_master$,
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
  select $mn_womengender_quiz$[
    {"type": "mcq", "prompt": "Which country elected the world's first women members of a national parliament, in 1907?", "options": ["Finland", "New Zealand", "Switzerland", "Norway"], "answerIndex": 0, "explanation": "Finland introduced women's suffrage in 1906 and in 1907 elected 19 women to its 200-seat parliament. New Zealand women could vote from 1893 but could not stand for parliament until 1919.", "id": "q1"},
    {"type": "mcq", "prompt": "What is the best current scholarly estimate of the number of people executed in the European witch-hunts of about 1400–1775?", "options": ["About nine million", "Between 1 and 2 million", "Between 40,000 and 60,000", "Fewer than 1,000"], "answerIndex": 2, "explanation": "Named estimates range from about 40,000 (Scarre and Callow) to 50,000–60,000 (Behringer and Roper). The 'nine million' figure goes back to Gottfried Christian Voigt in 1784 and is a myth.", "id": "q2"},
    {"type": "mcq", "prompt": "Who was the only undisputed female sovereign in Chinese history, and the only woman to reign as emperor (huangdi) in her own right?", "options": ["Ban Zhao", "Wu Zetian", "Empress Deng Sui", "Hatshepsut"], "answerIndex": 1, "explanation": "Wu Zetian proclaimed her own Zhou dynasty in 690 and ruled until a palace coup in 705. Ban Zhao was a historian who tutored Empress Deng; Hatshepsut ruled Egypt.", "id": "q3"},
    {"type": "mcq", "prompt": "What did Leslie Peirce argue about the Ottoman 'Sultanate of Women' (about 1534–1715)?", "options": ["That harem women had no political influence", "That it was invented by European travellers", "That it marked the corruption and decline of the dynasty", "That royal women's power was a foreseeable product of the dynasty's structure"], "answerIndex": 3, "explanation": "Peirce's The Imperial Harem (1993) argues that royal women trained princes, acted as regents and shaped the culture of sovereignty, as a normal part of the dynasty's structure rather than a corruption of it.", "id": "q4"},
    {"type": "open", "prompt": "Explain the difference between women's history and gender history, using Joan Scott's 1986 essay.", "rubric": "A strong answer explains that women's history recovers women as historical subjects (Lerner's courses and programmes from 1963 and 1972; works such as Deborah Gray White's on enslaved women; Joan Kelly asking whether women had a Renaissance), while gender history studies how differences between the sexes were perceived and organised, usually as socially constructed. It paraphrases Scott's two-part definition (gender rests on perceived differences between the sexes and is a primary way of signifying relationships of power) and explains why the second part implied that gender matters in all areas of history, including masculinity. Credit mention of reactions (Hoff's attack, Kerber's praise, Meyerowitz on the shift to cultural history) or of Bederman's two kinds of men's history.", "id": "q5"},
    {"type": "open", "prompt": "How have historians and critics questioned colonial claims to 'rescue' women? Use the sati debate and at least one other example.", "rubric": "A strong answer notes the British ban on sati in Bengal (1829) and explains Lata Mani's argument that the women who burned were not the subjects of the debate but the 'ground' for struggles over Hindu tradition and colonial rule; Spivak's analysis of abolitionist rhetoric as a civilising mission that ignored women's voices; and Mohanty's critique of the homogenised 'Third World woman'. A second example might be the colonial criminalisation of hijras under the Criminal Tribes Act (1871), which Hinchy says also drew on elite Indian attitudes, or Sinha's 'manly Englishman' and 'effeminate Bengali'. Credit noting the counter-argument that such readings may neglect women's material suffering.", "id": "q6"}
  ]$mn_womengender_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/thematic-history/women-and-gender-in-world-history', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

-- Borders and Borderlands — canonical master article, co-written and human-reviewed.
-- history/thematic-history/borders-and-borderlands @ research/advanced/read.
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
    'history/thematic-history/borders-and-borderlands',
    'research',
    'advanced',
    'read',
    $mn_borders_master$> **How humanity drew its lines.** For most of history, the edges of states were zones rather than lines: marches, frontiers and debatable lands where peoples mixed, raided and traded. This chapter follows the long and uneven change from those zones to the surveyed, mapped and policed boundary. It runs from the frontiers of Rome, China and the caliphate, through the myths of Westphalia and of "natural frontiers", to the mapping of Siam and the Qing–Russian border, the colonial line-drawings in Africa and South Asia, and the passport. It then turns to borderlands as worlds of their own, above all the US–Mexico border, and ends with Schengen's open interior and the walls, deaths and industries of borders today. Throughout, it follows the historians who have argued about what a border is.

## Zones Before Lines

The words themselves carry the history. "Frontier" entered English from French in the fifteenth century meaning a borderland, the region of a country that fronts on another. "March" goes back to an ancient root meaning "edge" or "boundary", which also gave Latin *margo*, Old English *mearc* and the Persian and Armenian *marz*, "borderland". A margrave was the count of a march.

In premodern times many borders were not lines at all but zones that both sides claimed and fought over. Charlemagne organised marches such as the Hispanic March, and in Wales Norman Marcher Lords ruled the *marchia Wallia*, distinct from the *pura Wallia* beyond. Such zones survived surprisingly late: Saudi Arabia shared a neutral zone with Iraq from 1922 until it was partitioned in the early 1980s, and another with Kuwait from 1922 to 1970.

Historians have built a vocabulary for this change. Jeremy Adelman and Stephen Aron, writing in 1999 about North America, distinguished a *frontier*, a meeting place of peoples where no single political authority controlled clearly marked territory, from *borderlands*, the contested zones between colonial empires, and from the *bordered lands* that national borders later made of them. In imperial borderlands, they argued, relations between peoples tended to be more inclusive; as national borders replaced them, relations became more exclusive, and borderlanders became "ethnics", minorities set apart from a national majority.

## The Frontiers of Empire

Rome's frontier ran for more than 10,000 kilometres, from northern Britain to the Black Sea, the Red Sea and across North Africa to the Atlantic. Much of it was river, mountain or desert rather than wall. Tacitus, in AD 98, is the first writer to use *limes* for a land border, and the German *limes* began as a road before gaining palisades, ditches and towers from about AD 162. Whether all this amounted to a planned system is a long debate. Edward Luttwak argued in 1976 for a Roman "grand strategy" of defence; Benjamin Isaac questioned in 1988 whether *limes* meant a fortified line at all, and many ancient historians doubt that Rome had an imperial grand strategy.

{{image: Hadrian's Wall | Hadrian's Wall in northern England, begun in AD 122: a frontier that controlled and taxed movement as well as defending it.}}

**Hadrian's Wall**, begun in AD 122, ran eighty Roman miles (117 kilometres) from the Tyne to the Solway; only about three-fifths was first built in stone. The *Historia Augusta* says Hadrian built it "to separate the Romans from the barbarians", but it also kept people in, channelled movement through gates where it could be monitored and taxed, and made a statement. The archaeologist Neil Faulkner called it "as much a propaganda statement as a functional facility", and some recent scholars question how great the northern threat really was.

China's walls, as the chapter on Chinese History describes, were a series of fortifications from many periods rather than one wall, and most surviving brick-and-stone sections are Ming. They too served border control, duties on Silk Road goods and the regulation of trade. Arthur Waldron's study of it is subtitled *From History to Myth*, and later dynasties usually avoided the very name "Long Wall" because of its association with the First Emperor's tyranny. One modern myth, found as early as William Stukeley's letter of 1754, is that it can be seen from the Moon. It cannot be seen there with the naked eye, and NASA says it is barely visible even from low orbit. Owen Lattimore's *Inner Asian Frontiers of China* (1940) recast the whole frontier as an interaction between two kinds of society, settled farmers and pastoralists, each changing the other, rather than as China radiating outward.

The early Islamic world had its own frontier system. Facing Byzantium across Cilicia, northern Syria and Upper Mesopotamia from the early eighth century to the mid-tenth, the caliphate held a chain of forward strongholds, *al-thughūr* (from a word meaning "cleft" or "opening"), backed by a rear zone, *al-ʿawāṣim*, which Harun al-Rashid made a province in 786. Tarsus held four to five thousand troops and hostels for volunteers for the faith from across the Muslim world; settlers included Persians, Slavs, Arab Christians and Zuṭṭ (Jats) from India. The Byzantines mirrored it with their own border guards, the *akritai*.

Later European frontiers worked the same way. The Habsburg Military Frontier (1553–1881) faced the Ottomans with communities of soldier-settlers, Serbs, Croats, Germans, Vlachs and others, who held land in return for service. On the Anglo-Scottish border, reiver families raided both sides regardless of nationality, a special "March law" was administered at Truce Days, and disputed ground such as the Debatable Land was claimed by both sides; the border was not fully marked until the Ordnance Survey mapped it in the mid-nineteenth century.

## Historians on the Frontier

The most famous frontier in historiography is an American one. On 12 July 1893 Frederick Jackson Turner told the American Historical Association, meeting in Chicago, that settling the frontier had formed American democracy and character. He began from an 1890 census bulletin which declared that there could "hardly be said to be a frontier line" any more.

```quote
the frontier is the outer edge of the wave—the meeting point between savagery and civilization.
Frederick Jackson Turner · "The Significance of the Frontier in American History" · 1893
```

The language shows what critics have found missing: Turner said little about Indigenous Americans, African Americans or women. Others point to the westward spread of slavery, the dispossession of Mexican Americans after 1848 and the Chinese Exclusion Act of 1882. The "New Western History" associated with Patricia Nelson Limerick from the late 1980s told the West's story as conquest rather than open land. Turner's own student Herbert Eugene Bolton looked south instead: *The Spanish Borderlands* (1921) named a field, and his 1932 address "The Epic of Greater America" called for a history of the whole hemisphere.

The newest work reverses Turner's direction of travel. Pekka Hämäläinen's *The Comanche Empire* (2008) presents the Comanche as an empire. By the 1830s Comanche raids reached deep into Mexico, and Brian DeLay has treated those raids as a background to the US–Mexican War. As the chapter on Indigenous Economies and Environments explains, Indigenous scholars have questioned Hämäläinen's use of "empire", a European category, for Indigenous powers.

## Westphalia, Natural Frontiers and the Map

Textbooks often date the modern system of sovereign, bordered states to the Peace of Westphalia, the treaties signed at Osnabrück and Münster in October 1648 that ended the Thirty Years' War. Scholars and statesmen from the international lawyer Leo Gross in 1948 to Henry Kissinger in 2014 treated it that way. Its critics call this the "Westphalian myth".

```quote
the treaties confirm neither [France's or Sweden's] 'sovereignty' nor anybody else's; least of all do they contain anything about sovereignty as a principle.
Andreas Osiander · "Sovereignty, International Relations, and the Westphalian Myth" · 2001
```

Far from forbidding interference, Westphalia gave France and Sweden rights to intervene in the Empire; the principle of non-interference is better traced to Emer de Vattel in the mid-eighteenth century. Today, the staunchest defenders of "Westphalian" non-interference are often non-Western states, as in a joint statement by Jiang Zemin and Vladimir Putin in 2001.

A second myth is the "natural frontier". The doctrine of natural boundaries developed in eighteenth-century Western thought. For France it meant the Rhine, the Alps, the Pyrenees and the sea. A statement attributed to Richelieu in 1642 is apocryphal; the idea was revived by Anacharsis Cloots in 1786 and became Revolutionary doctrine when, in January 1793, Georges Danton told the Convention that "the limits of France are marked by nature". Ernest Renan replied in 1882 that France's frontiers in 1789 "had nothing natural or necessary about them", and Arnold Toynbee warned in 1916 that each "natural" frontier invites a further one. Peter Sahlins (1990) concludes that most historians of France now dismiss the doctrine as "too teleological", though it formed part of "a constitutive myth of the state". Nor does nature hold still: the shifting Rio Grande produced repeated US–Mexico disputes, such as the Chamizal, settled by a treaty of 1963.

Real lines were drawn by diplomats and surveyors. The Treaty of the Pyrenees (1659) gave France Roussillon and half of Cerdanya, but because it transferred "villages" and Llívia was a town, Llívia remains a Spanish exclave. Sahlins's *Boundaries* (1989) combined the diplomatic history of that line with a historical ethnography of the Catalan villagers of the divided Cerdanya valley, ending with a conclusion on "Identity and Counter-Identity".

```checkpoint
q: What did Andreas Osiander argue about the Peace of Westphalia (1648)?
a*: That its treaties confirmed no one's sovereignty and said nothing about sovereignty as a principle.
a: That it created the modern principle of non-interference between equal states.
x: That is the view Osiander criticised; non-interference is better traced to Vattel in the eighteenth century.
a: That it forbade France and Sweden from intervening in the Empire.
x: The treaties in fact gave France and Sweden rights to intervene in the Empire.
a: That it fixed the border between France and Spain.
x: That was the Treaty of the Pyrenees of 1659.
hint: Think of the phrase "the Westphalian myth".
why: The idea of Westphalia as the birth of sovereign states is a later reading, not what the treaties said.
---
q: Which of these best describes what historians say about France's "natural frontiers"?
a: The doctrine was set out by Richelieu in 1642 and guided French policy from then on.
x: The statement attributed to Richelieu is apocryphal.
a: Ernest Renan proved that the Rhine was France's natural border.
x: Renan said France's frontiers in 1789 had nothing natural or necessary about them.
a*: It became a Revolutionary doctrine in the 1790s, and most historians now see it as a teleological myth.
a: Rivers make natural borders that never change.
x: The shifting Rio Grande caused repeated US–Mexico disputes, such as the Chamizal.
hint: Think of Danton in 1793 and Sahlins in 1990.
why: "Natural" borders are political claims dressed as geography.
```

## Mapping Beyond Europe

Boundary-making was not a European export alone. The Treaty of Nerchinsk of 1689, between the Kangxi Emperor's Qing China and Russia, was China's first formal treaty with a Western power. It was negotiated in Latin, with two Jesuits interpreting for the Qing, and its texts were in Latin, Russian and Manchu. It ran the border along rivers and a watershed, left the area west of the Argun undefined, required fugitives to be returned, allowed travel and trade "with proper documents", and called for boundary stones.

In Southeast Asia, Thongchai Winichakul's *Siam Mapped* (1994) argued that modern mapping did not record a Thai territory that already existed: it created the nation's "geo-body". The stakes were real. In the Franco-Siamese crisis of 1893 Siam ceded land east of the Mekong to French Indochina, splitting the Lao-speaking world. The chapter on Modern Southeast Asia places Thongchai's work in the wider rewriting of national histories in the region.

Some treaties tried to protect movement across new lines. A codicil of 1751 to the treaty fixing the Norwegian–Swedish border secured the Sámi right to keep herding reindeer across it. Norway long argued that the codicil had lapsed, but in 2021 Norway's Supreme Court held that it still governs Swedish Sámi herding rights there.

## The Great Line-Drawings

Colonial empires drew lines on a new scale. Europeans held about a tenth of Africa in the 1870s; by 1914 only Ethiopia and Liberia lay outside their control. The chapter on Imperial Expansion and Resistance explains why the Berlin Conference of 1884–85 did not itself "carve up" the continent: most borders came from later bilateral treaties. Still, the borders cut through peoples. Stelios Michalopoulos and Elias Papaioannou counted 231 ethnic homelands with at least a tenth of their area in more than one country, and working-paper versions of their study found roughly 25 to 50 per cent more intense conflict where partitioned groups live, the figure differing between versions.

Independent Africa chose to keep the lines. In July 1964 the Organisation of African Unity, meeting in Cairo, had its members pledge to respect the borders they held at independence, out of fear of civil war and instability. The principle, *uti possidetis juris*, under which new states inherit the administrative borders of the dependency before them, had been applied in Spanish America from the 1820s and was later used in the breakup of the Soviet Union and Yugoslavia.

In South Asia, the Durand Line of 1893, a single page of seven short articles agreed between Mortimer Durand and Emir Abdur Rahman Khan, cut through Pashtun lands; an Afghan assembly repudiated it in 1949, and it remains largely unrecognised in Afghanistan. The McMahon Line, agreed between British and Tibetan representatives in 1914 as part of the Simla Convention, was never accepted by China and became the eastern sector of the Sino-Indian War of 1962; it remains the de facto boundary. The chapter on Partition describes how Cyril Radcliffe, who had never visited India, drew the 1947 line in about five weeks. Partition also left a stranger legacy in the enclaves of Cooch Behar, which dated from a 1713 settlement and became international when Rangpur went to East Pakistan in 1947 and Cooch Behar joined India in 1949: more than a hundred Indian pockets inside Bangladesh and seventy-one Bangladeshi pockets in India, which included the world's only third-order enclave, Dahala Khagrabari, an Indian enclave inside a Bangladeshi enclave inside an Indian enclave inside Bangladesh. A 1974 agreement was carried out only at midnight on 31 July 2015, when about 14,000 people became Indian and about 36,000 Bangladeshi citizens. A popular legend that the enclaves were stakes in card or chess games between local rulers is only legend.

In the Middle East, the Sykes–Picot agreement of 1916 became shorthand for "artificial" borders. In July 2014 Abu Bakr al-Baghdadi vowed in Mosul to hit "the last nail in the coffin of the Sykes–Picot conspiracy"; the chapter on The Making of the Modern Middle East explains why historians call that story a myth.

The Cold War added lines of its own. The Korean armistice of 27 July 1953 created a Demilitarised Zone about 4 kilometres wide and 250 long; the 38th parallel behind it had been chosen in August 1945, as the chapter on The Yalta Conference recalls. The inner German border was fortified from 1952, and on 13 August 1961 East Germany began the Berlin Wall, two months after Walter Ulbricht had declared that "no one has the intention of erecting a wall". At least 140 people died at it before it opened on 9 November 1989.

## Papers

Lines were enforced through documents. Safe conducts are ancient, but for about thirty years before 1914 passports were on the whole not needed for travel within Europe. John Maynard Keynes looked back on a Londoner who could travel to any country "without passport or other formality". The First World War changed that: governments introduced passports for security and to keep skilled workers at home, and kept them. As the chapter on Migration and Diaspora describes, the League of Nations standardised the passport in 1920, the Nansen passport gave papers to stateless refugees, and John Torpey has described the state's monopoly of the "legitimate means of movement".

The United States built a police force for its land border. Mounted guards from 1904 chiefly chased Chinese migrants evading the Exclusion Act; the Border Patrol was created in May 1924 and had nearly 20,000 agents in 2019. Kelly Lytle Hernández's *Migra!* (2010) was the first significant academic history of it.

## A Borderland of Its Own: The US–Mexico Border

By the Treaty of Guadalupe Hidalgo, signed on 2 February 1848, Mexico ceded about 55 per cent of its territory, counting Texas, for \$15 million. Mexicans living there could choose US citizenship within a year, and over 90 per cent did, but the Senate struck out the article guaranteeing their land grants, which were often not honoured. In December 1853 the Gadsden Purchase added southern Arizona and south-western New Mexico for a railway route. It split the lands of the Tohono O'odham, who, unlike some peoples on the Canadian border, were not offered dual citizenship; militarisation in the 1980s and 1990s cut their traditional crossings, and in June 2026 the Nation sued to stop wall construction on its land.

The border runs 3,145 kilometres, along the deepest channel of the Rio Grande and then overland to the Pacific, and is described as the most frequently crossed in the world. Its economy was built across it: the Bracero Program brought Mexican farmworkers north from 1942 to 1964, Mexico's border industrial programme created the *maquiladora* assembly plants in the mid-1960s, and NAFTA (1994) turned northern Mexico into an export-processing zone.

The border has also been theorised from inside. Gloria Anzaldúa, born in the Rio Grande Valley of south Texas, wrote *Borderlands/La Frontera: The New Mestiza* (1987) in a mix of Spanish and English, describing a "mestiza consciousness" and the borderland as a psychological, sexual and spiritual space as well as a physical one.

```checkpoint
q: What did the Organisation of African Unity decide about colonial borders in 1964?
a: To redraw them along ethnic lines.
x: The OAU chose the opposite, from fear of civil war and instability.
a*: That member states would respect the borders they held at independence.
a: To abolish all borders between member states.
x: The resolution was about keeping existing borders, not removing them.
a: To return to the borders set at the Berlin Conference.
x: Berlin set few borders; the OAU pledged to keep those existing at independence.
hint: Think of *uti possidetis juris*.
why: African states deliberately chose stability over redrawing the colonial map.
---
q: How did the Gadsden Purchase affect the Tohono O'odham?
a: It placed all their lands inside the United States.
x: It divided their lands, leaving part of them in Mexico.
a: It gave them dual US and Mexican citizenship.
x: Unlike some groups on the Canadian border, they were not offered dual citizenship.
a: It had no effect, since the border was never enforced there.
x: Militarisation in the 1980s and 1990s cut traditional crossings, and wall-building is disputed today.
a*: It split their territory between the United States and Mexico.
hint: Think about where the new line ran in 1853–54.
why: Borders drawn between states often cut through Indigenous nations that predate both.
```

## Walls, Deaths and the Open Interior

The modern US–Mexico barrier began with 14 miles of fencing at San Diego–Tijuana in 1990; the Secure Fence Act of 2006 authorised 700 miles. Construction was paused in January 2021; in January 2025 Donald Trump pledged to finish it, and by November 2026 US Customs and Border Protection reported 96.1 of 626 planned miles of new primary wall completed. The strategy behind it, "Prevention Through Deterrence" (1994), sealed urban crossings at El Paso and San Diego and pushed migrants into the Sonoran Desert. Border Patrol recorded 8,050 deaths on the south-west border between fiscal 1998 and 2020 alone, with record numbers since; rights groups suggest far more. Jason De León's *The Land of Open Graves* (2015) combined ethnography, archaeology and forensic science to study those deaths.

The hardening is global. By one count reported in *The Atlantic*, half of all border barriers built since 1945 date from after 2000. Counts depend on the counter: Élisabeth Vallet's figures, the usual source, run from between 11 and 16 walls when the Berlin Wall fell to 74 by early 2022, and other figures are also quoted. The International Organization for Migration has documented more than 80,000 deaths and disappearances on migration routes worldwide since 2014, over 30,000 of them in the Mediterranean, and says these are undercounts. Do walls work? Governments speak of deterrence. Wendy Brown's *Walled States, Waning Sovereignty* (2010) reads the new walls as largely symbolic theatre, staged by states whose sovereignty is eroding under globalised capital, and the desert record suggests walls redirect migrants to deadlier routes rather than stopping them. In Robert Frost's "Mending Wall" (1914), "good fences make good neighbors" is the neighbour's proverb, not the poet's view; the speaker's is that "something there is that doesn't love a wall".

Europe shows both tendencies at once. The Schengen Agreement, signed on 14 June 1985 aboard a boat on the Moselle by five states, took effect in 1995 and now covers 29 countries and about 453 million people without routine internal checks; Bulgaria and Romania joined fully in January 2025. Yet its outer edge has hardened, with the border agency Frontex (founded 2004) and a biometric Entry/Exit System fully operational from April 2026, and member states may reintroduce temporary internal checks, as Germany, France, Poland, Sweden and others had done by 2026. Critics call the result "Fortress Europe". The long history of borders suggests why: a line opened in one place is often drawn more sharply in another, and the people who live along it rarely chose where it ran.

## Further exploration

- **Peter Sahlins, *Boundaries: The Making of France and Spain in the Pyrenees* (1989).** The classic study of a divided valley and how national identities formed along a border.
- **Thongchai Winichakul, *Siam Mapped: A History of the Geo-Body of a Nation* (1994).** How modern mapping made Thailand; a non-Western classic of border history.
- **Gloria Anzaldúa, *Borderlands/La Frontera: The New Mestiza* (1987).** Chicana feminist theory and memoir of the Texas–Mexico borderland.
- **Pekka Hämäläinen, *The Comanche Empire* (2008).** An Indigenous power that dominated the Spanish, Mexican and US borderlands.
- **Charles S. Maier, *Once Within Borders: Territories of Power, Wealth, and Belonging since 1500* (2016).** A global history of territoriality.
- **Kelly Lytle Hernández, *Migra! A History of the U.S. Border Patrol* (2010).** The first significant academic history of the Patrol.
- **John Torpey, *The Invention of the Passport: Surveillance, Citizenship, and the State* (2000).** How states took control of movement.$mn_borders_master$,
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
  select $mn_borders_quiz$[
    {"type": "mcq", "prompt": "In what language was the Treaty of Nerchinsk (1689) between Qing China and Russia negotiated?", "options": ["Manchu, through Mongol interpreters", "Latin, with Jesuits interpreting for the Qing", "Russian, through Cossack envoys", "French, the diplomatic language of Europe"], "answerIndex": 1, "explanation": "The treaty was negotiated in Latin, with two Jesuits interpreting for the Qing, and its texts were in Latin, Russian and Manchu. It was China's first formal treaty with a Western power.", "id": "q1"},
    {"type": "mcq", "prompt": "Which statement about the Great Wall of China is correct?", "options": ["It is a single continuous wall built by the First Emperor", "It can be seen with the naked eye from the Moon", "Its builders aimed only at military defence, not trade", "It cannot be seen from the Moon with the naked eye, and NASA says it is barely visible even from low orbit"], "answerIndex": 3, "explanation": "The Wall is a series of fortifications from many periods, which also served border control and the regulation of trade; the Moon story is a myth, found as early as William Stukeley in 1754.", "id": "q2"},
    {"type": "mcq", "prompt": "What happened to the Cooch Behar enclaves between India and Bangladesh in 2015?", "options": ["They were exchanged at midnight on 31 July 2015, and most of their residents became citizens of the surrounding country", "They were merged into a new independent state", "They were fenced off and closed to their residents", "Nothing: the 1974 agreement has still not been carried out"], "answerIndex": 0, "explanation": "The 1974 Land Boundary Agreement was implemented only in 2015; about 14,000 people became Indian and about 36,000 Bangladeshi citizens.", "id": "q3"},
    {"type": "mcq", "prompt": "Who signed the Schengen Agreement in June 1985?", "options": ["All ten members of the European Economic Community", "Germany and France alone", "Five states: Belgium, France, Luxembourg, the Netherlands and West Germany", "Every European state except Britain and Ireland"], "answerIndex": 2, "explanation": "Five of the then ten EEC states signed aboard a boat on the Moselle near Schengen; the agreement took effect in 1995 and now covers 29 countries.", "id": "q4"},
    {"type": "open", "prompt": "Adelman and Aron distinguished frontiers, borderlands and 'bordered lands'. Explain the distinction and apply it to one example from the chapter, such as the US–Mexico border, the Tohono O'odham or the Sámi.", "rubric": "Strong answers define a frontier as a meeting place of peoples without one authority over clearly marked territory, borderlands as contested zones between empires, and bordered lands as what national borders made of them; note their argument that relations became more exclusive and borderlanders became 'ethnics' or minorities; and apply this with accurate detail, e.g. Guadalupe Hidalgo (1848) and the Gadsden Purchase (December 1853) splitting the Tohono O'odham, who were not offered dual citizenship and whose crossings were cut by militarisation in the 1980s–90s; or the 1751 codicil protecting Sámi herding across the Norwegian–Swedish border and its disputed force today.", "id": "q5"},
    {"type": "open", "prompt": "Do border walls work? Use evidence and arguments from the chapter to answer.", "rubric": "Strong answers present the debate rather than a single verdict: governments cite deterrence; Hadrian's Wall and the Great Wall show walls also controlled, taxed and symbolised; Wendy Brown reads new walls as symbolic theatre of waning sovereignty; Prevention Through Deterrence (1994) pushed migrants into the Sonoran Desert, with thousands of deaths recorded by Border Patrol (8,050 in fiscal 1998–2020 alone) and De León's study of them; IOM's more than 80,000 deaths on routes worldwide since 2014. Credit care with figures, e.g. attributing wall counts to Vallet (about 11–16 in 1989, 74 by early 2022) rather than stating a single current total.", "id": "q6"}
  ]$mn_borders_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/thematic-history/borders-and-borderlands', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

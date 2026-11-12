-- Oil and Empire — canonical master article, co-written and human-reviewed.
-- history/thematic-history/oil-and-empire @ research/advanced/read.
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
    'history/thematic-history/oil-and-empire',
    'research',
    'advanced',
    'read',
    $mn_oil_master$> **The fuel of the twentieth century, seen from both ends of the pipeline.** Oil made fortunes and navies, redrew the Middle East and tied great powers to distant deserts and deltas. It also remade the places where it was found: company towns ranked by race, oil fields where workers struck, and states that took their resources back. This chapter follows oil from Standard Oil and Baku through Persia, Iraq, Saudi Arabia, Mexico, Venezuela and Nigeria to OPEC, the 1973 embargo, petrodollars and the Gulf wars; asks whether oil is a "curse"; looks at how its history has been written; and ends with dated notes on 2026.

## Kerosene, Baku and the first oil giants

Oil's first great market was light. The chapter on The Second Industrial Revolution tells how the industry began; here the point is the scale of what Rockefeller built. Standard Oil, incorporated in 1870, became a trust in 1882, and by 1904 controlled 91 per cent of American oil refining. That year **Ida Tarbell** published her exposé, *The History of the Standard Oil Company*, as a book. On 15 May 1911 the Supreme Court found Standard guilty of illegal monopolisation and broke it into more than 30 companies, among them the future Exxon, Mobil and Chevron. From the 1890s it even sold kerosene in China under the name *Mei Foo*.

The other early centre was **Baku**, on the Caspian, in the Russian Empire. In 1871 Ivan Mirzoev, an Armenian who held the tax-farm monopoly, built its first wooden derrick. The Nobel brothers and the Rothschilds invested heavily, but local capital mattered too: Armenians reportedly ran almost a third of the industry by 1900, and the Azerbaijanis Zeynalabdin Taghiyev and Musa Nagiyev were leading producers. Between 1898 and 1901 Baku produced more oil than the United States.

Baku was also where oil labour first showed its strength. At the Black Sea terminal of Batumi in 1902, the young Stalin called a strike at the Rothschild refinery, and Cossacks killed 13 people in a crowd trying to free arrested strike leaders. In December 1904 a Baku general strike ended with what is commonly called the first collective labour agreement in the Russian oil industry, the "mazut constitution"; who called the strike is disputed. Meanwhile Standard's great rival took shape: Royal Dutch, founded in 1890 to develop a field in Sumatra, merged with Marcus Samuel's Shell in 1907, in a deal arranged by the Armenian financier **Calouste Gulbenkian**, explicitly to compete with Standard.

## Persia and the Admiralty

On 28 May 1901 Mozaffar ad-Din Shah of Persia granted **William Knox D'Arcy**, a London-based millionaire, exclusive rights for 60 years over about three-quarters of the country, for £20,000 in cash, £20,000 in shares and 16 per cent of annual net profits. On 26 May 1908 George Reynolds struck oil at Masjed Soleyman, having paid the local Bakhtiari tribes to protect the works. The **Anglo-Persian Oil Company** followed in 1909, and its refinery at Abadan had become the largest in the world by 1950.

Britain's interest was strategic. As First Lord of the Admiralty from 1911, **Churchill** moved the Royal Navy from coal to oil for its greater range. But Britain had abundant coal and almost no oil, so security of supply meant control at the source. On 20 May 1914 the government agreed to take a 51 per cent stake in Anglo-Persian for £2.2 million. In November, as the chapter on The First World War (WW1) notes, British Indian troops landed in Mesopotamia to protect Persian oil.

Persians saw a different company. Before 1933 almost all its workmen were Iranian, but there were almost as many Indian foremen as Iranian ones, and few senior posts went to Iranians. In 1932 Reza Shah cancelled the concession; its 1933 replacement shrank the concession area but extended the term from 1961 to 1993. Historians differ on why the Shah acted. Bamberg, BP's official historian, blames the Depression; Stephanie Cronin blames company accounting that left out subsidiaries' profits. The company became Anglo-Iranian in 1935 and British Petroleum in 1954.

## Drawing the Red Line

The Ottoman defeat opened a scramble for oil, which the chapter on The Making of the Modern Middle East places in the making of the mandates. Gulbenkian's Turkish Petroleum Company struck oil near Kirkuk in 1927. On 31 July 1928 its partners, Anglo-Persian, Royal Dutch Shell, the French CFP and a group of American companies, each took 23.75 per cent, with 5 per cent for Gulbenkian, "Mr Five Percent". In this **Red Line Agreement** all bound themselves not to seek oil independently within the former Ottoman lands enclosed by a red line. Renamed the Iraq Petroleum Company (IPC), the group monopolised exploration there for about 20 years. Iraq reclaimed its oil in stages, taking back 99.5 per cent of IPC's concession area in 1961 and nationalising the company in 1972.

By the 1930s seven firms, later dubbed the **"Seven Sisters"** by Enrico Mattei of Italy's state oil company Eni, dominated world production: Anglo-Persian, Gulf, Shell, Texaco and three Standard successors. They owned nearly all the rights in Iran, Iraq, Saudi Arabia and the Gulf, and the political scientist Jeff Colgan argues that they coordinated to restrain supply and minimise payments to host governments, with British and American backing.

Saudi Arabia lay outside the Red Line monopoly. In 1933 it gave Standard of California a concession, preferring it to an IPC bid. In March 1938 the well Dammam No. 7, at Dhahran, struck oil, led by the geologist Max Steineke with the Bedouin guide Khamis bin Rimthan; Kuwait's Burgan field was found the same year. The Saudi venture became the **Arabian American Oil Company (Aramco)** in 1944, and when Jersey Standard and Socony joined it in 1947 the Red Line lapsed in practice. The concession set out the order of command:

```quote
The enterprise under this contract shall be directed and supervised by Americans who shall employ Saudi nationals as far as practicable, and in so far as the company can find suitable Saudi employees it will not employ other nationals.
Saudi concession · Article 23 · 1933
```

## Oil and the world wars

The wars confirmed oil as a strategic prize. In 1942 Hitler's summer offensive aimed at the Caucasus oil of Maikop, Grozny and Baku, and failed after Stalingrad. As Baku's men left for the front, women took their places: by summer 1942 more than 25,000 women, a third of the oil workforce, worked 18-hour shifts, and by 1944 they were about 60 per cent. In 1941 Britain and the Soviet Union jointly invaded Iran. The oil embargo on Japan is told in the chapters on The Second World War (WW2) and Japan's Empire in Asia.

## Camps, hierarchies and strikes

Oil was produced in places built on hierarchies of race and nation. In *America's Kingdom* (2006) the political scientist **Robert Vitalis** argues that Aramco's Dhahran camps were run as a Jim Crow system modelled on oil camps in the United States and Latin America, with housing worsening down a ladder from white Americans to Arab workers, and that company-sponsored histories hid this behind a myth of Aramco's benevolent "miracle" in the desert. Former Aramco employees disputed his account. In October 1953 about 13,000 Saudi workers struck at Dhahran, the kingdom's first major strike, demanding better pay and living conditions like the Americans'; the government ended it by threatening to send strikers back to their villages.

In Iran, Anglo-Iranian reported after-tax profits of £40 million in 1947 while Iran received £7 million, and Abadan's workers lived in a shanty town called Kaghazabad, "Paper City", without running water or electricity. The Khuzestan general strike of July 1946 brought Iranian and Indian workers together under the Tudeh-led unions; under martial law, clashes between strikers and Arab groups killed about 24 people, most of them Arabs, by a British report. In Mexico's Huasteca, the historian **Myrna Santiago** describes an "ecology of oil" that overturned the communal lands of the Teenek people, in which class and colour shaped who bore the environmental costs; Mexico's oil workers became among the most radical in its labour movement.

Oil also shaped gender. The political scientist **Michael Ross** argues that oil wealth reduces women's presence in the labour force by crowding out the export manufacturing that employs women; critics reply that his data fit an explanation based on Islam as well. **Cara Daggett**'s 2018 article on "petro-masculinity" argues that fossil fuels secure cultural meaning and political subjectivities as well as profits, and that their use can work as a compensatory assertion of masculinity bound up with Western authoritarian politics; the idea has also drawn partisan ridicule.

```checkpoint
q: What was the Red Line Agreement of 1928?
a*: An agreement by the partners in the Turkish (later Iraq) Petroleum Company not to seek oil independently within the former Ottoman lands enclosed by a red line.
a: A treaty fixing the border between Iraq and Saudi Arabia.
x: It was an agreement among oil companies, not a frontier treaty between states.
a: OPEC's first agreement on production quotas.
x: OPEC was founded only in 1960.
a: An Anglo-American agreement dividing Persia's oil between the two governments.
x: Persia's oil was held by Anglo-Persian; the Red Line covered the former Ottoman lands, not Iran.
hint: Think of Gulbenkian, "Mr Five Percent".
why: The Red Line let a few Western companies monopolise exploration in most of the former Ottoman lands for about 20 years.
---
q: What does Robert Vitalis argue in America's Kingdom (2006)?
a: That Aramco treated Saudi and American workers equally from the start.
x: Vitalis argues the opposite: the camps were ranked by race.
a: That oil wealth reduces women's participation in the labour force.
x: That is Michael Ross's argument in The Oil Curse.
a*: That Aramco ran its Dhahran camps as a Jim Crow system and that company-sponsored histories hid this behind a myth of benevolence.
a: That coal empowered workers more than oil did.
x: That is Timothy Mitchell's argument in Carbon Democracy.
hint: Think of the ladder of housing in Dhahran.
why: Vitalis links the history of race in the oil fields to the way that history was later written; former Aramco employees disputed his account.
```

## Producers push back: Mexico, Venezuela and Iran

The first state to take its oil back was Mexico. Article 27 of the 1917 Constitution vested subsoil rights in the nation, and in 1921 Mexico led the world in oil exports, though output later fell as companies moved to Venezuela. When the foreign companies refused to pay an arbitration award to the oil workers' union, upheld by the Supreme Court, President Cárdenas announced their expropriation by radio on 18 March 1938, as the chapter on The Mexican Revolution relates. Crowds donated everything from chickens to jewellery towards compensation. Jersey Standard and Shell organised a boycott and Britain withdrew its ambassador, but Roosevelt's Good Neighbor policy and the coming war ended the quarrel. In 1942 the United States accepted compensation for its companies of about \$24–29 million (accounts differ).

Venezuela's boom began after oil was struck at Maracaibo in 1922, under the dictator Juan Vicente Gómez, who let foreign companies shape the petroleum law of 1922; in December 1936 a strike paralysed the oil fields of Zulia before it was declared illegal. In 1943 Jersey Standard accepted a new agreement based on a 50–50 principle, and in 1948 **Juan Pablo Pérez Alfonzo** formalised a 50/50 tax. It became the global norm: Saudi Arabia's King Abdulaziz, threatening nationalisation, won a 50/50 split from Aramco in 1950, and Washington let the Aramco partners deduct the payments from their American taxes.

In Iran, the Majlis voted to nationalise oil on 15 March 1951, and Mosaddegh became prime minister. The chapter on Global Cold War and the Arms Race tells the story of the Anglo-American coup of August 1953. Ervand Abrahamian calls it "a classic case of nationalism clashing with imperialism in the Third World" and sees the communist threat as a smokescreen; Gasiorowski stresses fear of communism. The oil settlement shows who gained: in the consortium of 1954, BP took 40 per cent, the four Aramco partners and Gulf initially 8 per cent each, and Shell and the French the rest, with profits split 50–50 with Iran but no Iranian auditors or board members.

## OPEC, 1973 and petrodollars

In February 1959 the companies cut posted prices for Venezuelan and Middle Eastern crude by 10 per cent without consulting producer governments. At the initiative of Pérez Alfonzo, Saudi Arabia's **Abdullah Tariki** and Iraq's Qasim, on 14 September 1960, in Baghdad, Iran, Iraq, Kuwait, Saudi Arabia and Venezuela founded the **Organization of the Petroleum Exporting Countries (OPEC)**. Others followed, Nigeria among them in 1971. Economists call it a cartel; OPEC presents itself as a counterweight to the Seven Sisters' cartel.

In October 1973, after Egypt and Syria attacked Israel, the Arab producers' organisation OAPEC cut output and embargoed the United States, the Netherlands and others; by March 1974 prices had risen from about \$3 to nearly \$12 a barrel. The chapter on History of Energy describes the 1973 and 1979 shocks from the consumers' side. For producers this was the decade of ownership: the Saudi state took 25 per cent of Aramco in 1973 and 60 per cent in 1974, and its interest reached 100 per cent in 1980; Kuwait nationalised in 1975 and Venezuela on 1 January 1976. Around this time Pérez Alfonzo warned that oil would "bring us ruin" and called it "the devil's excrement", words later quoted in English in *Fortune* (2003).

The new wealth flowed back into the world economy. OPEC's current-account surplus from 1974 to 1981 totalled about \$450 billion; much of these **petrodollars** went into US Treasuries and Western banks, which lent onward, and the debts of 100 oil-importing developing countries rose 150 per cent between 1973 and 1977, a prelude to the debt crisis described in the chapter on The Neoliberal Age. Then OPEC's share of world output fell from about half in 1979 to under 30 per cent in 1985, and in 1986 prices more than halved.

## Guarding the Gulf

As producers took control of their oil, the United States took responsibility for its security. After the Soviet invasion of Afghanistan, President Carter announced what became the Carter Doctrine, in a sentence drafted by Brzezinski:

```quote
Let our position be absolutely clear: An attempt by any outside force to gain control of the Persian Gulf region will be regarded as an assault on the vital interests of the United States of America, and such an assault will be repelled by any means necessary, including military force.
Jimmy Carter · State of the Union address · 23 January 1980
```

In 1990 Iraq accused Kuwait and the UAE of exceeding OPEC quotas, driving prices as low as \$10 and costing Iraq \$7 billion a year, and invaded Kuwait on 2 August; the war that followed is told in the chapter on Modern Conflicts since 1991. Whether the 2003 invasion of Iraq was "about oil" is still argued. Alan Greenspan wrote that the war was "largely about oil", though he later said that was not the administration's motive; on the other side, John Duffield found "no compelling evidence" that oil was prominent in decision-making, and Jeff Colgan noted that Iraqi contracts went to non-American firms, including Russian and Chinese ones.

## The Niger Delta and the "resource curse"

Nigeria shows oil's costs to the people who live beside it. Oil was found at Oloibiri, in the Niger Delta, in 1956, and around 2000 oil and gas brought over 98 per cent of Nigeria's export earnings, while cocoa output fell. Among the Ogoni of the Delta, the writer **Ken Saro-Wiwa** led a movement in which about 300,000 Ogoni, more than half the population, marched in January 1993. After four Ogoni chiefs were murdered in 1994, Saro-Wiwa and eight others were convicted by a special military tribunal, whose witnesses later said they had been bribed, and hanged on 10 November 1995. Documents released in litigation in 2009 indicate that Shell in the 1990s paid and assisted Nigeria's military and police against Ogoni activists, which Shell denies; that year Shell paid \$15.5 million to settle the Wiwa family's lawsuits, denying wrongdoing.

Is oil itself to blame? Richard Auty coined "resource curse" in 1993. Terry Lynn Karl's *The Paradox of Plenty* (1997) studied Venezuela and other petro-states, and Ross's *The Oil Curse* (2012) argues that oil hinders democracy, makes civil war likelier and perpetuates patriarchy, partly because oil revenues are secret. Haber and Menaldo find no such curse, other studies find effects only under weak institutions, and Norway is the standard counter-example. A review in *Nature* faulted Ross for dating the curse to the nationalisations of the 1970s and playing down earlier corporate and colonial exploitation, and Mitchell too rejects a curse inherent in oil. The chapter on The Making of the Modern Middle East sets out the related theory of the rentier state.

```checkpoint
q: Why did OPEC's founders meet in Baghdad in September 1960?
a: To plan the 1973 embargo against the United States.
x: The embargo came thirteen years later and was imposed by OAPEC, the Arab producers.
a*: Producer governments, angered by the companies' unilateral price cut of 1959, wanted a common front.
a: To divide Iraq's oil among Western companies.
x: That had been the purpose of the Red Line Agreement of 1928.
a: To agree a 50/50 profit split with Aramco.
x: Saudi Arabia had already won a 50/50 split in 1950.
hint: Think of Pérez Alfonzo, Tariki and the posted-price cut.
why: OPEC was founded by Iran, Iraq, Kuwait, Saudi Arabia and Venezuela to counter the power of the major companies.
---
q: Which statement best describes the debate over the "resource curse"?
a: All scholars agree that oil causes dictatorship wherever it is found.
x: Haber and Menaldo find no causal curse, and Norway is a standard counter-example.
a: The idea was invented by OPEC to justify nationalisation.
x: The term was coined by the economist Richard Auty in 1993.
a: No scholar has linked oil to women's position in society.
x: Michael Ross argues that oil reduces women's presence in the labour force.
a*: Karl and Ross see oil wealth harming democracy and development, while critics stress institutions, counter-examples and earlier colonial exploitation.
hint: Think of Norway, Nigeria and the Nature review of Ross.
why: Whether the curse lies in oil itself or in how the industry was built remains a live dispute.
```

## Whose history of oil?

What we know about oil was shaped by who wrote it. Daniel Yergin's *The Prize*, published in December 1990, four months after Iraq invaded Kuwait, won the Pulitzer Prize and is often called the definitive history; critics note that Yergin founded an energy consultancy serving the industry and read it as an insider's view. Company-commissioned histories, such as BP's, have been criticised for deflecting responsibility from company practices. Timothy Mitchell's *Carbon Democracy* (2011), whose argument about coal, oil and labour the chapter on History of Energy summarises, turns the story around: on reviewers' accounts, he argues that Western democracies were active partners in building oil's power and became dependent on an undemocratic Middle East. Revisionists have added race (Vitalis), labour and ecology (Santiago) and the producers' own records: Giuliano Garavini's history of OPEC (2019), the first book-length academic history of the organisation, draws on its conference transcripts and writes sympathetically from the producers' side.

## Oil cities and the climate

{{image: Spindletop | The Spindletop gusher near Beaumont, Texas, 1901, which launched Gulf Oil and Texaco}}

Oil also built cities. At Spindletop, near Beaumont, Texas, a gusher on 10 January 1901 flowed an estimated 100,000 barrels a day for nine days. Houston became an oil city: by the 1930s petroleum, not cotton, dominated its Ship Channel, and the 1970s boom drew over 1,000 newcomers a week until the 1986 price collapse. The chapters on Urban History and The Role of Infrastructure in History describe the car-dependent suburb and the Interstate highways.

The industry also knew early where burning oil led. In July 1977 an Exxon senior scientist, James Black, told executives there was general scientific agreement that fossil fuels were the most likely way humans were influencing the climate. From 1989 the company publicly questioned climate science. Supran and Oreskes found in 2017 that 80 per cent of Exxon's internal documents acknowledged human-caused climate change but only 12 per cent of its newspaper advertorials did; in 2023 they showed that Exxon's own projections had accurately forecast warming. ExxonMobil says the allegations are cherry-picked. Whether the age of oil is ending is contested; the chapter on History of Energy gives the latest figures.

## Oil in 2026: a postscript

The events of 2026 are too recent for history's verdict, as the chapter on The Post-Cold War Era says; what follows is a dated record. On 3 January 2026 the United States captured Venezuela's President Maduro, and the Trump administration said access to Venezuelan oil was a core reason; a law of 29 January gave private companies control of oil production and sale. On 28 February 2026 the United States and Israel went to war with Iran; ceasefires in April and a memorandum in June broke down in July. Tanker traffic through the Strait of Hormuz, normally about a quarter of seaborne oil trade, fell close to zero. Crude passed \$100 a barrel on 8 March for the first time since 2022, and reported peaks that month range from about \$118 to \$126, depending on the source. By mid-October crude flows through Hormuz were about 82 per cent of pre-war levels, according to preliminary figures from the analytics firm Kpler, while refined products and gas lagged far behind. Meanwhile the United Arab Emirates, then OPEC's third-largest producer, left OPEC and the wider OPEC+ group with effect from 1 May 2026, to produce outside quotas.

## Further exploration

- **Daniel Yergin, *The Prize: The Epic Quest for Oil, Money, and Power* (1990).** The Pulitzer-winning narrative of oil and power, from an industry insider.
- **Timothy Mitchell, *Carbon Democracy: Political Power in the Age of Oil* (2011).** How coal and oil shaped democracy and Middle Eastern politics.
- **Robert Vitalis, *America's Kingdom: Mythmaking on the Saudi Oil Frontier* (2006).** Aramco's Jim Crow camps and the myths that hid them.
- **Myrna I. Santiago, *The Ecology of Oil: Environment, Labor, and the Mexican Revolution, 1900–1938* (2006).** Mexico's oil fields from the ground: land, labour and nationalisation.
- **Terry Lynn Karl, *The Paradox of Plenty: Oil Booms and Petro-States* (1997).** Venezuela and other petro-states.
- **Michael L. Ross, *The Oil Curse: How Petroleum Wealth Shapes the Development of Nations* (2012).** The quantitative case on oil, democracy, war and women.
- **Giuliano Garavini, *The Rise and Fall of OPEC in the Twentieth Century* (2019).** OPEC from the producers' side.$mn_oil_master$,
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
  select $mn_oil_quiz$[
    {"type": "mcq", "prompt": "Why did the British government take a majority stake in the Anglo-Persian Oil Company in 1914?", "options": ["Because the Royal Navy was moving from coal to oil, and Britain, with almost no oil of its own, wanted secure supply at the source", "Because Persia demanded British state ownership as a condition of the D'Arcy concession", "Because Standard Oil had tried to buy the company", "Because the Red Line Agreement required it"], "answerIndex": 0, "explanation": "Under Churchill the Admiralty converted the fleet to oil; Britain had abundant coal but almost no oil, so in May 1914 it took 51 per cent of Anglo-Persian for £2.2 million.", "id": "q1"},
    {"type": "mcq", "prompt": "What happened on 18 March 1938?", "options": ["Venezuela founded PDVSA", "Iran's Majlis voted to nationalise oil", "President Cárdenas announced the expropriation of the foreign oil companies in Mexico", "OPEC was founded in Baghdad"], "answerIndex": 2, "explanation": "After the companies refused to pay an arbitration award to the oil workers' union, upheld by Mexico's Supreme Court, Cárdenas announced the expropriation by radio; Pemex followed that June.", "id": "q2"},
    {"type": "mcq", "prompt": "Which body imposed the oil embargo of October 1973?", "options": ["The International Energy Agency", "The Seven Sisters", "The Iraq Petroleum Company", "OAPEC, the organisation of Arab oil producers"], "answerIndex": 3, "explanation": "OAPEC cut output and embargoed the United States, the Netherlands and others after Egypt and Syria attacked Israel; by March 1974 prices had risen from about $3 to nearly $12 a barrel.", "id": "q3"},
    {"type": "mcq", "prompt": "What did the Carter Doctrine of 23 January 1980 declare?", "options": ["That the United States would buy all OPEC oil in dollars", "That an attempt by any outside force to gain control of the Persian Gulf region would be repelled by any means necessary, including military force", "That the United States would end its dependence on imported oil by 1990", "That American oil companies must leave Iran"], "answerIndex": 1, "explanation": "Announced after the Soviet invasion of Afghanistan, in a sentence drafted by Brzezinski, it made the security of the Gulf a vital American interest.", "id": "q4"},
    {"type": "open", "prompt": "How did workers and governments in oil-producing countries push back against the foreign companies between the 1900s and the 1970s? Use at least three examples.", "rubric": "Full marks: at least three accurate examples, such as the Baku general strike of December 1904 and the 'mazut constitution'; Reza Shah's cancellation of the D'Arcy concession in 1932; the Khuzestan general strike of 1946; Mexico's expropriation of 18 March 1938 after the oil workers' union dispute; Venezuela's 50/50 principle (1943, formalised 1948) and its spread to Saudi Arabia in 1950; the Dhahran strike of October 1953; Iran's nationalisation in 1951; the founding of OPEC in 1960 after the 1959 price cut; and the takeovers of the 1970s (Iraq 1972, Saudi stakes 1973–1980, Kuwait 1975, Venezuela 1976). Better answers note the costs, such as the 1953 coup in Iran or the boycott of Mexico.", "id": "q5"},
    {"type": "open", "prompt": "Compare two ways of writing the history of oil: Daniel Yergin's The Prize and the work of revisionists such as Timothy Mitchell, Robert Vitalis or Myrna Santiago. What does each emphasise, and why does it matter who writes the history?", "rubric": "Full marks: The Prize (December 1990, Pulitzer Prize) as a sweeping narrative of companies, statesmen and wars, read by critics as an insider's view because Yergin founded an industry consultancy; company-commissioned histories (e.g. BP's) criticised for deflecting responsibility; Mitchell on how energy shapes politics and on Western democracies as partners in oil's power; Vitalis on Aramco's Jim Crow camps and the myth of benevolence (disputed by former employees); Santiago on labour, land and ecology in Mexico; Garavini on OPEC from producers' records. Argues that sources and authors shape which actors and costs are visible.", "id": "q6"}
  ]$mn_oil_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/thematic-history/oil-and-empire', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

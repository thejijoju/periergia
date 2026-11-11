-- God Save the Queen: the British Monarchy — canonical master article, co-written and human-reviewed.
-- history/regional-histories/europe/god-save-the-queen-the-british-monarchy @ research/advanced/read.
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
    'history/regional-histories/europe/god-save-the-queen-the-british-monarchy',
    'research',
    'advanced',
    'read',
    $mn_monarchy_master$> **A crown that survived by changing what it was for.** The age of revolutions toppled kings across Europe, yet the British monarchy still reigns, in the United Kingdom and in fourteen other countries. This chapter asks how. It follows the bargain that followed 1688 and the handover of power to ministers; Walter Bagehot's "dignified" crown; Victoria's imperial monarchy and the late invention of royal ritual; the Windsors' wartime rebranding and the abdication of 1936; Elizabeth II's seventy years of Commonwealth, decolonisation, Diana and devolution; and Charles III. It also looks at the crown from outside the palace: from enslaved Africans, Indian princes, Irish socialists, Māori and First Nations treaty partners, Caribbean and Aboriginal republicans, Windrush migrants, and a punk band.

## A Crown Older Than Its Rules

The English monarchy is ancient, and its antiquity tempts storytellers. In 1215 King John sealed **Magna Carta** at Runnymede; the Pope annulled it, yet it was reissued in 1216, 1217 and 1225, and three of its clauses remain law in England and Wales. In 1603 James VI of Scotland also became James I of England, joining two crowns but not two kingdoms. The seventeenth century showed that the monarchy could be destroyed: Charles I was executed outside the Banqueting House in Whitehall on 30 January 1649, and the monarchy was abolished until its restoration in 1660.

It is easy to arrange all this into a single march from Magna Carta to parliamentary freedom. **Herbert Butterfield** warned against exactly that in *The Whig Interpretation of History* (1931), attacking history written "with reference to the present". The monarchy's story is especially prone to Whig telling, because the institution has long told it that way itself.

## Royal Charters and Branded Captives

The restored Stuarts turned quickly to Africa. In 1660 the royal family and City of London merchants founded a company to trade there, chartered from 1660 and reorganised as the **Royal African Company** in 1672. It was overseen by the king's brother, James, Duke of York, and Charles II granted it a monopoly of English trade with Africa. It sought gold at first, but quickly turned to trading people. Historians estimate it shipped more enslaved Africans to the Americas than any other company: between 1672 and 1731 ships in which it invested carried 186,748 people to English colonies, of whom 16,077 died on the way.

The royal connection was literal. Many captives were branded "DoY", for the Duke of York; others "RAC" on their chests. When the duke, by then James II, was driven out in 1688, the company's deputy governor Edward Colston transferred much of his shareholding to the new king, William III. William ended the monopoly under parliamentary pressure in 1697, and the company survived until 1752. In 2023 Charles III backed a doctoral study of the monarchy's links to the slave trade, giving it access to the Royal Archives and Royal Collection, an admission that this history belongs to the crown.

## The Bargain of 1688

The chapter on The Rise of Absolutism tells how James II's Catholicism prompted William of Orange's invasion in November 1688. What matters here is the bargain that followed. The **Bill of Rights** of December 1689 required regular parliaments and free elections, forbade taxation without Parliament's consent, and barred Catholics from the throne. The Act of Settlement of 1701 passed the succession to the Protestant house of Hanover, whose George I succeeded in 1714. The settlement was not bloodless everywhere: James's Jacobite supporters fought on in Ireland and rose in Scotland in 1689.

Historians still argue about what 1688 was. The Whig tradition of Macaulay and Burke saw a consensual triumph of limited monarchy. J. R. Jones and Jonathan Israel stress a Dutch invasion; Jones called it "the first and arguably the only decisive phase of the Nine Years' War". **Steven Pincus**, in *1688: The First Modern Revolution* (2009), sees a violent, divisive revolution against James's French-style state-building.

Whatever it was, it began a long transfer of power. No monarch has refused royal assent to a law since 1708. Under the Hanoverians ministers took the lead, above all Robert Walpole (1721–42), often called the first prime minister though the title was not then in use. In 1760 George III surrendered the crown's hereditary revenues for a Civil List fixed by Parliament. After the Reform Act of 1832 the monarch could no longer interfere effectively with parliamentary power. Cabinet government, answerable to the Commons, had replaced royal government.

## Bagehot's Dignified Crown

The classic account of what was left came from the journalist **Walter Bagehot**, whose *The English Constitution* appeared as a book in 1867, the year of the Second Reform Act. He divided the constitution in two.

```quote
first, those which excite and preserve the reverence of the population—the dignified parts, if I may so call them; and next, the efficient parts
Walter Bagehot · The English Constitution, chapter 1 · 1867
```

The efficient parts, Cabinet and Commons, governed. The dignified parts, chiefly the monarch and the Lords, won the loyalty that made government acceptable. The monarch's practical powers came down to "the right to be consulted, the right to encourage, the right to warn". By Peter Hennessy's account, the future George V copied out those three rights in 1894. Bagehot gave the crown a respectable modern purpose just as mass politics arrived.

```checkpoint
q: What did Walter Bagehot mean by the "dignified" parts of the constitution?
a*: The parts, chiefly the monarch and the Lords, that win the reverence of the population, as opposed to the "efficient" parts that actually govern.
a: The parts of government that Parliament elects.
x: Bagehot placed the elected Commons, with the Cabinet, among the "efficient" parts.
a: The courts and the legal system.
x: His distinction was between reverence and governing, with the monarch and Lords on the dignified side.
a: The parts of the constitution written down in the Bill of Rights.
x: Bagehot was describing how the unwritten constitution worked in practice, not a written text.
hint: Think of reverence versus power.
why: Bagehot's distinction explained how a monarch with little power could still matter politically.
---
q: Why is the Royal African Company part of the monarchy's history?
a: Because it was founded after slavery was abolished to resettle freed people.
x: It was founded in the 1660s and traded enslaved people; Britain abolished slavery only in the 1830s.
a: Because Queen Victoria was its last governor.
x: The company survived only until 1752, long before Victoria's reign.
a*: Because it was founded by the Stuart royal family and London merchants, overseen by the Duke of York, and many captives were branded "DoY" for him.
a: Because Parliament forced the crown to buy it in 1689.
x: In 1689 Edward Colston transferred shares to William III; there was no forced purchase.
hint: Think of the letters branded on captives.
why: The crown was a direct participant in, and beneficiary of, the English slave trade.
```

## Empress, Durbar and the Invention of Ritual

{{image: Delhi Durbar | A Delhi durbar: the British crown staged these imperial assemblies for Indian princes and subjects in 1877, 1903 and 1911.}}

Victoria's coronation in 1838 drew some 400,000 visitors on the new railways, but inside Westminster Abbey there was a good deal of mishap and confusion. After Albert's death in 1861 her seclusion as the "widow of Windsor" let republicanism grow; in the 1870s Charles Dilke and Charles Bradlaugh called for a republic. The chapter on The Victorian Era covers her reign's social history; the point here is what became of the crown.

It went imperial. Under the Royal Titles Act of 1876, pushed by Disraeli and opposed by Gladstone, who thought the title despotic and un-British, Victoria became Empress of India, proclaimed at a Delhi durbar in 1877 that she did not attend, as the chapter on the British Empire describes. Her Golden Jubilee of 1887 was first celebrated in India, and an Indian cavalry contingent escorted her. One of her Indian attendants, **Abdul Karim**, "the Munshi", taught her Hindustani; after her death Edward VII sent him home and ordered their correspondence destroyed. For the Diamond Jubilee of 1897 Joseph Chamberlain proposed a "Festival of the British Empire": troops from Canada, India, Africa and the South Pacific marched, while in Dublin James Connolly's Irish Socialist Republican Party staged a mock funeral. At the Delhi durbar of 1911, the only one a reigning sovereign attended, George V wore a new Imperial Crown of India and appeared on the balcony of the Red Fort, a custom of the Mughal emperors. Yet the Maharaja of Baroda, Sayajirao Gaekwad III, approached without his jewellery, made a simple bow and turned his back as he left, an act the BBC has called "daring" anti-colonial dissent.

Historians read this pageantry through *The Invention of Tradition* (1983), edited by **Eric Hobsbawm** and Terence Ranger, which argued that many traditions that claim to be old are quite recent, and sometimes invented. **David Cannadine**'s chapter argued, in summary, that royal ceremonial, badly performed in the early nineteenth century, became expertly staged from the late nineteenth century in an age of imperial rivalry and mass media, and changed meaning again with decline and television after 1953. Roy Strong's verdict on 1838 makes the point: it was "the last of the botched coronations". In the same volume Bernard Cohn applied the idea to the durbars of British India. In *Ornamentalism* (2001) Cannadine went further, arguing that rank and status, crowned by the monarch, mattered more than race in the empire; critics such as Richard Gott found this a romantic view of empire.

## Windsors, War and Abdication

The First World War made the royal family's German name a liability. On 17 July 1917, amid anti-German feeling and months after his cousin Tsar Nicholas II abdicated, George V renamed the house of Saxe-Coburg and Gotha the **House of Windsor**. When H. G. Wells mocked Britain's "alien and uninspiring court", the king replied, "I may be uninspiring, but I'll be damned if I'm alien." In 1932 he gave the first royal Christmas broadcast, a new tradition in a new medium. The Statute of Westminster of 1931 made the dominions equal, with one monarch reigning separately in each.

That mattered in 1936, when **Edward VIII** wished to marry Wallis Simpson, an American divorcée whose second divorce was not yet final. Stanley Baldwin said the marriage would be unacceptable, and the dominion prime ministers, consulted, mostly agreed there was no alternative to abdication. The abdication even took effect on three different dates: South Africa dated it from 10 December, and the Irish Free State, which used the crisis to strip the Crown from its constitution, from 12 December. Edward's politics raised other questions: as king he had opposed sanctions on Fascist Italy after its invasion of Ethiopia and refused to receive the deposed Emperor Haile Selassie, and in 1937 he met Hitler against government advice. In the Second World War his brother George VI, the last Emperor of India, and Queen Elizabeth were in residence when Buckingham Palace was bombed; she said it made her feel "I can look the East End in the face".

## Treaty Partner: the Crown and Indigenous Nations

For many Indigenous peoples the crown was never merely dignified; it was a party to agreements. George III's Royal Proclamation of 1763 declared that only the Crown could buy land from First Nations, who have called it their "Magna Carta"; it was recognised in Canada's Constitution Act of 1982, partly thanks to the Indigenous "Constitution Express" campaign. The legal scholar **John Borrows** argues that it and the Treaty of Niagara of 1764 undercut Crown claims to sovereignty over First Nations. The eleven Numbered Treaties of 1871 to 1921 were made in the names of Victoria, Edward VII and George V, with a significant gap between their written texts and First Nations' oral understanding. First Nations, Inuit and Métis generally see their treaties as made with the continuing Crown, not the government of the day, to last "as long as the sun shines, grass grows, and rivers flow".

In Aotearoa New Zealand, as the chapter on the British Empire describes, the Treaty of Waitangi of 1840 raised the same question: the Māori text granted *kawanatanga*, governance, while the English text ceded sovereignty. The Kīngitanga, the Māori King movement of the 1850s, arose partly to deal with the Governor and the Queen on an equal footing. The crown could be a resource as well as a symbol of conquest.

## Elizabeth II and the Commonwealth

Princess Elizabeth was in Kenya on 6 February 1952 when she learned that she was queen. Five years earlier, touring southern Africa, she had broadcast a vow.

```quote
I declare before you all that my whole life, whether it be long or short, shall be devoted to your service and the service of our great imperial family to which we all belong.
Princess Elizabeth · Broadcast from South Africa · 21 April 1947
```

The "imperial family" was dissolving as she spoke. The **London Declaration** of 1949, drafted by V. K. Krishna Menon, Nehru's adviser, and Sir Norman Brook, let India stay in the Commonwealth as a republic, accepting the King as "the symbol of the free association of its independent member nations". It became the precedent for every later republic. Elizabeth's coronation on 2 June 1953 was the first televised from inside the Abbey, apart from the anointing and communion; estimates of the British audience range from 20 to 27 million, and of the worldwide audience 277 million.

More than twenty countries gained independence in the 1960s and 1970s, in what has been described as a planned transition. In 1961 she visited Ghana, hosted by President Nkrumah, who had replaced her as head of state. In 1965 Ian Smith's regime declared Rhodesian independence under a "Queen of Rhodesia"; she formally dismissed him, and the regime survived more than a decade. "Managed retreat" fits the ceremonies better than the colonies: as the chapters on Decolonization and the British Empire show, the end of empire in Kenya and elsewhere was violent. **Philip Murphy**'s *Monarchy and the End of Empire* (2013) studies how the palace and government used the crown to hold the Commonwealth together. Elizabeth was queen of 32 sovereign states in her lifetime and 15 at her death, and the realms sometimes reminded Britain that the crown was not only British: in 1983 the United States invaded Grenada, one of her realms, without telling her.

## The Near-Death of Deference

In November 1992, after a son's separation, her daughter's divorce and a fire at Windsor Castle, the Queen called the year her *annus horribilis* (Charles and Diana's separation followed in December); days later John Major announced that she would pay income tax. Then, in the early hours of 31 August 1997, **Diana, Princess of Wales**, died after a car crash in Paris. While the royal family stayed at Balmoral, more than a million bouquets piled up at Kensington Palace, and the absence of a flag at half-mast over Buckingham Palace became a symbol of distance. Tony Blair called Diana "the People's Princess". Under pressure, the Queen returned and broadcast live, speaking "as a grandmother". Republicanism grew in the 1990s, yet polls from 2002 to 2007 still showed 70 to 80 per cent support for the monarchy.

The state was changing beneath the crown. In 1999 the Queen opened the new Scottish Parliament and National Assembly for Wales, and in 2011 she made the first state visit by a British monarch to the Republic of Ireland. When she died on 8 September 2022, about 250,000 people filed past her coffin; in Hong Kong a pro-Beijing paper attacked mourners for "indulging in this fantasy that they are subjects of the British Empire".

The anthem had a double life. "God Save the King", of unknown authorship, was sung in London theatres in 1745 in support of George II against the Jacobites. In the Silver Jubilee year of 1977 the Sex Pistols' "God Save the Queen" equated the monarch with a "fascist regime" and sang "there is no future in England's dreaming". Banned by the BBC, it reached number one on the *NME* chart but only number two on the official chart, amid claims of rigging.

## The Realms Decide

A century after the colonial era traced in the chapter on Australia from 1770 to 1901, Australia's referendum of 6 November 1999 put the question directly. A republic with a president chosen by Parliament lost, with 54.87 per cent voting No and no state voting Yes. Many who wanted a directly elected president voted No, and some Aboriginal Australians were sceptical: the former senator Neville Bonner, a monarchist delegate to the 1998 Constitutional Convention, argued that Aboriginal people would be no better off under a republic. In 2022 the Aboriginal senator Lidia Thorpe added "the colonising" to her oath of allegiance and had to retake it; in October 2024 she heckled Charles in Canberra, shouting "you are not my king".

Barbados, independent since 1966, became a parliamentary republic on 30 November 2021 without a referendum, its governor-general Dame Sandra Mason becoming first president; her 2020 Throne Speech had said "the time has come to fully leave our colonial past behind". Jamaica's main parties both favour a republic, but the change needs a referendum, and a target date of the 2025 election was dropped in March 2025. When Prince William toured the Caribbean in March 2022, campaigners in Kingston demanded an apology and reparations for slavery; he expressed "profound sorrow", echoing his father's words in Barbados that slavery "forever stains our history".

The reckoning reached Britain too. The British Nationality Act of 1948 gave people from the colonies the right to settle, and between 1948 and 1970 nearly half a million came from the Caribbean, the "Windrush generation", named after the *Empire Windrush* of 1948. In the Windrush scandal of 2018, members of that generation and their children were wrongly detained, denied rights and, in at least 83 cases, wrongly deported. Polls find support for the monarchy lower among Black British and British Asian respondents, as among the under-35s.

```checkpoint
q: How did Barbados become a republic in 2021?
a: By a national referendum held in 2008.
x: A 2008 referendum plan lapsed; no referendum was held.
a*: By parliamentary decision, without a referendum, with Governor-General Dame Sandra Mason elected as first president.
a: By the British Parliament abolishing the monarchy there.
x: The change was made by Barbados itself; Charles attended the ceremony as a guest.
a: By leaving the Commonwealth.
x: Becoming a republic, as the London Declaration of 1949 made possible, did not require leaving the Commonwealth.
hint: Think of who became the first president.
why: Barbados followed the path India opened in 1949: republic and Commonwealth member at once.
---
q: Why do many First Nations in Canada see their treaties as made with the Crown rather than with the government?
a: Because Canadian governments refused to sign any treaties.
x: The treaties were signed in the monarch's name by Crown representatives; the question is how they are understood.
a: Because the treaties were all signed in London.
x: The Numbered Treaties were made in what is now Canada.
a: Because the Royal Proclamation of 1763 abolished Indigenous land rights.
x: The Proclamation said only the Crown could buy First Nations land, and First Nations call it their "Magna Carta".
a*: Because treaties such as the Numbered Treaties were made in the names of reigning monarchs, and are understood as relationships with the continuing Crown meant to last "as long as the sun shines, grass grows, and rivers flow".
hint: Think of the phrase about the sun, grass and rivers.
why: For treaty peoples, the crown is a lasting partner in agreements, not only a symbol.
```

## Charles III and the Language of Sorrow

Charles III became king on 8 September 2022, aged 73, and was crowned on 6 May 2023, when police made 64 arrests, 52 of them over feared disruption, including members of the pressure group **Republic**. He reigns in the United Kingdom and fourteen other realms, from Canada and Jamaica to Papua New Guinea and Tuvalu, and is Head of the Commonwealth, a role not inherited as of right.

His reign has developed a careful vocabulary of regret. At the Commonwealth summit in Kigali on 24 June 2022, still Prince of Wales, he said he could not "describe the depths of my personal sorrow at the suffering of so many" from slavery. On his state visit to Kenya in October–November 2023 he called colonial acts "abhorrent and unjustifiable acts of violence" and met the family of Dedan Kimathi, hanged by the colonial authorities, but gave no formal apology. On 3 November 2026, opening the Commonwealth summit in Antigua and Barbuda, he again expressed "sorrow" over the transatlantic slave trade, while saying the Royal Navy had "played such a leading role" in ending it. Campaigners want apology and reparations; the crown has so far offered sorrow.

At home, the Palace announced in February 2024 that the King had cancer; in December 2025 he said his treatment would be reduced. In October 2025 he began removing his brother Andrew's titles over his association with Jeffrey Epstein; in February 2026 Andrew Mountbatten-Windsor was arrested on suspicion of misconduct in public office and released under investigation, and the King said "the law must take its course". The Sovereign Grant, which replaced the Civil List in 2012 with a share of Crown Estate profits, was £132.1 million for 2025–26; the Palace says it will seek a reduction once the Buckingham Palace refurbishment is finished. Republic, counting security and lost revenue, put the full cost at £510 million a year in 2024.

## Explaining Survival

Why has the monarchy lasted? **Vernon Bogdanor**'s *The Monarchy and the Constitution* (1995) treats it as a working, neutral constitutional safeguard. **Frank Prochaska**'s *Royal Bounty* (1995) argues that royal patronage of charity made the crown a "welfare monarchy", standing between state and society. **Tom Nairn**'s *The Enchanted Glass* (1988), one of the earliest serious modern studies from an abolitionist perspective, mocked Britain as "Ukania".

Opinion is shifting slowly. In NatCen's long-running British Social Attitudes series, those calling the monarchy "very important" fell to an all-time low of 29 per cent in 2023. YouGov in January 2026 found 64 per cent for the monarchy and 23 per cent for a republic; Ipsos in March 2026 found 55 against 27. The crown survives by reigning rather than ruling; but from Bridgetown to Canberra, the people it reigns over increasingly ask on whose terms.

## Further exploration

- **Eric Hobsbawm and Terence Ranger (eds), *The Invention of Tradition* (1983).** Includes Cannadine's essay on British royal ritual and Bernard Cohn on Victorian India.
- **Vernon Bogdanor, *The Monarchy and the Constitution* (1995).** The standard account of the modern constitutional monarchy.
- **Tom Nairn, *The Enchanted Glass: Britain and Its Monarchy* (1988).** A Scottish republican critique of "Ukania".
- **Frank Prochaska, *Royal Bounty: The Making of a Welfare Monarchy* (1995).** How royal charity helped the crown survive.
- **David Cannadine, *Ornamentalism: How the British Saw Their Empire* (2001).** Empire as hierarchy and royal spectacle.
- **Philip Murphy, *Monarchy and the End of Empire* (2013).** The House of Windsor, the British government and the postwar Commonwealth.
- **Shrabani Basu, *Victoria & Abdul: The True Story of the Queen's Closest Confidant* (2010).** Victoria and Abdul Karim, told from her Urdu diaries.$mn_monarchy_master$,
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
  select $mn_monarchy_quiz$[
    {"type": "mcq", "prompt": "What did Walter Bagehot, in The English Constitution (1867), identify as the monarch's three rights?", "options": ["The right to veto, the right to dissolve, the right to appoint", "The right to be consulted, the right to encourage, the right to warn", "The right to tax, the right to declare war, the right to pardon", "The right to rule, the right to reign, the right to judge"], "answerIndex": 1, "explanation": "Bagehot reduced the monarch's practical role to 'the right to be consulted, the right to encourage, the right to warn'; by Peter Hennessy's account the future George V copied these out in 1894.", "id": "q1"},
    {"type": "mcq", "prompt": "Why did George V rename the royal house 'Windsor' in July 1917?", "options": ["To mark Victoria's Diamond Jubilee", "Because the Statute of Westminster required it", "To shed the German name Saxe-Coburg and Gotha amid anti-German feeling during the First World War", "Because Edward VIII had abdicated"], "answerIndex": 2, "explanation": "The proclamation of 17 July 1917 came amid wartime anti-German feeling, months after Nicholas II's abdication.", "id": "q2"},
    {"type": "mcq", "prompt": "What did the London Declaration of 1949 make possible?", "options": ["India's continued membership of the Commonwealth as a republic, accepting the King as a symbol of the free association of its members", "Victoria's proclamation as Empress of India", "The abolition of the Civil List", "Barbados's independence"], "answerIndex": 0, "explanation": "Drafted by V. K. Krishna Menon and Sir Norman Brook, it became the precedent for every later Commonwealth republic, including Barbados in 2021.", "id": "q3"},
    {"type": "mcq", "prompt": "What was the result of Australia's republic referendum of 6 November 1999?", "options": ["The republic won narrowly in every state", "The referendum was cancelled", "Australia became a republic with a directly elected president", "The republic model lost, with 54.87 per cent voting No and no state voting Yes"], "answerIndex": 3, "explanation": "Many republicans who wanted a directly elected president voted No, and some Aboriginal Australians, such as Neville Bonner, were sceptical of a republic.", "id": "q4"},
    {"type": "open", "prompt": "How far was the British monarchy an imperial and global institution rather than a purely British one?", "rubric": "A strong answer uses the Royal African Company (Stuart foundation, the Duke of York, 'DoY' branding); Victoria as Empress of India, the durbars, Abdul Karim and the Gaekwad of Baroda's dissent; Indigenous treaty relationships with the Crown (Royal Proclamation 1763, Numbered Treaties, Waitangi); the Commonwealth and the London Declaration; the realms (Australia 1999, Barbados 2021, Jamaica); Windrush; and the language of 'sorrow' at Kigali (2022) and in Kenya (2023), weighing the crown as symbol of conquest against its use by colonised and Indigenous peoples.", "id": "q5"},
    {"type": "open", "prompt": "Assess the main explanations historians have offered for the survival of the British monarchy.", "rubric": "A strong answer discusses the constitutional transfer of power after 1688 (with the Whig interpretation and Butterfield's critique, and the 1688 debate between Whigs, Jones and Pincus); Bagehot's dignified and efficient parts; Cannadine and the 'invention of tradition' (Strong on 1838); Bogdanor's working constitutional monarchy; Prochaska's 'welfare monarchy'; Nairn's republican critique; and recent polling, attributed to its pollsters, and the reaction to crises such as 1936 and 1997.", "id": "q6"}
  ]$mn_monarchy_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/regional-histories/europe/god-save-the-queen-the-british-monarchy', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

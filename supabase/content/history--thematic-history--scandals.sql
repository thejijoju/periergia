-- Scandals in History: Moral Panics, Repression, and Reform — canonical master article, co-written and human-reviewed.
-- history/thematic-history/scandals-in-history-moral-panics-repression-and-reform @ research/advanced/read.
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
    'history/thematic-history/scandals-in-history-moral-panics-repression-and-reform',
    'research',
    'advanced',
    'read',
    $mn_scandals_master$> **How outrage becomes history.** A scandal is a wrong made public; a moral panic is a fear that outgrows its cause. Both have repeatedly reshaped law and government. This chapter is anchored in Australia and the British imperial world of the nineteenth and twentieth centuries, from the Tichborne claimant, Myall Creek and Morant Bay to the Boer War camps, Amritsar, the Petrov affair and the Stolen Generations. It then widens to Dreyfus, Watergate and phone hacking, and to bribery scandals in Japan, India, South Africa, Brazil and Malaysia, tracing the mechanics of investigative journalism, moral panic, commissions of inquiry and reform legislation, and asking whose voices were heard.

## Scandal, Panic and the Public

A scandal needs an audience. Jürgen Habermas, in *The Structural Transformation of the Public Sphere* (1962; English translation 1989), traced how coffee houses, salons and print created a "public sphere" of debate that could check political authority, a starting point for those who treat scandal as a form of publicity. John B. Thompson's *Political Scandal* (2000) linked the rise of political scandal to new media that changed who could be seen and blurred public and private life; he distinguished sex, financial and "power" scandals. Ari Adut's *On Scandal* (usually dated 2008) argues that the disruption comes less from a transgression than from its being made public.

The idea of a **moral panic** owes most to Stanley Cohen, a sociologist born in Johannesburg and active in anti-apartheid issues, who moved to London in 1963. His LSE thesis became *Folk Devils and Moral Panics* (1972), a study of the press frenzy over clashes between mods and rockers at English resorts in 1964, when the *Birmingham Post* called the youths "internal enemies". Cohen argued the fighting was no different from earlier brawls at resorts and football matches. He did not invent the words, which appear in an 1830 religious journal; Marshall McLuhan discussed a similar idea in 1964, and Jock Young was using the term at the same time; but Cohen made it a concept.

```quote
a condition, episode, person or group of persons emerges to become defined as a threat to societal values and interests
Stanley Cohen · Folk Devils and Moral Panics · 1972
```

In Cohen's model the media amplify a threat in simplified, symbolic form, so that "the untypical is made typical"; anxiety rises; "gatekeepers" such as editors, clergy, politicians and experts respond, sometimes with new laws; and the panic fades or leaves lasting change. The blamed are "folk devils", the alarm-raisers "moral entrepreneurs". Erich Goode and Nachman Ben-Yehuda (1994) set out five criteria, concern, hostility, consensus, disproportionality and volatility, insisting that "the concept of moral panic *rests* on disproportion". Stuart Hall and his co-authors, in *Policing the Crisis* (1978), argued that Britain's early-1970s "mugging" scare singled out young Black men, was amplified by police, courts and press, and helped build an "authoritarian consensus" for law and order. One caution runs through this chapter: calling something a panic does not prove the danger was imaginary.

## Imposture and the Crowd: Tichborne

Roger Tichborne, heir to a Catholic baronetcy in Hampshire, was presumed lost at sea off Brazil in 1854. His mother advertised for news, including in Australian papers, and in 1866 a bankrupt butcher in Wagga Wagga, New South Wales, known as Thomas Castro, came forward as Roger. Lady Tichborne accepted him; most of the family did not, and the evidence pointed to Arthur Orton, a butcher's son from Wapping. A firm supporter was Andrew Bogle, a formerly enslaved Jamaican and long-time Tichborne servant. The claimant's criminal trial for perjury, 188 court days in 1873–74, was one of the longest in English history, and he was sentenced to 14 years. Yet the verdict "swelled the popular tide" for him: his disbarred counsel, Edward Kenealy, founded the Magna Charta Association and entered Parliament. George Bernard Shaw noted that crowds saw the claimant both as a rightful baronet and as a working man denied his rights by an elite. Most writers accept the verdict, though some see residual doubt; Rohan McWilliam reads the affair as popular radical politics.

## Frontier Violence and the Convict System

Some scandals turned on whether colonial violence could be punished at all. On 10 June 1838 at Myall Creek, in northern New South Wales, stockmen led by the free settler John Henry Fleming killed at least 28 unarmed Wirraayaraay (Kamilaroi) people, mostly women, children and old men. The first jury acquitted in twenty minutes; after a second trial seven men were hanged, while Fleming was never tried. *The Sydney Herald* (later the *Sydney Morning Herald*) opposed the executions, and the journalist Bruce Elder argues that the convictions taught settlers pacts of silence so that later massacres could not be proven. The chapters The 'Settler Revolution' at the Edge of Empire: Australia, 1770-1901 and British Empire set the massacre in context.

The convict system faced a parliamentary exposé when Sir William Molesworth's Commons select committee heard 23 witnesses, mostly opponents, and reported in 1838 that transportation neither deterred nor reformed and was morally corrupting to colonial society. Transportation to New South Wales ended in 1840, though Western Australia took convicts until 1868; about 162,000 were sent to Australia in all. The committee's weight is debated: it was stacked against assignment, and Hamish Maxwell-Stewart's quantitative work argues that its influence on punishments such as flogging has been overstated.

## Repression on Trial: Morant Bay and Governor Eyre

On 11 October 1865 the Baptist deacon Paul Bogle led hundreds of people to the courthouse at Morant Bay, Jamaica; the militia fired and the crowd burned the courthouse. Governor Edward John Eyre, earlier an explorer in Australia, declared martial law. About 439 Black Jamaicans were killed, many after summary courts-martial; sources also record 354 arrested and later executed, but it is unclear whether the 439 already includes them. More than 600 people were flogged and about 1,000 homes burned. The Assembly member George William Gordon, a critic of Eyre, was court-martialled and hanged, and Bogle soon after.

A Royal Commission in 1866 found the punishments "excessive" and the floggings "reckless", but did not condemn martial law itself; Eyre did not return to his post. In Britain, John Stuart Mill's Jamaica Committee, with Darwin and Huxley, sought his prosecution, while Thomas Carlyle's Eyre Defence Committee, with Ruskin, Tennyson and Dickens, defended him. Grand juries declined to indict, and a civil suit by a Jamaican, Alexander Phillips, failed in 1870. Jamaica lost its Assembly and became a Crown Colony; in 1969 it named Bogle and Gordon National Heroes. The Victorian Era chapter follows the British debate.

## Sex, the Press and the Law: Stead, Labouchère and Wilde

In July 1885 the *Pall Mall Gazette* ran "The Maiden Tribute of Modern Babylon" by its editor, W. T. Stead, to revive a stalled bill to protect girls. With Bramwell Booth of the Salvation Army and the former prostitute Rebecca Jarrett, Stead "bought" a 13-year-old chimney sweep's daughter, Eliza Armstrong. The paper sold out, crowds besieged its office, and Matthew Arnold called the style "the New Journalism". Stead was convicted of abduction, because the father had not consented, and served three months; the Criminal Law Amendment Act 1885 raised the age of consent for girls from 13 to 16. He had long opposed the Contagious Diseases Acts alongside Josephine Butler, a campaign The Victorian Era describes. Roland Pearsall said Stead used "the weapons of pornography to right a wrong".

The same Act carried a late clause, the Labouchère Amendment, which made "gross indecency" between men, "in public or private", punishable by up to two years; lawyers called it the "blackmailer's charter". Historians debate whether Henry Labouchère meant it as a wrecking amendment or sincerely. Ten years later it caught Oscar Wilde, whose failed libel prosecution of the Marquess of Queensberry led to his own arrest; in May 1895 he was sentenced to two years' hard labour, the maximum, which the judge called "totally inadequate". The same law later convicted Alan Turing. A reform born of a panic about girls' safety became an instrument of persecution; sex between men was partly decriminalised in 1967, and the offence of gross indecency was abolished in England and Wales only in 2003.

## Youth and the Larrikin Panic

"Larrikin", a West Midlands dialect word for a young urban rough, spread through Melbourne's streets from the late 1860s. Melissa Bellanta argues that around 1870 it was abuse aimed at teenage working-class hell-raisers, and her publisher's summary stresses that the early larrikins were female as well as male; from around 1900, and especially with the wartime "larrikin digger", the word became affectionate. The panic peaked with the Mount Rennie case. In September 1886, 16-year-old Mary Jane Hicks was gang-raped in Sydney by youths linked to the "Waterloo Push"; nine were sentenced to death and four hanged. Amid a "media frenzy", the *Bulletin* attacked Hicks's character: panic about youth could coexist with contempt for the victim.

```checkpoint
q: Which of these best describes the Labouchère Amendment of 1885?
a*: A late clause in the Criminal Law Amendment Act that criminalised "gross indecency" between men, in public or private.
a: A clause raising the age of consent for girls from 13 to 16.
x: That was the main purpose of the Criminal Law Amendment Act; the amendment was a separate late addition.
a: A law abolishing the Contagious Diseases Acts.
x: The amendment concerned sexual acts between men, not the regulation of prostitution.
a: A measure to protect journalists like Stead from prosecution.
x: Stead himself was convicted of abduction; the amendment had nothing to do with the press.
hint: Think of what convicted Oscar Wilde in 1895.
why: The same Act that answered Stead's campaign also created the offence used against Wilde and, later, Alan Turing.
---
q: What did Stanley Cohen contribute to the idea of moral panic?
a: He coined the words "moral panic" for the first time.
x: The phrase appears earlier, in an 1830 religious journal, and Marshall McLuhan discussed a similar idea in 1964.
a: He proved that every moral panic concerns an imaginary danger.
x: Cohen kept "panic" as a metaphor; a panic can surround a real harm whose scale is exaggerated.
a*: He turned it into an analytical concept, with folk devils, moral entrepreneurs and stages of media amplification and official response.
a: He set out the five criteria of concern, hostility, consensus, disproportionality and volatility.
x: Those criteria come from Goode and Ben-Yehuda (1994).
hint: Think of the mods and rockers study of 1972.
why: Cohen's *Folk Devils and Moral Panics* made the term a tool for analysing how societies react to perceived threats.
```

## Empire's Atrocities and Humanitarian Outrage

Lieutenant Harry "Breaker" Morant, an English-born bush balladeer in Australia, served in the Bushveldt Carbineers in the northern Transvaal. His case began with a letter from fifteen of his own men. He was convicted of murdering prisoners and captured civilians, including eight surrendered Boers; the South African historian Charles Leach notes that three Black African witnesses were also shot. Morant and Peter Handcock were executed in Pretoria on 27 February 1902. Federated Australia demanded an explanation, and its Defence Act of 1903 required the Governor-General to confirm any death sentence on an Australian soldier, so none was executed in the First World War. Bruce Beresford's 1980 film made Morant a folk hero, but Craig Wilcox calls George Witton's *Scapegoats of the Empire* (1907) a "half-truth", a pardon petition was rejected in 2010, and descendants of the victims criticised the campaign.

{{image: Emily Hobhouse | Emily Hobhouse, whose 1901 report on the Boer War camps forced an official inquiry}}

The camps for Boer women and children became a scandal through Emily Hobhouse, who reached the Bloemfontein camp in January 1901 and published her report that June.

```quote
I call this camp system a wholesale cruelty… To keep these Camps going is murder to the children.
Emily Hobhouse · Report of a Visit to the Camps of Women and Children · 1901
```

The Liberal leader Sir Henry Campbell-Bannerman denounced "methods of barbarism". The government won the Commons vote but appointed the all-female Fawcett Commission, which corroborated her account. Counts of the dead differ: one tally gives 27,927 Boers, while the British Empire chapter gives 18,000 to 26,000; in separate camps at least 14,154 Black Africans died, probably about 20,000, and their treatment "elicited little outrage". Niall Ferguson attributes the deaths to incompetence rather than a genocidal policy.

The Congo campaign's first voice was African American: in 1890 the historian George Washington Williams wrote an open letter to King Leopold II, and in a letter to the US Secretary of State he accused the Congo state of "crimes against humanity", an early use of the phrase that Adam Hochschild highlights. The shipping clerk E. D. Morel noticed that ships brought rubber out but sent mainly arms and officers in; the consul Roger Casement reported to the Foreign Office in 1904; together they founded the Congo Reform Association. The missionary Alice Seeley Harris photographed Nsala of Wala with the severed hand and foot of his five-year-old daughter, and her lantern-slide shows toured Britain. Belgium annexed the territory in 1908. Critics note that the Association sought Belgian rule, not the end of colonialism, and Felix Lösing argues that anxieties about white prestige helped it succeed. Imperial Expansion and Resistance and Modern African History since 1860 cover the Free State and its debated death toll.

At Amritsar on 13 April 1919, Brigadier-General Reginald Dyer's troops fired 1,650 rounds into a crowd in the walled Jallianwala Bagh. The official toll was 379; the Congress inquiry estimated about 1,000. Dyer told the Hunter Commission that otherwise the crowd "would have come back again and laughed". He was relieved of command but never prosecuted; Churchill called the massacre "unutterably monstrous", yet many Britons thought Dyer a hero. Kim Wagner argues that the shooting was an act of fear rooted in memories of 1857, not an aberration. The British Empire chapter tells the story in full.

## Spies, Media Trials and National Apologies

Vladimir Petrov, a KGB officer at the Soviet embassy in Canberra, defected in April 1954, and crowds at Sydney airport tried to stop his wife Evdokia being flown out. Robert Menzies announced a Royal Commission on Espionage shortly before an election Labor had been expected to win. No one was charged and no major spy ring was found, but the Labor leader H. V. Evatt's conspiracy claims helped split his party, which did not return to office until 1972. Once ASIO files opened, Robert Manne's *The Petrov Affair* (1987) found no conspiracy, against the earlier account in *Nest of Traitors* (1974).

The Chamberlain case became Australia's standard example of trial by media. Nine-week-old Azaria Chamberlain disappeared from a campsite at Uluru in 1980; her parents said a dingo took her. Rumours and "sickening jokes" polarised opinion, and Lindy Chamberlain was convicted of murder in 1982. After Azaria's jacket was found near dingo lairs in 1986 she was released, a royal commission found reasonable doubt, and the convictions were quashed in 1988. A fourth inquest in 2012 found that a dingo took the child.

Other inquiries exposed the state's own wrongs. Laws such as the Northern Territory's Aboriginals Act of 1910 allowed the removal of Aboriginal and Torres Strait Islander children; official estimates suggest between one in ten and one in three were taken in some regions between 1910 and 1970. The historian Peter Read named them "the stolen generations" in 1981. *Bringing Them Home* (1997), the report of a national inquiry by the Human Rights and Equal Opportunity Commission (not a royal commission), drew on 777 submissions, 535 of them Indigenous, and described the removals as genocide, a finding some critics dispute. John Howard refused an apology; on 13 February 2008 Kevin Rudd said: "For the pain, suffering, and hurt of these Stolen Generations, their descendants and for their families left behind, we say sorry."

Joanne McCarthy's reporting in the *Newcastle Herald* helped prompt Julia Gillard to announce the Royal Commission into Institutional Responses to Child Sexual Abuse in 2012. By its final report in 2017 it had made 409 recommendations in all, after about 8,000 private sessions; a National Redress Scheme began in July 2018, and in October Scott Morrison delivered a national apology. Here was the opposite of a baseless panic. The "Satanic panic" that *Michelle Remembers* (1980) helped launch produced more than 12,000 accusations in the United States, yet, *The New York Times* reported in 1994, police could not substantiate any allegation of organised cult abuse; institutional child abuse proved real and vast.

## Beyond the Empire: Classic Western Scandals

The Dreyfus Affair showed the press on both sides. Captain Alfred Dreyfus, an Alsatian Jewish officer, was convicted of treason in 1894 after the antisemitic *La Libre Parole* broke the story; the real culprit, Esterhazy, was acquitted. Émile Zola's "J'Accuse…!" of 13 January 1898 lifted *L'Aurore* from about 30,000 copies to nearly 300,000. Dreyfus was exonerated in 1906, and the phrase travelled: in 1925 the Palestinian newspaper *Filastin* headed an editorial against the Balfour Declaration "J'Accuse!". Nationalism and the Making of Nation-States returns to the affair.

Teapot Dome showed what inquiry could and could not do. Interior Secretary Albert Fall leased naval oil reserves without competitive bidding and took a \$100,000 loan from an oilman; he became the first U.S. cabinet officer jailed for misconduct in office, but no one was convicted of paying the bribes. In Britain in 1963, War Secretary John Profumo's affair with Christine Keeler, who also knew a Soviet naval attaché, came out after shots were fired at Stephen Ward's flat; Profumo denied it to the Commons, then resigned, and Ward died of an overdose during a trial widely seen as establishment revenge.

Watergate became the template. After the break-in of 17 June 1972, Bob Woodward and Carl Bernstein of *The Washington Post* followed "Deep Throat", later revealed as the FBI's Mark Felt. Nixon resigned in August 1974, new laws on presidential records and government ethics followed, and the suffix "-gate" went global. In Iran–Contra, secret arms sales to Iran whose proceeds funded the Contras, the arms sales were first exposed abroad, by the Lebanese magazine *Ash-Shiraa* on 3 November 1986, and the diversion of funds came out weeks later; Latin America in the Cold War places it in context. In Britain, after *The Guardian* revealed in 2011 that a murdered schoolgirl's phone had been hacked, the *News of the World* closed and the Leveson Inquiry followed, though its second part was cancelled in 2018.

## Bribery and the Global Scandal

In Japan in 1914, kickbacks from Siemens and Vickers to naval officers brought crowds of up to 50,000 into Tokyo's streets, and Prime Minister Yamamoto Gonnohyōe resigned. In 1976 a U.S. Senate subcommittee found \$22 million in Lockheed's foreign bribes: Japan's Kakuei Tanaka was arrested, Prince Bernhard of the Netherlands was forced from public roles, Italy's President Leone resigned, and the United States passed the Foreign Corrupt Practices Act. The Recruit share scandal, which broke in 1988, brought down Takeshita's cabinet in 1989. In India, Swedish Radio alleged kickbacks on the Bofors howitzer contract in 1987, and journalists at *The Hindu* pursued the story, which contributed to Congress's defeat in 1989. In South Africa, the PAC MP Patricia de Lille raised a dossier on the 1999 arms deal; only two men were convicted, and an inquiry that dismissed most allegations had its findings overturned in 2019.

Brazil's Lava Jato ("Car Wash") investigation, begun in 2014, exposed kickbacks at Petrobras, and the firm Odebrecht admitted bribing officials in twelve countries. Lula was jailed in 2018, but his convictions were annulled in March 2021, and on 23 March 2021 a Supreme Court panel ruled 3–2 that Judge Sergio Moro, who had become Bolsonaro's justice minister in 2019, had been biased; Lula won the presidency again in 2022. In Malaysia, reporting by *The Edge*, *Sarawak Report* and *The Wall Street Journal* in 2015 traced about US\$700 million to the accounts of Najib Razak, under whom the 1MDB fund was set up. His coalition lost power for the first time in 2018, and on 26 December 2025 he was convicted on all 25 main 1MDB counts, with an appeal pending.

```checkpoint
q: How did the Iran–Contra affair first become public?
a: Through Bob Woodward and Carl Bernstein's reporting in The Washington Post.
x: They exposed Watergate in 1972–74, not Iran–Contra.
a*: Through the Lebanese magazine Ash-Shiraa in November 1986.
a: Through the Tower Commission's report.
x: The Tower Commission investigated after the story had already broken.
a: Through a leak to The Guardian.
x: The Guardian broke the phone-hacking revelations in 2011.
hint: The first report came from the Middle East.
why: Scandal often travels across borders; this one was exposed abroad before Washington investigated.
---
q: What happened to Lula's convictions from the Lava Jato investigation?
a: They were upheld, and he never returned to office.
x: He won the presidency again in 2022.
a: They were overturned because Odebrecht withdrew its confession.
x: The annulment came from the courts, which separately found Judge Moro biased; it did not depend on Odebrecht.
a: He was pardoned by Bolsonaro.
x: The convictions were annulled by a Supreme Court justice, Edson Fachin, not set aside by a pardon.
a*: They were annulled in March 2021, and a Supreme Court panel ruled 3–2 that Judge Moro had been biased.
hint: Think of the leaks about the judge and the judge's later career.
why: Lava Jato shows how an anti-corruption campaign can itself be judged politicised.
```

## Did Scandal Drive Reform?

The cases suggest no single answer. Scandals did produce reforms: the age of consent rose in 1885, Watergate left lasting statutes, and Lockheed helped produce an anti-bribery law. But reform often rode on panic and carried new harms, as the Labouchère Amendment did, and inquiries could contain scandal as well as expose it: the Morant Bay commission spared martial law, Dyer was never prosecuted, and the Petrov commission charged no one. Whose suffering counted was itself political. The Boer camp outcry centred on white victims; the Congo campaign sought a new colonial master; Myall Creek may have taught settlers silence; and people such as Mary Jane Hicks and Nsala of Wala reached the public mainly through others' words and images.

Other panics are treated elsewhere: witch-hunts and #MeToo in Women and Gender in World History, the Lavender Scare in Modern American History: the United States in the Twentieth Century, the gin panic in History and Drugs, and Salem in Colonial North America. Cohen himself conceded that "panic" suggests irrationality and kept it as a metaphor. The concept is a lens, not a verdict: the historian's task is to ask what was real, what was exaggerated, who profited from the alarm, and what changed.

## Further exploration

- **Stanley Cohen, *Folk Devils and Moral Panics: The Creation of the Mods and Rockers* (1972).** The founding study of moral panic, by a South African-born sociologist.
- **John B. Thompson, *Political Scandal: Power and Visibility in the Media Age* (2000).** How media visibility made scandal central to modern politics.
- **Rohan McWilliam, *The Tichborne Claimant: A Victorian Sensation* (2007).** Imposture, class and popular radicalism.
- **Gad Heuman, *'The Killing Time': The Morant Bay Rebellion in Jamaica* (1994).** The rebellion and its repression from the Jamaican side.
- **Adam Hochschild, *King Leopold's Ghost: A Story of Greed, Terror and Heroism in Colonial Africa* (1998).** The Congo and the campaign against Leopold; its death toll is debated.
- **Kim A. Wagner, *Amritsar 1919: An Empire of Fear and the Making of a Massacre* (2019).** Colonial fear and the massacre's afterlives.
- **Melissa Bellanta, *Larrikins: A History* (2012).** Australian youth panics, including female larrikins.$mn_scandals_master$,
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
  select $mn_scandals_quiz$[
    {"type": "mcq", "prompt": "What was Bringing Them Home (1997)?", "options": ["The report of a national inquiry by the Human Rights and Equal Opportunity Commission into the removal of Aboriginal and Torres Strait Islander children", "The final report of the Royal Commission into Institutional Responses to Child Sexual Abuse", "Kevin Rudd's National Apology to the Stolen Generations", "The report of the Royal Commission on Espionage after the Petrov defection"], "answerIndex": 0, "explanation": "It was a HREOC national inquiry, not a royal commission; drawing on 777 submissions, it described the removals as genocide.", "id": "q1"},
    {"type": "mcq", "prompt": "What did the Criminal Law Amendment Act 1885, passed after W. T. Stead's 'Maiden Tribute' campaign, do to the age of consent for girls?", "options": ["Lowered it from 16 to 13", "Left it unchanged but banned brothels", "Raised it from 13 to 16", "Raised it from 12 to 21"], "answerIndex": 2, "explanation": "The Act raised the age of consent from 13 to 16; the same Act carried the Labouchère Amendment.", "id": "q2"},
    {"type": "mcq", "prompt": "Who wrote an open letter to King Leopold II about the Congo in 1890, before Morel and Casement began their campaign?", "options": ["Emily Hobhouse", "Alice Seeley Harris", "Émile Zola", "George Washington Williams"], "answerIndex": 3, "explanation": "The African American historian George Washington Williams wrote from Stanley Falls in 1890; in a separate letter to the US Secretary of State he accused the Congo state of 'crimes against humanity'.", "id": "q3"},
    {"type": "mcq", "prompt": "What did the Royal Commission into the Morant Bay repression report in 1866?", "options": ["That Governor Eyre should be tried for murder", "That the punishments were excessive and the floggings reckless, though it did not condemn martial law itself", "That George William Gordon had planned the rising", "That no one had been killed after the rebellion was suppressed"], "answerIndex": 1, "explanation": "The commission criticised the punishments and found no sufficient proof of Gordon's complicity, but did not condemn martial law; grand juries later declined to indict Eyre.", "id": "q4"},
    {"type": "open", "prompt": "Using Stanley Cohen's idea of moral panic and at least two cases from the chapter, explain how a moral panic differs from a scandal that exposes real wrongdoing.", "rubric": "A strong answer defines moral panic (Cohen's definition, folk devils, moral entrepreneurs, media amplification, gatekeepers' response) and notes that Cohen did not coin the phrase but made it a concept; mentions Goode and Ben-Yehuda's criteria, especially disproportion, and Hall et al. on the mugging scare and race; contrasts cases such as the mods and rockers, the larrikin panic and Mount Rennie, or the Satanic panic (12,000 accusations, no organised cult abuse substantiated) with scandals that revealed real harms, such as institutional child abuse, Myall Creek or the Boer War camps; and recognises that calling something a panic does not prove the danger imaginary.", "id": "q5"},
    {"type": "open", "prompt": "Did scandals in the British imperial world lead to reform? Assess with reference to at least three cases.", "rubric": "A strong answer weighs outcomes: Myall Creek convictions (but Fleming untried and Elder's argument about pacts of silence); the Molesworth committee and the end of transportation to New South Wales (with Maxwell-Stewart's doubts about its influence); Morant Bay (Royal Commission criticism, Eyre removed but never indicted, Crown Colony rule); Stead and the 1885 Act (age of consent raised, but the Labouchère Amendment); Hobhouse and the Fawcett Commission (with Black camp deaths drawing little outrage); the Congo campaign (Belgian annexation rather than decolonisation); Amritsar (Dyer relieved but never prosecuted); and Bringing Them Home and the 2008 apology. It should note whose voices were heard and how inquiries could contain as well as expose scandal.", "id": "q6"}
  ]$mn_scandals_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/thematic-history/scandals-in-history-moral-panics-repression-and-reform', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

-- History of Civil Liberties — canonical master article, co-written and human-reviewed.
-- history/thematic-history/history-of-civil-liberties @ research/advanced/read.
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
    'history/thematic-history/history-of-civil-liberties',
    'research',
    'advanced',
    'read',
    $mn_civlib_master$> **Freedoms won, written down, and taken back.** Civil liberties are protections against the power of one's own rulers: freedom of speech, press, assembly and religion; freedom from imprisonment without legal cause; due process and privacy. This chapter follows their uneven history, from royal edicts and later-labelled "charters" in Persia, India and Mali, and religious accommodation under Mughal and Ottoman rule, through Magna Carta, habeas corpus and 1689, the Enlightenment, and the Atlantic declarations, including Haiti's. It then traces a recurring counter-pattern: sedition laws in colonial India and Meiji Japan, wartime suspensions in the United States, emergency rule and surveillance states. It ends with the Universal Declaration of Human Rights and the regional charters, today's measures of decline, and the historians who disagree about when "rights" began.

## Before Rights: Edicts, Cylinders and Charters

Searches for an ancient pedigree for civil liberties need careful handling. The **Cyrus Cylinder**, a clay foundation deposit inscribed in Akkadian after the Persian conquest of Babylon in 539 BCE, praises Cyrus as chosen by Marduk and says he restored temples and returned deported peoples to their homes; it names only Mesopotamian sanctuaries, not the Jews or Jerusalem. From the late 1960s the Shah of Iran promoted it as "the first charter of human rights", and President Ahmadinejad repeated the phrase in 2010. Scholars such as Bill T. Arnold and Piotr Michalowski reject the label as anachronistic: it is "not an edict of any kind, nor does it provide any unusual human rights declaration as is sometimes claimed". The British Museum still stresses that returning deported peoples was a significant reversal of earlier Assyrian and Babylonian practice. The chapter on The Persian Empire sets it in context.

{{image: Cyrus Cylinder | The Cyrus Cylinder, a Babylonian foundation inscription made after the Persian conquest of 539 BCE, now in the British Museum.}}

In India the Mauryan emperor **Ashoka** (ruled about 268–232 BCE), by his own account remorseful after the Kalinga war, left more than thirty inscriptions preaching *dhamma*. One says the king "wishes that all sects may dwell in all places".

```quote
For whosoever praises his own sect or blames other sects … injures his own sect very severely. But concord is meritorious
Ashoka · Major Rock Edict 12 (Hultzsch's translation) · 3rd century BCE
```

A pillar edict gave prisoners sentenced to death three days' respite so that relatives could plead for them. Yet these were royal moral instructions, not rights a subject could claim.

In West Africa the **Kouroukan Fouga**, or Manden Charter, is said in the oral Epic of Sundiata to have been proclaimed by an assembly founding the Mali Empire after the Battle of Krina (1235); the text reconstructed at Kankan in 1998 includes the article "do not maltreat the foreigners", and UNESCO listed the charter as intangible heritage in 2009, though the listing's description in fact refers to a different text, the so-called Hunters' Oath. But the epic's earliest recorded versions date from the 1890s, and the "charter" text was reconstructed from oral tradition at a workshop in Kankan, Guinea, in 1998. It is an oral tradition with a modern reconstruction, not a thirteenth-century document (the chapter on Ghana, Mali, and the Trans-Saharan World describes the empire).

## Tolerance Under Empire

Multi-faith empires developed arrangements for difference that were neither modern liberties nor simple persecution. The Mughal emperor **Akbar** (1556–1605) abolished the *jizya*, the tax on non-Muslims (in 1564 according to his court historian Abu'l Fazl; another contemporary dates it to 1579), appointed non-Muslims to high civil and military office, and in 1575 built a House of Worship at Fatehpur Sikri for debates among faiths. The historian M. Athar Ali argued that Akbar's *sulh-i kul*, "universal peace", was a general policy of imperial administration rather than a purely religious idea. As the chapter on The Mughal Empire describes, Aurangzeb reimposed the jizya in 1679.

Ottoman non-Muslims had wide communal autonomy in personal law, education and tax collection, but the "millet system" of older accounts was not systematic before the nineteenth century, when Mahmud II (r. 1808–1839) first applied the term systematically; and autonomy went with political subordination. On 3 November 1839 the **Edict of Gülhane** promised guarantees to all Ottoman subjects regardless of religion or ethnicity, followed by a Reform Edict in 1856: royal promises rather than legal changes, and they were never fully carried out.

## England: Magna Carta, Habeas Corpus and 1689

King John sealed **Magna Carta** at Runnymede on 15 June 1215 to make peace with rebel barons. It protected barons from illegal imprisonment and promised swift justice. Pope Innocent III annulled it in August 1215, but it was reissued and confirmed as statute in 1297. A statute of 1354 widened "free man" to "no man, of whatever estate or condition he may be" and introduced the phrase "due process of law". The charter's fame as a foundation of universal liberty is largely a later creation: from the late sixteenth century lawyers such as Sir Edward Coke presented it as restoring ancient Anglo-Saxon freedoms, a reading that influenced American colonists. Victorian historians showed it concerned king and barons, and most historians now treat its universal reading as a myth, though one that shaped later liberties. (The chapter God Save the Queen: the British Monarchy tells its political story.)

The writ of **habeas corpus**, which makes a jailer justify a detention before a court, existed for centuries before the Habeas Corpus Act of 1679 and is thought to derive from the Assize of Clarendon (1166); the 1679 Act strengthened the procedure rather than creating it. A popular story holds that it passed in the Lords only because the tellers miscounted as a joke; the historian Helen Nutting judged it "highly improbable". The writ could be switched off: it was suspended in 1794, and statutes authorised internment without trial in both World Wars and during the Troubles in Northern Ireland.

The **Bill of Rights** of 1689 barred the Crown from suspending laws or taxing without Parliament, and forbade excessive bail and "cruel and unusual punishments". Its famous "freedom of speech" was parliamentary privilege, protecting debates in Parliament, not a right of the public. The **Toleration Act** of the same year allowed Protestant nonconformists to worship but deliberately excluded Roman Catholics, Jews, nontrinitarians and atheists.

## The Enlightenment Case

John Milton's *Areopagitica* (1644) attacked Parliament's order requiring books to be licensed before publication; in Britain pre-publication licensing ended only when the Licensing of the Press Act lapsed in 1695. Sweden's Freedom of the Press Act of 1766 was the world's first legal protection of press freedom.

John Locke's *A Letter Concerning Toleration*, written in Dutch exile in 1685–86, also had limits. A church whose members "pass into the allegiance and service of another prince" had no right to be tolerated, a passage traditionally read as aimed at Catholics, though Mark Goldie and others argue Locke did not exclude them in principle. Atheists he excluded outright: "those are not at all to be tolerated who deny the being of a God", because oaths could not bind them.

Montesquieu's *The Spirit of the Laws* (1748) argued for separation of powers and civil liberty, influencing Catherine the Great and the American framers. Voltaire's *Treatise on Tolerance* (1763) answered the execution of the Protestant Jean Calas on a baseless murder charge, and became a French bestseller again after the *Charlie Hebdo* shooting in 2015. Beccaria's *On Crimes and Punishments* (1764) condemned torture and the death penalty. The chapter on The Enlightenment covers the wider movement.

```checkpoint
q: What does recent scholarship say about Magna Carta as a charter of universal liberty?
a*: That this reading is largely a myth built from the late sixteenth century by lawyers such as Coke, though the myth itself shaped later liberties.
a: That it was always understood as protecting every English subject.
x: Victorian historians showed that the charter concerned the king and the barons, not ordinary subjects.
a: That the Pope confirmed it as a universal charter in 1215.
x: Innocent III annulled it in August 1215 as "null, and void of all validity for ever".
a: That it was written as the origin of the writ of habeas corpus.
x: The writ developed separately; Coke and others later presented Magna Carta as its foundation.
hint: Ask when, and by whom, the universal reading was constructed.
why: The charter's meaning changed as later generations reinterpreted it for their own struggles.
---
q: How far did the English settlement of 1689 protect free speech and religion?
a: It guaranteed free speech to the whole population.
x: The Bill of Rights protected freedom of speech and debate in Parliament, a parliamentary privilege.
a: It gave equal religious freedom to Catholics, Jews and Protestants.
x: The Toleration Act deliberately excluded Catholics, Jews, nontrinitarians and atheists.
a*: Narrowly: free speech meant parliamentary privilege, and toleration covered only Protestant nonconformists who took the oaths.
a: It abolished the writ of habeas corpus.
x: The writ survived and had been strengthened by the Act of 1679.
hint: Look at whose speech and whose worship were protected.
why: The documents of 1689 limited royal power without granting general rights to all subjects.
```

## Declarations and Their Exclusions, 1789–1805

The US Constitution of 1787 had no bill of rights; opponents made that a central objection, and Madison, at first reluctant, drafted the amendments ratified on 15 December 1791. The First protected speech, press, religion and the right "peaceably to assemble"; the Fourth, against unreasonable searches, became the root of American privacy law. They bound only the federal government until courts applied them to the states, piece by piece, under the Fourteenth Amendment (1868). The chapter Declarations of Independence: the American Revolution tells the founding story.

France's National Constituent Assembly adopted the **Declaration of the Rights of Man and of the Citizen** on 26 August 1789. Its Article XI called free communication of opinions "one of the most precious rights of man". But the Constitution of 1791 made women, the poor, servants, the enslaved and others "passive citizens", and the Declaration did not end colonial slavery. Olympe de Gouges answered in 1791 with a *Declaration of the Rights of Woman*, arguing in one translation that since "woman has the right to mount the scaffold, so she should have the right equally to mount the rostrum". She was guillotined in 1793.

The enslaved of Saint-Domingue forced the issue, as the chapter on French and Haitian Revolutions describes. France abolished slavery in 1794 and Napoleon reinstated it in 1802; Haiti declared independence in 1804 under Jean-Jacques Dessalines, who was proclaimed emperor that year. His imperial constitution of 1805 declared that "slavery is forever abolished", barred white men from setting foot in Haiti as masters or proprietors or acquiring property there, and ended distinctions of colour: all Haitians were to be known as "Blacks". Freedom from slavery became a state's founding principle, even as plantation labour was still enforced.

Elsewhere abolition came with conditions, as the chapter on Abolition and Emancipation explains: Britain's Act of 1833 imposed "apprenticeship" and compensated slaveholders; the US Thirteenth Amendment (1865) abolished slavery "except as a punishment for crime"; Mauritania formally abolished it only in 1981. Women's votes followed a long arc, from New Zealand in 1893 (Māori women included, after Kate Sheppard's campaign) to the United States in 1920 (though in practice many women of colour remained excluded), France in 1944, Swiss federal elections in 1971 and Saudi municipal elections in 2015.

## Constitutions Within Limits

Nineteenth-century states learned to grant liberties and fence them in. Metternich's **Carlsbad Decrees** of 1819 set up press censors across the German Confederation until 1848. Japan's **Meiji Constitution** of 1889 listed rights of subjects, including privacy of correspondence, speech, assembly and religion, but religious freedom held only "within limits not prejudicial to peace and order", and, as Oda's *Japanese Law* notes, the liberties were freely subject to limitation by law. The Peace Preservation Law of 1925 punished joining any association aimed at "altering the kokutai", the national polity; more than 70,000 people were arrested under it before the Allied occupation repealed it in 1945. The chapter on The Meiji Restoration describes the wider reforms.

## Sedition and Emergency: India

Colonial rule produced some of the most durable restrictions. Section 124A, the offence of sedition or "exciting disaffection", entered the Indian Penal Code in 1870. It was used against Bal Gangadhar Tilak in 1897 and 1908 and against Gandhi in 1922, who at his trial called it the "prince among the political sections of the Indian Penal Code designed to suppress the liberty of the citizen". The **Rowlatt Act**, passed on 18 March 1919 by the Imperial Legislative Council over the opposition of its Indian members, allowed detention for up to two years without trial. Jinnah called it a "Black Act" and resigned; Gandhi's satyagraha followed, then Amritsar, as the chapter on The First World War (WW1) recounts.

Such laws outlived the Raj. Under Indira Gandhi sedition became an offence allowing arrest without warrant in 1973, and during the **Emergency** of 1975–77 elections were postponed, the press was censored, and 34,988 people were arrested under one detention law (MISA) and 75,818 under the Defence of India rules. In *ADM Jabalpur* (1976) the Supreme Court held that detainees could not seek habeas corpus while the right to life and liberty was suspended. The lone dissenter, Justice H. R. Khanna, was passed over for Chief Justice; in 2017 a nine-judge bench, in the privacy case *Puttaswamy*, repudiated the ruling, and Justice Chandrachud's lead opinion said Khanna "was clearly right". The Supreme Court put sedition on hold in May 2022, and the new criminal codes in force from 2024 replaced Section 124A. (See Modern South Asia.)

## War and Security in the United States

American history shows the same cycle of emergency and regret. The **Alien and Sedition Acts** of 1798, passed during the Quasi-War with France, criminalised "false" or "malicious" statements against the government; prosecutions of publishers, a congressman and even a drunken bystander helped Jefferson win in 1800, and the Sedition Act expired. The Alien Enemies Act, however, is still in force: used in the War of 1812 and both World Wars, it was invoked by President Trump in March 2025 for deportations, prompting litigation.

In April 1861 Lincoln authorised the suspension of habeas corpus along the military line between Philadelphia and Washington; when Chief Justice Taney ruled in *Ex parte Merryman* that only Congress could do so, Lincoln did not comply, asking whether all the laws but one should go unexecuted "lest that one be violated". In the First World War the Espionage Act, as amended by the Sedition Act of 1918, brought Eugene V. Debs a ten-year prison sentence (commuted in 1921), and in *Schenck* (1919) Justice Holmes upheld a conviction for anti-draft leaflets, a ruling largely overturned in 1969. The **Palmer raids** of 1919–20 arrested thousands of people (estimates range from about 3,000 to 10,000) and deported 556 resident aliens.

Crystal Eastman and Roger Nash Baldwin's bureau for anti-war speech and conscientious objectors, founded in 1917, became the **American Civil Liberties Union** in 1920, the first such body not tied to one group or issue. In *Gitlow* (1925), an ACLU case, the Supreme Court accepted that free-speech protection applied against the states while upholding the conviction; in 1977–78 the ACLU defended a neo-Nazi group's right to march in Skokie, Illinois, a mostly Jewish town.

Executive Order 9066 of February 1942 led to the removal of about 120,000 people of Japanese descent, 62 per cent of them US citizens, to ten camps. The Supreme Court upheld the exclusion in *Korematsu* (1944), over three dissents.

```quote
The principle then lies about like a loaded weapon, ready for the hand of any authority that can bring forward a plausible claim of an urgent need.
Justice Robert Jackson · dissent, Korematsu v. United States · 1944
```

Korematsu's conviction was vacated in 1983, after it emerged that evidence of no espionage had been suppressed, and the Civil Liberties Act of 1988 paid survivors \$20,000 each, after a federal commission in 1983 had blamed "race prejudice, war hysteria, and a failure of political leadership". In *Trump v. Hawaii* (2018) Chief Justice Roberts wrote that *Korematsu* "was gravely wrong the day it was decided"; some scholars call this a disavowal rather than a formal overruling. McCarthyism then targeted the Hollywood Ten and gay federal employees in the "lavender scare". The civil rights era brought *Brown v. Board of Education* (1954), the Civil Rights Act (1964), the Voting Rights Act (1965) and rulings such as *Gideon* and *Miranda*, told in Modern American History: the United States in the Twentieth Century.

## Universal Rights After 1945

The **Universal Declaration of Human Rights** was adopted in Paris on 10 December 1948 by 48 votes to none, with 8 abstentions, among them the USSR, South Africa and Saudi Arabia, the last objecting chiefly to the freedom to change religion and to equal marriage rights. Its drafters came from many traditions. Eleanor Roosevelt chaired the Commission on Human Rights; the Canadian John Peters Humphrey wrote the first blueprint; René Cassin of France gave it its structure; P. C. Chang of China urged that it reflect more than Western ideas and quoted Mencius; Charles Malik of Lebanon was rapporteur; and Hansa Mehta of India is credited with changing "all men" to "all human beings". The Declaration is not a treaty, though many lawyers regard it as customary international law.

Binding instruments followed. The **European Convention on Human Rights** (signed 1950, in force 1953) has a court that has sat in Strasbourg since 1959; Russia was a party from 1998 until 2022. The International Covenant on Civil and Political Rights (1966) allows states to suspend (derogate from) rights only in an emergency "which threatens the life of the nation", and never from the rights to life or freedom from torture and slavery. The **African Charter on Human and Peoples' Rights** (1981, in force 1986) added collective "peoples' rights" and individual duties to the list.

## Surveillance States

East Germany's **Stasi** had 91,015 employees and 173,081 informants when the regime collapsed, roughly one collaborator for every 63 East Germans; higher popular figures, such as one informer per 6.5 people, include estimated part-time informers and are best treated as an upper estimate. Its files were opened to those they concerned in 1992. Liberal democracies built their own powers after 11 September 2001. The USA PATRIOT Act passed the Senate 98–1 and drew criticism for indefinite detention of immigrants and "sneak and peek" searches; Britain's indefinite detention of foreign terrorism suspects was ruled incompatible with the European Convention in 2004; at least 780 people have been held at Guantánamo Bay. In June 2013 leaks by Edward Snowden, an NSA contractor, revealed a court order for bulk collection of Verizon phone records and the PRISM programme; US appeals courts later held that the law did not authorise bulk collection (2015) and called the programme illegal (2020), as the chapter on Technological Advancements and the Digital Age describes.

```checkpoint
q: What pattern links Korematsu (1944), ADM Jabalpur (1976) and Schenck (1919)?
a: Each was overturned within a year by the same court.
x: The repudiations came decades later: Brandenburg (1969), Puttaswamy (2017), Trump v. Hawaii (2018).
a*: Each upheld wartime or emergency restrictions at the time and was repudiated or largely overturned decades later.
a: Each struck down an emergency law as unconstitutional.
x: All three upheld the restrictions before them.
a: Each concerned the rights of foreign diplomats.
x: They concerned Japanese Americans, Indian detainees and an American anti-draft campaigner.
hint: Compare what the courts did during the emergency with what later courts said.
why: Courts have often deferred to governments in crises and recanted afterwards.
---
q: Which statement about the Stasi's informers is best supported?
a: One in every 6.5 East Germans was a confirmed informer.
x: That figure includes estimated part-time informers and is only an upper estimate.
a: The Stasi had fewer officers per head than the Gestapo.
x: It had about one full-time officer per 166 people, against one Gestapo officer per 2,000.
a: Its files remain closed to the public.
x: They were opened to the people they concerned in 1992.
a*: At the end it had 91,015 employees and 173,081 informants, about one collaborator per 63 people.
hint: Distinguish core counts from estimates.
why: Careful use of figures matters when describing surveillance.
```

## Rights in Retreat?

Two indices, built from expert coding with different methods, track the trend. Freedom House's *Freedom in the World 2026*, published in March 2026, found that global freedom declined in 2025 for the twentieth consecutive year, with 54 countries declining and 35 improving. V-Dem's *Democracy Report 2026* reported, according to press coverage, that the level of democracy enjoyed by the average person had fallen back to about the level of 1978, and that freedom of expression was the most affected component. The two indices agree on the direction of change, though measuring liberty is itself contested.

## Historians' Debates

When did human rights begin? Lynn Hunt argues that eighteenth-century novels and new attitudes to torture created an "imagined empathy" that produced the declarations of 1776 and 1789; critics doubt that reading novels changes behaviour, and note that her eighteenth century did not extend rights to women. Samuel Moyn replies that the 1940s declarations had little purchase, and that human rights became a mass movement only in the later 1970s, a "last utopia" after socialism and anticolonial nationalism lost their appeal. Steven L. B. Jensen places the breakthrough in the 1960s and credits post-colonial states such as Jamaica, Ghana, Liberia and the Philippines. Paul Halliday argues that habeas corpus grew from the king's claim to know why any subject was held, an instrument of sovereignty that spread unevenly across the empire and was suspended there too. Geoffrey Stone traces American free speech under wartime pressure, and Gautam Bhatia follows Indian free-speech law from colonial sedition onward. Together they suggest that liberties have rarely advanced in a straight line: claimed by the excluded, granted with limits, suspended in emergencies, and recovered, often after courts admitted their mistakes.

## Further exploration

- **Lynn Hunt, *Inventing Human Rights: A History* (2007).** Novels, torture and the "imagined empathy" behind the eighteenth-century declarations.
- **Samuel Moyn, *The Last Utopia: Human Rights in History* (2010).** Argues that human rights became a mass movement only in the 1970s.
- **Mary Ann Glendon, *A World Made New: Eleanor Roosevelt and the Universal Declaration of Human Rights* (2001).** How Roosevelt, Chang, Malik, Cassin and others drafted the Declaration.
- **Steven L. B. Jensen, *The Making of International Human Rights: The 1960s, Decolonization, and the Reconstruction of Global Values* (2016).** Puts the breakthrough in the 1960s and the post-colonial states.
- **Paul D. Halliday, *Habeas Corpus: From England to Empire* (2010).** The writ as an instrument of royal sovereignty, traced through thousands of cases.
- **Geoffrey R. Stone, *Perilous Times: Free Speech in Wartime from the Sedition Act of 1798 to the War on Terrorism* (2004).** American free speech under wartime pressure.
- **Gautam Bhatia, *Offend, Shock, or Disturb: Free Speech under the Indian Constitution* (2016).** Indian free-speech law from colonial sedition onward.$mn_civlib_master$,
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
  select $mn_civlib_quiz$[
    {"type": "mcq", "prompt": "Why do most scholars reject calling the Cyrus Cylinder 'the first charter of human rights'?", "options": ["It is a Babylonian building inscription praising Cyrus, not a declaration of rights", "It was forged in the nineteenth century", "It mentions only the return of the Jews to Jerusalem", "It was written in Greek for a Western audience"], "answerIndex": 0, "explanation": "The cylinder is an Akkadian foundation deposit; the 'charter' label was promoted by the Shah from the late 1960s and is anachronistic.", "id": "q1"},
    {"type": "mcq", "prompt": "What did the 'freedom of speech' in the English Bill of Rights of 1689 protect?", "options": ["Freedom of the press for all subjects", "The right of Catholics to worship publicly", "Freedom of speech and debates in Parliament", "The right to criticise the king in pamphlets"], "answerIndex": 2, "explanation": "It was a parliamentary privilege, not a general right of the public; pre-publication licensing lapsed only in 1695.", "id": "q2"},
    {"type": "mcq", "prompt": "What did the Indian Supreme Court decide in ADM Jabalpur (1976), during the Emergency?", "options": ["That sedition under Section 124A was unconstitutional", "That the Emergency itself was illegal", "That privacy was a fundamental right", "That detainees could not seek habeas corpus while the right to life and liberty was suspended"], "answerIndex": 3, "explanation": "Justice H. R. Khanna was the lone dissenter; a nine-judge bench in Puttaswamy (2017) repudiated the ruling.", "id": "q3"},
    {"type": "mcq", "prompt": "What was the vote in the UN General Assembly adopting the Universal Declaration of Human Rights on 10 December 1948?", "options": ["Unanimous, with no abstentions", "48 in favour, none against, 8 abstentions", "40 in favour, 8 against", "It was adopted without a vote"], "answerIndex": 1, "explanation": "The abstainers included the USSR, South Africa and Saudi Arabia; the Declaration is not a treaty.", "id": "q4"},
    {"type": "open", "prompt": "'Universal rights, partial subjects.' Discuss with reference to the declarations of 1689, 1789–91 and 1805.", "rubric": "A strong answer shows that the Bill of Rights' free speech was parliamentary privilege and the Toleration Act excluded Catholics, Jews, nontrinitarians and atheists (and Locke excluded atheists and, traditionally read, Catholics); that the French Declaration coexisted with 'passive citizens', the exclusion of women (Olympe de Gouges) and colonial slavery; and that Haiti's imperial constitution of 1805 made freedom from slavery its founding principle and called all Haitians 'Blacks', while still enforcing plantation labour. It may use Hunt and her critics.", "id": "q5"},
    {"type": "open", "prompt": "How have governments restricted civil liberties in wartime and emergencies, and how have courts responded?", "rubric": "A strong answer uses examples across countries: the Alien and Sedition Acts (the Alien Enemies Act still in force, invoked in 2025), Lincoln and Merryman, Schenck and Brandenburg, the Palmer raids, Japanese American incarceration with Korematsu and its later disavowal in Trump v. Hawaii, the Rowlatt Act and Section 124A, India's Emergency with ADM Jabalpur and Puttaswamy, Japan's Peace Preservation Law, and post-2001 measures (PATRIOT Act, the Belmarsh ruling, Snowden). It notes the pattern of measures upheld at the time and repudiated later, and may refer to ICCPR Article 4, Stone and Halliday.", "id": "q6"}
  ]$mn_civlib_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/thematic-history/history-of-civil-liberties', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

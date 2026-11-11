-- The Post-Cold War Era — canonical master article, co-written and human-reviewed.
-- history/contemporary-history/the-post-cold-war-era @ research/advanced/read.
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
    'history/contemporary-history/the-post-cold-war-era',
    'research',
    'advanced',
    'read',
    $mn_postcw_master$> **From one superpower to many pressures.** When the Soviet Union dissolved on 26 December 1991, the United States was left without a rival, and many believed that liberal democracy and open markets had won for good. This chapter follows the decades since: the "unipolar moment" and the argument between Francis Fukuyama's "end of history" and Samuel Huntington's "clash of civilizations"; the genocides in Bosnia and Rwanda that answered the decade's optimism; the eastward growth of NATO and the European Union, and Russia's response; the rise of China, India and the wider Global South; the September 11 attacks and the "war on terror"; the crash of 2008, the Arab Spring and the populist wave; the return of great-power rivalry; and the pandemic, climate and artificial-intelligence pressures of the present, with the debates scholars from many parts of the world have had over what the era means.

## A World Without a Rival

The chapter on the Global Cold War and the Arms Race ends with the Soviet Union gone. What replaced the bipolar world was, for a time, something new. Even before the Soviet collapse, the American columnist Charles Krauthammer argued in 1990, in a *Washington Post* column and in an essay in *Foreign Affairs*' 1990/91 issue titled "The Unipolar Moment", that the Cold War would give way not to a world of several great powers but to a unipolar one. Power would reside in a "serenely dominant" United States and its Western allies, with a gap between first and second power greater than any in history. He did not expect the moment to last forever; by 2002 he wrote that "the unipolar moment has become the unipolar era".

Krauthammer saw the **Gulf War** as the event that revealed the new order. Iraq invaded Kuwait on 2 August 1990; the UN Security Council condemned it at once and in November authorised "all necessary means" if Iraq did not withdraw by 15 January 1991. A coalition of 42 countries, the broadest military alliance since the Second World War, began an air campaign on 17 January and a ground offensive on 24 February; a ceasefire came within 100 hours. The limits of American power appeared soon after. In Somalia, where the UN had intervened after the famine of 1992, eighteen American soldiers were killed in Mogadishu on 3–4 October 1993, along with, by most estimates, between about 200 and 700 Somalis. The fear of "another Somalia" would shape Washington's response to Rwanda.

Political scientists argued over how long unipolarity could last. For William Wohlforth, "a unipolar system is one in which a counterbalance is impossible". Kenneth Waltz replied in 2000 that it was "the least durable of international configurations", and Nuno Monteiro later called it prone to conflict.

The decade also built institutions meant to entrench a liberal order. The **World Trade Organization** began on 1 January 1995. The Rome Statute of an **International Criminal Court** was adopted in July 1998 by 120 votes to 7, with China and the United States among those against; the statute came into force in 2002, but China, India, Russia and the United States are not parties, and the court has been accused of disproportionately targeting African leaders, prompting several African governments to announce their withdrawal; Burundi left in 2017. In 2005 the UN endorsed a "responsibility to protect" populations from genocide and other mass crimes, a principle whose application, in Libya, Syria and elsewhere, remains contested.

## The End of History or a Clash of Civilizations?

The most famous attempt to name the age came just before it began. In the summer of 1989 Francis Fukuyama, drawing on Hegel, Marx and Alexandre Kojève, published an essay in *The National Interest*, later expanded into *The End of History and the Last Man* (1992).

```quote
What we may be witnessing is not just the end of the Cold War, or the passing of a particular period of postwar history, but the end of history as such: that is, the end point of mankind's ideological evolution and the universalization of Western liberal democracy as the final form of human government.
Francis Fukuyama · "The End of History?", The National Interest · Summer 1989
```

Fukuyama did not claim that events would stop, only that no superior alternative to liberal democracy remained. Critics heard American triumphalism; he has denied it, suggesting that the European Union resembles a "post-historical" world more than the United States does. At first the evidence seemed to favour him: Freedom House counted 69 electoral democracies among 167 countries in 1989–90, and 123 of 192, about 64 per cent and the highest share it had recorded, in its survey covering 2005.

Huntington, Fukuyama's former teacher, offered the rival picture in *Foreign Affairs* in 1993 and a book of 1996. After ideology, he argued, "the great divisions among humankind and the dominating source of conflict will be cultural." He divided the world into civilizations, Western, Latin American, Orthodox, Islamic, Sinic, Hindu, Japanese and possibly African, named the Sinic and Islamic as challengers to the West, and wrote that "Islam has bloody borders". He called Ukraine a "cleft" country, yet rejected the possibility of a Russia–Ukraine war.

Both theses drew fire. Benjamin Barber stressed the persistence of ethnic and religious loyalties; Jacques Derrida likened Fukuyama's thesis to a religious gospel; Slavoj Žižek noted that China and Singapore showed capitalism could flourish without democracy, and Azar Gat and Robert Kagan wrote of the return of authoritarian great powers. Against Huntington, Edward Said wrote of "The Clash of Ignorance" (2001), and Amartya Sen argued that people hold many identities and that diversity is a feature of most cultures. Others observed that the biggest wars after 1991, in Syria, Yemen and between Russia and Ukraine, were fought *within* Huntington's civilizations, not across them, and some criticise both books as Western-centred. There were answers from outside the West too: Iran's president Mohammad Khatami promoted a "Dialogue Among Civilizations", and the UN made 2001 its Year of Dialogue among Civilizations.

## The Decade's Dark Answer: Bosnia and Rwanda

The optimism of the early 1990s was answered by mass killing. Yugoslavia broke up in a series of wars, which the chapter on the Collapse of the Soviet Union and Eastern Europe describes in detail. At **Srebrenica** in July 1995, a declared UN "safe area", Bosnian Serb forces killed more than 8,000 Bosniak men and boys, a crime ruled genocide; the Yugoslav wars as a whole killed between 130,000 and 140,000 people.

In **Rwanda** the killing was faster still. The rebel Rwandan Patriotic Front (RPF) had invaded from Uganda in 1990, beginning a civil war; accords were signed at Arusha in August 1993, and a UN peacekeeping mission, UNAMIR, was sent. Extremist media prepared the ground: Radio Télévision Libre des Mille Collines called Tutsi *inyenzi*, "cockroaches". In January 1994 UNAMIR's commander, Roméo Dallaire, sent his "genocide fax" reporting an informant ordered to register Tutsi in Kigali; UN headquarters refused his request to raid weapons caches.

On 6 April 1994 the plane carrying President Juvénal Habyarimana was shot down, and the next day the killing began. The prime minister, Agathe Uwilingiyimana, was murdered, and so were the ten Belgian peacekeepers guarding her; a Senegalese UN officer, Mbaye Diagne, rescued her children. Over about a hundred days, to 19 July, victims were often killed by their neighbours. Most scholars estimate that 500,000 to 662,000 Tutsi died, along with some 10,000 Twa and 10,000 to 30,000 opposition and moderate Hutu; Rwanda's own official figure is over a million. There were an estimated 250,000 to 500,000 rapes.

The outside world largely watched; Dallaire called UNAMIR a "failure". Haunted by Somalia, the United States stayed out, and Bill Clinton later said: "I don't think we could have ended the violence, but I think we could have cut it down. And I regret it." France's Opération Turquoise, from 23 June, has a disputed record: it saved some thousands, but was accused of shielding the génocidaires. The RPF ended the genocide by military victory; the killers and many Hutu refugees fled into Zaire, feeding the First Congo War of 1996, and the RPF carried out reprisal killings that one researcher estimated at around 30,000. Historians still debate how far the genocide was planned before 6 April: the UN's tribunal for Rwanda could not prove a conspiracy. The Ugandan scholar Mahmood Mamdani traced its roots to colonialism. In the same months, South Africa held its first democratic election, as the chapter on Apartheid and Its End relates.

```checkpoint
q: What did Francis Fukuyama mean by "the end of history"?
a*: That liberal democracy had emerged as the final form of human government, with no superior ideological alternative left.
a: That major historical events would no longer happen after the Cold War.
x: Fukuyama explicitly did not claim that events would stop; his claim concerned ideas about government.
a: That the world would now divide into rival civilizations defined by religion and culture.
x: That was Samuel Huntington's rival thesis of the "clash of civilizations".
a: That the United States would, for a time, remain the only superpower.
x: That was closer to Charles Krauthammer's "unipolar moment", an argument about power rather than ideas.
hint: Think about ideological evolution rather than events.
why: Fukuyama argued that the contest of ideologies had ended; his critics pointed to ethnic and religious loyalties and to capitalism without democracy.
---
q: Which statement about the Rwandan genocide of 1994 is best supported?
a: The UN peacekeeping mission stopped the killing within a few weeks.
x: UNAMIR was largely a bystander; its own commander called it a failure.
a: Scholars agree that exactly one million people were killed.
x: Most scholars estimate 500,000–662,000 Tutsi plus Hutu and Twa victims; the figure of over a million is Rwanda's official one.
a*: It lasted about a hundred days and was ended by the military victory of the Rwandan Patriotic Front.
a: The killing was carried out mostly by foreign troops.
x: Victims were often killed by their own neighbours, urged on by extremist media.
hint: Think about who actually stopped the killing.
why: The genocide ran from 7 April to 19 July 1994, while the outside world largely failed to act.
```

## Widening Europe and the Russian Question

In Europe the end of the Cold War brought integration on a new scale. The **Maastricht Treaty**, or Treaty on European Union, signed in February 1992, created EU citizenship and set the path to a single currency, though Danish voters rejected it at the first attempt and the French approved it by a *petit oui* of about 51 per cent. Euro notes and coins arrived on 1 January 2002. The Union widened eastward, taking in ten states on 1 May 2004, eight of them formerly communist, and Bulgaria and Romania in 2007.

**NATO** grew in step: Poland, Hungary and the Czech Republic joined in 1999, seven more states in 2004, and four Balkan states between 2009 and 2020. The chapter on the Collapse of the Soviet Union and Eastern Europe sets out the dispute over whether the West had promised Moscow in 1990 not to expand. George Kennan, the diplomat behind Cold War containment, called enlargement "a strategic blunder of potentially epic proportions" and warned that it would inflame nationalist, anti-Western and militaristic opinion in Russia. Others answered that the Central European states had chosen to join, and had every right to.

Russia hardened under **Vladimir Putin**, a former KGB officer elected president in 2000, whose first terms brought growth of around 7 per cent a year on a fivefold rise in oil and gas prices. At the Munich Security Conference in February 2007 he denounced American dominance:

```quote
One centre of authority, one centre of force, one centre of decision-making. It is [a] world in which there is one master, one sovereign.
Vladimir Putin · Speech at the Munich Security Conference (Kremlin English text) · 10 February 2007
```

In April 2008 NATO promised Georgia and Ukraine eventual membership. That August Russia fought a short war with Georgia, and in 2014 it annexed Crimea, the first annexation of part of one European country by another since 1945.

## The Rising Rest

The era's deepest change may have been the shift of economic weight towards Asia. **China**, which joined the WTO in 2001, grew by about 9.5 per cent a year between 1978 and 2013; it overtook Japan as the second-largest economy in 2010, and some 800 million people left extreme poverty between 1978 and 2018.

**India** changed course in 1991, when a balance-of-payments crisis, worsened by the Gulf War's oil-price spike and the collapse of trade with the Soviet Union, left it with reserves worth about three weeks of imports. Prime Minister P. V. Narasimha Rao and his finance minister, Manmohan Singh, dismantled most of the "Licence Raj" of industrial permits, cut tariffs and opened the economy to foreign investment. "Let the whole world hear it loud and clear," Singh said in his budget speech of 24 July 1991. "India is now wide awake." Scholars still argue over how far the reforms were home-grown or imposed by the IMF and World Bank, and critics point to inequality and agrarian distress. In 1998 India and then Pakistan tested nuclear weapons.

In 2001 Jim O'Neill of Goldman Sachs coined "BRIC" for Brazil, Russia, India and China; the group held its first summit in 2009 and has since admitted South Africa and, in the 2020s, several more states including Egypt, Ethiopia and Iran. In Latin America disappointment with the free-market policies of the 1990s brought a "pink tide" of left governments, from Hugo Chávez in Venezuela (1998) to Lula in Brazil (2002) and Evo Morales in Bolivia (2005), rooted in movements such as Argentina's *piqueteros* and Bolivia's Indigenous and coca-growers' movements, and funded by a commodity boom fed partly by Chinese demand. When prices fell, a conservative wave followed, and Venezuela and Nicaragua turned authoritarian. In Africa the African Union replaced the Organisation of African Unity in 2002 and joined the G20 in 2023. *The Economist* hailed "Africa Rising" in 2011, but Patrick Bond called the idea a chimera coined just as commodity-driven growth was ending.

## September 11 and the War on Terror

On **11 September 2001** nineteen al-Qaeda hijackers seized four airliners. Two struck the World Trade Center in New York and a third the Pentagon; the fourth crashed near Shanksville, Pennsylvania, after its passengers revolted. The attacks killed 2,977 people, and more than 9,000 have since died of related illnesses. For the only time in its history, NATO invoked Article 5, its mutual-defence clause. Fareed Zakaria called it "the end of the end of history"; Fukuyama replied that he believed he would in the end be proved right.

President George W. Bush spoke of a "war on terrorism" from 16 September and in January 2002 named Iran, Iraq and North Korea an "axis of evil". Its most contested campaign was the invasion of Iraq in 2003, justified by false claims about weapons of mass destruction and links between Saddam Hussein and al-Qaeda. No stockpiles were found; the UN secretary-general Kofi Annan called the invasion illegal, and Britain's Chilcot Report of 2016 found it unnecessary. Estimates of Iraqi deaths for 2003–06 alone range from 151,000 violent deaths to some 655,000 excess deaths. Brown University's Costs of War project estimates 4.5 to 4.7 million direct and indirect deaths in the post-9/11 war zones and some 38 million people displaced. Huntington's thesis has been cited as an influence both on Islamist strategies and on the war on terror itself.

## Crash, Uprising and Reaction

The next great shock was economic. A crisis in American subprime mortgages from 2007 culminated on 15 September 2008 in the bankruptcy of Lehman Brothers, the largest in US history. In the United States some 8.7 million jobs were lost and unemployment doubled to 10 per cent; the crisis spread to Iceland and the eurozone. Hungary's Viktor Orbán called it a turning point comparable to the world wars, and V-Dem scholars describe a "third wave of autocratization" that they trace to the mid-1990s and that quickened in the 2010s.

In the Arab world the shock was political. On 17 December 2010 Mohamed Bouazizi set himself on fire in Tunisia. Within weeks Tunisia's president Ben Ali had fled, and after eighteen days of protest Egypt's Hosni Mubarak resigned on 11 February 2011, as crowds chanted *ash-shaʻb yurīd isqāṭ an-niẓām*, "the people want to bring down the regime". Libya's Gaddafi was overthrown and killed. Yet the aftermath was bleak: civil wars in Syria, Libya and Yemen, the rise of the Islamic State, a military coup in Egypt in 2013, and an uprising in Bahrain crushed with Saudi-led help.

{{image: 2011 Egyptian revolution | Tahrir Square, Cairo, in February 2011, during the eighteen days of protest that forced Hosni Mubarak to resign.}}

## The Return of Great-Power Rivalry

By the 2010s the question was less whether the unipolar moment would end than whether it already had. On 24 February 2022 Russia launched a full-scale invasion of Ukraine. The UN General Assembly condemned it by 141 votes to 5, with 35 abstentions, but many states of the Global South stayed neutral, and Finland and Sweden joined NATO, bringing it to 32 members. Fukuyama said in 2022 that his "ultimate nightmare" would be China backing Russia's war and Russia backing a Chinese invasion of Taiwan, and "if the United States and the rest of the West couldn't stop that from happening, then that really is the end of the end of history." American military action against Venezuela and, with Israel, against Iran in 2026 is too recent for history's verdict.

Scholars disagree about where power now lies. Stephen Brooks and William Wohlforth argued in 2023 that the United States remains "safely above China and far, far above every other country". Barry Posen and John Mearsheimer see a shift to multipolarity, and China has passed the United States in output measured by purchasing power. The Indian-born scholar Amitav Acharya describes a "multiplex" world: the end of an American world order, though not necessarily of American power. The Singaporean diplomat Kishore Mahbubani has written of power shifting to Asia.

## Populists, Strongmen and the Democratic Recession

The democratic wave went into reverse. Freedom House's report of March 2026 found that global freedom had declined for the twentieth consecutive year, with the United States tied for the sharpest decline among free countries, and V-Dem found nearly a quarter of the world's countries autocratizing in 2025. Since the Cold War, democracies have mostly been dismantled not by coups but by elected leaders weakening institutions from within. Not everyone reads this as a lasting trend: Christian Welzel argues that the third wave overshot popular demand for democracy, and that the regression may reverse.

Much of the change came under the banner of populism. Cas Mudde defined it in 2004 as a "thin-centred ideology" that divides society into "the pure people" versus "the corrupt elite"; whether populism corrects democracy or threatens it remains a central debate. Fareed Zakaria had popularised the phrase "illiberal democracy" in 1997; in July 2014 Orbán declared that "the new state we are constructing in Hungary is an illiberal state, a non-liberal state." The pattern was global. In India, Narendra Modi won the first single-party majority since 1984 in 2014 and revoked Kashmir's special status in 2019, amid charges of democratic backsliding. In Brazil, supporters of Jair Bolsonaro stormed federal buildings after his 2022 defeat, and in September 2025 the Supreme Federal Court convicted him over a coup plot. British voters chose in 2016 to leave the EU, which the UK did in 2020. In the United States, Donald Trump won in 2016, refused to concede in 2020, and won again in 2024. Ivan Krastev and Stephen Holmes argue that Central Europe's turn against liberalism was partly a revolt against the "imitation" of the West expected of it after 1989. Yet reversals happen: Orbán lost Hungary's election of 12 April 2026 in a landslide.

```checkpoint
q: How did Cas Mudde define populism?
a: As a strategy used only by left-wing parties in Latin America.
x: Mudde's definition concerns how populists divide society, not a single region or party family.
a*: As a "thin-centred ideology" that divides society into "the pure people" and "the corrupt elite".
a: As any politics that is popular with voters.
x: Popularity is not the point; the defining feature is a moral division between people and elite.
a: As a form of military dictatorship.
x: Populists usually come to power through elections, not coups.
hint: Think of the two groups his definition sets against each other.
why: Mudde's 2004 definition is widely used, though scholars debate whether populism corrects or threatens democracy.
---
q: Which statement best describes how democracy has declined since the mid-2000s?
a: Mostly through military coups, as during the Cold War.
x: Coups have occurred, but scholars find that most backsliding since the Cold War has come through elected leaders.
a: It has not declined; Freedom House reports steady gains since 2006.
x: Freedom House reported a twentieth consecutive year of decline in its 2026 report.
a: Only in countries outside Europe and North America.
x: Freedom House found the United States tied for the sharpest decline among free countries in 2025, and Hungary was a leading case of illiberalism.
a*: Mostly through elected leaders gradually dismantling institutions from within.
hint: Think about who has been doing the dismantling.
why: V-Dem describes a "third wave of autocratization", though Welzel argues it may reverse.
```

## Planetary Pressures: Pandemic, Climate and AI

The 2020s added pressures no single state could manage. A new coronavirus emerged in Wuhan in December 2019. The World Health Organization declared a public health emergency on 30 January 2020 and a pandemic on 11 March; the emergency ended on 5 May 2023. The pandemic brought the largest global recession since the Great Depression. The WHO estimated about 14.9 million excess deaths in 2020 and 2021 (range 13.3 to 16.6 million), against 5.42 million reported COVID deaths; 81 per cent were in middle-income countries, and India alone, by WHO's estimate, lost 4.7 million. Scientific consensus favours a spillover from animals, though a laboratory-leak hypothesis remains contested.

Climate change ran through the whole era. The Kyoto Protocol of 1997 bound only developed countries to cut emissions, on the principle of "common but differentiated responsibilities". The **Paris Agreement** of December 2015 asked every country to submit plans, aiming to hold warming "well below 2 °C" and preferably to 1.5 °C; following the IPCC, such goals are usually measured over twenty-year averages. The United States withdrew in 2020, rejoined in 2021, and withdrew again by an order signed on 20 January 2025, effective 27 January 2026. The World Meteorological Organization judged 2024 likely the first calendar year more than 1.5 °C above pre-industrial levels, at 1.55 °C (± 0.13 °C), while stressing that a single year above 1.5 °C does not mean the Paris goal has been missed.

Artificial intelligence became a new arena of rivalry. ChatGPT, released on 30 November 2022, reached 100 million monthly users in two months and 900 million weekly users by February 2026, and commentators spoke of a US–China "AI arms race". The world that began in 1991 with one dominant power and a confident ideology has become, in many scholars' view, a contest of several powers, a weakened liberal consensus, and problems that cross every border.

## Further exploration

- **Francis Fukuyama, *The End of History and the Last Man* (1992).** The founding text of post-Cold War optimism, more nuanced than its reputation.
- **Samuel P. Huntington, *The Clash of Civilizations and the Remaking of World Order* (1996).** The rival thesis, best read alongside its critics.
- **Mahmood Mamdani, *When Victims Become Killers: Colonialism, Nativism, and the Genocide in Rwanda* (2001).** A Ugandan scholar on the colonial roots of the genocide.
- **Adam Tooze, *Crashed: How a Decade of Financial Crises Changed the World* (2018).** The 2008 crash and its political and geopolitical consequences.
- **Ivan Krastev and Stephen Holmes, *The Light That Failed: A Reckoning* (2019).** Why Central Europe turned against liberal "imitation" after 1989.
- **Kishore Mahbubani, *Has the West Lost It? A Provocation* (2018).** A Singaporean diplomat on the shift of power to Asia.
- **Cas Mudde and Cristóbal Rovira Kaltwasser, *Populism: A Very Short Introduction* (2017).** A clear guide to the concept and its debates.$mn_postcw_master$,
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
  select $mn_postcw_quiz$[
    {"type": "mcq", "prompt": "Which event did Charles Krauthammer treat as revealing the 'unipolar moment' after the Cold War?", "options": ["The Gulf War of 1990–91, fought by a US-led coalition of 42 countries under a UN Security Council mandate", "The Battle of Mogadishu in 1993", "The September 11 attacks of 2001", "The NATO bombing of Yugoslavia in 1999"], "answerIndex": 0, "explanation": "Krauthammer saw the 1990–91 Gulf crisis as the event that revealed US unipolarity; Iraq's invasion of Kuwait was reversed by a coalition of 42 countries, with a ceasefire within 100 hours of the ground offensive.", "id": "q1"},
    {"type": "mcq", "prompt": "What death toll for the Rwandan genocide do most scholars give?", "options": ["About 14,000, mostly in Kigali", "Exactly one million Tutsi, as all historians agree", "500,000–662,000 Tutsi, plus about 10,000 Twa and 10,000–30,000 opposition and moderate Hutu", "Between 130,000 and 140,000"], "answerIndex": 2, "explanation": "The Rwandan government's official figure is over a million; 130,000–140,000 is the toll of the Yugoslav wars.", "id": "q2"},
    {"type": "mcq", "prompt": "What did Vladimir Putin denounce in his speech at the Munich Security Conference in February 2007?", "options": ["Chinese economic expansion", "Islamist terrorism", "The euro", "A world of 'one master, one sovereign', with a single centre of power, force and decision-making"], "answerIndex": 3, "explanation": "Putin attacked American dominance; in 2008 Russia fought Georgia, and in 2014 it annexed Crimea.", "id": "q3"},
    {"type": "mcq", "prompt": "According to Freedom House's report of March 2026, what happened to global freedom in 2025?", "options": ["It rose for the first time since 2005", "It declined for the twentieth consecutive year, with the United States tied for the sharpest decline among free countries", "It was unchanged", "It declined only in Africa"], "answerIndex": 1, "explanation": "V-Dem likewise found nearly a quarter of countries autocratizing in 2025, though Christian Welzel argues the trend may reverse.", "id": "q4"},
    {"type": "open", "prompt": "Compare Fukuyama's 'end of history' and Huntington's 'clash of civilizations'. How well has each held up since 1991?", "rubric": "A strong answer explains Fukuyama's claim (1989/1992) that liberal democracy is the final form of government, not that events would stop, and Huntington's (1993/1996) that culture and civilization would be the main source of conflict. It uses evidence for and against each: the democratic wave to 2005 and the twenty-year decline since; 9/11 and Zakaria's 'end of the end of history'; wars within rather than across civilizations (Syria, Yemen, Russia–Ukraine); and critics such as Barber, Derrida, Žižek, Kagan, Said and Sen, including the charge that both are Western-centred, and Fukuyama's own revisions.", "id": "q5"},
    {"type": "open", "prompt": "Is the 'unipolar moment' over? Discuss with reference to events and scholars since 1991.", "rubric": "A strong answer defines unipolarity (Krauthammer; Wohlforth's 'a counterbalance is impossible') and weighs views: Waltz and Monteiro on its instability; Brooks and Wohlforth (2023) that the US remains far ahead; Posen and Mearsheimer on multipolarity; Acharya's 'multiplex' world; Mahbubani on Asia. It uses evidence such as the Gulf War and Somalia, 9/11 and Iraq, the rise of China and India and BRICS, the 2008 crash, Putin's Munich speech, Georgia, Crimea and the 2022 invasion of Ukraine, and the neutrality of many Global South states at the UN.", "id": "q6"}
  ]$mn_postcw_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/contemporary-history/the-post-cold-war-era', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

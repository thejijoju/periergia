-- Contemporary History — chapter OVERVIEW master, co-written and human-reviewed.
-- history/contemporary-history @ research/advanced/read.
-- This node is a chapter (it has child topics); the app renders this overview
-- article above the chapter's topic list (see the section-overview branch in
-- src/app/learn/[subject]/[...node]/page.tsx).
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
    'history/contemporary-history',
    'research',
    'advanced',
    'read',
    $mn_contemp_master$> **The world since the end of the Cold War.** When the Soviet Union dissolved on 26 December 1991, the United States was left without a rival, and many believed that liberal democracy and open markets had won for good. The decades since have tested that belief: a market revolution, a globalization with clear winners and losers, China's rise, the digital and biotechnology revolutions, wars and genocides that mocked the promise of a "new world order", and the spread and then the recession of democracy. This overview draws the era's six chapters together around those themes. The events are too recent for settled verdicts, so it says plainly what is known, what is contested and what is still unfolding.

## History Too Close to See

Contemporary history has a special difficulty: it has no ending. The tariff story told in the chapter on **Globalization** "was still moving at the time of writing (November 2026)". The chapter on **Modern Conflicts since 1991** treats every death toll after 2024 as provisional, and the chapter on **The Post-Cold War Era** says that American military action against Venezuela and, with Israel, against Iran in 2026 "is too recent for history's verdict".

The chapters therefore share a method: figures come with their sources and, where sources differ, as ranges. Estimates of Iraqi deaths after 2003 run from about 150,000 to over a million, depending on the period covered, the method, and whether violent deaths or all excess deaths are counted; in Ukraine, military losses are state secrets. The disagreement is part of the history, a lesson in how the dead are counted and by whom.

The chapters also show how quickly legend forms. Shenzhen is usually described as a fishing village that became a megacity, but Juan Du calls that a myth: by her count it had some 300,000 people or more when the zone was founded. The words most often attributed to Deng Xiaoping, "To get rich is glorious", are probably a misquotation. Recent history is a good place to watch history being written.

## After Bipolarity: One Superpower and Its Critics

Even before the Soviet collapse, the American columnist Charles Krauthammer argued that the world would become unipolar, with a "serenely dominant" United States and its Western allies, and he saw the Gulf War of 1990–91 as the event that revealed it. A coalition of 42 countries, the broadest military alliance since the Second World War, reversed Iraq's invasion of Kuwait under a Security Council mandate, and in September 1990, before the fighting, President George H. W. Bush had already spoken of "a new world order".

Two essays, later expanded into books, tried to name the age. Francis Fukuyama argued that the contest of ideologies had ended:

```quote
What we may be witnessing is not just the end of the Cold War, or the passing of a particular period of postwar history, but the end of history as such: that is, the end point of mankind's ideological evolution and the universalization of Western liberal democracy as the final form of human government.
Francis Fukuyama · "The End of History?", The National Interest · Summer 1989
```

Samuel Huntington replied in 1993 that "the great divisions among humankind and the dominating source of conflict will be cultural." Critics from Edward Said to Amartya Sen answered him, some found both theses Western-centred, and Iran's president Mohammad Khatami promoted a "Dialogue Among Civilizations".

Scholars still disagree about American primacy. In 2023 Stephen Brooks and William Wohlforth argued that the United States remained "safely above China and far, far above every other country"; Barry Posen and John Mearsheimer see a shift to multipolarity. The Indian-born scholar Amitav Acharya describes a "multiplex" world, the end of an American world order though not necessarily of American power, and the Singaporean diplomat Kishore Mahbubani writes of power shifting to Asia.

The European Union and NATO grew eastward; George Kennan called NATO's enlargement "a strategic blunder of potentially epic proportions". At Munich in 2007 Vladimir Putin denounced a world of "one master, one sovereign". Russia fought Georgia in 2008, annexed Crimea in 2014 and launched a full-scale invasion of Ukraine on 24 February 2022. The UN General Assembly condemned it by 141 votes to 5, but many states of the Global South stayed neutral.

## The Market Revolution and Its Discontents

As the chapter on **The Neoliberal Age** shows, the era's economics began in the 1970s, when the postwar Keynesian order broke. On 15 August 1971 Richard Nixon suspended the conversion of dollars into gold, effectively ending the Bretton Woods system, and oil shocks and stagflation followed. Ideas nursed since the Mont Pèlerin Society's founding in 1947 stepped into the gap, carried by the Volcker shock and the governments of Margaret Thatcher and Ronald Reagan.

The turn was global, and it was felt sharply in the South. Chile under Pinochet was its first laboratory. When Mexico announced in August 1982 that it could not service its debt, Latin America entered *la década perdida*, the lost decade. In 1989 John Williamson coined "Washington Consensus" for ten reforms, a list narrower than its reputation, and across Latin America and sub-Saharan Africa IMF and World Bank loans came with conditions; Thandika Mkandawire and Charles Soludo gathered African economists' case for a more active state. Other roads ran in parallel: India opened its economy after its crisis of 1991, and China, Isabella Weber argues, twice rejected shock therapy in the 1980s.

By the 1990s, through the "Third Way" of Bill Clinton and Tony Blair, the order had become bipartisan. The historian Gary Gerstle calls it a "political order" whose ideas even the opposition accepted, and argues that the crash of 2008 fractured it. Its record is disputed. Inequality rose steeply in the United States; defenders reply that extreme poverty fell from about 43 per cent of humanity in 1990 to about 13 per cent in 2015, on the World Bank's \$3-a-day line; critics answer that most of that fall came in China and India, which, Dani Rodrik argues, largely ignored the Washington Consensus, a claim others dispute. Historians cannot even agree on the name "neoliberalism", which one study found almost never defined.

## Globalization's Winners and Losers

The chapter on **Globalization** traces how the shipping container cut the cost of loading cargo from \$5.86 a ton to 16 cents, and how the World Trade Organization, founded on 1 January 1995, and China's entry on 11 December 2001 opened an era of "hyperglobalization". On World Bank figures, world exports plus imports rose from a low of 25 per cent of world GDP in 1970 to a pre-crisis high of about 61 per cent in 2008 (briefly exceeded in 2022).

Who won? Lakner and Milanović's "elephant curve" showed that between 1988 and 2008 the global middle, largely in China and elsewhere in Asia, and the global top 1 per cent gained most, while incomes near the 80th percentile, where many working- and middle-class people in rich countries sat, barely grew, and the very poorest gained little. In the United States the "China shock" concentrated losses in particular places, with estimates running from about 550,000 manufacturing jobs to 2.0–2.4 million jobs, depending on method; economists have linked trade-exposed regions to political polarisation in America and to Britain's vote to leave the EU.

The Global South's experience was as mixed. Bangladesh became the world's second-largest apparel exporter, with women making up about 54 per cent of its garment workers, but more than 1,100 people died when the Rana Plaza building collapsed in 2013. Commodity exporters rode a boom and then a bust: *The Economist* popularised "Africa Rising" in 2011, just as, Patrick Bond argued, commodity-led growth was ending.

The argument moved from the streets into governments. Zapatista insurgents rose in Chiapas on NAFTA's first day in 1994, and protesters converged on the WTO at Seattle in 1999; from 2016 came Brexit, the US–China trade war and Donald Trump's tariffs of 2025. Rodrik's trilemma offers one reading: voters reclaiming democracy and sovereignty at the expense of integration. Whether it amounts to a second deglobalization or a reshuffling of supply chains, a "China-plus-many" strategy rather than a retreat, is still open.

```checkpoint
q: What did Lakner and Milanović's "elephant curve" suggest about income growth from 1988 to 2008?
a*: That the global middle, largely in Asia, and the global top 1 per cent gained most, while many in rich countries' working and middle classes gained little.
a: That every income group in the world gained by roughly the same amount.
x: The curve's shape shows very unequal gains, which is why it looks like an elephant.
a: That the poorest people in sub-Saharan Africa gained most.
x: The very poorest gained relatively little in the original curve.
a: That rich countries' working and middle classes gained most.
x: Incomes near the 80th percentile, where many of them sat, barely grew.
hint: Picture the trunk and the dip in the curve.
why: The curve became a shorthand for globalization's uneven distribution, though critics such as Adam Corlett dispute how to read the dip.
---
q: What did John Williamson mean by the "Washington Consensus"?
a: A programme of monetarism, supply-side tax cuts and a minimal state.
x: Williamson said he did not mean these, which he called "the quintessentially neoliberal ideas".
a: The full liberalisation of capital movements across borders.
x: Williamson "consciously excluded" freeing capital movements.
a*: A list of ten reforms, from fiscal discipline and trade liberalisation to privatisation and secure property rights.
a: China's dual-track price reform of the 1980s.
x: China's gradual reform is usually presented as a contrast to the Consensus.
hint: He coined the phrase in 1989 and later called it "a damaged brand name".
why: The term came to stand for much more than Williamson's narrow list, which is why the debate over it is also a debate over what "neoliberalism" means.
```

## China's Rise

The chapter on **China Today: the Economic Miracle and Infrastructural Revolution** follows "reform and opening" from December 1978: family farming, whose founding legend is the village of Xiaogang, Special Economic Zones such as Shenzhen, the dual-track price system, and entry to the WTO on harsher terms than other developing countries. Growth averaged close to 10 per cent a year from 1979 to 2010, China passed Japan as the world's second-largest economy in 2010, and by the World Bank's count, on its \$1.90-a-day line, close to 800 million people left extreme poverty over four decades.

The costs belong to the same story. The army crushed the Tiananmen protests in 1989, and political reform ended. Between 27 and 35 million state workers were laid off from the mid-1990s; an estimated 200 million people have lived outside the places where they are registered under the *hukou* system; the one-child policy was enforced with coercion; the Three Gorges Dam displaced between about 1.13 million and 1.4 million people. Much of the building boom, which produced a high-speed rail network of more than 50,000 kilometres, was paid for through land sales and local debt.

China's rise runs through the other chapters too, from the commodity boom its demand helped feed to the American towns its imports reshaped. Abroad, the Belt and Road Initiative spans projects in some 150 countries, and Sri Lanka's Hambantota port became the test case in a debate between Brahma Chellaney, who coined "debt-trap diplomacy", and Deborah Brautigam and Meg Rithmire, who called that narrative "a lie, and a powerful one". Whether the model can last is open: Michael Pettis argues that growth has come to depend on ever more debt, though his own 2011 forecast proved too gloomy.

## Machines, Networks and Genes

The digital revolution began in war, at Bletchley Park and with ENIAC, and the chapter on **Technological Advancements and the Digital Age** tells it globally, from Sergei Lebedev's MESM near Kyiv and Project Cybersyn in Allende's Chile to Morris Chang's TSMC in Taiwan, Kenya's M-Pesa and India's software industry. In 2025 the International Telecommunication Union counted about 6 billion people, 74 per cent of humanity, online, but 2.2 billion still offline, 96 per cent of them in low- and middle-income countries.

The age's arguments are about power. Shoshana Zuboff calls the platforms' business "surveillance capitalism"; Cory Doctorow answers that the real problem is monopoly. In Myanmar, the head of a UN fact-finding mission said in 2018 that social media, which in Myanmar effectively meant Facebook, had played a "determining role" in the crisis facing the Rohingya. The digital world rests on hidden labour and minerals, from Kenyan content moderators to the Democratic Republic of the Congo, which supplied about three-quarters of the world's cobalt in 2024. Chips became a field of rivalry: TSMC took about 70 per cent of contract-foundry revenue in 2025 on TrendForce's figures, and in October 2022 the United States restricted China's access to advanced chips.

Biology moved as fast. CRISPR gene editing, proposed in 2012, brought both a therapy for sickle-cell disease and the scandal of He Jiankui's gene-edited twins. Katalin Karikó and Drew Weissman's work on modified mRNA enabled effective vaccines against COVID-19, yet the global scheme COVAX suffered shortages blamed partly on richer nations' "vaccine nationalism". Artificial intelligence became a mass technology after ChatGPT's release on 30 November 2022, and commentators spoke of a US–China "AI arms race". How to govern such technologies divides the European Union, which regulates, the United States, which relies more on antitrust courts, and China, which exercises direct state control.

## War, Humanitarianism and Law

For millions of people the decades after 1991 were years of war. The optimism of the early 1990s was answered by genocide. At Srebrenica in July 1995, a UN-declared "safe area", Bosnian Serb forces killed more than 8,000 Bosniak men and boys. In Rwanda over about a hundred days in 1994, most scholarly estimates put the Tutsi dead at between about 500,000 and 662,000, while the Rwandan government's count is over a million; the outside world largely watched. Next door, the Second Congo War drew in nine African states, and its toll is itself disputed, from the International Rescue Committee's 5.4 million excess deaths to the Human Security Report Project's revised figure of about 860,000 for 2001–07.

These failures forced a question Kofi Annan put in 2000:

```quote
if humanitarian intervention is, indeed, an unacceptable assault on sovereignty, how should we respond to a Rwanda, to a Srebrenica—to gross and systematic violations of human rights that offend every precept of our common humanity?
Kofi Annan · Millennium Report · 2000
```

The answer was the Responsibility to Protect, endorsed unanimously in 2005, with force permitted only through the Security Council. Its record is the era's legal argument in miniature. An independent commission called NATO's bombing of Yugoslavia in 1999 "illegal but legitimate". In 2011 the Security Council invoked R2P to authorise force in Libya; Russia and China, saying it had become regime change, later vetoed resolutions on Syria. The invasion of Iraq in 2003 raised the opposite problem: Annan called it illegal.

The September 11 attacks of 2001, which killed 2,977 people, opened two decades of war; Brown University's Costs of War project estimates 905,000–940,000 people killed directly in the post-9/11 war zones and 38 million displaced. Then came the Islamic State, the wars that followed the Arab Spring, Sudan and Tigray, Russia's war on Ukraine, and Gaza since October 2023. The chapter on **Modern Conflicts since 1991** asks whether war itself has changed, setting Mary Kaldor's "new wars" thesis against its critics, and whether violence has declined, as Steven Pinker argued, or shows no consistent trend except fewer uses of force between states, as Bear Braumoeller found.

## Democracy's Spread and Recession

At first the evidence seemed to favour Fukuyama. Freedom House counted 69 electoral democracies among 167 countries in 1989–90, and 123 of 192, the highest share it had recorded, in its survey covering 2005. Then the wave went into reverse. Its report of March 2026 found that global freedom had declined for the twentieth consecutive year, and V-Dem scholars describe a "third wave of autocratization" that they trace to the mid-1990s and that quickened in the 2010s. Since the Cold War, democracies have mostly been dismantled not by coups but by elected leaders weakening institutions from within.

The pattern was global. In the Arab world, the uprisings of 2010–11 toppled Ben Ali and Mubarak, but the aftermath brought civil wars and a military coup in Egypt in 2013.

{{image: 2011 Egyptian revolution | Tahrir Square, Cairo, in February 2011, during the eighteen days of protest that forced Hosni Mubarak to resign.}}

In 2014 Viktor Orbán declared that the new state being built in Hungary was "an illiberal state". Narendra Modi's India faced charges of democratic backsliding; supporters of Jair Bolsonaro stormed federal buildings in Brazil after his 2022 defeat; Donald Trump refused to concede in 2020 and won again in 2024. Latin America's "pink tide" was itself a reaction against the free-market 1990s, and Venezuela and Nicaragua turned authoritarian. Cas Mudde defines populism as a "thin-centred ideology" that sets "the pure people" against "the corrupt elite"; Ivan Krastev and Stephen Holmes read Central Europe's turn as a revolt against the "imitation" of the West; Christian Welzel argues that the regression may reverse. Reversals do happen: Orbán lost Hungary's election of 12 April 2026 in a landslide.

```checkpoint
q: How have democracies mostly been dismantled since the Cold War?
a: Mostly through military coups, as during the Cold War.
x: Coups have occurred, but most backsliding since the Cold War has come through elected leaders.
a*: Mostly by elected leaders gradually weakening institutions from within.
a: Mostly through foreign invasion.
x: Backsliding since the Cold War has come mainly from elected leaders at home, not from foreign invasion.
a: They have not been; Freedom House reports steady gains since 2005.
x: Freedom House's report of March 2026 found a twentieth consecutive year of decline.
hint: Think about who has been doing the dismantling.
why: V-Dem describes a "third wave of autocratization", though Christian Welzel argues it may reverse.
---
q: Why did the Human Security Report Project dispute the International Rescue Committee's estimate of deaths in the Second Congo War?
a: Because it believed the war had killed almost no civilians.
x: Most estimated deaths were civilians dying of disease and malnutrition.
a: Because no surveys had ever been carried out.
x: The IRC published repeated mortality surveys; the dispute was about their method.
a: Because the Rwandan government had published an official count.
x: Rwanda's official count concerns the genocide of 1994, not the Congo wars.
a*: Because it judged the early surveys unreliable and the later ones based on too low a baseline death rate, revising excess deaths for 2001–07 to about 860,000.
hint: Think about how "excess deaths" are calculated.
why: Excess-mortality estimates depend heavily on what death rate is assumed for peacetime, which is why figures for recent wars must be given with their sources.
```

## Pandemic and Climate

The 2020s added pressures no single state could manage. A new coronavirus emerged in Wuhan in December 2019, and the World Health Organization declared a pandemic on 11 March 2020. The WHO estimated about 14.9 million excess deaths in 2020 and 2021 (range 13.3 to 16.6 million), against 5.42 million reported COVID deaths; 81 per cent were in middle-income countries. Scientific consensus favours a spillover from animals, though a laboratory-leak hypothesis remains contested.

Climate change ran through the whole era. The Kyoto Protocol of 1997 bound only developed countries; the Paris Agreement of 2015 asked every country to submit plans, aiming to hold warming "well below 2 °C" and preferably to 1.5 °C. The United States withdrew, rejoined and withdrew again. The World Meteorological Organization judged 2024 likely the first calendar year more than 1.5 °C above pre-industrial levels, while stressing that a single year above that mark does not mean the Paris goal has been missed.

## Reading the Chapters

The chapter on **The Post-Cold War Era** gives the political frame, from the unipolar moment and the Fukuyama–Huntington debate through 9/11, the crash of 2008 and the Arab Spring to great-power rivalry and democratic recession. **The Neoliberal Age** goes back to the 1970s to explain the market revolution. **Globalization** follows the integration of the world economy since 1945 and asks who won and who lost. **Technological Advancements and the Digital Age** tells the story of computers, networks, biotechnology and artificial intelligence, and of the people written out of it. **Modern Conflicts since 1991** follows the wars from the Gulf to Gaza and the problem of counting their dead. **China Today** traces four decades of reform, building and debt. Together they describe a world that began in 1991 with one dominant power and a confident ideology and has become, in many scholars' view, a contest of several powers, a weakened liberal consensus, and problems that cross every border.

## Further exploration

- **Gary Gerstle, *The Rise and Fall of the Neoliberal Order: America and the World in the Free Market Era* (2022).** Neoliberalism as a bipartisan political order, from Reagan to its fracturing after 2008.
- **Branko Milanović, *Global Inequality: A New Approach for the Age of Globalization* (2016).** The elephant curve and globalization's winners and losers.
- **Isabella M. Weber, *How China Escaped Shock Therapy: The Market Reform Debate* (2021).** How China's reformers rejected big-bang price liberalisation in the 1980s.
- **Mary Kaldor, *New and Old Wars: Organized Violence in a Global Era* (1999).** The influential and contested "new wars" thesis.
- **Ivan Krastev and Stephen Holmes, *The Light That Failed: A Reckoning* (2019).** Why Central Europe turned against liberal "imitation" after 1989.
- **Kate Crawford, *Atlas of AI: Power, Politics, and the Planetary Costs of Artificial Intelligence* (2021).** AI's mines, labour and data.
- **Kishore Mahbubani, *Has the West Lost It? A Provocation* (2018).** A Singaporean diplomat on the shift of power to Asia.$mn_contemp_master$,
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
  select $mn_contemp_quiz$[
    {"type": "mcq", "prompt": "What did President Richard Nixon announce on 15 August 1971?", "options": ["The suspension of the dollar's convertibility into gold, which effectively ended the Bretton Woods system", "The founding of the World Trade Organization", "An embargo on Arab oil", "The appointment of Paul Volcker as chairman of the Federal Reserve"], "answerIndex": 0, "explanation": "The 'Nixon shock' broke the monetary half of the postwar settlement; with the oil shocks and stagflation that followed, it opened the way for the market revolution traced in the chapter on the Neoliberal Age.", "id": "q1"},
    {"type": "mcq", "prompt": "According to the International Telecommunication Union, how connected was the world in 2025?", "options": ["Almost everyone was online, with fewer than 100 million people offline", "About 6 billion people, 74 per cent of humanity, were online, but 2.2 billion were offline, 96 per cent of them in low- and middle-income countries", "About half of humanity was online, mostly in Europe and North America", "Internet use was the same in high-income and low-income countries"], "answerIndex": 1, "explanation": "The ITU found 94 per cent of people in high-income countries online against 23 per cent in low-income ones: the digital revolution has been global but deeply unequal.", "id": "q2"},
    {"type": "mcq", "prompt": "What did Freedom House's report of March 2026 find about global freedom?", "options": ["It had risen for the first time since 2005", "It was unchanged from the previous year", "It had declined for the twentieth consecutive year", "It had declined only in Africa"], "answerIndex": 2, "explanation": "Freedom House had counted 123 electoral democracies among 192 countries in its survey covering 2005, the highest share it had recorded; since then the wave has gone into reverse, though Christian Welzel argues the regression may reverse.", "id": "q3"},
    {"type": "mcq", "prompt": "What death toll for the Tutsi killed in the Rwandan genocide of 1994 do most scholarly estimates give?", "options": ["About 50,000, mostly soldiers", "Exactly 1,074,017, as all researchers agree", "Between 5 and 6 million, mostly from disease", "Between about 500,000 and 662,000"], "answerIndex": 3, "explanation": "The Rwandan government counts 1,074,017 victims, 94 per cent of them Tutsi, a figure a 2020 scholarly symposium judged not credible; 5.4 million is the International Rescue Committee's estimate of excess deaths in the Congo wars.", "id": "q4"},
    {"type": "open", "prompt": "Why is it difficult to write the history of the years since 1991? Use examples from at least two of the era's chapters.", "rubric": "A strong answer explains that the events have no ending yet: the tariff story was 'still moving at the time of writing (November 2026)', death tolls after 2024 are provisional, and American action against Venezuela and Iran in 2026 is 'too recent for history's verdict'. It shows how sources disagree and why figures must be given as attributed ranges: Iraqi deaths from about 150,000 to over a million depending on the period, the method and whether violent or all excess deaths are counted; Rwanda's government count against scholarly estimates of about 500,000–662,000; the IRC's 5.4 million against the Human Security Report Project's about 860,000 for Congo; Ukrainian and Russian military losses as state secrets. Credit for showing how quickly myths form (Shenzhen as a 'fishing village', which Juan Du disputes; Deng's probably misquoted 'To get rich is glorious'; credit for inventions such as the integrated circuit narrowing from four names to two) and for noting that the participants' debates (Fukuyama and Huntington, the meaning of 'neoliberalism') are still live.", "id": "q5"},
    {"type": "open", "prompt": "'The world that began in 1991 with one dominant power and a confident ideology has become a contest of several powers and a weakened liberal consensus.' How far do the era's chapters support this view?", "rubric": "A strong answer sets out the starting point (Krauthammer's 'unipolar moment', the Gulf War coalition of 42 countries, Fukuyama's 'end of history', Freedom House's 123 electoral democracies of 192 in its survey covering 2005) and weighs the evidence of change: China's rise to second-largest economy in 2010 and close to 800 million people out of extreme poverty; Putin's Munich speech, Crimea and the 2022 invasion of Ukraine, with many Global South states neutral at the UN; the crash of 2008 and Gerstle's fractured neoliberal order; the backlash against globalization (the China shock, Brexit, tariffs); the democratic recession (twenty years of decline, V-Dem's 'third wave of autocratization', Orbán's 'illiberal state'). It considers the counter-arguments: Brooks and Wohlforth (2023) that the US remains far ahead; Acharya's 'multiplex' world as the end of an American order but not of American power; Welzel's view that the regression may reverse; Orbán's defeat in April 2026; and the claim that firms are diversifying rather than deglobalizing.", "id": "q6"}
  ]$mn_contemp_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/contemporary-history', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

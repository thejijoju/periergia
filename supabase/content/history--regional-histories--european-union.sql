-- The European Union — canonical master article, co-written and human-reviewed.
-- history/regional-histories/europe/the-european-union @ research/advanced/read.
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
    'history/regional-histories/europe/the-european-union',
    'research',
    'advanced',
    'read',
    $mn_eu_master$> **The improbable union.** In 1950, five years after the Second World War ended, France proposed to pool its coal and steel with West Germany's. From that narrow beginning grew a union of 27 states and about 452 million people, with its own court, parliament, single market and, for most members, a single currency. This chapter follows that history, from the wartime dreams of federation, the Schuman Declaration and the Treaties of Rome, through the colonial "Eurafrica" the founders also planned, the single market, Maastricht and the euro, to the enlargement of 2004, the crisis decade of Greek debt, Mediterranean migration and Brexit, and the questions of the 2020s. It also weighs the debates over why integration happened and whom it served.

## Ideas of Unity Before 1950

Plans to unite Europe are older than the Union. Richard von Coudenhove-Kalergi's *Paneuropa* (1923) launched the oldest European unification movement, which Nazi Germany banned in 1933.

The most radical plan was written in captivity. Altiero Spinelli and Ernesto Rossi, confined by Mussolini's regime on the island of Ventotene, completed a manifesto *For a Free and United Europe* in June 1941, with Eugenio Colorni. It called for a federal European republic after fascism's defeat and argued that the decisive political divide now lay between those who sought national power and those who sought "a solid international State". It also declared that "the European revolution must be socialist".

The ruin described in the chapter on The Second World War (WW2) gave such ideas a hearing. In Zurich in September 1946 Winston Churchill called for "a kind of United States of Europe", though without Britain as a member. And as the chapter on Global Cold War and the Arms Race describes, American Marshall Plan aid flowed to Western Europe; a central condition was that Europeans plan and use the aid jointly.

## Coal, Steel and a Failed Army (1950–1954)

On 9 May 1950, now Europe Day, the French foreign minister Robert Schuman proposed placing "Franco-German production of coal and steel as a whole" under a common High Authority, open to other European countries. Jean Monnet drafted the declaration, and Konrad Adenauer, who had agreed that morning, reportedly called it "our breakthrough". Interest mixed with idealism: France's modernisation plan depended on German coal. Yet the declaration promised that war between France and Germany would become "not merely unthinkable, but materially impossible", and it set out a method.

```quote
Europe will not be made all at once, or according to a single plan. It will be built through concrete achievements which first create a de facto solidarity.
Robert Schuman · Declaration of 9 May 1950 · 1950
```

Britain stayed out; Clement Attlee would not hand the economy to "an authority that is utterly undemocratic and is responsible to nobody". The Treaty of Paris was signed on 18 April 1951 by the "Inner Six": France, West Germany, Italy, Belgium, the Netherlands and Luxembourg. The European Coal and Steel Community began work in 1952 with Monnet as President of the High Authority. Its four institutions, a High Authority, a Common Assembly, a Council of ministers and a Court of Justice, were the blueprint for today's Commission, Parliament, Council and Court.

The next step went too far. To avoid separate West German divisions, the Pleven Plan of 1950 proposed a supranational European army, and the Six signed a European Defence Community treaty in 1952. Four states ratified it, but on 30 August 1954 the French National Assembly voted, by 319 to 264, for its indefinite postponement, which killed it.

## Rome and the Gaullist Decade

The Treaties of Rome, creating the European Economic Community (EEC) and Euratom, were signed on 25 March 1957 on the Capitoline Hill and came into force on 1 January 1958. The EEC was to be a customs union and a common market in goods, labour, services and capital, with a Common Agricultural Policy (CAP). Its preamble declared the signatories "DETERMINED to lay the foundations of an ever closer union among the peoples of Europe", though France insisted the new Commission have less power than the old High Authority.

{{image: Treaty of Rome | The signing of the Treaties of Rome on the Capitoline Hill, 25 March 1957.}}

The CAP, introduced in 1962, took nearly three-quarters of the budget by the mid-1980s. Its "butter mountains" and "wine lakes" of surplus became bywords, and its subsidies and dumped surpluses have been criticised for harming farmers in developing countries, though the EU is also the largest importer of their farm products.

Charles de Gaulle wanted a Europe of sovereign nations acting as a third pole between the United States and the Soviet Union. He vetoed British entry in 1963 and 1967, reportedly seeing Britain as an American "trojan horse". When the Hallstein Commission proposed in 1965 that the Community raise its own revenue and move towards majority voting, France boycotted the Council for six months, the "empty chair crisis". The Luxembourg compromise of 1966 let a state block decisions touching a "very important" national interest, entrenching unanimity in practice.

Integration advanced where few were watching. In *Van Gend en Loos* (1963) the Court of Justice declared that "The Community constitutes a new legal order of international law for the benefit of which the states have limited their sovereign rights", establishing the doctrine of direct effect; in *Costa v ENEL* (1964) it established the primacy of Community law over national law. Neither doctrine is written in the treaty.

## Eurafrica: The Colonial Community

The founders' Europe reached beyond Europe. "Eurafrica" was an interwar idea, and Coudenhove-Kalergi had called Africa Europe's "dowry", with racial undertones. The Schuman Declaration named "the development of the African continent" as one of Europe's "essential tasks". At Rome, France and Belgium made the association of their overseas territories, chiefly the Belgian Congo, French West Africa and French Equatorial Africa, a condition of signing, and a sceptical West Germany agreed to pay substantially into a European Development Fund. Algeria, legally part of France and divided into French departments, was covered by the Treaty of Rome; its status stayed ambiguous after independence in 1962, into the 1970s by Megan Brown's account.

Historians argue about what this means. Peo Hansen and Stefan Jonsson contend that Eurafrica was constitutive of integration, a way to pool and prolong colonial rule, which the EU's memory has largely forgotten; reviewers welcome the corrective but note that it gives African actors little space and stretches "Eurafrica" too broadly. Megan Brown has shown how French anxieties over Algeria shaped the early Communities. Africans had their own visions: Léopold Sédar Senghor developed a Eurafrique linked to négritude, treating African and European cultures as equals.

Independence changed the relationship's form. As the chapter on Decolonization describes, 1960 was the "Year of Africa". The Yaoundé Convention of 1963, renewed in 1969, linked the EEC to 18 newly independent African states, though some African Commonwealth states saw association as neo-colonialism. After Britain joined, the Lomé Convention of 1975 brought in 46 African, Caribbean and Pacific (ACP) states with duty-free entry for most of their exports, a partnership presented as fairer and non-reciprocal. The Cotonou Agreement of 2000 replaced one-way preferences with reciprocal Economic Partnership Agreements and political conditions; its successor, the Samoa Agreement of 2023, eases the return of undocumented migrants.

## Widening and Deepening (1973–1992)

After de Gaulle resigned in 1969, Pompidou lifted the veto, and Britain, Ireland and Denmark joined on 1 January 1973; Norway's voters said no. Greenland, which entered with Denmark, voted in 1982 to leave and left in 1985. In Britain's 1975 referendum 67.2 per cent voted to stay, with Margaret Thatcher, the new Conservative leader, on the Yes side. Greece joined in 1981, Spain and Portugal in 1986: states emerging from dictatorship sought to secure their democracies.

In 1979 the European Parliament was first directly elected, sitting under its President Simone Veil, and David Marquand applied the phrase "democratic deficit" to the Community. From 1985 Jacques Delors, a former French finance minister, led the Commission. Thatcher's own commissioner, Lord Cockfield, listed about 300 measures to complete a single market, and the Single European Act of 1986 set a deadline of 31 December 1992, extended majority voting and gave the Parliament a real legislative say. The single market of goods, services, capital and people began on 1 January 1993.

Thatcher answered Delors in her Bruges speech of 1988, a founding text of British Euroscepticism. In a passage quoted in slightly different versions, she warned against freeing Britain from state control at home only to see a European superstate wield new power from Brussels. Meanwhile Europe became something people lived: the Erasmus exchange, begun in 1987 with 3,244 students, had over 13 million participants by 2021, and the Schengen Area began in 1995.

## Maastricht and the Euro

German reunification and the end of the Cold War, told in the chapter on Collapse of the Soviet Union and Eastern Europe, set the stage. The Treaty on European Union, signed at Maastricht in February 1992, created the European Union and EU citizenship and set the path to a single currency. As the chapter on The Post-Cold War Era notes, Danish voters rejected it at first, by 50.7 per cent, and the French approved it by a *petit oui* of about 51 per cent. Delors drew the lesson: "Europe began as an elitist project in which it was believed that all that was required was to convince the decision-makers. That phase of benign despotism is over."

Was the euro the price of German unity? *Der Spiegel* reported in 2010 that Mitterrand demanded it in return for accepting reunification, but the Delors Committee's plan for monetary union was commissioned in 1988 and reported in 1989, before the Berlin Wall fell, so that story is at most partial.

The euro launched in eleven states in 1999, with notes and coins from 1 January 2002. The Stability and Growth Pact capped deficits at 3 per cent of GDP, but France and Germany themselves escaped its penalties in the early 2000s. Critics, including IMF authors, argued that the eurozone was not an "optimum currency area"; Martin Feldstein called the euro "an experiment that failed", and Olivier Blanchard argued that fiscal union would ease but not cure the periphery's problems. Bulgaria became the 21st member on 1 January 2026.

## From Twelve to Twenty-Eight

The Copenhagen criteria of 1993 required candidates to have stable democratic institutions, the rule of law, minority protection and a functioning market economy. Austria, Finland and Sweden joined in 1995. On 1 May 2004 ten states joined, eight of them formerly communist, the largest enlargement ever; Bulgaria and Romania followed in 2007 and Croatia in 2013. Cyprus entered divided, a week after Greek Cypriots rejected the Annan reunification plan. In France the "Polish plumber" became a campaign cliché, and public opinion turned against further expansion.

A constitutional treaty, drafted by a convention under Valéry Giscard d'Estaing, was rejected in 2005 by French voters (about 55 per cent No) and Dutch voters (61.5 per cent No). The Treaty of Lisbon took its place, amending the existing treaties without constitutional symbols; after an Irish No in 2008 and Yes in 2009, it came into force on 1 December 2009, creating a full-time President of the European Council and making the Charter of Fundamental Rights binding.

## How the Union Works, and Whom It Answers To

The **Commission** is the executive and holds almost all the right to propose laws. The **Council of the EU** gathers national ministers, the **European Council** heads of state and government. The **European Parliament**, elected every five years and now 720 members strong, co-legislates with the Council. The **Court of Justice** upholds direct effect and primacy.

Is this democratic? Turnout at European elections fell at every election to a low of about 42 per cent in 2014. Follesdal and Hix argue that the deficit is structural, because voters cannot really contest who holds executive power or what policy it pursues. Giandomenico Majone replies that the EU is a regulatory body to be judged by its results, not by majoritarian standards, and Andrew Moravcsik that it is legitimate because elected national governments control it through the Council.

```checkpoint
q: What did the French National Assembly do with the European Defence Community in August 1954?
a*: It voted for the treaty's indefinite postponement, which killed it.
a: It ratified the treaty, creating a European army.
x: France never ratified it; the European army was never created.
a: It referred the treaty to a national referendum.
x: The decision was taken by a parliamentary vote of 319 to 264, not a referendum.
a: It rejected the Schuman Declaration.
x: The Schuman Declaration was a French proposal, and the Coal and Steel Community it led to was already working.
hint: The vote was about procedure as much as substance.
why: The failure of a supranational army left integration to advance through economics, as in the Treaties of Rome.
---
q: What did Peo Hansen and Stefan Jonsson argue about "Eurafrica"?
a: That Africa played no part in the Treaty of Rome negotiations.
x: They argue the opposite: that Africa was central to the negotiations.
a: That the idea was invented by Léopold Sédar Senghor.
x: Eurafrica was an interwar European idea; Senghor developed his own version.
a*: That it was constitutive of European integration, a way to pool and prolong colonial rule, and has been largely forgotten.
a: That it was abandoned when the Schuman Declaration was made.
x: The Schuman Declaration itself named the development of Africa as one of Europe's essential tasks.
hint: Think of the overseas territories at the Rome negotiations.
why: Their work challenges the story of integration as a purely European peace project, though reviewers note that African actors appear only briefly.
```

## The Crisis Decade: The Euro and Greece

In late 2009 Greece revealed that its deficits had been underreported. As the chapter on The Neoliberal Age relates, the eurozone crisis followed the crash of 2008. Greece received €110 billion from the eurozone and the IMF in 2010, a second package of €130 billion in 2012, with private bondholders accepting a 53.5 per cent cut, and a third of up to €86 billion in 2015. Twelve rounds of Greek austerity followed. Greek GDP fell by more than a quarter between 2009 and 2014, and unemployment reached about 25 per cent.

The currency was steadied by its central bank. At a London investment conference, the ECB's President made a pledge.

```quote
Within our mandate, the ECB is ready to do whatever it takes to preserve the euro. And believe me, it will be enough.
Mario Draghi · Global Investment Conference, London · 26 July 2012
```

In September the ECB announced unlimited bond purchases for countries in a rescue programme, which calmed markets though they were not then used. For Greece the crisis peaked in 2015: on 5 July voters rejected the bailout terms by 61.3 per cent in a referendum called by Alexis Tsipras; his finance minister, Yanis Varoufakis, resigned the next day, and on 13 July, eight days after the vote, Tsipras accepted a third bailout on harsher terms. More broadly, Joseph Stiglitz and Paul Krugman argued that Europe's crisis was more a banking crisis than a sovereign-debt one.

## Migration, the Mediterranean and Turkey

On 3 October 2013 a boat from Libya sank off Lampedusa and more than 360 people died, many from Eritrea, Somalia and Ghana. Italy's rescue operation Mare Nostrum saved at least 150,000 people over the following year, but other states declined to share its cost, and a smaller Frontex operation focused on border protection replaced it.

In 2015 Europe received a record 1.3 million asylum applications, nearly double the previous peak of 1992, mostly Syrians, with Afghans, Iraqis and Eritreans; at least 3,771 drowned in the Mediterranean. On 31 August Angela Merkel said "wir schaffen das" ("we can manage this"); Hungary fenced its borders. A 2016 EU–Turkey deal, under which Turkey took back irregular migrants for €6 billion and other promises, cut arrivals in Greece by more than 90 per cent; the UN refugee agency refused to take part. Italy funded and trained the Libyan coast guard from 2017, and a 2021 *Guardian* investigation attributed almost 40,000 pushbacks during the pandemic to member states, supported by Frontex. Critics, African ones among them, see such deals, and the Samoa Agreement's return clauses, as Europe pushing its border outwards. A new Pact on Migration and Asylum took effect in June 2026.

Turkey's candidacy is the longest of all. It signed an association agreement in 1963 and applied for membership in 1987. It became a candidate in 1999 and opened talks in 2005, but Austria and Germany preferred a "privileged partnership", 59 per cent of EU citizens opposed its membership in 2006, and the Cyprus dispute froze chapter after chapter. Talks have stalled since 2016 over rule-of-law backsliding and were declared effectively frozen in 2018.

## Brexit

On 23 June 2016 the United Kingdom voted by 51.9 per cent to leave, with Scotland and Northern Ireland voting to remain. As the chapter on Globalization explains, regions most exposed to Chinese imports leaned to Leave. Britain triggered Article 50 in March 2017 and, after a revised agreement with a Northern Ireland Protocol and Boris Johnson's election victory, left on 31 January 2020: the only state ever to withdraw.

## Pandemic, War and Today's Questions

The COVID-19 pandemic broke with the austerity of the 2010s. In 2020 members agreed NextGenerationEU, €750 billion in grants and loans financed by common EU borrowing, over the resistance of the "Frugal Four". Germany's finance minister, Olaf Scholz, called it a "Hamiltonian moment", though Angela Merkel insisted it remain a one-off. At home, the Union triggered Article 7 against Poland in 2017, and the Parliament voted for action against Hungary, whose leader Viktor Orbán called his model an "illiberal state"; Orbán lost the April 2026 election to Péter Magyar's Tisza party.

As the chapter on East European Identities: Russia and Ukraine relates, the Euromaidan protests began in 2013 over an EU association agreement; the war is told in the chapter on Modern Conflicts since 1991. For the first time, the EU funded weapons, through its European Peace Facility, and it granted Ukrainian refugees temporary protection. Ukraine and Moldova became candidates in June 2022 and opened talks in June 2024; after long Hungarian obstruction, negotiating clusters opened in June, July and October 2026. Emmanuel Macron championed "strategic autonomy", urging in 2023 that Europe not be drawn into a US–China confrontation over Taiwan, and the ReArm Europe plan of 2025 aims to mobilise up to €800 billion for defence. Since 2019 the EU has called China at once "a cooperation partner…, a negotiating partner…, an economic competitor…, and a systemic rival".

Seen from elsewhere, the Union looks less central than it sees itself. In 2022 India's foreign minister, S. Jaishankar, said that "Europe has to grow out of the mindset that Europe's problems are the world's problems but the world's problems are not Europe's problems", and, as the chapter on The Post-Cold War Era describes, many Global South states stayed neutral on Ukraine.

## Why Did It Happen? The Debates

Jean Monnet is often quoted as saying that Europe "will be forged in crises and will be the sum of the solutions adopted for those crises". Scholars disagree about the engine. Ernst B. Haas, a Jewish refugee from Germany, argued in *The Uniting of Europe* (1958) that integration in one sector creates "spillover" pressure into others: Monnet's method, theorised. After the empty chair crisis Haas declared his theory obsolete, later revoking that verdict. Andrew Moravcsik's liberal intergovernmentalism explains the bargains from Messina to Maastricht as rational choices by national leaders serving domestic economic interests; critics say it explains grand bargains better than everyday politics. Alan Milward, who influenced Moravcsik, argued that integration rescued the nation-state, letting postwar governments deliver the welfare, farm incomes and jobs on which their legitimacy rested, a polemic against federalist tales of saintly founders.

Peace project or market machine? The Nobel Committee gave the EU the 2012 Peace Prize for having "contributed to the advancement of peace and reconciliation, democracy and human rights in Europe", but Desmond Tutu, Mairead Maguire and Adolfo Pérez Esquivel opposed the award. Critics cite Quinn Slobodian's argument, set out in the chapter on The Neoliberal Age, that neoliberals sought to "encase" markets in supranational law, and Greece's overridden referendum; defenders cite the turn to common borrowing in 2020. The argument continues.

```checkpoint
q: What did Mario Draghi promise in London in July 2012?
a: That Greece would leave the euro within a year.
x: Draghi's aim was to preserve the euro, not to shrink it.
a*: That, within its mandate, the ECB was ready to do "whatever it takes" to preserve the euro.
a: That the ECB would buy every member state's bonds without conditions.
x: He spoke "within our mandate"; the later bond programme applied only to countries in a rescue programme.
a: That Germany would pay off the debts of southern Europe.
x: Draghi spoke for the central bank, not for any national government.
hint: Three famous words, with a qualifying phrase before them.
why: The pledge, and the bond programme announced in September, calmed markets though the programme was not used at the time.
---
q: What is Alan Milward's argument in The European Rescue of the Nation-State?
a: That integration was driven by federalist visionaries who wanted to abolish nations.
x: Milward wrote against that "saints" narrative.
a: That integration has steadily destroyed the nation-state.
x: He argued the opposite: integration strengthened national governments.
a: That integration happened only because of American pressure.
x: Milward stressed national governments' own domestic purposes.
a*: That integration rescued the nation-state, helping governments deliver welfare, farm incomes and employment.
hint: Read the title literally.
why: Milward shifted attention from founding fathers to the interests of postwar states, and influenced Moravcsik.
```

## Further exploration

- **Kiran Klaus Patel, *Project Europe: A History* (2020).** A critical history of the European Communities, first published in German in 2018.
- **Peo Hansen and Stefan Jonsson, *Eurafrica: The Untold History of European Integration and Colonialism* (2014).** Argues that Africa was central to the project that produced the Treaty of Rome.
- **Megan Brown, *The Seventh Member State: Algeria, France, and the European Community* (2022).** How French Algeria shaped the early Communities.
- **Alan S. Milward, *The European Rescue of the Nation-State* (1992).** Integration as the creation and servant of the postwar welfare state.
- **Andrew Moravcsik, *The Choice for Europe: Social Purpose and State Power from Messina to Maastricht* (1998).** Five grand bargains explained by national economic interests.
- **Luuk van Middelaar, *The Passage to Europe: How a Continent Became a Union* (2013).** A political history by a philosopher who worked inside the institutions.
- **Ivan Krastev, *After Europe* (2017).** The refugee crisis and the split between East and West.$mn_eu_master$,
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
  select $mn_eu_quiz$[
    {"type": "mcq", "prompt": "Which six states signed the Treaty of Paris creating the European Coal and Steel Community in April 1951?", "options": ["France, West Germany, Italy, Belgium, the Netherlands and Luxembourg", "France, West Germany, Britain, Italy, Belgium and the Netherlands", "France, West Germany, Spain, Portugal, Italy and Greece", "France, Britain, Ireland, Denmark, Belgium and Luxembourg"], "answerIndex": 0, "explanation": "The 'Inner Six' were France, West Germany, Italy, Belgium, the Netherlands and Luxembourg. Britain stayed out; Attlee refused to hand the economy to an authority 'responsible to nobody'.", "id": "q1"},
    {"type": "mcq", "prompt": "What did the Court of Justice establish in Van Gend en Loos (1963) and Costa v ENEL (1964)?", "options": ["That member states could leave the Community at will", "That the Commission must be directly elected", "The doctrines of direct effect and the primacy of Community law over national law", "That unanimity was required for all Council decisions"], "answerIndex": 2, "explanation": "The Court declared the Community 'a new legal order' and established direct effect (1963) and primacy (1964), doctrines not written in the treaty itself.", "id": "q2"},
    {"type": "mcq", "prompt": "What was the Lomé Convention of 1975?", "options": ["A treaty admitting Britain, Ireland and Denmark to the Community", "The agreement that launched the euro", "A deal with Turkey to return irregular migrants", "An agreement between the Community and 46 African, Caribbean and Pacific states giving duty-free entry to most of their exports"], "answerIndex": 3, "explanation": "Lomé followed the Yaoundé Conventions with the newly independent African states and, after Britain joined, included former British colonies. It was presented as a fairer, non-reciprocal partnership; the Cotonou Agreement of 2000 later introduced reciprocity.", "id": "q3"},
    {"type": "mcq", "prompt": "What happened after Greek voters rejected the bailout terms in the referendum of 5 July 2015?", "options": ["Greece left the eurozone", "Varoufakis resigned, and Tsipras accepted a third bailout on harsher terms", "The European Central Bank cancelled Greece's debts", "Greece joined the Schengen Area"], "answerIndex": 1, "explanation": "Despite a 61.3 per cent No vote, Tsipras accepted a third bailout eight days later; critics cite the overridden referendum as evidence for the view of the EU as a market machine.", "id": "q4"},
    {"type": "open", "prompt": "Was European integration a federalist project, a rescue of the nation-state, or something else? Discuss with reference to at least two scholars.", "rubric": "A strong answer contrasts at least two positions: Haas's neofunctionalism (sectoral 'spillover', fitting Monnet's method, which Haas declared obsolete after the empty chair crisis); Moravcsik's liberal intergovernmentalism (rational bargains by national leaders serving domestic economic interests); and Milward's argument that integration rescued the nation-state by helping governments deliver welfare, farm incomes and jobs. It may use evidence such as the Ventotene Manifesto, the failure of the EDC, de Gaulle's empty chair and the Luxembourg compromise, or the Court's rulings on direct effect and primacy, and notes criticisms of each theory.", "id": "q5"},
    {"type": "open", "prompt": "How have historians and critics outside Europe's mainstream narrative challenged the idea of the EU as a peace project? Use at least two examples.", "rubric": "Good answers draw on several of: Hansen and Jonsson's argument that Eurafrica was constitutive of integration, a way to pool and prolong colonial rule (and reviewers' criticisms); the association of colonial territories demanded by France and Belgium at Rome, and Algeria's place under the Treaty of Rome; criticism of Yaoundé as neo-colonial and of Cotonou's reciprocity; Mediterranean deaths, the EU–Turkey deal and funding of the Libyan coast guard; opposition to the 2012 Nobel Prize by Tutu, Maguire and Pérez Esquivel; Slobodian's 'encasement' thesis and Greek austerity; Jaishankar's critique of Eurocentrism. The best answers weigh these against the Nobel Committee's case and the Franco-German reconciliation.", "id": "q6"}
  ]$mn_eu_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/regional-histories/europe/the-european-union', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

-- The Neoliberal Age — canonical master article, co-written and human-reviewed.
-- history/contemporary-history/the-neoliberal-age @ research/advanced/read.
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
    'history/contemporary-history/the-neoliberal-age',
    'research',
    'advanced',
    'read',
    $mn_neoliberal_master$> **The market revolution of our times.** In the 1970s the postwar Keynesian order ran into stagflation, oil shocks and the end of Bretton Woods. Into the gap stepped ideas that economists around Friedrich Hayek and Milton Friedman had nursed for decades: free markets, sound money and a smaller state. This chapter follows that turn from the Mont Pèlerin Society to the Volcker shock and the governments of Margaret Thatcher and Ronald Reagan; through debt, the Washington Consensus and structural adjustment in Latin America and Africa, and the different roads of India, China and East Asia; to the "Third Way", financialisation, the crash of 2008 and the argument over whether the age has ended, or whether "neoliberalism" is even a useful word.

## The Postwar Order Breaks

The postwar world economy rested on the **Bretton Woods** agreement of 1944: the dollar was fixed to gold at \$35 an ounce and other currencies were pegged to the dollar. As American gold drained away, the system strained. On 15 August 1971, after a secret meeting at Camp David with advisers who included the Treasury official Paul Volcker, President Richard Nixon suspended the conversion of dollars into gold and imposed a wage and price freeze and a 10 per cent import surcharge. The "Nixon shock" effectively ended Bretton Woods. After a further devaluation of the dollar in February 1973, Japan and the European Economic Community floated their currencies, and the Jamaica Accords of 1976 formally ratified the end.

The second blow was **stagflation**. The word is generally credited to the British Conservative MP Iain Macleod, speaking in the House of Commons in 1965:

```quote
We now have the worst of both worlds—not just inflation on the one side or stagnation on the other, but both of them together. We have a sort of 'stagflation' situation.
Iain Macleod · House of Commons · 1965
```

Keynesian economists, guided by the Phillips curve, had assumed that high unemployment and high inflation did not occur together. In the 1970s both rose at once. There is some evidence that American inflation was climbing before the oil crisis, but the oil shocks made everything worse. After Egypt and Syria attacked Israel on 6 October 1973, OPEC's Gulf producers raised the posted price of oil, and the Arab producers' organisation, **OAPEC**, imposed an embargo on countries that supported Israel, above all the United States. By the time the embargo was lifted in March 1974, the price had risen from about \$3 to nearly \$12 a barrel. The Iranian Revolution brought a second shock in 1979–80, when crude more than doubled within a year.

In Britain inflation peaked at almost 27 per cent in 1975, a sterling crisis followed in 1976, and the strikes of the "Winter of Discontent" of 1978–79 set the stage for a Conservative victory. Meanwhile oil exporters deposited their earnings in international banks, which lent them on to Latin American governments, storing up the next crisis.

## The Intellectual Insurgency

The ideas that answered the crisis were old. In August 1938 about 25 liberal intellectuals, among them Walter Lippmann, Friedrich Hayek and Ludwig von Mises, met in Paris to renew liberalism after the Depression; "neoliberalism" was one name floated. They split at once: Alexander Rüstow and Lippmann wanted strong state supervision of the economy, Mises and others a narrower state, with Hayek's place between them disputed. In Germany the word came to mean the "ordoliberal" Freiburg School and Ludwig Erhard's "social market economy". Even Milton Friedman, in 1951, wanted a state that would also "relieve acute misery and distress". By the 1970s the movement had narrowed its focus to liberating markets.

Hayek's *The Road to Serfdom* (1944), dedicated "To the socialists of all parties", argued that socialism required central planning and that planning led towards totalitarianism. In April 1947 Hayek gathered 39 invited scholars at Mont Pèlerin, near Vevey in Switzerland. The **Mont Pèlerin Society**, whose founders included Friedman, Karl Popper, George Stigler and Mises, began its statement of aims: "Over large stretches of the Earth's surface the essential conditions of human dignity and freedom have already disappeared." Friedman called it a "rallying point".

For decades these ideas stayed on the fringe, carried by networks: Antony Fisher, a society member, founded the Institute of Economic Affairs in London in 1955 and later the Manhattan Institute. David Harvey and Thomas Volscho trace the American political mobilisation to a confidential memorandum of 1971 by Lewis Powell urging business to build its own intellectual infrastructure. Friedman supplied the economics. In 1963 he declared that "inflation is always and everywhere a monetary phenomenon", and in 1968, as did Edmund Phelps independently, he argued that inflation could not permanently lower unemployment, an account that fitted stagflation better than the Phillips curve. Recognition followed the crisis: Hayek shared the 1974 economics Nobel, and Friedman won it in 1976, amid protests over his visit to Chile.

## The Volcker Shock

The decisive turn came from a central bank. Jimmy Carter appointed Paul Volcker chairman of the Federal Reserve in August 1979. Using money-supply targets inspired by monetarism, the Fed let interest rates soar; the federal funds rate peaked at 20 per cent in June 1981. Inflation, which had peaked at 14.8 per cent in March 1980, fell below 3 per cent by 1983. The price was the recession of 1980–82, which pushed unemployment over 10 per cent; indebted farmers blockaded the Fed's headquarters with tractors. Policy eased in 1982.

{{image: Paul Volcker | Paul Volcker, chairman of the US Federal Reserve from 1979 to 1987, whose high interest rates broke American inflation.}}

The shock travelled, sharply raising the debt payments of borrowing countries. Giovanni Arrighi argues that the resulting scarcity of capital, heralded by the Mexican default of 1982, created the conditions for structural adjustment across the Global South.

## Thatcher's Britain

Margaret Thatcher became Conservative leader in 1975; one witness recalled her producing Hayek's *The Constitution of Liberty* at a party meeting: "'This', she said sternly, 'is what we believe', and banged Hayek down on the table." Elected in May 1979, she cut the top rate of income tax from 83 to 60 per cent (and to 40 per cent in 1988), raised indirect taxes and abolished exchange controls. Her money-supply targets were overshot and revised, so analysts argue that Thatcherism was never strictly monetarist. In March 1981, 364 economists warned that her policies would "deepen the depression"; unemployment passed three million for the first time since the 1930s. She held her course; in May 1980 she had said, "I believe people accept there's no real alternative", the origin of the slogan "There is no alternative", or TINA. Inflation fell from 18 per cent to 8.6 per cent by 1982.

**Privatisation**, accelerated after 1983, raised more than £29 billion, and share ownership among adults rose from 7 to 25 per cent, though natural monopolies such as water saw little real competition. The Right to Buy let more than a million families buy their council homes, and the "Big Bang" of 27 October 1986 deregulated the London Stock Exchange. "Who is society? There is no such thing!" she told *Woman's Own* in 1987.

The defining confrontation was the **miners' strike of 1984–85**. On 6 March 1984 the National Coal Board announced 20 pit closures; cabinet papers released in 2014 show its chairman, Ian MacGregor, wanted to close 75 pits over three years. The National Union of Mineworkers under Arthur Scargill held no national ballot, and over a fifth of miners, especially in Nottinghamshire, kept working. At Orgreave on 18 June 1984 about 5,000 pickets faced some 6,000 police; there were 11,291 arrests in all, and among the dead were two pickets and a taxi driver killed by strikers. Thatcher spoke of union leaders as "the enemy within". The strike drew new solidarities, from Women Against Pit Closures to Lesbians and Gays Support the Miners, after which the union backed gay rights. It ended in defeat on 3 March 1985; every pit open in 1983 had closed by the end of 2015. Union membership fell from 13 million in 1979 to about 7.3 million in 2000.

## Reagan's America

Ronald Reagan, elected in 1980, took office in January 1981 declaring:

```quote
In this present crisis, government is not the solution to our problem; government is the problem.
Ronald Reagan · Inaugural address · 20 January 1981
```

The tax act of August 1981 cut the top marginal rate from 70 to 50 per cent; after the Tax Reform Act of 1986 it stood at about 28 per cent. Critics called the "supply-side" theory "trickle-down". Military spending rose and federal debt held by the public nearly tripled, which Reagan called his "greatest disappointment"; unemployment, after the recession, fell to 5.4 per cent by the time he left office. Deregulation, however, had begun under Carter, in trucking, airlines and banking: the turn was not one party's work.

The American counterpart to the miners was **PATCO**, the air traffic controllers' union, which had endorsed Reagan in 1980. It struck illegally on 3 August 1981, and Reagan warned that strikers who did not return within 48 hours "have forfeited their jobs". Two days later 11,345 were fired and banned from federal service for life. Volcker called it a "watershed" in the fight against inflation; Alan Greenspan later argued that it emboldened private employers. Union density, 20.1 per cent in 1983, was 10 per cent in 2025, and 5.9 per cent in the private sector.

```checkpoint
q: Who imposed the oil embargo of 1973–74?
a*: OAPEC, the organisation of Arab oil producers, against countries that supported Israel in the October War.
a: OPEC as a whole, including Iran and Venezuela.
x: OPEC's Gulf members raised the posted price, but the embargo was imposed by the Arab producers of OAPEC.
a: The United States, against the Soviet Union.
x: The United States was the main target of the embargo, not its author.
a: The IMF, as a condition of its loans.
x: The IMF's conditional lending belongs to the debt crisis of the 1980s, not to the oil embargo.
hint: Think of the war that began on 6 October 1973.
why: The embargo, with the price rise, roughly quadrupled the price of oil and fed the stagflation of the 1970s.
---
q: Why was the PATCO strike of 1981 seen as a turning point?
a: Because it won the air traffic controllers a 32-hour week.
x: The strike failed; the controllers were fired and their union decertified.
a: Because Reagan settled it by raising taxes.
x: Reagan's response was to fire the strikers, not to make concessions.
a*: Because Reagan fired 11,345 striking controllers and banned them from federal service, a move Alan Greenspan later argued emboldened private employers.
a: Because Reagan rehired all the strikers within a week.
x: The strikers were banned from federal service for life; Clinton lifted the ban only in 1993.
hint: Consider what Reagan said would happen after 48 hours.
why: Like the miners' defeat in Britain, PATCO marked the weakening of organised labour; Volcker called it a "watershed" against inflation.
```

## Debt and Adjustment in the Global South

The first laboratory of the new economics was **Chile**. As the chapter on Latin America in the Cold War describes, after the 1973 coup the "Chicago Boys" imposed austerity, deregulation and privatisation from 1975. Friedman visited in March 1975, though he insisted he was never the regime's adviser, and Hayek told a Chilean interviewer, in words that reach us through translation, "Personally I prefer a liberal dictatorship to democratic government devoid of liberalism." Critics note that, by one measure, 45 per cent of Chileans were below the poverty line in 1987. It was opposition scholars under Pinochet who took up *neoliberalismo* as a name for the Chicago reforms, and from Spanish the word passed into English.

The wider crisis came in August 1982, when Mexico announced that it could not service its debt. Latin America's external debt had risen from \$75 billion in 1975 to over \$315 billion by 1983. Banks stopped lending, and *la década perdida*, "the lost decade", followed: real urban wages fell by 20 to 40 per cent in the decade after 1980. Most countries abandoned import-substitution industrialisation for IMF-backed export orientation; in 1985 Bolivia ended hyperinflation with "shock therapy" advised by Jeffrey Sachs. As the chapter on Decolonization notes, the debt crisis also sank hopes for a New International Economic Order.

In 1989 the economist **John Williamson** coined the phrase "Washington Consensus" for a ten-point list of reforms, including fiscal discipline, trade liberalisation, openness to foreign investment, privatisation, deregulation and secure property rights. His list was narrower than its reputation. He "consciously excluded" freeing capital movements and did not mean "monetarism, supply-side economics, or a minimal state", which he thought of as "the quintessentially neoliberal ideas". By 2002 he called the phrase "a damaged brand name". Daniel Yergin and Joseph Stanislaw argue that the prescriptions were "developed in Latin America, by Latin Americans"; critics such as Joseph Stiglitz and Arrighi stress the leverage of debt. Argentina, showcased by the IMF in 1998 as a reform success, collapsed in 2001.

In **Africa** the template was the World Bank's Berg Report of 1981, which answered the Organisation of African Unity's inward-looking Lagos Plan of Action with outward-looking liberalisation; critics said it played down external shocks. Through the 1980s IMF and World Bank loans across Latin America and sub-Saharan Africa came with conditions: privatisation, liberalised trade, balanced budgets and devaluation. Critics point to slower growth, agriculture hurt by the withdrawal of state support, early industrialisation "wiped out", cuts to health and education with gendered effects, and a loss of sovereignty some called neo-colonial. Defenders cite studies weakly linking adjustment to growth and lower inflation, and argue that governments were otherwise captured by rent-seeking. Ghana, adjusting from 1983 under Jerry Rawlings, was often presented as a success, though critics say poverty persisted outside export sectors. In Malawi, after donors long pressed for cuts to fertiliser subsidies, a disastrous 2005 harvest left nearly five million people needing food aid; restored subsidies brought record maize harvests. In 1999 the Malawian economist Thandika Mkandawire and Charles Soludo gathered African economists' studies in *Our Continent, Our Future*, arguing for a more active state within a market economy.

## Other Roads

The turn was not only imposed from outside. In **New Zealand** a Labour government from 1984, with Roger Douglas as finance minister, floated the currency, corporatised state enterprises and removed farm subsidies; supporters point to the defeat of inflation, critics to child poverty that doubled to 29 per cent by 1994, after further cuts by the next government.

**India** turned in 1991, when its reserves fell to about three weeks of imports and it pledged gold to borrow. P. V. Narasimha Rao's government devalued the rupee, and finance minister Manmohan Singh's budget of 24 July 1991 dismantled most of the "Licence Raj". How far the IMF shaped the reforms, and how much of the faster growth and falling poverty that followed they explain, are debated; the top tenth's share of income rose from 35 per cent in 1991 to 57 per cent in 2014.

**China** offers the great contrast. From December 1978 Deng Xiaoping's leadership decollectivised farming and opened Special Economic Zones such as Shenzhen, while a "dual-track" system let market prices grow up beside planned ones. Isabella Weber argues that China twice "escaped shock therapy", in 1986 and 1988. Growth averaged about 9.5 per cent a year from 1978 to 2013; whether this counts as neoliberal reform is contested, and the chapter on Maoism follows the party's reckoning with Mao's legacy. East Asia's "miracles" were also built by **developmental states**: Chalmers Johnson credited Japan's bureaucrats, and Alice Amsden described South Korea as "deliberately getting relative prices wrong", against the World Bank's stress on export orientation in *The East Asian Miracle*. When the **Asian financial crisis** broke in Thailand on 2 July 1997, IMF rescues came with high interest rates and austerity; Indonesia lost about 13 per cent of its output in 1998 and Suharto fell, while Malaysia refused IMF aid and imposed capital controls. Stiglitz and Sachs blamed the IMF's prescriptions.

After 1989, shock therapy reached the former communist world, with Poland's Balcerowicz plan and Russia's far more painful transition; the chapter on the Collapse of the Soviet Union and Eastern Europe tells that story and its debates.

## The Third Way

By the 1990s the order had become bipartisan. The historian Gary Gerstle casts Reagan as its ideological architect and Bill Clinton as its key facilitator. Clinton, Tony Blair and Gerhard Schröder spoke of a **Third Way**, which Blair called "a modernised social democracy, passionate in its commitment to social justice". In January 1996 Clinton declared that "the era of big government is over", adding that citizens must not be "left to fend for themselves". He signed NAFTA, a welfare reform with a five-year lifetime limit on benefits, and in 1999 the repeal of part of the Glass–Steagall Act of 1933; whether that contributed to 2008 is disputed. New Labour largely kept Thatcher's privatisations and union laws.

## Finance and Inequality

Scholars call a deeper shift **financialisation**: for Greta Krippner, profits made "increasingly through financial channels rather than through trade and commodity production". American commercial-bank assets grew from 53 per cent of GDP in 1978 to 84 per cent in 2007.

Inequality rose steeply and has stayed high. In the estimates of Thomas Piketty, Emmanuel Saez and Gabriel Zucman, the top 1 per cent's share of American pre-tax income rose from 12 per cent in 1980 to 20 per cent in 2014, while the bottom half's fell from 20 to 12 per cent. Defenders reply with the global picture: extreme poverty fell from about 43 per cent of humanity in 1990 to about 13 per cent in 2015, on the World Bank's current \$3-a-day line. Critics answer that most of that fall came in China and India, which, the economist Dani Rodrik argues, largely ignored the Washington Consensus, a claim others dispute.

```checkpoint
q: What did John Williamson mean by the "Washington Consensus"?
a: A programme of monetarism, supply-side tax cuts and a minimal state.
x: Williamson explicitly said he did not mean these, which he called "the quintessentially neoliberal ideas".
a*: A list of ten policy reforms, from fiscal discipline and trade liberalisation to privatisation and secure property rights.
a: The full liberalisation of capital movements across borders.
x: Williamson "consciously excluded" capital-account liberalisation.
a: China's dual-track price reform of the 1980s.
x: China's gradual reform is usually presented as a contrast to the Consensus.
hint: He coined the phrase in 1989 and later called it "a damaged brand name".
why: The term came to stand for much more than Williamson's narrow list, which is why he disowned its broad use.
---
q: What does Isabella Weber argue about China's reforms?
a: That China adopted Polish-style shock therapy in 1978.
x: Weber argues the opposite: China chose gradual reform.
a: That China's growth came entirely from foreign aid.
x: Weber's argument concerns price reform, not aid.
a: That China followed the Washington Consensus more closely than Latin America.
x: Rodrik and others cite China as a fast grower that largely ignored the Consensus.
a*: That China twice rejected shock therapy, in 1986 and 1988, and reformed gradually through dual-track pricing.
hint: Think of the title of her book, *How China Escaped Shock Therapy*.
why: China's path shows that market reform could take a gradual, state-directed form, a point central to debates about neoliberalism's record.
```

## 2008 and After

The order's great crisis began in American subprime mortgages in 2007. On 15 September 2008 Lehman Brothers filed the largest bankruptcy in American history, and in October Congress passed a \$700 billion bank rescue. About 8.6–8.7 million American jobs were lost and unemployment reached 10 per cent in October 2009; the eurozone crisis followed. Governments turned to austerity, and TINA returned in Angela Merkel's *alternativlos*. Yet the ideas survived: Philip Mirowski argued in *Never Let a Serious Crisis Go to Waste* (2013) that neoliberal thought had proved unfalsifiable.

Over the next decade the consensus came under attack from both flanks. Researchers link the convergence of mainstream parties since the 1990s to the rise of populist challengers, and Gerstle connects 2008 to the rise of both Donald Trump and Bernie Sanders. Industrial policy returned: the CHIPS and Science Act and the Inflation Reduction Act, both signed in August 2022, put public money into semiconductors and clean energy. In April 2023 Jake Sullivan, Joe Biden's national security adviser, called for "a modern American industrial strategy" and said trade liberalisation's promise to export goods "not jobs and capacity" was "a promise made but not kept". Trump's second-term tariffs of 2025 pushed the average American tariff to its highest level in over a century, but on 20 February 2026 the Supreme Court ruled 6–3, in *Learning Resources, Inc. v. Trump*, that the IEEPA emergency-powers law he had used did not authorise tariffs, though separate tariffs on steel, aluminium and other goods remained and the administration turned to other trade laws to impose new tariffs.

Has the neoliberal order ended? Gerstle argues that a "political order" is a set of ideas that even the opposition comes to accept, as Democrats accepted the market from Clinton onwards, and that the crash of 2008 fractured this one in the 2010s. Some reviewers doubt that a new order will replace it, predicting gridlock instead. Others note how much of the institutional architecture persists: independent central banks, the rules of the World Trade Organization, privatised utilities.

## What Was Neoliberalism?

Historians disagree even about the name. A study of 148 scholarly articles found "neoliberalism" almost never defined. Daniel Stedman Jones warns that it is "too often used as a catch-all shorthand for the horrors associated with globalization and recurring financial crises"; Rajesh Venugopal calls it "a controversial, incoherent and crisis-ridden term". Defenders of the word point out that even the IMF published a paper in 2016 titled "Neoliberalism: Oversold?", and Gerstle calls it a legitimate term for "a creed that calls explicitly for unleashing capitalism's power", distinct from conservatism, which respects tradition. Those who favour the policies usually reject the label; Deirdre McCloskey calls her position simply liberalism.

Historians also disagree about what drove it. For David Harvey it was a "class project" to restore the power of economic elites. Mirowski and Dieter Plehwe trace a "thought collective" of intellectuals and think tanks, and Stedman Jones a transatlantic network. Quinn Slobodian argues that neoliberals did not seek to abolish the state but to "encase" markets in supranational law, from trade agreements to the European Union, protecting them from democratic nations. And the record remains disputed: inflation conquered and long expansions on one side; inequality, financial crises, the miners' towns, Latin America's lost decade, Africa's adjustment years and Russia's mortality crisis on the other.

## Further exploration

- **David Harvey, *A Brief History of Neoliberalism* (2005).** A Marxist geographer's account of neoliberalism as a class project, from Chile to China.
- **Daniel Stedman Jones, *Masters of the Universe: Hayek, Friedman, and the Birth of Neoliberal Politics* (2012).** The transatlantic intellectual movement that led to Thatcher and Reagan.
- **Quinn Slobodian, *Globalists: The End of Empire and the Birth of Neoliberalism* (2018).** The "Geneva School" and the global institutions built to protect markets from democratic nations.
- **Gary Gerstle, *The Rise and Fall of the Neoliberal Order: America and the World in the Free Market Era* (2022).** Neoliberalism as a bipartisan political order, from Reagan to its fracturing after 2008.
- **Isabella M. Weber, *How China Escaped Shock Therapy: The Market Reform Debate* (2021).** China's 1980s choice of gradual, dual-track reform.
- **Thandika Mkandawire and Charles C. Soludo, *Our Continent, Our Future: African Perspectives on Structural Adjustment* (1999).** African economists' critique of adjustment.
- **Johan Norberg, *In Defense of Global Capitalism* (Swedish 2001; English edition 2003).** A defender's case for globalisation and free trade.$mn_neoliberal_master$,
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
  select $mn_neoliberal_quiz$[
    {"type": "mcq", "prompt": "What did President Nixon announce on 15 August 1971?", "options": ["The suspension of the dollar's convertibility into gold, which effectively ended the Bretton Woods system", "The founding of the Mont Pèlerin Society", "An embargo on Arab oil", "The appointment of Paul Volcker as chairman of the Federal Reserve"], "answerIndex": 0, "explanation": "The 'Nixon shock' also imposed a wage and price freeze and an import surcharge; currencies floated from 1973 and the Jamaica Accords of 1976 formally ratified the end of the system.", "id": "q1"},
    {"type": "mcq", "prompt": "What happened in the 'Volcker shock' after Paul Volcker became chairman of the Federal Reserve in 1979?", "options": ["The Fed cut interest rates to zero to fight unemployment", "The Fed returned the dollar to gold", "The Fed let interest rates soar, with the federal funds rate peaking at 20 per cent in 1981, and inflation fell below 3 per cent by 1983 at the cost of a deep recession", "The Fed nationalised the largest banks"], "answerIndex": 2, "explanation": "Inflation fell from a peak of 14.8 per cent, but the 1980–82 recession pushed unemployment over 10 per cent, and higher rates raised the debt payments of borrowing countries.", "id": "q2"},
    {"type": "mcq", "prompt": "In which country did a crisis in August 1982 open the Latin American debt crisis and the 'lost decade'?", "options": ["Chile", "Argentina", "Bolivia", "Mexico"], "answerIndex": 3, "explanation": "Mexico announced it could not service its debt; banks stopped lending, and real urban wages in the region fell by 20 to 40 per cent in the decade after 1980.", "id": "q3"},
    {"type": "mcq", "prompt": "Which phrase sums up Gary Gerstle's view of the neoliberal order?", "options": ["A purely Republican project that Democrats always resisted", "A bipartisan 'political order' with Reagan as its ideological architect and Clinton its key facilitator, fractured by the crash of 2008 in the 2010s", "An order that began in China in 1978", "An order that the IMF imposed on the United States"], "answerIndex": 1, "explanation": "For Gerstle a political order is one whose ideas even the opposition accepts; he links its fracturing after 2008 to the rise of both Trump and Sanders.", "id": "q4"},
    {"type": "open", "prompt": "How global was the neoliberal turn? Compare at least three cases from different regions.", "rubric": "A strong answer contrasts cases such as Chile under the Chicago Boys, the 1982 debt crisis and Latin America's lost decade, structural adjustment in Africa (Berg Report, Ghana presented as a success, Malawi's fertiliser subsidies, the critique of Mkandawire and Soludo), New Zealand's Labour-led reforms, India's 1991 crisis and reforms, China's gradual dual-track path (Weber), East Asian developmental states and the 1997 Asian financial crisis; it distinguishes reforms imposed through debt and conditionality from those chosen at home, and notes debates over outcomes such as inequality and the fall in global poverty.", "id": "q5"},
    {"type": "open", "prompt": "Is 'neoliberalism' a useful term for historians? Assess the arguments.", "rubric": "A strong answer notes the word's shifting history (the 1938 Paris meeting, German ordoliberalism, Friedman's 1951 usage, its take-up by Chilean opposition scholars) and that a study found it almost never defined; it weighs critics such as Stedman Jones ('catch-all shorthand') and Venugopal ('incoherent') against defenders such as Gerstle and the IMF's 2016 'Neoliberalism: Oversold?', mentions that supporters of the policies (e.g. McCloskey) prefer 'liberalism', and engages competing explanations: Harvey's class project, the 'thought collective' of Mirowski and Plehwe, and Slobodian's 'encasing' of markets.", "id": "q6"}
  ]$mn_neoliberal_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/contemporary-history/the-neoliberal-age', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

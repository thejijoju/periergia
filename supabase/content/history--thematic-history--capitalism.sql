-- Global History of Capitalism: Past, Present, Future — canonical master article, co-written and human-reviewed.
-- history/thematic-history/global-history-of-capitalism-past-present-future @ research/advanced/read.
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
    'history/thematic-history/global-history-of-capitalism-past-present-future',
    'research',
    'advanced',
    'read',
    $mn_capitalism_master$> **A system with many birthplaces and no agreed definition.** Capitalism is usually defined as an economic system based on private ownership of the means of production and their use for profit, but historians disagree about where and when it began, and even about what it is. This chapter follows the argument across a thousand years: merchant capitalism in Song China, the Islamic world and the Indian Ocean; enclosure and the Brenner debate; the Dutch companies and Wallerstein's world-system; slavery and colonial extraction; factories, informal work and unwaged labour; the gold standard, the Depression, Keynes and Bretton Woods; developmental and state capitalism; neoliberalism, China's reforms and 2008; and the arguments over inequality, climate and automation that will shape what comes next.

## A Word and Its Definitions

Étienne Clavier wrote of *capitalistes* in French in 1788, and among early English uses of "capitalist" were Alexander Hamilton's in 1791 and Arthur Young's in 1792. The noun "capitalism" in its modern sense is attributed to Louis Blanc in 1850, who meant by it "the appropriation of capital by some to the exclusion of others". In English, according to the *Oxford English Dictionary*, it first appears in 1854, in Thackeray's novel *The Newcomes*. Karl Marx, the system's most famous critic, rarely or never used the noun: in *Capital* (volume I, 1867) his term was the "capitalist mode of production". Werner Sombart's *Der moderne Kapitalismus* (1902–27) divided capitalism into early, high and late stages, and Sombart is credited with coining "late capitalism".

Definitions still divide historians into three broad camps. One stresses commerce and markets, from Adam Smith to Braudel and Jairus Banaji. A second, following Marx, stresses social relations, above all wage labour. A third, following Max Weber and Sombart, stresses a cultural "spirit". Jürgen Kocka, in *Capitalism: A Short History* (2016 in English), proposes a working definition that "emphasizes decentralization, commodification, and accumulation as basic" characteristics; one reviewer asked whether this was a list of features rather than a true definition. Where you look for capitalism's origins depends on what you think it is.

Weber's *The Protestant Ethic and the Spirit of Capitalism* (1904–05) argued that the Calvinist ideas of a "calling", predestination and worldly asceticism helped capitalism develop in northern Europe. Critics have chipped away at it: Davide Cantoni (2015) found no effect of Protestantism on growth in German cities from 1300 to 1900. Fernand Braudel, in *Civilization and Capitalism, 15th–18th Century* (1967–79), pictured economic life as a building. On the ground floor was "material life", everyday subsistence; above it the "market economy"; at the top, "capitalism". For Braudel the two upper floors were to some degree opposed: the market meant open exchange among many competitors, capitalism meant a few large players using capital, private deals, control of information and limits on competition to dominate it. He traced finance capitalism to the Genoese in the sixteenth century and the Dutch after them.

## Merchant Capitalism Beyond Europe

If capitalism means markets, credit and investment for profit, Europe was neither first nor alone. Under the **Song dynasty** (960–1279) China moved from command structures to extensive use of markets, with cash crops, a national market and coal as industrial fuel. By one estimate its national income was around three times that of twelfth-century Europe. Sichuan merchants first issued paper notes, *jiaozi*, which the state took over from the 1020s, and Chinese records describe the *douniu*, a pooling of capital among many shareholders. The chapter on Tang and Song China tells this story.

{{image: Jiaozi (currency) | A reproduction of a Song paper note. Merchants in Sichuan first issued such notes before the Song state took them over in the 1020s.}}

In the Islamic world the *qirad* partnership let an investor fund a travelling merchant who bore no risk to the capital; it is the closest relative of the Italian *commenda*, as the chapter on the Islamic Commercial Revolution (800–1200) describes. Across the **Indian Ocean**, monsoon trade linked the Red Sea, the Gulf, India, Southeast Asia, China and East Africa: Gujarati merchants carried Moluccan spices and Chinese silk in exchange for textiles, and the *hundi*, a medieval Indian bill of exchange, carried credit and remittances.

How did such trade work without strong courts? Avner Greif argued that eleventh-century Jewish "Maghribi" traders, known from the Cairo Geniza letters, enforced honesty through a reputation-based "coalition" that punished cheats collectively, unlike the Genoese, who relied more on formal law. Jeremy Edwards and Sheilagh Ogilvie (2012) replied that none of Greif's examples proves a coalition existed and that the traders also used courts, and the historian Jessica Goldberg's study of the letters (2012) stressed the traders' use of legal and administrative institutions. The debate is unresolved.

Recent syntheses turn such evidence against Eurocentric accounts. Banaji's *A Brief History of Commercial Capitalism* (2020) argues that commercial capitalism reorganised production on a world scale long before industry, from Byzantine and Italian merchants through the Muslim trading world to the Dutch and English companies, and always combined free and unfree labour. Sven Beckert's *Capitalism: A Global History* (2025), as reviewers describe it, argues that capitalism was born global, opening around 1150 with the merchants of Aden in Yemen, whom he calls "capitalists without capitalism"; critics find it light on theory.

The question has been argued within Asia too. A 1939 text edited by Mao Zedong claimed that China "would of herself have developed slowly into a capitalist society even without the impact of foreign capitalism". From the 1950s Shang Yue and others looked for these "sprouts of capitalism" in the late Ming and early Qing economies. Denounced in the Anti-Rightist campaign and the Cultural Revolution, the school revived in the 1980s; Korean nationalist historians have also taken up the idea. Reviewing the Japanese research on the subject, Mori Masao judged in 1980 that it "failed to produce satisfactory theoretical results, though it uncovered a wealth of historical facts". The chapter on Global History sets out the wider debate over the Great Divergence.

## Enclosure and the Brenner Debate

Those who define capitalism by wage labour look to the English countryside. Between 1604 and 1914 more than 5,200 enclosure bills fenced about 6.8 million acres, roughly a fifth of England. Enclosure was a grievance in Kett's Rebellion of 1549, and in Thomas More's *Utopia* (1516) sheep "devour men". E. P. Thompson called it "a plain enough case of class robbery"; revisionists reply that its impact has been grossly exaggerated. Smith had spoken of a "previous accumulation" of capital; Marx answered with "so-called primitive accumulation", a story of violent expropriation, not thrift: "This primitive accumulation plays in Political Economy about the same part as original sin in theology." Silvia Federici's *Caliban and the Witch* (2004) extends it to the subjugation of women's bodies and reproductive labour, enforced through the witch-hunts.

In 1976 Robert Brenner argued that class structure, not population or trade, decided Europe's paths. The same demographic collapse after the Black Death ended serfdom in the west but brought a "second serfdom" east of the Elbe. In England landlords leased land competitively, creating the triad of landlord, capitalist tenant farmer and wage labourer, while France reinforced small peasant property. Postan and Le Roy Ladurie defended a demographic explanation, Guy Bois a rival Marxism, and T. J. Byres, following Rodney Hilton, made rich peasants the "prime movers". Ellen Meiksins Wood developed Brenner's view in *The Origin of Capitalism* (1999). Karl Polanyi set a later date still: without a competitive labour market, established in England only in 1834, industrial capitalism as a social system did not exist.

## Companies and the World-System

The Dutch East India Company (VOC), established by the States General on 20 March 1602, had a 21-year monopoly on Asian trade and capital of 6,440,200 guilders. Any Dutch citizen could buy its shares, traded on what became the Amsterdam stock exchange, and its charter let it build forts, keep armies and make treaties. It was one of the first joint-stock companies, not the first: share companies existed earlier, from the Song *douniu* to Sweden's Stora Kopparberg and the Bazacle mills of Toulouse. Its distinctive features also came later than its founding: according to Padgett and Powell, the VOC acquired "locked-in" capital and limited liability by 1612. The chapter on Trading Companies and Empires: the VOC and the East India Company tells how such armed corporations conquered for profit.

States backed these companies with monopolies and colonies, the system later called mercantilism. Adam Smith attacked it in 1776.

```quote
It is not from the benevolence of the butcher, the brewer, or the baker, that we expect our dinner, but from their regard to their own interest.
Adam Smith · The Wealth of Nations · 1776
```

For Immanuel Wallerstein, whose *The Modern World-System* appeared in four volumes from 1974 to 2011, the companies belonged to a single capitalist world-economy of core, semi-periphery and periphery, with hegemony passing from the Netherlands to Britain to the United States. Critics call the model too economistic and state-centred, and Janet Abu-Lughod described an older, thirteenth-century world system. The chapter on Global History covers these arguments.

```checkpoint
q: What did Fernand Braudel mean by placing "capitalism" on the top floor of economic life?
a*: That a few large players used capital, private deals, information and limits on competition to dominate the market economy below them.
a: That capitalism and the free market are the same thing at different scales.
x: Braudel argued the opposite: capitalism and the open competitive market are to some degree opposed.
a: That capitalism was confined to subsistence production in the countryside.
x: Subsistence "material life" was the ground floor, not the top.
a: That capitalism began only with the factory system of the nineteenth century.
x: Braudel found finance capitalism among the Genoese in the sixteenth century and the Dutch after them.
hint: Think of the three floors: material life, the market economy, and what sat above them.
why: Braudel distinguished the open market of many competitors from the monopolistic capitalism at the top, a distinction most economists do not make.
---
q: What does recent research suggest about the Dutch East India Company's place in the history of the joint-stock company?
a: It was the first share company in history, with limited liability from its founding in 1602.
x: Earlier share companies existed, and Padgett and Powell date its locked-in capital and limited liability to 1612.
a: It was copied directly from a Chinese model.
x: Song China had joint-stock-like pooling, but nothing in the evidence shows the Dutch copied it.
a*: It was one of the first joint-stock companies, with earlier precedents, and acquired permanent capital and limited liability by 1612.
a: It never issued shares to the public.
x: Any Dutch citizen could buy VOC shares, which traded on the Amsterdam exchange.
hint: Look for the hedged answer, with a date later than 1602.
why: The VOC was a landmark, but the Song douniu, Stora Kopparberg and the Bazacle company came earlier, and its key features developed after its founding.
```

## Slavery and Colonial Extraction

Marx himself placed colonial violence at the origin. In *Capital* he described the gold and silver of the Americas, the enslavement of Indigenous people in the mines, the conquest of the East Indies and the hunting of Africans for trade as signalling "the rosy dawn of the era of capitalist production", and wrote that capital comes dripping "from every pore, with blood and dirt". Eric Williams's *Capitalism and Slavery* (1944), which British publishers refused, set slavery at the heart of the history of British capitalism. Even Seymour Drescher, one of its critics, called it a classic. Beckert's *Empire of Cotton* (2014) spoke of "war capitalism" for the violent foundations of the cotton economy. The chapters on Slavery: a Global History and the Atlantic Slave Trade set out this debate in full.

## Workers, Factories and Uncounted Labour

Industrial capitalism, as the chapter on the Industrial Revolution describes, also made new classes. E. P. Thompson's *The Making of the English Working Class* (1963) argued that workers took an active part in making themselves a class. Antonio Gramsci popularised "Fordism" for the moving assembly line and the mass market. Beverly Silver has argued that as car production moved from Detroit and Flint to Turin, and then to Brazil, South Africa and South Korea in search of cheap, disciplined labour, it recreated militant labour movements in each new place.

Industrialisation and deindustrialisation are one story: the American Rust Belt declined from the 1950s and 1960s. Dani Rodrik's "premature deindustrialisation" (2016) observes that developing countries now reach peak industrialisation at much lower incomes than the early industrialisers, with Latin America hit hardest and Asian countries and manufactures exporters largely insulated.

Most of the world's workers have never fitted the image of the factory hand. Keith Hart described "informal income opportunities" in Ghana in the early 1970s, and Hernando de Soto's *The Other Path* blamed over-regulation for informality. By ILO estimates about two billion people, close to three in five of the world's workers, are informally employed; home-based workers are the most numerous, street vendors the most visible. The World Bank estimated in 2023 that between 154 and 435 million people do online gig work.

Some work earns no wage at all. In 1972 Mariarosa Dalla Costa, Silvia Federici, Brigitte Galtier and Selma James launched the Wages for Housework campaign, with groups in Italy, London, Bristol and Brooklyn, joined by Black Women for Wages for Housework in the mid-1970s. Federici's *Wages Against Housework* (1975) opened: "They say it is love. We say it is unwaged work." Critics feared that payment would reinforce gender roles. In 2020 Oxfam valued women's unpaid care work at no less than \$10.8 trillion a year, and by 2025, by a BBC estimate, 118 million women in twelve Indian states were receiving cash transfers that some states justified as wages for housework.

## Gold, Collapse and the Double Movement

The first globalisation ran on gold. From 1873 to 1914 an international gold standard took shape as Germany, the United States, India, Japan, Russia, Mexico and others joined; Japan, which saw gold as vital for access to Western capital, used reserves won in its war with China in 1894–95. In the Great Depression world GDP fell by an estimated 15 per cent in 1929–32 and international trade by more than half in value, as the chapters on Globalization and the Interwar Period describe. The Soviet five-year plans, from 1928, offered a planned alternative whose growth coincided with the Depression elsewhere.

Karl Polanyi read the catastrophe through the market itself.

```quote
Our thesis is that the idea of a self-adjusting market implied a stark utopia.
Karl Polanyi · The Great Transformation · 1944
```

For Polanyi, land, labour and money were "fictitious commodities", and when markets were disembedded from society, society moved to protect itself in a "double movement". Critics such as McCloskey and North question his history of markets; others say he underplays class and power.

## Keynes, Bretton Woods and the Postwar Order

"In the long run we are all dead," John Maynard Keynes wrote in 1923, chiding economists who could only promise that when the storm is long past "the ocean is flat again". His *General Theory* followed in 1936. In July 1944, 730 delegates from 44 Allied nations met at Bretton Woods, New Hampshire; Keynes's plan for a world currency, the "bancor", lost to Harry Dexter White's more conservative scheme. John Ruggie, building on Polanyi, called the result "embedded liberalism", a compromise between open trade and domestic stability. Growth in the 1950s and 1960s was unusually fast. On 15 August 1971 Nixon suspended the dollar's convertibility into gold, and by 1973 floating rates had effectively ended the system.

Capitalism was never one model. Chalmers Johnson's *MITI and the Japanese Miracle* (1982) first seriously conceptualised the "developmental state", in which far-sighted bureaucrats steer industry; Alice Amsden extended the idea to South Korea and other late industrialisers, which succeeded by "getting prices wrong". "State capitalism" is older: Engels saw state ownership as capitalism brought to its limit rather than abolished, Lenin used the term approvingly from 1918 and again under the New Economic Policy, and commentators now apply it to China and Singapore. Peter Hall and David Soskice's *Varieties of Capitalism* (2001) contrasted liberal market economies such as the United States and Britain with coordinated ones such as Germany and Japan; Colin Crouch objected that in their scheme "actors seem to exist in an iron cage of institutions".

## Neoliberalism, China and 2008

From the 1970s the pendulum swung. Friedrich Hayek had argued in 1945 that prices act as signals carrying dispersed knowledge, and in 1989 John Williamson named a ten-point package of reforms the "Washington Consensus". The chapter on the Neoliberal Age follows Thatcher, Reagan and the rise of finance, which Greta Krippner (2005) defines as "a pattern of accumulation in which profits accrue primarily through financial channels rather than through trade and commodity production".

China took another road. From December 1978 it decollectivised farming, opened special economic zones and freed prices gradually through a "dual track"; in 1982 Deng Xiaoping called for "Socialism with Chinese Characteristics". Extreme poverty fell by 800 million between 1978 and 2018, while the state kept the commanding heights of banking and petroleum. Isabella Weber argues that gradualism, not shock therapy, shaped the reform. The chapter on China Today: the Economic Miracle and Infrastructural Revolution tells the story.

In 2008 the system nearly broke. Lehman Brothers filed for bankruptcy on 15 September, the largest in US history; about 8.7 million American jobs were lost, and 2009 was a global recession year, though China, India and Indonesia kept growing. Adam Tooze's *Crashed* (2018) traces how a decade of crises changed the world.

```checkpoint
q: What did John Ruggie mean by "embedded liberalism"?
a: The return to the gold standard in the 1920s.
x: Ruggie described the postwar order after 1944, not the interwar gold standard.
a*: The postwar compromise, embodied in Bretton Woods, between open trade and domestic stability.
a: The neoliberal reforms of the 1980s.
x: Embedded liberalism was the order that broke down in the 1970s, before the neoliberal turn.
a: China's dual-track price reform.
x: That was China's gradualist reform from 1978, studied by Isabella Weber.
hint: Ruggie built on Polanyi's idea that markets must be embedded in society.
why: Ruggie's term, from 1982, describes the Bretton Woods order of the fast-growing 1950s and 1960s.
---
q: What did Chalmers Johnson's "developmental state" describe?
a: A state that leaves all economic decisions to the market.
x: That is closer to the Washington Consensus than to Johnson's model.
a: The Soviet planned economy under the five-year plans.
x: Johnson studied Japan, a capitalist economy guided by bureaucrats, not a planned economy.
a: The informal economy of street vendors and home workers.
x: Informality was studied by Keith Hart and Hernando de Soto, not Johnson.
a*: A state with far-sighted bureaucrats, such as Japan's MITI, steering industry towards development.
hint: Think of Japan's Ministry of International Trade and Industry.
why: Johnson's MITI and the Japanese Miracle (1982) introduced the concept, and Alice Amsden extended it to South Korea.
```

## Platforms and Inequality

Nick Srnicek's *Platform Capitalism* (2016) popularised a term coined by Sascha Lobo in 2014 for firms such as Google, Amazon and Uber that act as platforms for others' business, and Shoshana Zuboff's *The Age of Surveillance Capitalism* (2019) argues that Google and Facebook invented "a new logic of accumulation" from behavioural data; the chapter on Technological Advancements and the Digital Age sets out the case and the replies.

Thomas Piketty's *Capital in the Twenty-First Century* (French 2013, English 2014) argued that when the return on capital (r) exceeds growth (g) over the long run, wealth concentrates. The wars, the Depression and policy reversed inequality between 1930 and 1975, but the world is returning to "patrimonial capitalism". Critics replied from many sides: Lawrence Summers pointed to diminishing returns, Daron Acemoglu and James Robinson to institutions, and Matthew Rognlie to housing; in late 2014 Piketty said r > g was not the only or main tool for explaining inequality. According to press coverage of the World Inequality Report 2026, published on 9 December 2025, the richest tenth of the world's people receive about 53 per cent of global income and own about three-quarters of its wealth, while the poorest half hold about 2 per cent of the wealth.

## Contested Futures

Weber foresaw the modern economic order shaping lives "until the last ton of fossilized coal is burnt". Andreas Malm, who coined "Capitalocene" in 2009, argues in *Fossil Capital* (2016) that cotton masters switched to steam for profit and control over labour, and dates the climate crisis from the fossil economy after about 1830; Jason W. Moore's "Cheap Nature" places the origins earlier, in the early modern centuries. The chapters on Environmental History and History of Energy take up these arguments. Degrowth writers such as Hickel and Kallis argue that green growth lacks empirical support; critics answer that degrowth is vague, politically unpopular and would deepen poverty. A second wave of deglobalisation, dating from 2008, revives questions last asked between 1914 and 1945. Automation brings back an old fear: Frey and Osborne estimated in 2013 that 47 per cent of US jobs were at high risk, while critics say such studies ignore new jobs. Keynes, who called technological unemployment "only a temporary phase of maladjustment", imagined in 1930 a world rich enough that the love of money would lose its hold.

Smith trusted self-interest checked by competition; Marx and Engels saw the need for expanding markets chase the bourgeoisie "over the entire surface of the globe"; Keynes wanted management; Hayek trusted prices; Polanyi expected society to fight back. A global history suggests that each saw part of a system that has taken many forms, in Song China and Aden as well as Amsterdam and London, and whose future will be argued over by the people who live inside it.

## Further exploration

- **Jürgen Kocka, *Capitalism: A Short History* (2016).** A compact global history by a leading German social historian, with a usable working definition.
- **Sven Beckert, *Capitalism: A Global History* (2025).** Argues that capitalism was born global, opening with the merchants of Aden in the twelfth century.
- **Karl Polanyi, *The Great Transformation* (1944).** The classic account of the self-regulating market, "fictitious commodities" and society's double movement.
- **Jairus Banaji, *A Brief History of Commercial Capitalism* (2020).** A Marxist, non-Eurocentric account of merchant capital from the eleventh century.
- **Silvia Federici, *Caliban and the Witch: Women, the Body and Primitive Accumulation* (2004).** The transition to capitalism seen from women's unwaged labour and the witch-hunts.
- **Thomas Piketty, *Capital in the Twenty-First Century* (2013; English 2014).** Three centuries of inequality data and the argument that r > g.
- **Adam Tooze, *Crashed: How a Decade of Financial Crises Changed the World* (2018).** The 2008 crisis and its global aftermath.$mn_capitalism_master$,
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
  select $mn_capitalism_quiz$[
    {"type": "mcq", "prompt": "Which term did Marx himself use in Capital (1867) for the system he analysed?", "options": ["The capitalist mode of production", "Late capitalism", "Platform capitalism", "Embedded liberalism"], "answerIndex": 0, "explanation": "Marx rarely or never used the noun 'capitalism'; his term was the 'capitalist mode of production'. 'Late capitalism' is credited to Sombart, 'platform capitalism' to Sascha Lobo, popularised by Srnicek and 'embedded liberalism' to Ruggie.", "id": "q1"},
    {"type": "mcq", "prompt": "What did Avner Greif argue about the eleventh-century Maghribi traders of the Cairo Geniza?", "options": ["That they relied entirely on Islamic courts to enforce contracts", "That they invented the joint-stock company", "That they enforced honesty through a reputation-based coalition that punished cheats collectively", "That they were the first to issue paper money"], "answerIndex": 2, "explanation": "Greif contrasted the Maghribis' reputation-based 'coalition' with the Genoese reliance on formal law. Edwards and Ogilvie and Jessica Goldberg dispute the evidence, and the debate is unresolved.", "id": "q2"},
    {"type": "mcq", "prompt": "What did Robert Brenner argue in 1976 about the divergence of England and eastern Europe after the Black Death?", "options": ["That population change alone explained it", "That class structure, not population or trade, decided long-run outcomes", "That the growth of long-distance trade was the prime mover", "That Protestant ethics caused agrarian capitalism"], "answerIndex": 1, "explanation": "Brenner argued that social-property relations decided outcomes: the same demographic collapse ended serfdom in the west but brought a 'second serfdom' east of the Elbe. Postan and Le Roy Ladurie defended the demographic model; Sweezy had earlier defended the older trade-led, commercialisation model.", "id": "q3"},
    {"type": "mcq", "prompt": "According to press coverage of the World Inequality Report 2026, roughly what share of global wealth do the richest 10 per cent own?", "options": ["About 2 per cent", "About a quarter", "About half", "About three-quarters"], "answerIndex": 3, "explanation": "Press coverage of the report, published on 9 December 2025, said the richest tenth receive about 53 per cent of global income and own about three-quarters of global wealth, while the poorest half hold about 2 per cent.", "id": "q4"},
    {"type": "open", "prompt": "Historians disagree about where and when capitalism began. Explain how the answer depends on the definition used, with examples from inside and outside Europe.", "rubric": "A strong answer identifies the three broad approaches: commerce and markets (Smith, Braudel, Banaji, with examples such as Song China's markets and paper notes, the qirad and the Indian Ocean hundi, or Beckert's merchants of Aden); social relations and wage labour (Marx's 'capitalist mode of production', primitive accumulation, enclosure, Brenner's English agrarian capitalism, Polanyi's 1834); and culture (Weber's Protestant ethic, Sombart's 'spirit'). It may mention Kocka's working definition (decentralisation, commodification, accumulation) or the Chinese 'sprouts of capitalism' debate as a non-Western case, and shows that each definition points to a different time and place.", "id": "q5"},
    {"type": "open", "prompt": "How did Karl Polanyi explain the crises of the early twentieth century, and how did his ideas shape later accounts of the postwar order?", "rubric": "A strong answer explains Polanyi's argument in The Great Transformation (1944) that the self-adjusting market was a 'stark utopia', that land, labour and money were 'fictitious commodities', and that society protected itself against disembedded markets in a 'double movement'. It links this to the collapse of the gold standard and the Depression, and to John Ruggie's 'embedded liberalism' (1982): the Bretton Woods compromise between open trade and domestic stability that accompanied the rapid growth of the 1950s and 1960s and broke down in the 1970s. Credit for noting criticisms (McCloskey and North on his history of markets; the charge that he underplays class and power).", "id": "q6"}
  ]$mn_capitalism_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/thematic-history/global-history-of-capitalism-past-present-future', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

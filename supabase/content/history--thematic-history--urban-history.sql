-- Urban History — canonical master article, co-written and human-reviewed.
-- history/thematic-history/urban-history @ research/advanced/read.
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
    'history/thematic-history/urban-history',
    'research',
    'advanced',
    'read',
    $mn_urban_master$> **The city as history's great artifact.** On the United Nations' newest count, nearly half of humanity now lives in cities and most of the rest in towns. This chapter follows how that came about over six thousand years and every inhabited continent: the "urban revolution" in Mesopotamia and its independent repetitions in the Indus valley, Mesoamerica, Africa and Southeast Asia; the dispersed, low-density cities archaeologists have only recently recognised; the great premodern capitals; the shock of the industrial city and the sanitary reform it forced; planning and its hubris, from Haussmann's Paris to Le Corbusier and the struggle between Jane Jacobs and Robert Moses; segregation built into space; suburbs and sprawl; and the megacities and informal settlements of the Global South.

## A Field and Its Founders

Urban history studies how people have concentrated in cities over time. Most of its scholarship has dealt with the great metropolis rather than small towns or suburbs, and very few scholars have attempted a global history of cities. The most famous attempt is Lewis Mumford's *The City in History* (1961), which won the American National Book Award for Nonfiction in 1962. Mumford, influenced by the Scottish planner Patrick Geddes, argued that planning should stress an "organic" relationship between people and their surroundings, and he was a harsh critic of sprawl.

As a discipline the field took shape in the 1960s. In Britain its great promoter was **H. J. Dyos** of the University of Leicester, who founded an *Urban History Newsletter* in 1963; it became the *Urban History Yearbook* in 1974 and the journal *Urban History* in 1992. Dyos studied the Victorian city as a whole, slums and suburbs together. In the United States a quantitative "new urban history" used census records to trace ordinary city dwellers, as in Stephan Thernstrom's *Poverty and Progress* (1964) on Newburyport, Massachusetts; Dyos rejected that turn, preferring large structures to individual careers.

Two other traditions recur below. The **Chicago school** of sociology treated its city as a laboratory; Ernest Burgess proposed that cities grow outward in concentric zones. And the French philosopher **Henri Lefebvre** introduced the "right to the city" in *Le Droit à la ville* (1968), published just before the revolts of that May, and later wrote *The Production of Space* (1974).

## The First Cities

V. Gordon Childe coined the phrase "urban revolution" in the 1930s, and in 1950 set out ten criteria for it, among them large, dense settlements, full-time specialists, monumental buildings, a ruling class, writing, long-distance trade, and a state organised by residence rather than kinship. He placed the first such revolution in **Mesopotamia** in the fourth millennium BCE, and saw it repeated independently elsewhere. Its type site, **Uruk**, may have had up to 50,000 residents around 3100 BCE on Hans Nissen's estimate, with perhaps 80,000–90,000 in its surroundings on Guillermo Algaze's, when most settlements covered about ten hectares. The chapter on Mesopotamia tells Uruk's story, and the overview of The First Civilizations tests Childe's checklist.

Many places fail parts of that list. **Çatalhöyük** in south-central Anatolia, occupied from about 7500 to 5600 BCE, was large and densely packed, yet it shows strong signs of an egalitarian society, with no elite houses and little sign of social hierarchy. Even its size is disputed: early estimates ran to 5,000–7,000 people, but recent work suggests only 600–800 in an average year of its middle phase. With estimates ranging from under a thousand to several thousand, whether it was a town, a "proto-city" or a very large village depends on the definition used (see the chapter on the Neolithic Revolution).

**Mohenjo-daro**, in the Indus valley, was built around 2500 BCE and abandoned by about 1700 BCE. Laid out on a grid, it had over 700 wells, drains and the Great Bath, and an estimated population of at least 40,000. Neither the Indus cities nor Teotihuacan have yielded clear palaces or royal portraits, which has led some scholars to suggest collective forms of rule, another strain on the assumption that cities came with kings (see The Indus Valley Civilization).

In the Americas, **Teotihuacan**, northeast of modern Mexico City, held at least 25,000 and probably around 100,000 people at its height, living in multi-family apartment compounds; dates for its peak and its burning vary, as the chapter on Mesoamerican Cultures: Olmec, Maya, and Teotihuacan explains. Far to the north, **Cahokia**, across the Mississippi from St Louis, was the largest urban centre north of Mesoamerica. A 2007 study estimated that Cahokia's population grew from between 1,400 and 2,800 people to between 10,200 and 15,300 between 1050 and 1100 CE, and estimates of its overall peak range from 6,000 to 40,000, and it was abandoned by 1400 apart from a brief reoccupation (see North America before Columbus).

In southern Africa, **Great Zimbabwe**, settled from about 1000 CE and built in stone from the eleventh to the fifteenth centuries, became a kingdom's capital from the thirteenth. Traditional estimates gave it up to 18,000 inhabitants; a more recent survey concluded that it probably never exceeded 10,000. African construction was the scholarly consensus by the 1950s, yet in the 1960s and 1970s Rhodesia's white government pressured archaeologists to deny it (see The Swahili Coast and Great Zimbabwe).

## Low-Density Cities

In 2007 an international team using satellite imagery concluded that **Angkor**, whose name descends from the Sanskrit *nagara*, "city", was the largest pre-industrial city in the world by surface area, a sprawl of at least 1,000 square kilometres linked by roads and canals and with no clear boundary. Largest by area, it was not largest by population: a 2021 lidar-based study by Sarah Klassen and colleagues put the thirteenth-century peak of the Greater Angkor region at about 700,000–900,000 people across some 3,000 square kilometres. The chapter on Angkor, Srivijaya, and Medieval Southeast Asia describes its water systems.

**Roland Fletcher** of the University of Sydney argues that Angkor, Anuradhapura and Polonnaruwa in Sri Lanka, and the Classic Maya lowland cities were all "low-density", dispersed agrarian cities. He links their breakdown between the ninth and sixteenth centuries to climate instability, and compares them with today's sprawling megacities. The archaeologist **Monica L. Smith** adds that cities were not inevitable, yet were crucial to the rise of our species, and that ancient and modern cities share problems such as rubbish and pollution.

## Great Cities of the Premodern World

Which city first reached a million people is uncertain: Rome, Jiankang (Nanjing) and Chang'an may each have done so, at dates from the first century CE to the eighth. Estimates for Rome range from Chandler's 450,000 to a million or more (Morris, Modelski), so "perhaps half a million to a million" is the honest phrase (see Rome and the Ancient Roman World).

**Chang'an**, refounded by the Sui in 582 and renamed by the Tang in 618, was called a "million-man city" in Chinese records around 750; most modern estimates put the population within its walls at about 800,000–1,000,000. Its grid of walled wards was closed by a nightly curfew lifted only for the Lantern Festival. Its plan was copied on a smaller scale in Japan's Nara and Kyoto and in Silla's Gyeongju: the city as an instrument of state order (see Tang and Song China).

In 762 the Abbasid caliph al-Mansur began the **Round City** of Baghdad, the "City of Peace". Baghdad was one of the world's largest cities, rivalling Chang'an, and perhaps the largest until the 930s, with estimates from several hundred thousand to over a million people. Historians once spoke of a single "Islamic city" of mosque, bazaar, baths and walled quarters, a model associated with French Orientalists such as Georges Marçais. In 1987 Janet Abu-Lughod called it a myth built on too few cases, mostly North African and Syrian, and pointed instead to processes, such as gender segregation, the legal distinction between Muslims and non-Muslims, and Islamic law on property and neighbours, that shaped space in different ways. The chapter on Lords, Peasants, and Towns in Medieval Europe turns to the towns of medieval Christendom.

In West Africa, **Timbuktu** grew under Mali and Songhay into a centre of trade and Islamic learning, with its population probably in the tens of thousands. Its libraries still held up to 700,000 manuscripts in 2003, and when Islamist fighters set fire to the Ahmed Baba Institute in 2013, the BBC reported that most of its manuscripts had been saved (see Ghana, Mali, and the Trans-Saharan World).

When Spanish soldiers reached **Tenochtitlan** in 1519, the island city, joined to the mainland by causeways and supplied by aqueducts, held between 200,000 and 400,000 people on most estimates; in Europe only Paris, Venice and Constantinople might have rivalled it. Bernal Díaz del Castillo recalled soldiers asking "whether the things that we saw were not a dream" (see Moctezuma's Mexico). In Japan, **Edo** grew from a fishing village to perhaps a million people by the early eighteenth century (see Tokugawa Shogunate). Around 1800 the world's largest city was probably Beijing, at about 1.1 million.

```checkpoint
q: Why do historians disagree about whether Çatalhöyük was a city?
a*: It was large and dense, but it showed little social hierarchy, and recent estimates put its population at only 600–800 people in an average year.
a: Because it was built after the invention of writing.
x: Çatalhöyük was occupied from about 7500 to 5600 BCE, thousands of years before Uruk's peak around 3100 BCE.
a: Because it was a low-density city spread over 1,000 square kilometres.
x: That describes Angkor; Çatalhöyük was densely packed.
a: Because it had too many palaces and kings to count as a village.
x: The site shows strong evidence of an egalitarian society, with no elite houses.
hint: Think about which of Childe's criteria it meets and which it fails.
why: Whether Çatalhöyük counts as a city depends on the definition, and estimates of its size range from under a thousand to several thousand people.
---
q: What did the 2007 study of Angkor and Roland Fletcher's work show about premodern cities?
a: That all premodern cities were small, walled and crowded.
x: This is the assumption their work overturned.
a: That Angkor had more people than any modern megacity.
x: Angkor was largest by area, not population; a 2021 estimate puts the Greater Angkor region at about 700,000–900,000 people.
a*: That some were dispersed, low-density agrarian cities, and Angkor was the largest pre-industrial city in the world by area.
a: That Angkor was built after the Industrial Revolution.
x: The Angkorian period began in 802, and its peak population is estimated for the thirteenth century.
hint: Think about area rather than population.
why: Low-density urbanism widened the definition of a city and invites comparison with today's sprawling megacities.
```

## The Industrial City

By about 1830 London was the world's largest city, and the first to pass two million. **Manchester**, "Cottonopolis", grew so fast and with so little planning that it has been called the world's first industrialised city. Friedrich Engels, who lived in Salford and Manchester in 1842–44, argued in *The Condition of the Working Class in England* (1845) that industrialisation had left workers worse off, citing death rates in Manchester and Liverpool far above the national average. The chapter on The Industrial Revolution covers Manchester's growth and the long debate over industrial living standards.

Disease forced reform. Edwin Chadwick's sanitary report of 1842 led to Britain's first Public Health Act in 1848. Cholera killed 14,137 Londoners in 1849, and after the "Great Stink" of 1858 Joseph Bazalgette's main drainage, some 82 miles of intercepting sewers and 1,100 miles of street sewers, largely ended London's cholera epidemics (the last, in 1866, struck an area not yet connected), as The Victorian Era and Disease and Epidemics in World History describe.

Colonial cities often bore the industrial city's costs without its investment. In Bombay (Mumbai), polluting trades such as tanneries were pushed out of the colonial city to Dharavi, where the first tannery moved in 1887; the district received no colonial spending on sanitation or roads.

## Planning and Its Hubris

In 1853 Napoleon III made **Georges-Eugène Haussmann** prefect of the Seine and asked him to give Paris air, unity and beauty. Haussmann cut broad boulevards through the old centre, beginning with districts where cholera had been worst, and created or remade parks such as the Bois de Vincennes for the working-class east. He was dismissed in 1870, but the Third Republic completed his projects. The costs fell on the poor: rents rose by about 300 per cent during the Second Empire while most wages stagnated, and low-income Parisians were pushed to the outer districts.

Whether the boulevards were built to defeat revolution is disputed. Paris had seen six armed uprisings in its narrow streets between 1830 and 1848, and critics from Émile Zola to Mumford said the avenues were designed against barricades. Haussmann admitted using that argument to win funding, but denied that it drove the design:

```quote
But, as for me, I who was the promoter of these additions made to the original project, I declare that I never thought in the least, in adding them, of their greater or lesser strategic value.
Georges-Eugène Haussmann · Mémoires
```

Patrice de Moncan calls the strategic reading "very reductive", and in 1871 the army that crushed the Paris Commune largely avoided the boulevards.

Other planners sought to escape the crowded city. **Ebenezer Howard**'s *Garden Cities of To-morrow* (1902, first published in 1898 as *To-morrow*) inspired Letchworth, north of London, planned for 30,000–35,000 people within an agricultural green belt; the idea travelled to Tokyo's Den-en-chōfu, Patrick Geddes's plan for Tel Aviv, Canberra, colonial towns in Africa and Britain's post-1945 New Towns. **Le Corbusier** went the other way, towards towers. His Plan Voisin of 1925 would have replaced much of central Paris's Right Bank with eighteen identical skyscrapers; his Ville Radieuse (1930) set towers in parkland, and his Obus plan adapted it to colonial Algiers. In India, Nehru wanted **Chandigarh** to be "symbolic of the freedom of India, unfettered by the traditions of the past", and Le Corbusier took over its plan in 1951. **Brasília**, founded in 1960 to Lúcio Costa's plan with Oscar Niemeyer's buildings, was a modernist showpiece, while its workers and migrants settled in satellite cities such as Taguatinga.

The modernist estate became a symbol of failure. **Pruitt–Igoe** in St Louis, 33 eleven-storey blocks first occupied in 1954, was over two-thirds empty by 1970, and its demolition began with a televised implosion in 1972; Charles Jencks called it "the day Modern architecture died". More recent work spreads the blame to the federal government, which imposed the uniform height and high density, to St Louis's population loss and the housing authority's fiscal crisis, and to racial politics: legally desegregated at first, the estate was exclusively African American by the mid-1960s.

In New York, **Robert Moses**, who never held elective office but held up to twelve titles at once, built parkways, bridges and expressways; the Cross Bronx Expressway alone displaced thousands of residents, with estimates ranging from about 1,500 to as many as 60,000. "I raise my stein to the builder who can remove ghettos without moving people," he retorted to critics, "as I hail the chef who can make omelets without breaking eggs." Against him stood **Jane Jacobs**, who joined the campaign, begun by the local activist Shirley Hayes, that stopped his road through Washington Square Park in 1958, and later the Lower Manhattan Expressway.

```quote
This book is an attack on current city planning and rebuilding.
Jane Jacobs · The Death and Life of Great American Cities · 1961
```

Jacobs praised mixed uses, short blocks, buildings of various ages, density and "eyes on the street", and attacked Howard, Le Corbusier and the "Decentrists", Mumford among them; Mumford struck back in a 1962 review titled "Mother Jacobs' Home Remedies for Urban Cancer". Critics on the left later faulted her for ignoring race and welcoming what she called "unslumming". Moses's reputation has swung too: Robert Caro's *The Power Broker* (1974) condemned him, including on charges of racism, while exhibitions by Hilary Ballon and Kenneth T. Jackson in 2007 made the case for his achievements.

## Segregation Built into Space

**Carl H. Nightingale** argues that urban racial segregation is a colonial and global invention. It began with British Madras and the East India Company's division of Calcutta into a "White Town" and a "Black Town", and spread in a "segregation mania" of the 1890s and 1900s, when plague and sanitation fears in Hong Kong and Bombay justified dividing cities, and officials, reformers and the real-estate industry carried the idea to South Africa and the United States. In South Africa, sanitation and plague prevention served as pretexts for moving people of colour to the urban fringes, creating Soweto and other townships; the Group Areas Act of 1950 then assigned each racial group its own areas, "the foundation of residential apartheid" in Nelson Mandela's words. The chapter on Apartheid and Its End describes the removals.

In the United States, federal agencies in the 1930s graded neighbourhoods on colour-coded maps, marking some "hazardous" largely because of who lived there, a practice later called "redlining". Between 1945 and 1959 African Americans received less than 2 per cent of federally insured home loans, and the lease at Levittown, New York, barred anyone not of "the Caucasian race". Richard Rothstein argues that this segregation was made by government; economists debate how far the maps caused, rather than followed, lending patterns, as the chapter on Modern American History explains.

## Suburbs and Sprawl

Suburbanisation took many forms: planned satellite towns in Europe, rail suburbs in East Asia, high-rise suburbs in Canada, and informal growth on the edges of cities in the Global South. In the United States, federally backed mortgages, veterans' benefits and Moses's parkways opened the suburbs to white families, while redlining and white flight decided who could follow. Dyos and David Reeder had argued in 1973 that central slums and peripheral suburbs grew together, linked by flows of capital.

## The Global South's Urban Century

How urban is the world? It depends on definitions. In 2007 the UN Population Fund projected that in 2008, for the first time, more than half of humanity, 3.3 billion people, would live in urban areas, using each country's own definition of "urban"; on those national definitions the world is now 58 per cent urban. The UN's *World Urbanization Prospects 2025*, using a uniform "Degree of Urbanisation" method, finds instead that 45 per cent of the world's 8.2 billion people live in cities, 36 per cent in towns and 19 per cent in rural areas. On that method **Jakarta**, at about 41.9 million, is now the world's largest city, ahead of Dhaka and Tokyo, and nine of the ten largest are in Asia; yet Indonesia's statistics count about 11 million registered residents in Jakarta's administrative area.

Much of this growth has been informal. The UN counts as a slum household one lacking improved water, sanitation, enough living space, durable housing or secure tenure; by its estimates nearly a billion people lived in slums in 2006, and over a billion by 2018. Mike Davis's *Planet of Slums* (2006), surveying slums from Cape Town and Caracas to Casablanca, read this as catastrophe; critics called the book "anti-urban" and "overly apocalyptic". Dharavi, with an annual turnover estimated at over a billion US dollars, is often cited on the other side, as a city in the making.

{{image: Dharavi | Dharavi in Mumbai, where about a million people live and work on some 2.4 square kilometres.}}

```checkpoint
q: What did Carl H. Nightingale argue about urban segregation?
a: That it began with the American suburbs of the 1950s.
x: He traces it much further back, to colonial cities in India.
a*: That it had colonial origins, beginning with British Madras and Calcutta's "White Town" and "Black Town", and spread globally in a "segregation mania" around 1900.
a: That it was invented by Haussmann in Paris.
x: Haussmann's works reinforced class divisions, but Nightingale's account is of racial segregation spread by empire.
a: That it existed only in South Africa.
x: He follows it across Asia, Africa and the United States.
hint: Think of the East India Company.
why: Nightingale's global account sets apartheid and redlining in a longer imperial history.
---
q: Why do the UN's 2025 figures say 45 per cent of people live in cities, while other figures say 58 per cent of the world is urban?
a: Because the world's population fell after 2008.
x: The world's population has kept growing, to about 8.2 billion.
a: Because the 58 per cent figure counts only megacities.
x: It is an aggregate of each country's own definition of "urban".
a: Because one figure is for Asia and the other for the world.
x: Both are global figures.
a*: Because they use different definitions: the 58 per cent rests on national definitions, the 45 per cent on the UN's uniform Degree of Urbanisation, which also counts 36 per cent in towns.
hint: Think about who decides what counts as "urban".
why: Claims such as "half the world became urban in 2008" depend on definitions, so the numbers must be read with them.
```

## Questions of the Urban Age

Three questions now dominate. The first is who the city is for: Lefebvre's "right to the city" was revived by David Harvey in 2008, written into Brazil's City Statute of 2001, and echoed in the UN's New Urban Agenda of 2016, with its vision of "cities for all". The second is displacement. Ruth Glass coined "gentrification" in 1964 for the way London's working-class districts, such as Islington, were "invaded by the middle-classes" until the original occupiers were displaced; the term remains, in a Brookings report's words, "both imprecise and quite politically charged". The third is climate. Cities are warmer than their surroundings, an effect first reported for London by Luke Howard in 1818, and flooding has driven new designs: China adopted Kongjian Yu's "sponge city" model as national policy in 2014, after a survey found that 62 per cent of 351 cities had flooded in 2008–2010. Fletcher's warning from Angkor, that sprawling cities can buckle under climate stress, gives urban history a direct bearing on these choices.

## Further exploration

- **Lewis Mumford, *The City in History: Its Origins, Its Transformations, and Its Prospects* (1961).** The classic one-man global history of the city, and a lament against sprawl.
- **Jane Jacobs, *The Death and Life of Great American Cities* (1961).** The founding attack on modernist planning and urban renewal.
- **Monica L. Smith, *Cities: The First 6,000 Years* (2019).** An archaeologist's accessible long-run history of urban life.
- **Carl H. Nightingale, *Segregation: A Global History of Divided Cities* (2012).** The colonial and global origins of urban racial segregation.
- **Mike Davis, *Planet of Slums* (2006).** A polemical survey of informal urbanism in the Global South.
- **Ben Wilson, *Metropolis: A History of the City, Humankind's Greatest Invention* (2020).** A narrative tour of 26 cities from Uruk to Lagos and Shanghai.
- **Richard Rothstein, *The Color of Law: A Forgotten History of How Our Government Segregated America* (2017).** The case that American housing segregation was made by government.$mn_urban_master$,
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
  select $mn_urban_quiz$[
    {"type": "mcq", "prompt": "Who coined the phrase \"urban revolution\" and set out ten criteria for recognising early cities?", "options": ["Lewis Mumford", "V. Gordon Childe", "Henri Lefebvre", "Jane Jacobs"], "answerIndex": 1, "explanation": "V. Gordon Childe coined the term in the 1930s and set out ten criteria in 1950, placing the first urban revolution in Mesopotamia in the fourth millennium BCE.", "id": "q1"},
    {"type": "mcq", "prompt": "What did a 2021 study by Sarah Klassen and colleagues estimate for the peak population of the Greater Angkor region in the thirteenth century?", "options": ["About 50,000", "About 200,000–400,000", "About 700,000–900,000", "Over 5 million"], "answerIndex": 2, "explanation": "Using lidar, archaeology and modelling, the study estimated about 700,000–900,000 people across a roughly 3,000 square kilometre landscape; Angkor was the largest pre-industrial city by area, not by population.", "id": "q2"},
    {"type": "mcq", "prompt": "Which statement best reflects the debate over Haussmann's boulevards in Paris?", "options": ["Critics such as Zola and Mumford said they were designed against barricades; Haussmann denied strategy drove the design, and historians such as Patrice de Moncan call the strategic reading reductive.", "All historians agree they were built only for sanitation.", "Haussmann openly declared that defeating barricades was his only aim.", "The boulevards were built by Le Corbusier in 1925."], "answerIndex": 0, "explanation": "Haussmann admitted using the strategic argument to win funding but denied it shaped the design; the question remains disputed.", "id": "q3"},
    {"type": "mcq", "prompt": "According to the UN's World Urbanization Prospects 2025, using the Degree of Urbanisation method, which is the world's largest city?", "options": ["Tokyo", "New York", "Dhaka", "Jakarta"], "answerIndex": 3, "explanation": "On the UN's new 2025 method Jakarta, at about 41.9 million, ranks first, ahead of Tokyo, which had led the old rankings since 1955; the change of rank owes much to the change of method. Indonesia's own statistics count about 11 million registered residents in Jakarta's administrative area.", "id": "q4"},
    {"type": "open", "prompt": "Using examples from the chapter, explain why historians and archaeologists disagree about what counts as a city.", "rubric": "A strong answer explains Childe's checklist (dense settlement, specialists, monuments, ruling class, writing, trade, residence-based state) and gives cases that strain it: Çatalhöyük (dense but egalitarian, population estimates from 600–800 to 5,000–7,000), the Indus cities and Teotihuacan (no clear palaces, possible collective rule), and low-density cities such as Angkor, Anuradhapura and the Maya centres (Fletcher). It should note that the answer depends on definitions, and may link this to modern disputes over how urban the world is (58 per cent on national definitions, 45 per cent in cities on the UN's 2025 method).", "id": "q5"},
    {"type": "open", "prompt": "How was segregation built into urban space, and how have historians explained its origins?", "rubric": "A strong answer discusses Nightingale's colonial and global account (Madras and Calcutta's White Town and Black Town, the 1890s–1900s 'segregation mania' using plague and sanitation, spread to South Africa and the United States); South Africa's townships and the Group Areas Act of 1950; US redlining and the HOLC maps, the under 2 per cent share of federally insured loans for African Americans in 1945–1959, and Levittown's racial clause; Rothstein's argument that segregation was made by government versus economists who ask whether the maps caused or followed lending; and may mention Haussmann's displacement of poorer Parisians or Pruitt–Igoe's racial politics.", "id": "q6"}
  ]$mn_urban_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/thematic-history/urban-history', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

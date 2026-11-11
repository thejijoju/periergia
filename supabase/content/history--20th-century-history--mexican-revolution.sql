-- The Mexican Revolution — canonical master article, co-written and human-reviewed.
-- history/20th-century-history/the-mexican-revolution @ research/advanced/read.
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
    'history/20th-century-history/the-mexican-revolution',
    'research',
    'advanced',
    'read',
    $mn_mexrev_master$> **The first great social revolution of the twentieth century.** Between 1910 and 1920 Mexico was torn apart by regional wars that began as a challenge to an ageing dictator and became a struggle over who owned the land, the oil beneath it, and the state itself. Villagers in Morelos, miners and farm labourers in the north, Yaqui and Mayo soldiers from Sonora, women who cooked, nursed and fought, and urban workers all shaped its course, and roughly one to one and a half million people died. This chapter follows it from Madero's call to arms through the war of the factions, the US interventions, the Constitution of 1917, the Cristero War and Lázaro Cárdenas to the one-party state that claimed its name, and the historians' arguments over what kind of revolution it was.

## The Porfiriato and Its Discontents

As the chapter on Latin America after Independence describes, Porfirio Díaz ruled Mexico from 1876 until 1911, apart from brief interludes, notably 1880–84. His regime promised "order and progress" through *pan o palo*, "bread or bludgeon"; his technocratic *Científicos* looked down on a largely rural, Indigenous and mixed-race population; haciendas, many foreign-owned, swallowed village lands; and Yaqui people from Sonora were deported to Yucatán. Yet in 1910, as the historian Friedrich Katz observed, there was no foreboding of revolution. What broke the regime was an ageing Díaz's failure to manage his own succession, amid labour unrest marked by the strikes at Cananea and Río Blanco.

## Madero's Challenge, 1910–1913

The challenger was an unlikely revolutionary. **Francisco I. Madero**, born in 1873 into one of Mexico's wealthiest families, was a spiritist who believed spirits had guided his writing. Jailed in 1910, he escaped to Texas and issued the Plan of San Luis Potosí, calling Mexicans to rise on 20 November 1910, now Revolution Day. Few at first heeded the call, but rebellions broke out in the north and, from early 1911, in Morelos, drawing in farm labourers, miners and many Indigenous communities. When Pascual Orozco and Pancho Villa took Ciudad Juárez, against Madero's wishes, Díaz agreed to go, and by the end of May 1911 he had left for exile.

The first phase was relatively bloodless, but not for everyone: at Torreón in May 1911 Maderista troops and a local mob killed 303 Chinese and 5 Japanese residents, nearly half the city's Chinese community; an investigation later called it an unprovoked act of racism.

Madero, elected president in October 1911, allowed a free press and the right to strike, and the anarcho-syndicalist **Casa del Obrero Mundial** was founded in 1912. But he kept the Porfirian Federal Army, which Katz judged "the basic cause of his fall", and disbanded his own forces. A member of a rich landowning family, he told Zapata that the land question needed careful study, while the interim government of 1911 had already sent General Victoriano Huerta to burn villages in Morelos. The breach with the villagers was complete.

## Zapata and the Villages of Morelos

**Emiliano Zapata**, born in 1879 in Anenecuilco, was not a peasant himself; contrary to legend, his family was well known locally and reasonably well off, and he ran mule teams and trained horses. But he led peasants. Anenecuilco was a mixed town of Spanish-speaking mestizos and Nahuatl speakers, whose leaders guarded colonial land titles, some written in Nahuatl, for lawsuits against the haciendas. An eyewitness, Luz Jiménez of Milpa Alta, recalled that Zapata spoke Nahuatl fluently. In 1909 Anenecuilco elected him president of its village council. At one point he was forcibly conscripted into the army, a common punishment.

In November 1911 Zapata and the schoolteacher Otilio Montaño issued the **Plan of Ayala**. It denounced Madero as a traitor and demanded that lands usurped by "landlords, científicos, or bosses" be returned to villages holding titles, that a third of monopolised estates be expropriated for the landless, and that owners who resisted lose the rest. Villagers were to hold their lands "at all costs, arms in hand". Its motto was "Reform, Freedom, Justice and Law!" (*¡Reforma, Libertad, Justicia y Ley!*); after Zapata's death it became "Land and Liberty!" (*¡Tierra y Libertad!*), a phrase first used by Ricardo Flores Magón.

```quote
That to the pueblos (villages) there be given what in justice they deserve as to lands, timber, and water.
Plan of Ayala, as translated by John Womack · 1911
```

The Zapatistas were the most homogeneous of the revolutionary armies: free villagers, not hacienda labourers, who fought under the emblem of the Virgin of Guadalupe and went home between battles. Their enemies called the rising a "caste war" and Zapata the "Attila of the South". In 1915 Zapata redistributed hacienda land and let village councils govern; Morelos was the only region to enact land reform during the fighting. Villagers grew maize, beans and vegetables instead of cash crops, and while the capital starved they ate better than they had in 1910.

{{image: Emiliano Zapata | Emiliano Zapata in 1914, leader of the villagers of Morelos and co-author of the Plan of Ayala.}}

## Huerta and the War against Him

In February 1913, during the *Decena Trágica*, the "Ten Tragic Days", fighting in central Mexico City caught civilians in the shelling. Huerta, commanding the city's defence, changed sides in a pact brokered by the US ambassador, Henry Lane Wilson. Asked whether Madero should be exiled or put in an asylum, Wilson reportedly replied, in one version, "General, do what you think is best for the welfare of Mexico"; accounts of his words differ. On 22 February Madero and his vice-president were shot behind Lecumberri prison. Whether Huerta ordered it is debated, but Katz found strong evidence that he did and that Wilson knew. In death, as one historian put it, Madero united "all the revolutionists under one banner".

Huerta, who identified himself as Indigenous and was of Huichol descent, is remembered in Mexico as *El Chacal*, "the Jackal": being Indigenous placed no one on a particular side. Britain and Germany recognised his regime; Woodrow Wilson's United States did not. His forced conscription, the *leva*, filled the army with men who deserted and mutinied.

Against him rose a coalition. The Coahuila landowner and governor **Venustiano Carranza** was named *Primer Jefe*, First Chief, of a Constitutionalist Army in the Plan of Guadalupe (March 1913), a purely political plan that promised no reform. In Chihuahua **Pancho Villa**, a sharecropper's son turned bandit, built the División del Norte, a railway army with hospital trains that paid its soldiers a peso a day. As governor he confiscated hacienda wealth and promised land after the war, but did not redistribute it while he had power. His victories at Torreón and Zacatecas in 1914 broke the back of Huerta's regime. In Sonora **Álvaro Obregón**, a chickpea farmer who had learned the Mayo language working beside Mayo labourers, led an army with a core of Mayo and Yaqui fighters.

The United States intervened too. After US sailors were briefly detained at Tampico, American forces occupied Veracruz from April to November 1914, under orders to "Seize custom house. Do not permit war supplies to be delivered to Huerta government or any other party." Mexican dead are put at about 150–170, soldiers, cadets and armed civilians, against about twenty Americans, and even Huerta's enemies, Carranza among them, condemned the occupation. Huerta fled in July 1914 on a German ship.

```checkpoint
q: Why did Zapata break with Madero?
a*: Because Madero would not carry out land reform, and federal troops under the interim government had burned villages in Morelos.
a: Because Madero restored Porfirio Díaz to power.
x: Díaz left Mexico in 1911 and never returned to power.
a: Because Madero allied with the United States to occupy Veracruz.
x: The Veracruz occupation came in 1914, after Madero's death, and was aimed at Huerta.
a: Because Zapata wanted to become president himself.
x: The Plan of Ayala named Pascual Orozco chief of the revolution; Zapata's demand was the return of village lands.
hint: Think of the "careful study" Madero promised.
why: The Plan of Ayala made the return of village lands the price of Zapatista loyalty, and Madero would not pay it.
---
q: Which statement about Huerta's background is best supported?
a: He was a northern landowner like Madero and Carranza.
x: Madero and Carranza came from landowning families in Coahuila; Huerta was a general born in Colotlán, Jalisco.
a: He was a Zapatista general who betrayed the villagers of Morelos.
x: Huerta fought the Zapatistas from 1911; he was never one of them.
a*: He identified himself as Indigenous and was of Huichol descent, a reminder that Indigenous Mexicans were found on every side.
a: He was a Spanish-born officer sent by Madrid.
x: Huerta was born in Mexico, in Colotlán, Jalisco.
hint: Think of the Huichol.
why: Indigenous people fought in every army of the revolution, and one of them led the counter-revolution.
```

## The War of the Winners

Victory split the coalition. Villa effectively took over the Convention of Aguascalientes in October 1914; Carranza rejected it, and Obregón sided with Carranza. Villa and Zapata, in a loose alliance, entered Mexico City in December 1914, and a photograph of Villa in the presidential chair, with Zapata beside him, became a classic image. Villa reportedly said the chair was too big for them.

Carranza learned to promise reform. His Additions to the Plan of Guadalupe (December 1914) and an agrarian law of 1915 offered to restore illegally seized village lands, and in February 1915 workers of the Casa del Obrero Mundial formed "Red Battalions" to fight Villa and Zapata; Carranza dissolved them a year later. In April 1915, at **Celaya**, Obregón's entrenched machine guns and wire shattered Villa's cavalry charges. The United States recognised Carranza's government in October 1915.

On 9 March 1916 Villa's men raided Columbus, New Mexico, killing eighteen Americans. John J. Pershing's Punitive Expedition, put at between 5,000 and 10,000 troops, used truck convoys and aircraft but never caught Villa. Clashes with Carranza's own forces, at Parral and at Carrizal, where the Black troopers of the 10th Cavalry were defeated, brought the two countries close to war and left lasting anti-American feeling. Carranza also did not take up Germany's offer, in the Zimmermann telegram of 1917, to help Mexico recover Texas, New Mexico and Arizona.

Carranza returned confiscated estates to their owners. On 10 April 1919, at Chinameca, soldiers under Colonel Jesús Guajardo, who had feigned defection, shot Zapata dead; his body was displayed in Cuautla. When Carranza tried to impose a civilian successor in 1920, Obregón, Plutarco Elías Calles and Adolfo de la Huerta rose under the Plan of Agua Prieta, the last successful coup of the revolution, and Carranza was killed in flight, perhaps assassinated, possibly by his own hand. Villa made peace in 1920 and was ambushed and killed in 1923, most likely on the orders of Obregón and Calles. Every major leader, Madero, Zapata, Carranza, Villa and in 1928 Obregón, died violently.

## Soldaderas and the Women of the Revolution

The northern armies moved by rail, and they depended on women. *Soldaderas*, called "Adelitas" after the corrido "La Adelita", found and cooked food and nursed the wounded, riding on the roofs of boxcars while the horses rode inside; some fought, and a few became *coronelas*, though no woman is reported to have become a general. Many did not choose to go: the press reported kidnappings, such as forty women taken from Jojutla by Zapatistas in 1913. One defeated federal army crossed into the United States with 1,256 women and 554 children. Violence fell on them too: in 1916 Villa reportedly had about ninety Carrancista soldaderas killed, though accounts differ. Some lived beyond the categories: Petra Herrera served Villa as "Pedro" and later led an all-women troop, and Amelio Robles Ávila, a Zapatista colonel, lived as a man for the rest of his long life and was recognised as a veteran. Official memory has largely forgotten these women, above all the *coronelas* who lived as men.

## A Decade of Death

How many died is genuinely uncertain, so this chapter gives a range: **roughly one to one and a half million**. Common figures run from about one million, mostly non-combatants, to about one and a half million, and some higher tallies reach two million or more. Nearly 200,000 refugees fled abroad, mainly to the United States. The raw censuses of 1910 and 1921 are misleading: the 1921 count missed perhaps a million people, and the shortfall against the expected population mixes deaths with births that never happened. Correcting for the undercount, the demographer Robert McCaa (2003) estimated a total demographic loss of about 2.1 million, of which about two-thirds, some 1.4 million, were excess deaths and a quarter lost births. Most of the dead were civilians, many killed by hunger and disease: in 1918 cold and influenza killed perhaps a quarter of the people of Morelos. Yet, unlike the French revolutionaries in the chapter on the French and Haitian Revolutions, the victors waged no systematic terror; there were no prisoner-of-war camps, and defeated soldiers were often absorbed into the winning armies.

## The Constitution of 1917

The constitution was written at Querétaro by 220 delegates, all Carrancistas; Villistas and Zapatistas were excluded. The delegates, mostly middle-class professionals with revolutionary generals such as Francisco J. Múgica, mauled Carranza's cautious draft. The historian Frank Tannenbaum later wrote that "the Constitution was written by the *soldiers* of the Revolution, not by the lawyers", and that the soldiers had wanted to socialise property but were "afraid of their own courage ... Article 27 was a compromise."

```quote
Ownership of the lands and waters within the limits of the national territory belongs originally to the Nation. [La propiedad de las tierras y aguas comprendidas dentro de los límites del territorio nacional, corresponde originariamente a la Nación]
Constitution of Mexico · Article 27 · 5 February 1917
```

**Article 27** vested land, water and the subsoil in the nation, the legal basis for land reform and, later, for seizing the oil fields. **Article 123**, drawing on the Mexican Liberal Party's programme of 1906, granted the eight-hour day, the right to strike, a minimum wage and equal pay for women, and barred the employment of children under twelve and company stores; Carranza had not intended any of it. Articles 3 and 130 secularised education and curbed the Church. The constitution is often described as the first in the world to set out social rights, before those of Soviet Russia (1918) and Weimar Germany (1919). It did not extend them to women: when Hermila Galindo, Carranza's secretary and a feminist editor, asked for the vote, the committee called it "unnecessary", and Mexican women won the national vote only in 1953, first using it in 1955. Carranza, elected president in 1917, largely ignored the radical articles.

## The Sonorans and the Cristero War

Obregón, president from 1920, made peace with the Zapatista generals, whose land reform in Morelos proved impossible to reverse, and won US recognition in 1923 by conceding on oil. Yet in 1926–27 he fought the Yaqui, who had followed him for a promise of land, when they rebelled to claim it.

His successor Calles enforced the anticlerical articles with the Calles Law of 1926. The bishops suspended public worship, and from August 1926 to June 1929 the **Cristero War** raged across Jalisco, Michoacán and neighbouring states, under the cry "Long live Christ the King!" (*¡Viva Cristo Rey!*). Perhaps 50,000 Cristeros, men and women, faced some 100,000 government troops; combatant deaths are put at about 90,000, and one estimate including civilians reaches 250,000. Thousands of women, perhaps 25,000 by the end, joined the Feminine Brigades of St Joan of Arc to smuggle arms and money. Many Cristeros fought for land as well as faith. A Catholic militant assassinated Obregón in July 1928, after his re-election. The 1929 settlement, brokered by the US ambassador Dwight Morrow without consulting the rebels, restored worship, but the government then executed some 500 Cristero leaders and about 5,000 others. In the 1930s former Cristeros attacked the rural teachers of "socialist education", killing perhaps 300. Calles, meanwhile, founded the National Revolutionary Party in 1929 and ruled through three presidents as *Jefe Máximo*.

## Cárdenas: Land, Oil and the Party

**Lázaro Cárdenas**, Calles's candidate in 1934, broke his patron and had him deported in 1936. Some 18 million hectares of land were redistributed, much of it as collective *ejidos* carved from commercial estates such as the cotton lands of La Laguna and the henequen plantations of Yucatán, though many peasants would have preferred titled plots of their own. He created a Department of Indigenous Affairs, and his government's 1940 report admitted that "the indigenous problem is one of the most serious that the revolutionary government has had to confront". Workers formed the CTM confederation in 1936, and the railways were nationalised.

When foreign oil companies defied a Supreme Court ruling upholding an award to their workers' union, Cárdenas announced by radio on **18 March 1938** the expropriation of the US and Anglo-Dutch companies; Pemex followed that June. A crowd put at 200,000 filled the Zócalo, and people queued to donate chickens and jewellery towards compensation. Britain broke off relations and the companies organised a boycott, but Franklin Roosevelt's Good Neighbor Policy kept the US from intervening; a 1942 agreement awarded the American companies about $24 million, and Britain settled in 1947.

In 1938 Cárdenas also rebuilt the party around sectors of workers, peasants, the middle class and the army; renamed the Institutional Revolutionary Party (PRI) in 1946, the party under its three names held the presidency from 1929 to 2000. Rural wages fell by a quarter in 1934–40 as urban wages rose, and Alan Knight called the managed 1940 election "a requiem for Cardenismo". Cárdenas is nonetheless remembered as the revolution's moral conscience.

```checkpoint
q: What did Article 27 of the 1917 Constitution establish?
a: The eight-hour day and the right to strike.
x: Those labour rights were in Article 123.
a*: That land, water and the subsoil belonged originally to the nation, the basis for land reform and the 1938 oil expropriation.
a: Secular education in all schools.
x: Secular education was the subject of Article 3.
a: Votes for women in national elections.
x: The constitutional congress refused women the vote; they won it nationally only in 1953.
hint: Think of what lay beneath the oil fields.
why: Article 27 turned the villagers' demand for land into national law and gave the state a claim to the subsoil.
---
q: Why do historians disagree about how to classify the Cristero War?
a: Because it is unclear whether any fighting took place.
x: The war lasted from 1926 to 1929 and killed tens of thousands.
a: Because it was fought mainly by foreign volunteers.
x: The Cristeros were mostly Mexican villagers from the centre-west.
a: Because the Pope ordered the rebels to fight.
x: The rising followed the Calles Law and the bishops' suspension of worship, and the 1929 settlement was made without consulting the rebels.
a*: Because it was a religious rising against the anticlerical state, but many Cristeros were also peasants fighting for land.
hint: Think of Cristeros who fought for land as well as faith.
why: The Cristiada can be read as a church–state conflict or as the last great peasant rising, and regional studies show villages divided.
```

## Murals and Memory

In the early 1920s Obregón's education minister, José Vasconcelos, commissioned murals for public buildings, and "Los Tres Grandes" made the revolution visible: Diego Rivera's utopian epics, José Clemente Orozco's critical and pessimistic scenes, and the radical David Alfaro Siqueiros, a veteran of the Constitutionalist Army. In Rivera's chapel at Chapingo the buried bodies of Zapata and Montaño fertilise the maize. Novels such as Mariano Azuela's *The Underdogs* (*Los de abajo*) and Nellie Campobello's *Cartucho* told the war from below.

The heroes of popular memory are the two radicals who lost, Zapata and Villa. The state claimed Zapata from 1921; Villa's remains entered the Monument to the Revolution in the 1970s, to lie beside Madero, Carranza, Calles and Cárdenas, men who had fought one another. Knight called the revolution's memory a kind of "secular religion" that legitimised the ruling party; Cuauhtémoc Cárdenas's breakaway of 1988, and the Party of the Democratic Revolution he founded in the late 1980s, contested that claim. After the 1992 reforms ended land redistribution, the Zapatista Army of National Liberation rose in Chiapas on 1 January 1994 under Zapata's slogan and image.

## Interpreting the Revolution

When the revolution ended is disputed: in 1917, 1920, 1940 or 1946. What it was is more disputed still. The **orthodox** reading, founded by Tannenbaum and echoed in the regime's own story, saw a popular, agrarian and nationalist revolution. John Womack's *Zapata and the Mexican Revolution* (1968), a sympathetic history of the Morelos villagers, stood close to that view, though it was local rather than national, and it inspired many scholars to write grassroots rural history. From the late 1960s **revisionists**, among them regional historians and Ramón Eduardo Ruiz, stressed elite and middle-class leadership, regional variety, and a strong state that crushed popular movements. Ruiz called it a "great rebellion", a bourgeois reform rather than a true social revolution; Jean Meyer's study of the Cristeros showed a Catholic countryside at war with the revolutionary state. The Marxist Adolfo Gilly saw a peasant revolution "interrupted" by the bourgeois Constitutionalists, and Katz showed how great-power rivalries shaped its course.

**Alan Knight** replied in his two-volume history (1986) and in an essay asking whether it was "Bourgeois? Nationalist? Or Just a 'Great Rebellion'?" He accepted regional complexity but argued that the revolution was a genuinely popular, largely agrarian movement that brought real change, and elsewhere judged that a victory for Villa and Zapata would probably have produced "a weak, fragmented state".

## Further exploration

- **Alan Knight, *The Mexican Revolution*, 2 vols. (1986).** The major modern synthesis, and the answer to the revisionists.
- **John Womack Jr., *Zapata and the Mexican Revolution* (1968).** The classic history of the Morelos villagers' revolution.
- **Friedrich Katz, *The Life and Times of Pancho Villa* (1998).** The definitive biography, built on archives in several countries.
- **Adolfo Gilly, *The Mexican Revolution* (1971; English trans. 1983).** The Marxist classic, written in Lecumberri prison.
- **Elena Poniatowska, *Las Soldaderas: Women of the Mexican Revolution* (1999; English trans. 2006).** An essay on the soldaderas with photographs from the Casasola archive.
- **Jean Meyer, *The Cristero Rebellion: The Mexican People between Church and State, 1926–1929* (1976).** The Cristiada seen from the Catholic countryside.
- **Gilbert M. Joseph and Jürgen Buchenau, *Mexico's Once and Future Revolution* (2013).** A short modern survey from Díaz to 2012.$mn_mexrev_master$,
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
  select $mn_mexrev_quiz$[
    {"type": "mcq", "prompt": "What did the Plan of Ayala (1911) demand?", "options": ["That usurped lands be returned to villages holding titles, and a third of monopolised estates be expropriated for the landless", "That Madero be confirmed as president for life", "That foreign oil companies be expropriated", "That the Church be stripped of legal status"], "answerIndex": 0, "explanation": "Zapata and Otilio Montaño's plan declared Madero a traitor and made the return of village lands, held 'arms in hand', the Zapatistas' central demand.", "id": "q1"},
    {"type": "mcq", "prompt": "Which article of the 1917 Constitution granted the eight-hour day, the right to strike and equal pay for women?", "options": ["Article 3", "Article 27", "Article 123", "Article 130"], "answerIndex": 2, "explanation": "Article 123 drew on the Mexican Liberal Party's 1906 programme; Carranza had not intended to put labour protection in the constitution.", "id": "q2"},
    {"type": "mcq", "prompt": "Why is the revolution's death toll best given as a range, roughly one to one and a half million?", "options": ["Because no census was taken in Mexico after 1910", "Because the censuses show a population loss that mixes deaths with births that never happened, and the 1921 census undercounted; the best study puts excess deaths at about 1.4 million", "Because all the dead were soldiers whose records were lost", "Because the government forbade historians to study the question"], "answerIndex": 1, "explanation": "Robert McCaa's study attributes about two-thirds of a loss of some 2.1 million to excess deaths and a quarter to lost births; most of the dead were civilians, many from hunger and disease.", "id": "q3"},
    {"type": "mcq", "prompt": "What happened on 18 March 1938?", "options": ["Zapata was killed at Chinameca", "The Cristero War ended", "The PRI was founded", "Lázaro Cárdenas expropriated the US and Anglo-Dutch oil companies"], "answerIndex": 3, "explanation": "The companies had refused a Supreme Court ruling upholding an award to the oil workers' union; Pemex was created that June.", "id": "q4"},
    {"type": "open", "prompt": "How far did the Mexican Revolution answer the demands of peasants, Indigenous communities and women?", "rubric": "A strong answer discusses the Plan of Ayala and land reform enacted in Morelos during the war; Carranza's return of estates; Article 27 and Article 123; Cárdenas's redistribution of some 18 million hectares, mostly as collective ejidos, and peasants' preference for individual plots; the Yaqui, who fought for Obregón and rebelled for land in 1926–27, and the Department of Indigenous Affairs; soldaderas and coronelas, the refusal of the vote in 1917 and women's national vote only in 1953; rural wages falling under Cárdenas; and the Cristeros as peasants as well as Catholics. It reaches a balanced judgement.", "id": "q5"},
    {"type": "open", "prompt": "Was the Mexican Revolution a popular agrarian revolution or a 'great rebellion'? Assess the historians' debate.", "rubric": "A strong answer explains the orthodox reading founded by Tannenbaum (a popular, agrarian, nationalist revolution) and Womack's sympathetic history of the Morelos villagers; the revisionists, Ruiz and the regional historians, who stressed elite leadership, regional variety and a state that crushed popular movements; Meyer's Cristeros; Gilly's 'interrupted' revolution; and Knight's reply that it was genuinely popular and largely agrarian while accepting regional complexity. It uses evidence such as Morelos, the exclusion of Villistas and Zapatistas from the 1917 congress, Cárdenas's reforms and the one-party state.", "id": "q6"}
  ]$mn_mexrev_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/20th-century-history/the-mexican-revolution', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

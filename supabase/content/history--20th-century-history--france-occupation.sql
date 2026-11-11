-- France Under Nazi Occupation — canonical master article, co-written and human-reviewed.
-- history/20th-century-history/france-under-nazi-occupation @ research/advanced/read.
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
    'history/20th-century-history/france-under-nazi-occupation',
    'research',
    'advanced',
    'read',
    $mn_france_master$> **The dark years.** Between the armistice of June 1940 and the Liberation of 1944, France was a defeated country, divided by a demarcation line, plundered by its occupier and governed in the south by a French regime at Vichy that chose to collaborate. This chapter follows the collapse of 1940, Pétain's "National Revolution" and the state collaboration of Vichy and Laval, the persecution of Jews and French complicity in their deportation, hunger and forced labour, the Milice, and a resistance that included communists, immigrants, women and, from the first months, the African empire. It ends with the Liberation, the purges and the shaving of women's heads, and the long "memory wars" over what Vichy had been, from the myth of a nation of resisters to Paxton, Rousso and the trials of Barbie, Touvier and Papon.

## Defeat and Armistice, 1940

The campaign of May and June 1940 is told in the chapter on the Second World War. Between about 55,000 and 85,000 French soldiers were killed, according to different estimates, and about 1.5–1.8 million were captured. Colonial prisoners were held in camps in France, the *Frontstalags*, in conditions shaped by Nazi racial ideology, and, as that chapter records, between about 1,500 and 3,000 Senegalese *tirailleurs* were murdered by German troops, many after surrendering (Raffael Scheck's estimate). At Chasselay near Lyon about 50 were machine-gunned by tanks.

Prime Minister Reynaud wanted to fight on from North Africa; Philippe Pétain and Weygand demanded an armistice. On 16 June Reynaud resigned and President Lebrun appointed the 84-year-old Pétain in his place. The next day Pétain told the nation on the radio, before Germany had even agreed to negotiate: "It is with a heavy heart that I tell you today that we must stop fighting."

The armistice was signed on 22 June 1940 in the Compiègne forest, in the same railway carriage as the armistice of 1918. Germany occupied about three-fifths of metropolitan France, including every Channel and Atlantic port. France paid occupation costs of about 400 million francs a day. It kept its fleet, disarmed, and its empire, and a small "Armistice Army" without tanks. Article 19 obliged France to hand over any German national the Germans demanded, a clause aimed at anti-Nazi refugees, many of them Jewish. On 3 July the British attacked the French fleet at Mers-el-Kébir, near Oran, killing 1,297 French servicemen, and Vichy broke off relations with Britain.

## Vichy and the National Revolution

The government settled in the spa town of Vichy. On 10 July 1940 the National Assembly voted full powers to Pétain, including the power to write a new constitution, by 569 votes to 80; the 80 became known as the "Vichy 80". Pétain became "head of the French State", with Pierre Laval as his successor, and the motto *Liberté, Égalité, Fraternité* gave way to *Travail, Famille, Patrie* (Work, Family, Fatherland). Laval had declared on 6 July that "parliamentary democracy has lost the war; it must disappear, ceding its place to an authoritarian, hierarchical, national and social regime." Charles Maurras called Pétain's accession a "divine surprise".

Every postwar government has called Vichy illegal; Julian Jackson argues that at the outset "Vichy was both legal and legitimate", recognised by more than 40 countries, including the United States.

The regime's programme, the **National Revolution**, was anti-parliamentary and built a cult of Pétain, whose portrait hung everywhere. A Labour Charter abolished free trade unions and the right to strike; propaganda praised a "return to the land" and the Catholic Church; Joan of Arc replaced Marianne as the national symbol. For women, Vichy promoted motherhood with Mother's Day medals, tightened divorce, restricted the employment of married women and opposed birth control and abortion. It persecuted what Maurras called the "Anti-France": Protestants, Jews, Freemasons and foreigners. None of these changes was forced on France by Germany. Pétain remained popular: crowds cheered him in Paris as late as 26 April 1944.

Was it fascist? Stanley Payne calls it "distinctly rightist and authoritarian but never fascist", Roger Griffin "para-fascist", and Zeev Sternhell "no less fascist than Mussolini's Italy".

## Collaboration d'État

On 24 October 1940 Pétain met Hitler at Montoire, in a meeting arranged by Laval, and their handshake was used in Nazi propaganda. Six days later Pétain announced on the radio: "I enter today on the path of collaboration." Laval was dismissed in December 1940; under Darlan, who led the government until Laval returned in April 1942, Vichy agreed in May 1941 to give Germany access to bases in Syria. In a radio speech on 22 June 1942 Laval said he wished for a German victory, because otherwise "Bolshevism [would] establish itself everywhere".

Historians distinguish this *state collaboration* from the *collaborationnistes*, the ideological fascists of Paris such as Doriot and Déat. The material cost was enormous: France provided an estimated 42 per cent of all "foreign aid" to the German economy.

## The Persecution of the Jews

About 330,000–350,000 Jews lived in France in 1940, a large share of them, perhaps half, foreign-born or refugees. Vichy did not wait for German orders. Its first **Statut des Juifs**, of 3 October 1940, defined a "Jewish race" and barred Jews from the civil service, the army, teaching, the press and entertainment; a document found in 2010 shows that Pétain made it harsher in his own hand, and it applied also to Algeria and the rest of the empire. A law of the next day let prefects intern foreign Jews in camps such as Gurs, Rivesaltes and Les Milles. A second, harsher *statut* followed in June 1941. Pétain's own chief of staff later admitted: "Germany was not at the origin of the anti-Jewish legislation of Vichy. That legislation was spontaneous and autonomous."

Arrests began in Paris in 1941, and the first deportation convoy left for Auschwitz on 27 March 1942. On 16–17 July 1942 thousands of French police carried out the **Vél d'Hiv round-up**, planned by Vichy's René Bousquet and Darquier de Pellepoix with German officers. Police records count 13,152 people arrested, more than 4,000 of them children. Held in the arena without food, water or sanitation, they were sent through camps in France to Auschwitz. The Germans had not asked for children: Laval ordered that children under 16 be deported with their parents, and Bousquet cancelled their exemptions. Of the roughly 3,900 Vél d'Hiv children who were deported, only six adolescents survived. The Protestant leader Pastor Marc Boegner said of his conversation with Laval: "I talked to him about murder, he answered me with gardening." In August 1942 Bousquet's police arrested about 7,000 foreign Jews in the unoccupied south.

Most convoys left from **Drancy**, in the Paris area, which the French police ran until the SS took over in July 1943. In April 1944 Klaus Barbie seized 44 Jewish children from a children's home at Izieu; none survived. In all, about 76,000 Jews were deported from France, a third of them French citizens; only about 2,500 returned. Estimates of the dead run from about 72,500 to slightly under 77,500, the higher figure including about 3,000 who died in camps in France and about 1,000 who were shot. Many survived because others hid them: Le Chambon-sur-Lignon, led by its Protestant pastors, sheltered an estimated 800 to 5,000 people, most of them Jewish children, and the children's aid society OSE saved several thousand. The wider genocide, and the fate of the Jews of French North Africa, are treated in the chapter on the Holocaust.

## Shield or Partner? The Vichy Debate

The "sword and shield" thesis, already used in Pétain's own defence at his 1945 trial, was given its most influential scholarly form by Robert Aron in *Histoire de Vichy* (1954). Aron presented Pétain as the "shield" protecting the French while de Gaulle was the "sword", and distinguished a "good Vichy" of Pétain in 1940–42 from a "bad Vichy" of Laval after 1942. Pétain used the same defence at his trial, and Laval's defenders pointed to the comparatively high survival rate of Jews in France, especially French citizens.

Robert Paxton overturned that view with *Vichy France: Old Guard and New Order* (1972). Vichy, he argued, was not a puppet but an autonomous government that sought collaboration, practised no "passive resistance", and carried out reforms of its own choosing. With Michael Marrus, in *Vichy France and the Jews* (1981), he showed that Vichy handed over foreign Jews without protecting French ones, and that what limited the toll was a shortage of railway wagons, public reaction and the Italian occupation zone, where Jews were generally spared until September 1943, not Vichy's protection. Laval, after all, had added the children. Susan Zuccotti finds that Vichy did give priority to deporting foreigners until at least 1943, and Jackson describes the persecution as an autonomous policy with its own native roots. Paxton's book was received in France with fury, but it opened what the French now call the "Paxtonian revolution".

```checkpoint
q: Why do historians reject the claim that Vichy acted as a "shield" for the Jews of France?
a*: Because Vichy passed antisemitic laws on its own initiative, handed foreign Jews to the Germans and added children the Germans had not asked for, while survival owed more to wagon shortages, public reaction and the Italian zone.
a: Because Vichy refused to apply any antisemitic law in the unoccupied zone.
x: The first Statut des Juifs of October 1940 applied throughout France and the empire.
a: Because no Jews from France survived the war.
x: About three-quarters of the Jews in France survived, which is why apologists could point to a survival rate at all.
a: Because Germany forced Vichy to draft the Statut des Juifs.
x: Pétain's own chief of staff called the legislation "spontaneous and autonomous", and Pétain made it harsher himself.
hint: Think of Paxton and Marrus, and of who decided the children's fate in July 1942.
why: The shield thesis rested on the survival rate; Paxton and Marrus showed that Vichy's own choices increased the toll, not reduced it.
---
q: What did the armistice of 22 June 1940 leave in French hands?
a: The whole of metropolitan France, without any German occupation.
x: Germany occupied about three-fifths of the country, including the whole Atlantic coast.
a: Nothing at all: France was annexed to the Reich.
x: Only Alsace and Moselle were annexed in practice; a French government continued at Vichy.
a*: The empire and a disarmed fleet, with a French government ruling the unoccupied south.
a: The army of 1939, intact and undemobilised.
x: Only a small Armistice Army, without tanks, was allowed, and prisoners stayed in captivity.
hint: Hitler did not have the navy to seize France's overseas territories.
why: Leaving Vichy its fleet and empire kept France out of the war cheaply, and made the empire a prize for both Vichy and Free France.
```

## Living Under Occupation

The unoccupied *zone libre* covered about two-fifths of the country; crossing the demarcation line required a German pass, the *Ausweis*, cross-line mail was limited to pre-printed family cards, and the occupied north ran on German time. On 11 November 1942, after the Allied landings in North Africa, Germany and Italy occupied the south as well.

Official rations fell to a starvation level of around 1,000–1,300 calories a day. A black market flourished; profiteers in butter, eggs and cheese were resented as the "BOF". By October 1943 about 85,000 children had been born to German fathers.

Germany also wanted French labour. In June 1942 Laval launched the *Relève*: one prisoner of war released for every three volunteers who went to work in Germany. On 16 February 1943 Vichy created the **Service du travail obligatoire** (STO), which required men born in 1920–22 to work in Germany. Between 600,000 and 650,000 French workers were sent between June 1942 and July 1944; France's conscripts were the only ones required to go by their own state's laws. Nearly 200,000 men hid instead, and about a quarter of them joined the Resistance full-time. The rural bands they formed were the beginning of the *maquis*.

## The Milice and the Years of Terror

On 30 January 1943 Vichy created the **Milice française**, with Laval as its formal head and Joseph Darnand, who held an SS rank and had sworn an oath to Hitler, as its real leader. By 1944 it had 25,000–30,000 members. It hunted resisters and helped round up Jews, and in the spring of 1944 France saw what has been called a *guerre franco-française*, Milice against maquis. In January 1944 miliciens murdered the human-rights campaigner Victor Basch; after resisters killed Vichy's propaganda minister Philippe Henriot on 28 June 1944, they murdered Georges Mandel on 7 July; and the Milice officer Paul Touvier had seven Jewish prisoners shot at Rillieux.

German repression was harsher still. Under its "Code of Hostages", after killings in Nantes and Bordeaux in October 1941, about a hundred hostages were shot. On 10 June 1944 an SS company of the *Das Reich* division killed 642 men, women and children at Oradour-sur-Glane.

## Free France and the Empire

De Gaulle, a brigadier-general and under-secretary for war, flew to London on 17 June 1940 and the next evening spoke on the BBC.

```quote
But has the last word been said? Must hope disappear? Is defeat final? No! … For France is not alone! She is not alone! She is not alone! She has a vast Empire behind her.
de Gaulle · Appeal of 18 June, BBC broadcast · 18 June 1940
```

Few in France heard it, and many later memories of it are false. The famous line "France has lost a battle, but France has not lost the war" came not from the broadcast but from his London poster *À tous les Français* of August 1940. At first few rallied: of more than 100,000 French soldiers in Britain, only about 7,000 stayed.

The empire he invoked was where Free France first gained ground. On 26 August 1940 Chad declared for de Gaulle under its governor, **Félix Éboué**, followed within days by Cameroun, French Congo and Ubangi-Shari; Gabon was taken by force that autumn. Éboué, born in French Guiana and a grandson of slaves, was the first Black man appointed to a senior colonial post, and became governor-general of French Equatorial Africa. Brazzaville served as Free France's capital from 1940 to 1942. The historian Eric Jennings argues that Free France was African before it was metropolitan, drawing its early strength from Equatorial Africa rather than London; others stress the forced labour and taxes that Africans paid for it. From Chad, Leclerc's column, including Senegalese *tirailleurs*, took the Italian fort at Kufra in Libya, where in early March 1941 he made his men swear not to lay down their arms until "our colours, our fine colours" flew over Strasbourg cathedral. Strasbourg was liberated on 23 November 1944.

Elsewhere the empire was fought over. In **Syria and Lebanon**, British, Australian, Indian and Free French forces defeated Vichy's army in June–July 1941. In November 1941 Catroux recognised Syrian and Lebanese independence in the name of Free France, and Lebanon became independent in 1943; but French repression in Damascus in 1945 led to British intervention and to French withdrawal the next year. In **Indochina**, Admiral Decoux governed for Vichy while Japanese troops, who entered in September 1940 and controlled the whole colony by July 1941, left the French to administer it. Ho Chi Minh founded the Viet Minh in May 1941; the Japanese ended French rule in March 1945; and the famine of 1944–45 killed between 400,000 and 2 million Vietnamese. In **North Africa**, Vichy forces fought the Allied landings of 8 November 1942 until Darlan changed sides; the Crémieux decree, which had given Algerian Jews citizenship, was restored only in October 1943.

Up to 200,000 African *tirailleurs* served France, and colonial soldiers, mostly Moroccans, made up 60 per cent of the French force in Italy, where Moroccan *goumiers* committed mass rapes. One estimate holds that nearly two-thirds of the Free French army were African colonial troops. Yet, as the chapter on the Second World War describes, they were kept out of the liberation of Paris and then "whitened" out of front-line units, and on 1 December 1944 at **Thiaroye**, near Dakar, French troops shot repatriated former prisoners protesting over unpaid wages, killing between 35 and 300. In 2024 President Macron called it a "massacre". Some historians see French repression at Sétif in Algeria on VE Day, 8 May 1945, as the real beginning of the Algerian War.

## Resistance Inside France

One estimate puts organised resistance at 1–3 per cent of the population. The first movements, such as *Combat* and *Libération-Sud*, began with underground newspapers, and some early resisters came from the nationalist right. The communist party, banned in 1939 after the Nazi–Soviet pact, followed the Comintern's anti-war line for the first year of the occupation, and organised armed resistance came only after 22 June 1941; its Francs-Tireurs et Partisans (FTP) numbered perhaps 100,000 by 1944. After the war it called itself "the party of the 75,000 shot", but close to 30,000 French people of all tendencies were shot, only a few thousand of them communists.

**Jean Moulin**, a prefect dismissed by Vichy, was parachuted back into France on 1 January 1942 to unite the movements. His National Council of the Resistance (CNR) first met in Paris on 27 May 1943, uniting eight movements, two unions and six parties; its programme of March 1944 promised universal suffrage, press freedom and social security. Moulin was arrested at Caluire, near Lyon, in June 1943 and tortured by Klaus Barbie. His death was registered at Metz station, and its exact circumstances are uncertain, as is who betrayed him. In 1964 his ashes were moved to the Panthéon, where André Malraux addressed him: "Enter here, Jean Moulin, with your terrible procession."

Many resisters were not French by birth. The **FTP-MOI**, the communists' immigrant wing, drew Jews, Hungarians, Armenians, Poles, Italians and Spaniards. Its Paris group was led in 1943 by **Missak Manouchian**, a survivor of the Armenian genocide who had grown up in an orphanage in Lebanon. Arrested by French police in November 1943, he was one of 23 tried by a German military court; 22 were shot at Mont-Valérien on 21 February 1944, and Olga Bancic was beheaded in Stuttgart. About 15,000 copies of a red poster were printed, showing ten of the men and their foreign names, asking "Liberators? Liberation by the army of crime!" Some, it is said, wrote *Morts pour la France*, died for France, on them. Spanish Republican exiles escaped labour companies to join the Resistance, and Jews, about 1 per cent of the population, made up an estimated 15–20 per cent of the Resistance.

{{image: Affiche Rouge | The "Affiche rouge" of 1944, a propaganda poster against Manouchian's immigrant resisters, who became symbols of the Resistance}}

Estimates of women's share of resisters run from about 11 per cent of formal network members (Julian Jackson) to 15–20 per cent. They worked as couriers, liaison agents and keepers of safe houses, yet very few headed a network, Marie-Madeleine Fourcade of Alliance being the best known, and none led a major movement. Lucie Aubrac co-founded Libération-Sud, Germaine Tillion was in the Musée de l'Homme network, and Madeleine Riffaud of the FTP shot a German NCO on 23 July 1944. French women gained the vote at the Liberation (1944–45). Robert Gildea's *Fighters in the Shadows* argues that we should speak of "resistance in France" rather than "the French Resistance", to restore these foreigners, Jews and women to the story.

```checkpoint
q: Why did the maquis grow so quickly from 1943?
a: Because Vichy encouraged young men to go into the hills to train.
x: Vichy hunted the maquis, above all through the Milice.
a*: Because young men fled the STO labour draft to Germany, and many of those who hid joined the Resistance.
a: Because the Allies landed in southern France in 1943.
x: The landing in Provence came in August 1944.
a: Because Germany withdrew its troops from the southern zone in 1943.
x: Germany occupied the southern zone in November 1942 and stayed.
hint: Think of the law of 16 February 1943.
why: Nearly 200,000 men hid to avoid forced labour, and about a quarter joined the Resistance full-time.
---
q: What does Eric Jennings argue about Free France?
a: That it was a purely British creation run from London.
x: Jennings stresses the opposite: its base in Africa.
a: That the African colonies all stayed loyal to Vichy until 1944.
x: Chad, Cameroun, French Congo and Ubangi-Shari rallied in August 1940.
a: That Africans gained full citizenship by rallying to de Gaulle.
x: Critics stress the forced labour and taxes imposed on Africans.
a*: That it was African before it was metropolitan, drawing its early strength from Chad and Equatorial Africa.
hint: Think of Félix Éboué and Brazzaville.
why: Free France's first territory, capital and many of its soldiers were African, at a cost borne by Africans.
```

## Liberation and the Épuration

After the landings in Normandy on 6 June and in Provence on 15 August 1944, where de Lattre's 1st French Army was backed by more than 25,000 maquisards, most of France was free by September. Eisenhower valued the Resistance at ten to fifteen divisions. Paris rose on 19 August, led by the communist Colonel Rol-Tanguy, and the German commander surrendered on 25 August. That day de Gaulle proclaimed at the Hôtel de Ville that Paris had been "liberated by itself, liberated by its people with the help of the French armies", words that anticipated the myth of a nation that had freed itself.

Punishment came fast. About 10,000 people were killed in summary executions, the *épuration sauvage*; a figure of 100,000, first given by the interior minister in 1944–45, was later taken up by Pétainists; Robert Aron gave 30,000–40,000. Between 10,000 and 30,000 women had their heads shaved in public for alleged "horizontal collaboration"; Fabrice Virgili, who estimates about 20,000, argues that many had not slept with Germans at all and that the shavings were a gendered ritual of national renewal. In the legal purge, the courts passed 6,763 death sentences between 1944 and 1951, 3,910 of them in absentia, and 791 people were executed; nearly 50,000 were punished with "national degradation". Amnesty laws followed in 1951 and 1953. Pétain was sentenced to death in 1945; de Gaulle commuted it, and Pétain died on the Île d'Yeu in 1951. Laval, after a rushed trial, was shot in October 1945.

## The Memory Wars

De Gaulle's line from 1944 was that almost the whole nation had resisted apart from a few traitors. The historian Henry Rousso took up the term *résistancialisme* for this inflated memory. His *The Vichy Syndrome* (1987) traced how France remembered Vichy in stages: unfinished mourning; repression; a "broken mirror" when Marcel Ophuls's documentary *The Sorrow and the Pity* (made in 1969, shown in cinemas from 1971 and kept off French television until 1981) and Paxton's book shattered the myth; and, from the mid-1970s, obsession. Vichy, in the phrase of his later book with Éric Conan (1994), was "a past that does not pass".

The state's position changed slowly. In 1994 President Mitterrand maintained that the Republic had nothing to do with what happened, since Vichy was not the Republic. On 16 July 1995 Chirac recognised the responsibility of the French state.

```quote
[T]hose dark hours forever soil our history. … [T]he criminal madness of the occupier was seconded by Frenchmen, by the French State. … France, that day, committed the irreparable.
Chirac · Speech recognising the responsibility of the French state · 16 July 1995
```

Hollande (2012) and Macron (2017) went further: "It was indeed France that organised this", said Macron.

Trials kept the past in court. **Klaus Barbie**, the "Butcher of Lyon", whom US Army intelligence had helped to reach Bolivia, was extradited and in 1987 convicted of crimes against humanity. **Paul Touvier**, pardoned by Pompidou in 1971 to public outcry, became in 1994 the first Frenchman convicted of crimes against humanity, for Rillieux. **René Bousquet** was murdered in 1993 before he could be tried. **Maurice Papon**, who as a prefectural official in Bordeaux had handled Jewish affairs while about 1,600 Jews were deported, had later, as Paris police prefect, overseen the police repression that killed Algerian demonstrators on 17 October 1961. His trial in 1997–98, the longest in French history, ended in a conviction for complicity in crimes against humanity. Paxton testified at it, rejecting the idea that Vichy had sacrificed foreign Jews to protect French ones. In 2024 Manouchian became the first communist to enter the Panthéon, a sign that the memory of the Resistance now includes those once labelled "the army of crime".

## Further exploration

- **Robert O. Paxton, *Vichy France: Old Guard and New Order, 1940–1944* (1972).** The book that showed Vichy sought collaboration on its own initiative, and began the "Paxtonian revolution".
- **Michael R. Marrus and Robert O. Paxton, *Vichy France and the Jews* (1981).** The first full study of Vichy's own role in the persecution and deportation of Jews.
- **Julian Jackson, *France: The Dark Years, 1940–1944* (2001).** The standard one-volume history, from high politics to everyday life.
- **Henry Rousso, *The Vichy Syndrome: History and Memory in France since 1944* (1991).** How the French remembered and forgot Vichy; first published in French in 1987.
- **Robert Gildea, *Fighters in the Shadows: A New History of the French Resistance* (2015).** "Resistance in France", restoring foreigners, Jews, Spanish Republicans and women.
- **Eric T. Jennings, *Free French Africa in World War II: The African Resistance* (2015).** Free France's early base in Chad and Equatorial Africa, and its costs to Africans.
- **Fabrice Virgili, *Shorn Women: Gender and Punishment in Liberation France* (2002).** The shaving of about 20,000 women at the Liberation.$mn_france_master$,
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
  select $mn_france_quiz$[
    {"type": "mcq", "prompt": "Who ordered that children under 16 be deported with their parents after the Vél d'Hiv round-up of July 1942?", "options": ["Pierre Laval, head of the Vichy government, although the Germans had not asked for children", "Hitler, in a written order to the military administration in Paris", "De Gaulle's Free French committee in London", "The Italian authorities in their occupation zone"], "answerIndex": 0, "explanation": "The Germans had not asked for children. Laval ordered that children under 16 be deported with their parents, and Bousquet cancelled their exemptions. Of the roughly 3,900 Vél d'Hiv children deported, only six adolescents survived.", "id": "q1"},
    {"type": "mcq", "prompt": "Which territory was the first to rally to Free France, in August 1940, under its governor Félix Éboué?", "options": ["Indochina", "Algeria", "Chad", "Syria"], "answerIndex": 2, "explanation": "Chad declared for de Gaulle on 26 August 1940 under Éboué, followed by Cameroun, French Congo and Ubangi-Shari. Indochina and Algeria stayed under Vichy, and Syria was taken from Vichy's army in 1941.", "id": "q2"},
    {"type": "mcq", "prompt": "What was the Service du travail obligatoire (STO), created in February 1943?", "options": ["A Vichy youth movement for the 'return to the land'", "The Milice's full-time armed wing", "A German police unit that ran Drancy", "A labour draft that required young Frenchmen to work in Germany"], "answerIndex": 3, "explanation": "In all, counting the Relève and the STO, 600,000–650,000 French workers went to Germany between June 1942 and July 1944. Nearly 200,000 men hid instead, and many joined the maquis.", "id": "q3"},
    {"type": "mcq", "prompt": "What did Robert Paxton argue in Vichy France: Old Guard and New Order (1972)?", "options": ["That Pétain had been a 'shield' protecting the French from worse German demands", "That Vichy was an autonomous government that sought collaboration and chose its own reforms", "That Vichy had been run directly by German officials", "That most of the French population had joined the Resistance"], "answerIndex": 1, "explanation": "Paxton showed that Vichy was not a puppet but an autonomous government that sought collaboration. His book overturned Robert Aron's 'shield' thesis and began what the French call the 'Paxtonian revolution'.", "id": "q4"},
    {"type": "open", "prompt": "Explain why France's empire mattered to both Vichy and Free France between 1940 and 1945, and what colonial subjects gained and lost from serving France.", "rubric": "A strong answer notes that the armistice left France its empire; that Free France found its first territory in Equatorial Africa (Éboué, Chad, Brazzaville), as Eric Jennings argues, at the cost of forced labour and taxes; that up to 200,000 tirailleurs served and colonial troops formed much of the Free French army; and that they were kept out of the liberation of Paris, 'whitened' out of front-line units, and shot at Thiaroye (35–300 killed). It may mention Indochina (Japanese occupation, the famine of 1944–45, Ho Chi Minh) and Syria and Lebanon.", "id": "q5"},
    {"type": "open", "prompt": "How did French memory of the occupation change between 1944 and the 1990s? Use Henry Rousso's idea of a 'Vichy syndrome' in your answer.", "rubric": "A strong answer describes de Gaulle's account of a nation that had almost entirely resisted and Rousso's term résistancialisme; Aron's 'shield' thesis (1954); the 'broken mirror' of The Sorrow and the Pity and Paxton's book; the 'obsession' from the mid-1970s; the trials of Barbie, Touvier and Papon; and the shift from Mitterrand's refusal to apologise (1994) to Chirac's recognition of the French state's responsibility (1995).", "id": "q6"}
  ]$mn_france_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/20th-century-history/france-under-nazi-occupation', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

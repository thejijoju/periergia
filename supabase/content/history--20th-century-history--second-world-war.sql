-- The Second World War (WW2) — canonical master article, co-written and human-reviewed.
-- history/20th-century-history/world-wars/the-second-world-war-ww2 @ research/advanced/read.
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
    'history/20th-century-history/world-wars/the-second-world-war-ww2',
    'research',
    'advanced',
    'read',
    $mn_ww2_master$> **A world war from the start.** The Second World War is conventionally dated from 1 September 1939 to 2 September 1945, but in Asia it began in July 1937, when fighting near Beijing became a full-scale Japanese invasion of China. It became the deadliest conflict in history, and most of its dead were civilians. This chapter follows it from China to the Eastern Front, where most of the fighting took place, and across Asia, the Pacific and North Africa, with the colonial soldiers, resisters, women and bombed cities often left at the edges of the story. It ends with how the dead are counted, the founding of the United Nations, and three continuing arguments: why the Allies won, whether the atomic bombs were necessary, and whether this was a "good war".

## A War That Began in China

As the overview of the twentieth century argues, the war is best dated not from 1939 but from 1937. The road to war in Europe, from Manchuria in 1931 to Munich and the Molotov–Ribbentrop Pact, is told in the chapter on the Interwar Period; the Japanese empire and its occupations are the subject of the chapter on Japan's Empire in Asia, 1895–1945, and the Nazi regime of the chapter on Hitler and the Death of Democracy in Germany, 1918-1945.

On 7 July 1937, after a night manoeuvre near the **Marco Polo Bridge** outside Beijing, Japanese troops claimed a soldier was missing and demanded entry to the town of Wanping; fighting broke out although the soldier had already returned, and it escalated into full-scale invasion. In December, after the fall of Shanghai, Japan took the capital, Nanjing. In the **Nanjing Massacre** that began on 13 December, Japanese troops murdered and raped civilians and prisoners on a mass scale. The death toll is disputed: the Tokyo tribunal estimated more than 200,000, many newer estimates fall between 100,000 and 200,000, and China's official figure is 300,000. The international committee of the Nanking Safety Zone, which included the German Nazi Party member John Rabe, is credited with saving at least 200,000 lives.

Wuhan fell in 1938 and the Nationalist government moved inland to Chongqing, which Japanese aircraft bombed until 1944. In June 1938 Nationalist forces deliberately broke the Yellow River dikes to block the Japanese advance; in all, 400,000–500,000 people died from drowning, famine and plague. From 1939 the war was a stalemate: the Nationalists fought the major battles, the Communists mostly a guerrilla war. From 1941 Japan's "Three Alls" policy, "kill all, loot all, burn all", killed millions of civilians in northern and central China, and Japan carried out the largest attacks in the history of biological warfare, causing at least 200,000 deaths.

Modern estimates of Chinese deaths run from 10 to 20 million, with Rana Mitter putting the most likely figure at about 15–16 million; the official figure of the People's Republic is over 20 million. Tens of millions became refugees. The historian Rana Mitter calls China the "forgotten ally", whose resistance tied down Japanese armies.

## Europe, 1939–1941

Germany invaded Poland on 1 September 1939, and Britain and France declared war on 3 September. On 17 September the Soviet Union invaded from the east under the secret protocol of its pact with Germany, and Poland was divided. In 1940 the USSR annexed the Baltic states, while Germany conquered Norway, Denmark and the Low Countries.

France fell between 10 May and 25 June 1940, after German armour broke through the Ardennes; 338,226 men were evacuated from **Dunkirk**, Italy entered the war, and the armistice of 22 June was followed by the Vichy regime under Pétain. Between about 1,500 and 3,000 Senegalese *tirailleurs*, Black African soldiers of the French army, were murdered by German troops, many after surrendering (Raffael Scheck's estimate).

The **Battle of Britain** (10 July – 31 October 1940, by British reckoning) was the first major campaign fought entirely by air forces and Germany's first major defeat; Hitler cancelled his invasion. Its "few", in Churchill's word, were not only British: the Polish No. 303 Squadron became the highest-scoring Allied unit. By mid-1941 the Axis had also conquered Yugoslavia and Greece, and in March 1941 the United States signed Lend-Lease into law; Britain became its largest recipient.

## The Eastern Front

On 22 June 1941 more than 3.8 million Axis troops invaded the Soviet Union. **Operation Barbarossa**, the largest and costliest military offensive in history, opened the deadliest land war ever fought, and it was planned as a war of annihilation. *Generalplan Ost* foresaw the removal of Slavs by deportation, Germanisation, enslavement and genocide, and the Hunger Plan envisaged starving tens of millions; together they foresaw removing well over a hundred million people. Of nearly six million Red Army soldiers captured, the Germans deliberately starved or otherwise killed about 3 million or more. Over a million Soviet Jews were shot or gassed. Meanwhile thousands of trains carried Soviet factories and workers east to the Urals, Central Asia and Siberia.

The German and Finnish **siege of Leningrad**, a city never captured, lasted 872 days, from September 1941 to January 1944. About 1.5 million people died (estimates run from 1.3 to 2 million); in the winter of 1941–42 the bread ration fell to 125 grams a day, half or more of it sawdust and other inedible fillers, and supplies crossed frozen Lake Ladoga on the "Road of Life". Some historians classify the siege as genocide.

At **Stalingrad** the German offensive began in August 1942; women crewed some of the city's anti-aircraft guns. On 19 November a Soviet counter-offensive encircled the German 6th Army, whose commander, Paulus, surrendered on 2 February 1943. It was the largest and deadliest urban battle in history, costing over a million soldiers' and civilians' lives, and is generally regarded as the turning point in Europe. Of about 91,000 prisoners taken, only 5,000–6,000 came home. After Kursk crippled Germany's offensive power, Operation Bagration in 1944 destroyed Army Group Centre.

The historian Geoffrey Roberts writes that "more than 80 percent of all combat during the Second World War took place on the Eastern Front", and the Red Army accounted for most of the German army's casualties. American Lend-Lease to the USSR, worth $11.3 billion, was mostly food, metals, fuel and machinery rather than weapons.

## The Pacific and Southeast Asia

When Japan occupied southern Indochina in July 1941, the United States, Britain and others imposed a total oil embargo, which many Japanese officers saw as "an unspoken declaration of war". On 7 December 1941 (8 December in Asia) Japan struck almost simultaneously at **Pearl Harbor**, where 2,403 Americans were killed, and from the Philippines to Malaya and Hong Kong. On 15 February 1942 Singapore fell, and about 80,000 British, Indian, Australian and local troops were taken prisoner, Britain's largest surrender. By April Japan held Malaya, the Dutch East Indies and most of Burma, folding them into what it called the "Greater East Asia Co-Prosperity Sphere". Its forces were sometimes welcomed as liberators, but their crimes often turned local opinion against them.

Those crimes, described in the chapter on Japan's Empire in Asia, included the massacre of tens of thousands of Chinese in Singapore, and the Burma Railway of 1942–43, on which more than 90,000 Asian labourers and about 12,000 Allied prisoners died. More than a quarter (27 per cent) of Allied prisoners held by Japan died. Women and girls, mostly from Korea, were forced into sexual slavery as "comfort women"; estimates run from under 20,000 to over 400,000, most historians settling between 20,000 and 200,000. In northern Vietnam, under Japanese occupation and Vichy French administration, the famine of 1944–45 killed between 400,000 and 2 million.

The Pacific turned at **Midway** (4–7 June 1942). American code-breakers knew Japan's plan, and all four Japanese fleet carriers present were sunk, halting Japan's advance.

## Soldiers of Empire

Britain's Viceroy declared war for India in 1939 without consulting Indian leaders. As the chapter on the British Empire notes, over two and a half million Indians served, in North and East Africa, the Middle East, Italy and Burma, and more than 87,000 died. Yet in August 1942 Congress launched the Quit India movement, and over 60,000 leaders were arrested. The **Bengal famine** of 1943, treated in that chapter, killed an estimated 0.8–3.8 million, with a scholarly consensus of about 2.1 million.

Some Indians fought the other way. Subhas Chandra Bose rebuilt the **Indian National Army** from 1943, from Indian prisoners of war and, increasingly, Indian civilians in Malaya and Burma, to about 43,000, with a women's regiment led by Lakshmi Sahgal; it joined Japan's 1944 invasion of India, halted at Imphal and Kohima. Historians stress its dependence on Japan and poor military record, yet the British trials of its officers in 1945–46 made them nationalist heroes in India. British Empire forces in Burma, about a million at their peak, were drawn primarily from India and included 100,000 East and West African troops.

Roughly half a million Africans served Britain (David Killingray and Martin Plaut count over half a million, combatant and non-combatant). The King's African Rifles fought Italy in East Africa, Vichy France in Madagascar and Japan in Burma, alongside West African divisions in which, by the war's end, only one or two Black officers had been commissioned. France fielded up to 200,000 *tirailleurs*. They fought in Italy and in 1944 from Toulon to the Swiss border. Black troops were kept out of the forces chosen to liberate Paris in August 1944, and that autumn thousands of tirailleurs were withdrawn from front-line units and replaced by white volunteers, a "whitening" (*blanchiment*) of the army. On 1 December 1944, at **Thiaroye** near Dakar, French troops shot repatriated former prisoners protesting over unpaid wages, killing between 35 and 300.

About 16,000 West Indians volunteered for British service, some 6,000 of them in the RAF. The Jamaican Billy Strachan sold all he owned to reach Britain, survived 33 bombing operations and became a flight lieutenant, a rare achievement for a Black person in 1940s Britain; many others met racism. In the United States, the *Pittsburgh Courier* launched the "Double V" campaign in 1942, from a reader's call for "victory over our enemies from without" and "over our enemies from within"; the armed forces stayed segregated until Truman ordered their desegregation in 1948.

```checkpoint
q: Why do many historians call the Eastern Front the centre of the war in Europe?
a*: Because, in Geoffrey Roberts's estimate, more than 80 per cent of all combat took place there, and the Red Army inflicted most German army casualties.
a: Because the Soviet Union entered the war in September 1939 as Britain's ally.
x: In 1939 the USSR invaded Poland under its pact with Germany; it was itself invaded only in June 1941.
a: Because the Western Allies landed in Normandy before Barbarossa began.
x: Barbarossa began in June 1941; D-Day came three years later, in June 1944.
a: Because Lend-Lease weapons did most of the Soviet fighting.
x: Most Lend-Lease aid to the USSR was food, metals, fuel and machinery rather than weapons.
hint: Think of where the fighting, and the German losses, were concentrated.
why: The scale of Barbarossa, Leningrad, Stalingrad and Bagration made the East the war's decisive land front.
---
q: What happened at Thiaroye, near Dakar, on 1 December 1944?
a: Tirailleurs led a successful rising against Vichy rule.
x: Vichy had already lost French West Africa; the victims were former prisoners returning home.
a: Japanese forces attacked a British convoy.
x: Thiaroye is in Senegal, far from the war with Japan.
a*: French troops shot repatriated African soldiers who were protesting over unpaid wages.
a: Allied troops liberated a German prisoner-of-war camp.
x: The soldiers had been German prisoners in 1940, but the shooting was by the French army after their return.
hint: Think of what the empire owed the soldiers it had sent to fight.
why: Thiaroye, like the "whitening" of the French army in 1944, shows how colonial soldiers were treated by the powers they served.
```

## North Africa and the Mediterranean

In North Africa, an Italian army was destroyed between December 1940 and February 1941, when the German *Afrika Korps* began to arrive. At the **Second Battle of El Alamein** (23 October – 4 November 1942) Montgomery's Eighth Army, which included Indian, New Zealand (with the 28th Māori Battalion), Australian and South African divisions, defeated *Panzerarmee Afrika*, and Anglo-American forces landed in French North Africa on 8 November.

```quote
Now this is not the end. It is not even the beginning of the end. But it is, perhaps, the end of the beginning.
Winston Churchill · Speech at the Mansion House, London · 10 November 1942
```

About 250,000 German and Italian troops surrendered in Tunisia in May 1943. The Allied invasion of Italy that July brought down Mussolini's regime.

## The Holocaust

The war in the East was also the setting of genocide. Around six million Jews, about two-thirds of Europe's Jews, were murdered by Nazi Germany and its collaborators: from June 1941 by mass shootings in the occupied East, and then in gas chambers at Auschwitz-Birkenau, Treblinka, Bełżec, Sobibor, Chełmno and Majdanek. Roma, Soviet prisoners of war and others were also murdered. The Holocaust is treated in its own chapter.

## Resistance

Every occupation met resistance. Tito's **Yugoslav Partisans**, Europe's most effective anti-Axis resistance movement, grew to over 800,000 by April 1945, fighting both the occupiers and royalist rivals. Poland's **Home Army**, loyal to the government-in-exile, numbered between 200,000 and 600,000 in 1944 by different estimates; its intelligence work carried the first reports of the Holocaust to the Allies, although its attitude towards Jews remains controversial. Its **Warsaw Uprising** of August–October 1944, the largest effort by any European resistance movement, was crushed while the Red Army halted outside the city: 150,000–200,000 civilians died and Warsaw was destroyed.

In Asia, about 260,000 Filipinos took part in resistance in some form, including the communist-led peasant army, the Hukbalahap; by the war's end Japan controlled only 12 of 48 Philippine provinces. In Malaya the mainly Chinese, communist-led Malayan Peoples' Anti-Japanese Army worked with Britain's Force 136. Women took part in resistance from France and Italy to Poland and Yugoslavia.

## Home Fronts and Women

Several hundred thousand women served in combat roles, especially in anti-aircraft units. Between 800,000 and about a million women served in the Red Army, mostly as medics but also as pilots and snipers; Lyudmila Pavlichenko was credited with 309 kills. In Britain, from late 1941, unmarried women aged 20–30 were conscripted, a first in British history. About 350,000 American women served in uniform, and the image of "Rosie the Riveter" became iconic. On Okinawa, students from girls' schools, the Himeyuri students, were mobilised as army nurses.

War also meant coercion. By late 1944 Germany held 7.6 million foreign workers, including prisoners of war, and about 500,000 concentration-camp slave labourers; the chapter on Hitler and the Death of Democracy in Germany describes the wider system of forced labour; afterwards, between 200,000 and one million Soviet citizens returned from German camps were sent to the gulag as suspected collaborators. In the United States about 120,000 Japanese Americans on the West Coast were incarcerated; they received an apology and reparations only in 1988.

## Bombing

Germany bombed Warsaw, Rotterdam and British cities, killing about 60,000 British civilians, and Japan bombed Chinese cities from 1938. From 1942 Britain's Bomber Command, under Arthur Harris, turned to area bombing of German cities; about 160,000 Allied airmen died over Europe. At **Hamburg** in 1943 an estimated 35,000–40,000 people died, about 18,000 of them in a single night's firestorm. At **Dresden** in February 1945, up to 25,000 were killed, the figure confirmed by a city-commissioned study in 2010; the Nazi government had published a falsified 200,000, and inflated figures were later spread by the Holocaust denier David Irving. Estimates of all German civilian deaths from bombing run from about 350,000 to over 600,000.

Over Japan, American precision raids largely failed, and the United States switched to firebombing more than sixty cities. On the night of 9–10 March 1945, 279 B-29s burned out much of eastern **Tokyo**, killing 90,000–100,000 or more and leaving over a million homeless: the deadliest conventional air raid in history, and more destructive than either atomic bomb. In all, between 330,000 and 500,000 Japanese civilians were killed by bombing.

## The End of the War

On **D-Day**, 6 June 1944, nearly 160,000 Allied troops landed in Normandy in the largest seaborne invasion in history. At **Yalta** in February 1945, Roosevelt, Churchill and Stalin met in a conference that later became intensely controversial over the division of Europe; there the Soviet Union promised to enter the war against Japan "two or three months" after Germany's defeat. After the fall of Berlin, Germany surrendered unconditionally on 8 May 1945.

{{image: Raising a Flag over the Reichstag | A 1945 photograph of a flag raised over the Reichstag in Berlin, an image of the war's end in Europe.}}

In the Pacific, the battle for Okinawa from 1 April 1945 killed about 12,000 Americans, some 94,000–110,000 Japanese military personnel and between 40,000 and 150,000 Okinawan civilians; local authorities count about 150,000 Okinawans dead in all. During the Potsdam Conference, a declaration of 26 July in the names of Truman, Churchill and Chiang Kai-shek demanded Japan's unconditional surrender or "prompt and utter destruction". On 6 August an American B-29 dropped a uranium bomb on Hiroshima, and on 9 August a plutonium bomb fell on Nagasaki. By the end of 1945 between 150,000 and 246,000 had died, about 90 per cent of them civilians; the dead included Koreans, among them conscripted workers at Nagasaki. On 8 August the Soviet Union declared war and invaded Manchuria. On 15 August Emperor Hirohito's recorded broadcast announced that Japan accepted the Potsdam terms, asking his people, in one translation, to "bear the unbearable and endure the unendurable". The surrender was signed on 2 September. German and Japanese leaders were later tried at Nuremberg and Tokyo.

```checkpoint
q: Which of these is the best-supported death toll for the bombing of Dresden in February 1945?
a: About 200,000.
x: That was a falsified figure published by the Nazi government and later spread by David Irving.
a*: Up to 25,000, a figure confirmed by a 2010 study commissioned by the city.
a: About 100,000, more than the Tokyo raid.
x: Around 90,000–100,000 or more died in Tokyo on 9–10 March 1945; Dresden's toll was far lower.
a: Under 1,000.
x: The researched figure is up to 25,000.
hint: Think about who produced the higher figures, and why.
why: Casualty figures can become political weapons; the Dresden figures show how.
---
q: Which event did the historian Tsuyoshi Hasegawa argue was decisive in Japan's surrender?
a: The firebombing of Tokyo.
x: The Tokyo raid came in March 1945, five months before the surrender.
a: The Battle of Midway.
x: Midway in 1942 halted Japan's advance but did not end the war.
a: The atomic bomb on Nagasaki alone.
x: Hasegawa argues that the atomic bombs alone were not decisive.
a*: The Soviet declaration of war and invasion of Manchuria.
hint: Think of what happened on 8 August 1945.
why: Hasegawa's argument is one of several challenges to the view that the atomic bombs alone ended the war.
```

## Counting the Dead

How many died depends on what is counted. Estimates run from about 60 to 75 million, some above 80 million, about 3 per cent of the world's population. Much of the spread comes from whether, and how many, deaths from war-related famine and disease, roughly 20 million or more in the Soviet Union, China, Indonesia, Vietnam, the Philippines and India, are counted. Military deaths were 21–25 million, including about 5 million prisoners who died in captivity. More than half of all the dead were Chinese or Soviet, and some 7–10 million died in the European and American colonies of South and Southeast Asia, mostly from famine.

Each national figure is itself a range. Soviet deaths are commonly put at about 27 million, against a Soviet-era official 20 million and a 2017 claim of about 42 million, which specialists reject. Poland lost about 17 per cent of its population, the highest proportion of any country. German military deaths were about 4.4–5.3 million; Japan's dead, 2.5–3.1 million. As the *Oxford Companion to World War II* puts it, "casualty statistics are notoriously unreliable", and some figures, such as Nanjing's 300,000 or Dresden's 200,000, have become political symbols.

## Arguments That Continue

**Why did the Allies win?** Richard Overy's *Why the Allies Won* (1995) rejected the idea that greater resources made victory inevitable; he stressed moral and political causes, and how the Allies turned their economic strength into effective fighting power. Others stress the weight of the Soviet war, China's long resistance, or the disputed importance of Lend-Lease. Overy's *Blood and Ruins* (2021) frames the conflict, from 1931, as an imperial war in which the Axis states sought new empires; some reviewers think this underplays ideology.

**Were the atomic bombs necessary?** The orthodox view holds that they ended the war and averted a costly invasion of Japan; Truman said in 1953 he had been advised American casualties could reach 250,000 to a million. Against this, the US Strategic Bombing Survey of 1946 concluded that air supremacy alone could have forced Japan's unconditional surrender, though historians including Hasegawa criticise Paul Nitze for taking its conclusions beyond the evidence. Tsuyoshi Hasegawa argues that the Soviet invasion, not the bombs, was decisive; Gar Alperovitz argued in 1965 that the bombs were meant chiefly to intimidate the Soviet Union; and the historian Mark Selden calls the dissent of the Indian judge Radhabinod Pal at the Tokyo tribunal perhaps "the most trenchant contemporary critique" of the American moral position. As J. Samuel Walker wrote in 2005, the controversy "seems certain to continue".

**A "good war"?** Studs Terkel's oral history *"The Good War"* (1984) put the phrase in quotation marks; yet many who took part did see it as a good war. Paul Fussell's *Wartime* (1989) attacked what he called the "Disneyfication" of the war in American memory, and John Bodnar's *The "Good War" in American Memory* (2010) argues that the label took hold only years after 1945. A global view adds reasons for caution: the Bengal famine, segregated armies and Japanese American camps, Thiaroye, Soviet atrocities and expulsions, and the bombing of cities.

## The World the War Made

The **United Nations** Charter was signed at San Francisco on 26 June 1945 by 50 states (Poland signed later as the 51st original member), with the United States, China, France, the Soviet Union and Britain as permanent members of the Security Council.

```quote
to save succeeding generations from the scourge of war, which twice in our lifetime has brought untold sorrow to mankind
Charter of the United Nations · Preamble · 26 June 1945
```

The United States and the Soviet Union emerged as rival superpowers, setting the stage for the Cold War. Germany, Austria, Japan and Korea were occupied, and Korea's division at the 38th parallel led to separate states in 1948 and then war. About 12 million Germans fled or were expelled from Eastern and Central Europe, and between 500,000 and 2.5 million died. Burma, Malaya and Singapore went back to Britain and Indochina to France, but Indonesia proclaimed independence on 17 August 1945 and fought the Dutch to keep it, and the decolonisation of Asia and Africa had begun.

## Further exploration

- **Richard Overy, *Why the Allies Won* (1995).** The classic argument that Allied victory was not inevitable.
- **Richard Overy, *Blood and Ruins: The Great Imperial War, 1931–1945* (2021).** A global history of the war as the last imperial war, beginning in Asia in 1931.
- **Rana Mitter, *China's War with Japan, 1937–1945: The Struggle for Survival* (2013).** China's war, long forgotten in the West; published in the US as *Forgotten Ally*.
- **Christopher Bayly and Tim Harper, *Forgotten Armies: The Fall of British Asia, 1941–1945* (2004).** The war in British Asia, from Bengal to Malaya.
- **Yasmin Khan, *The Raj at War: A People's History of India's Second World War* (2015).** India's war, seen from below.
- **Lizzie Collingham, *The Taste of War: World War Two and the Battle for Food* (2011).** Food and hunger as weapons and causes of death worldwide.
- **Svetlana Alexievich, *The Unwomanly Face of War* (1985).** An oral history of Soviet women at war, by the 2015 Nobel laureate in Literature.$mn_ww2_master$,
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
  select $mn_ww2_quiz$[
    {"type": "mcq", "prompt": "Which event of July 1937 is generally regarded as the start of the full-scale war between Japan and China?", "options": ["The Marco Polo Bridge incident near Beijing", "The Mukden explosion in Manchuria", "The fall of Nanjing", "The attack on Pearl Harbor"], "answerIndex": 0, "explanation": "On 7 July 1937 a clash near the Marco Polo Bridge at Wanping escalated into full-scale invasion. The Mukden incident was in 1931, Nanjing fell in December 1937, and Pearl Harbor was attacked in December 1941.", "id": "q1"},
    {"type": "mcq", "prompt": "Why do estimates of the total dead of the Second World War range from about 60 million to 85 million?", "options": ["Because German and Soviet records were all destroyed", "Because some totals leave out civilians entirely", "Because they differ on whether, and how many, war-related famine and disease deaths are counted", "Because the war's end date is disputed by decades"], "answerIndex": 2, "explanation": "Estimates run from about 60 to 75 million, some above 80 million; much of the spread comes from how many of the roughly 20 million or more deaths from war-related famine and disease in the USSR, China, Indonesia, Vietnam, the Philippines and India are counted. Civilians were the majority of the dead.", "id": "q2"},
    {"type": "mcq", "prompt": "What is the best-supported figure for deaths in the bombing of Dresden in February 1945?", "options": ["About 200,000", "About 100,000", "About 1,000", "Up to 25,000"], "answerIndex": 3, "explanation": "A 2010 study commissioned by the city confirmed up to 25,000 dead. The 200,000 figure was falsified by the Nazi government and later spread by David Irving. The firebombing of Tokyo on 9–10 March 1945 killed 90,000–100,000 or more.", "id": "q3"},
    {"type": "mcq", "prompt": "What was the 'blanchiment' (whitening) of 1944?", "options": ["A Japanese policy in occupied Southeast Asia", "The withdrawal of Black African soldiers from French front-line units in 1944, after they had been kept out of the liberation of Paris", "The British evacuation from Dunkirk", "A German plan for the occupied Soviet Union"], "answerIndex": 1, "explanation": "Black troops were kept out of the forces chosen to liberate Paris in August 1944, and that autumn thousands of tirailleurs who had fought in Italy and from Toulon to the Swiss border were replaced by white volunteers. On 1 December 1944, at Thiaroye near Dakar, French troops shot repatriated African soldiers protesting over unpaid wages.", "id": "q4"},
    {"type": "open", "prompt": "Explain why many historians now see the Second World War as a global war that began in Asia and was decided above all on the Eastern Front. Use evidence from China and the Soviet Union.", "rubric": "A good answer dates the war in Asia from the Marco Polo Bridge incident of July 1937 and uses China's experience: Nanjing (with the disputed death toll), the move to Chongqing, the Yellow River flood, the Three Alls policy, 10–20 million Chinese dead (Mitter's most likely figure about 15–16 million), and Mitter's 'forgotten ally'. On the Eastern Front it should use Barbarossa as a war of annihilation (Generalplan Ost, the Hunger Plan, Soviet prisoners starved), Leningrad, Stalingrad as the turning point in Europe, Roberts's estimate that more than 80 per cent of all combat took place there, and Soviet deaths of about 27 million. Stronger answers note that more than half of all the dead were Chinese or Soviet, weigh Lend-Lease (mostly food, metals, fuel and machinery), and mention Overy's framing of the war from 1931.", "id": "q5"},
    {"type": "open", "prompt": "Were the atomic bombings of Hiroshima and Nagasaki necessary to end the war? Set out the main positions in the debate.", "rubric": "A good answer describes the bombings (6 and 9 August 1945; 150,000–246,000 dead by the end of 1945, about 90 per cent civilians, including Koreans) and sets out the orthodox view (the bombs ended the war and averted an invasion; Truman's 1953 claim of 250,000 to a million projected US casualties) against challenges: the 1946 US Strategic Bombing Survey's conclusion that air supremacy could have forced surrender (and criticism of Nitze), Hasegawa's argument that the Soviet invasion of Manchuria on 8 August was decisive, Alperovitz's 'atomic diplomacy', and Pal's dissent at the Tokyo tribunal. Stronger answers mention the firebombing of Tokyo as context and Walker's judgement that the controversy will continue.", "id": "q6"}
  ]$mn_ww2_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/20th-century-history/world-wars/the-second-world-war-ww2', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

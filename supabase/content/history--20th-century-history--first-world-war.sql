-- The First World War (WW1) — canonical master article, co-written and human-reviewed.
-- history/20th-century-history/world-wars/the-first-world-war-ww1 @ research/advanced/read.
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
    'history/20th-century-history/world-wars/the-first-world-war-ww1',
    'research',
    'advanced',
    'read',
    $mn_ww1_master$> **A world war, not a European war with extras.** From 1914 to 1918 the war was fought in France, but also in Serbia and the Alps, at Gallipoli, along the Tigris, in East Africa and in China. Soldiers and labourers came from India, Africa, Vietnam and China; civilians starved under blockade; the Ottoman government destroyed its Armenian population; and between 15 and 22 million people died. This chapter follows the July Crisis and the argument over its causes, the war's many fronts, the home fronts, the peace treaties, and the "Wilsonian moment" of 1919, when hopes of self-determination rose and were dashed from Cairo to Seoul.

## A Global War from the First Week

The war ran from 28 July 1914 to 11 November 1918. On one side stood the **Central Powers**: Germany, Austria-Hungary, the Ottoman Empire and, from 1915, Bulgaria. On the other stood the **Allies**: France, Britain and its empire, Russia until 1917, Italy from 1915, Japan, the United States from 1917, and others. Because the belligerents were empires, the war was global from the start: French and British forces invaded German Togoland and Kamerun on 6–7 August 1914, and by late August Japan was besieging the German base at Qingdao. As the chapter on Imperial Expansion and Resistance shows, by 1914 almost all of Africa was under European rule. The overview of the twentieth century introduces the war as the start of total war; this chapter looks closer.

## Sarajevo and the July Crisis

On 28 June 1914 Archduke **Franz Ferdinand**, heir to the Habsburg throne, and his wife Sophie were shot in Sarajevo, capital of recently annexed Bosnia-Herzegovina. The gunman, **Gavrilo Princip**, was one of six Young Bosnia conspirators, five Bosnian Serbs and one Bosniak, armed by extremists of the Serbian Black Hand. Austria-Hungary imprisoned about 5,500 prominent Bosnian Serbs, of whom 700 to 2,200 died.

On 5 July Kaiser **Wilhelm II** told the Austrian ambassador that Austria-Hungary could "count on Germany's full support" even if "grave European complications" followed, the so-called **blank cheque**. A day earlier he had scrawled: "We must finish with the Serbs, quickly. Now or never!" Vienna's ultimatum of 23 July was made intentionally unacceptable; Serbia accepted all of it except the demands that Austrian officials operate inside Serbia. Austria declared war on 28 July; Russia mobilised on 30 July; Germany and Russia were at war on 1 August. Germany's **Schlieffen Plan** sent most of its army west to defeat France in about six weeks before turning east, so Germany invaded Belgium on 4 August, and Britain's ultimatum expired at midnight. As the chapter on the Second Industrial Revolution describes, the Second International of socialist parties collapsed that same day.

```quote
The lamps are going out all over Europe, we shall not see them lit again in our life-time.
Sir Edward Grey · Twenty-Five Years 1892–1916 (1925) · remark dated to 3 August 1914
```

## Who Was to Blame?

The overview sets out the war-guilt argument in brief. After Versailles asserted German responsibility, in the 1920s the German Foreign Ministry answered with 40 volumes of carefully edited documents, purged of incriminating papers, spreading the view that everyone had slid into war together. In 1961 **Fritz Fischer**'s *Griff nach der Weltmacht* (*Germany's Aims in the First World War*) argued that Germany's leaders had deliberately sought a war of expansion; Gerhard Ritter led the opposition, insisting that Germany had acted defensively. In 1973 John Röhl observed that most historians now accepted that Germany bore the main responsibility; by the 1980s, Annika Mombauer notes, few accepted Fischer's premeditation thesis, though most still gave Germany the larger share.

Others looked elsewhere: A. J. P. Taylor to railway timetables that trapped leaders, Samuel Williamson to Austro-Hungarian elites, Sean McMeekin to Russian ambitions toward the Straits, Niall Ferguson to British diplomatic blunders. Clark's *The Sleepwalkers* (2012) spread responsibility widely: Germany and Austria sought a local war knowing they risked a wider one, Russia backed Serbia whatever the cost and was first to order general mobilisation, and France encouraged Russia; all the continental powers, in his account, risked a general war but none sought it. Critics such as Hans-Ulrich Wehler and Mombauer replied that Clark's choice of sources relativised deliberate decisions taken in Berlin and Vienna. The question is not settled.

## Stalemate in the West

The Schlieffen Plan failed. The First Battle of the Marne in September 1914 halted the Germans, and a "Race to the Sea" left a continuous line of trenches from the Channel to Switzerland by the year's end.

In 1916 came the two battles that stand for the war in Western memory. **Verdun** (February to December) cost about 700,000–750,000 casualties on both sides, and some counts are higher. On 1 July, the first day of the **Somme**, the British suffered 57,500 casualties, 19,200 of them dead; by November roughly 420,000 British, 200,000 French and, on estimates from 237,000 to 600,000, German soldiers had become casualties, for little ground. Verdun and the Somme together cost perhaps 1.6 to 2 million casualties. In 1918 a German spring offensive advanced 60 km before the Allied Hundred Days from 8 August drove it back.

## East, Italy and the Balkans

Germany crushed a Russian invasion of East Prussia at **Tannenberg** in August 1914 and in 1915 pushed Russia out of Poland. Brusilov's offensive of 1916 took 420,000–470,000 Austro-Hungarian prisoners and brought Romania into the war, but fatally weakened both the Austrian and Russian armies; by the end of 1916 Russia had lost over five million men killed, wounded, sick or captured. Italy, promised Austrian territory by the secret Treaty of London, joined the Allies in May 1915 and fought on the Isonzo and high in the Alps; at **Caporetto** in 1917 it lost 265,000–275,000 men as prisoners, but in 1918 it broke the Austro-Hungarian army at Vittorio Veneto.

Serbia, where the war began, suffered most of all relative to its size. It threw back Austria's invasions of 1914, but in the winter of 1914–15 typhus killed perhaps 150,000 or more, and in October 1915 German, Austro-Hungarian and Bulgarian forces conquered it. In the winter "Great Retreat" across the Albanian mountains, of about 400,000 who set out only 180,000 soldiers and civilians reached the sea. Estimates of Serbian war dead, soldiers and civilians, range from about 750,000 to over a million, from a population of 4.5 million. In September 1918 Serbian and Allied troops from Salonica broke Bulgaria; the Kaiser complained, "Disgraceful! 62,000 Serbs decided the war!"

## The Ottoman War

The Ottoman Empire signed a secret alliance with Germany on 2 August 1914 and entered the war that November; it mobilised nearly three million men over the war, many of them Arab conscripts. Enver Pasha's winter offensive against Russia at **Sarikamish** in the Caucasus (December 1914 to January 1915) cost tens of thousands of Ottoman soldiers, many of them frozen.

At **Gallipoli** (Çanakkale), an Allied naval attack failed on 18 March 1915, with three battleships lost, and on 25 April troops landed at Helles and at Anzac Cove. The Ottoman army was commanded by the German Liman von Sanders, but a lieutenant colonel, **Mustafa Kemal**, led the counter-attack above Anzac Cove. He ordered the 57th Infantry Regiment (in translation): "I do not order you to fight, I order you to die." Every man was killed or wounded. After more than eight months of fighting, with approximately 250,000 casualties on each side, the Allies withdrew in January 1916. Allied dead numbered 43,000–61,000, Ottoman dead 57,000–87,000. Both sides made the campaign a national story. In Turkey 18 March is commemorated and "Çanakkale geçilmez" ("Çanakkale is impassable") became a byword; Kemal went on to found the Turkish Republic in 1923. In Australia and New Zealand, 25 April is Anzac Day, seen by some as the start of national consciousness. Words of comfort to Anzac mothers often attributed to Kemal, later Atatürk, are of disputed provenance: no evidence for them appears before 1953, and some researchers argue the key sentence was added in 1978.

{{image: Gallipoli campaign | Gallipoli seen from both sides: Ottoman commanders, among them Mustafa Kemal, Allied landings and Ottoman troops in their trenches, 1915.}}

In **Mesopotamia**, British Indian troops landed in November 1914 to protect Persian oil. At Kut in April 1916, after a five-month siege, 13,164 men, about three-quarters of them Indian, surrendered; many died on the march into captivity. Baghdad fell in 1917, and from Egypt British forces took Jerusalem that December.

In June 1916 Sharif **Hussein** of Mecca launched the **Arab Revolt**, trusting British promises of an independent Arab state made in the McMahon–Hussein correspondence. Arab forces, with Auda Abu Tayi and T. E. Lawrence, took Aqaba in 1917, raided the Hejaz railway and reached Damascus on 30 September 1918, where an Arab government was set up; in 1920 Hussein's son Faisal proclaimed a short-lived Arab Kingdom of Syria. Historians qualify the legend: most Arabs in Ottoman lands stayed loyal, Britain paid the revolt in gold, and its main military value was pinning down many thousands of Ottoman troops, including the Medina garrison; some call it a Hashemite, Hejaz-centred dynastic rising rather than an "Arab" one. Meanwhile Britain and France secretly agreed to partition the Ottoman lands (Sykes–Picot, 1916), and the Balfour Declaration of 1917 promised "a national home for the Jewish people" in Palestine. Civilians paid heavily: in Mount Lebanon, blockade, Ottoman policy and locusts caused a famine that killed up to 200,000 people, perhaps half the population, and in neutral but occupied Persia a mainstream though contested estimate puts famine deaths in 1917–19 at about two million.

## The Armenian Genocide

The ruling Committee of Union and Progress used the war to destroy the empire's Armenians, estimated at 1.5 to 2 million, whom Enver blamed for Sarikamish. On the night of 23–24 April 1915 hundreds of Armenian intellectuals and leaders were arrested in Constantinople; 24 April is now the day of remembrance. A deportation law of late May gave a cover of legality, and on Talaat Pasha's orders an estimated 800,000 to 1.2 million Armenians were driven on death marches towards the Syrian desert in 1915–16. Men were usually separated and executed; deportees were starved, robbed, raped and massacred, much of the killing done by the paramilitary Special Organization. Between 100,000 and 200,000 women and children were forcibly converted and absorbed into Muslim households. Most estimates put the dead at around one million, within a range of 600,000 to 1.5 million. Assyrian delegates in 1919 claimed some 250,000 Assyrian dead, an unverifiable figure, and estimates for Greeks killed between 1914 and 1922 run from about 300,000 to 750,000.

In May 1915 Britain, France and Russia condemned "crimes against humanity and civilization". Almost all historians outside Turkey call these events genocide; the Turkish state denies it. The chapter on the Ottomans places these events in the empire's longer history.

```checkpoint
q: Why did Gallipoli become so important in Turkish, Australian and New Zealand memory?
a*: Because it was an Ottoman victory that made Mustafa Kemal's name, while Anzac Day turned the landings into a founding story for Australia and New Zealand.
a: Because it was the decisive Allied victory that knocked the Ottoman Empire out of the war.
x: The Allies failed and withdrew in January 1916; the Ottomans signed an armistice only in October 1918.
a: Because it was fought only by British and French troops.
x: Australian, New Zealand, Indian and Newfoundland soldiers also fought and died there.
a: Because it was the first battle in which poison gas was used.
x: The first German use of chlorine gas on the Western Front came at Ypres in April 1915.
hint: Think of 18 March and 25 April.
why: The same campaign became a national story on both sides, for different reasons.
---
q: How do historians assess the Arab Revolt of 1916?
a: As a rising joined by almost all the Arabs of the Ottoman Empire.
x: Most Arabs in Ottoman lands stayed loyal and did not join.
a: As the campaign that won the war in the Middle East on its own.
x: Historians judge that it was not militarily decisive.
a*: As a real but limited rising whose main value was pinning down Ottoman troops, which some see as a Hashemite dynastic project rather than an "Arab" revolt.
a: As a revolt the British opposed.
x: Britain encouraged it with promises and paid it subsidies in gold.
hint: Ask who joined, who paid, and what it achieved.
why: The revolt's legend is larger than its military weight, and even its name is debated.
```

## Africa and the Carriers

In Africa the war was fought largely by Africans. In German East Africa, **Paul von Lettow-Vorbeck**'s force of at most about 3,000 Europeans and 15,000 African soldiers (askari) fought a guerrilla campaign to tie down Allied resources, surrendering only on 25 November 1918, two weeks after the armistice. The heaviest burden fell on **carriers**, the porters who moved supplies: the British Carrier Corps alone recruited or conscripted over 400,000 men, and one account counts about a million Africans conscripted, depopulating whole districts. Deaths among the British side's carriers alone are estimated at about 90,000–95,000, among them 45,000 Kenyans, 13 per cent of Kenya's male population. A Colonial Office official remarked that the campaign had escaped scandal only "because the people who suffered most were the carriers - and after all, who cares about native carriers?" An estimated 365,000 civilians died in war-related famines.

Africans also resisted. In Nyasaland in January 1915 **John Chilembwe**, an American-educated Baptist minister, led a rising against forced labour, racism and wartime demands; he was killed and is now a national hero in Malawi. In present-day Mali and Burkina Faso an uprising against forced French recruitment in 1915–17 was crushed, with over 100 villages destroyed.

## Japan, Qingdao and China

Japan entered the war in August 1914 under its alliance with Britain. At the **Siege of Tsingtao (Qingdao)** some 23,000 Japanese troops, with about 1,500 British and Indian soldiers, took Germany's base in Shandong in November. In 1915 its **Twenty-One Demands** sought to make China a virtual protectorate; China leaked them and boycotted Japanese goods.

China declared war on Germany in August 1917, but its main contribution had already begun: about 140,000 Chinese labourers, mostly from Shandong, served on the Western Front, some 100,000 with the British **Chinese Labour Corps** and 40,000 with the French, digging trenches and building roads. British and French records count about 2,000 deaths, many from influenza; some Chinese scholars estimate up to 20,000.

## The Empires' Soldiers and Labourers

India made the largest contribution of any colony. Nearly 1.3 million Indians volunteered as soldiers and non-combatants, over a million served overseas, and some 65,000–75,000 died, depending on the count. They fought on the Western Front, at Gallipoli, in East Africa and, nearly 700,000 of them, in Mesopotamia. Congress leaders supported the war in the expectation of Home Rule. From French West Africa came around 200,000 *tirailleurs sénégalais*, more than 135,000 of them in Europe, of whom about 30,000 were killed. About 90,000 Indochinese, mostly Vietnamese, went to France as soldiers and workers, some fighting at Verdun. Labour corps also came from Egypt, South Africa, Fiji and the West Indies, and, as the chapter on the British Empire notes, over 2.5 million men served in the Dominion armies. What the empires owed these men in return became one of 1919's sharpest questions.

## Home Fronts, Hunger and the Blockade

Total war remade states. Government spending passed half of national output in Germany and France and reached well over a third in Britain. Britain created a Ministry of Munitions in 1915, and its women munitions workers were nicknamed "canaries" for the yellow skin TNT gave them. Russia's Provisional Government fielded women's combat battalions in 1917. States policed dissent: the United States passed Espionage and Sedition Acts, Britain jailed Bertrand Russell, and Britain crushed the Easter Rising of 1916 in Dublin and executed its leaders.

The Allied **blockade** of Germany treated food as contraband. After the "Turnip Winter" of 1916–17, rations at times fell to about 1,000 calories a day, and female mortality in 1917 was 30 per cent above prewar levels. How many died is debated, not least because hunger deaths are hard to separate from influenza: a German report of December 1918 claimed 763,000, a figure later studies revised sharply downward; a 1928 study gave 424,000, and recent figures are similar or lower, with perhaps 100,000 more as the blockade continued into 1919. The argument over whether hunger at home or defeat on the Western Front forced the armistice later fed the myth that Germany had been "stabbed in the back".

Women won the vote during or soon after the war in the United States, Britain, Germany, Russia and elsewhere, but not in France; in Britain, where the chapter on the Victorian Era ends with the vote of 1918, only women over 30 who met a property qualification. Contemporaries saw this as a reward for war work; the historian Martin Pugh argues that politicians decided in 1916 mainly to enfranchise soldiers, while Arthur Marwick saw the war as transforming British society.

## 1917: America In, Russia Out

In February 1917 Germany resumed unrestricted submarine warfare, weeks after the Zimmermann telegram had offered Mexico Texas, Arizona and New Mexico. The United States declared war on 6 April 1917. Russia went the other way; the chapter on Imperial Russia from Napoleon to 1905 shows how 1905 had rehearsed its revolution. In March 1917 soldiers refused to fire on strikers in Petrograd and the tsar abdicated; the Bolsheviks took power in November and in March 1918 signed the Treaty of Brest-Litovsk, surrendering, by one estimate, a third of Russia's population and half its industry.

## Armistices and the Dead

Bulgaria signed an armistice on 29 September 1918, the Ottomans on 30 October, Austria-Hungary on 3 November. German sailors mutinied, a republic was proclaimed on 9 November, and the armistice took effect at 11 a.m. on 11 November. Four dynasties fell: Romanov, Hohenzollern, Habsburg and Ottoman.

Deaths numbered 15–22 million, of whom 9–11 million were soldiers and 6–13 million civilians. Germany lost about 2 million soldiers, Russia 1.7–2.25 million, France about 1.4 million, the British Empire about 1 million. Then the 1918–20 influenza pandemic, spread along troop movements, killed 17–50 million people, perhaps more: 12–17 million in India alone, and 22 per cent of Western Samoa's population in two months.

## The Peace Settlements

The **Treaty of Versailles**, signed on 28 June 1919, capped Germany's army at 100,000 men, turned its colonies into League of Nations mandates, and in Article 231 made Germany accept responsibility for the loss and damage caused by "the aggression of Germany and her allies", a clause written to found reparations. Reparations were set in 1921 at a nominal 132 billion gold marks, of which only about 50 billion was really expected; Germany paid about 20.6 billion. The US Senate never ratified the treaty. Other treaties carved up Austria-Hungary and the Ottoman Empire; Hungary lost 64 per cent of its population, and Poland, Czechoslovakia and Yugoslavia appeared on the map.

Was the peace too harsh? Keynes called it a "Carthaginian peace", and Foch said it was "an armistice for twenty years". Others reply that Germany kept its unity, that Correlli Barnett found it lenient beside Brest-Litovsk, and that it freed Poles, Czechs and others. At Paris, too, Japan proposed a clause on racial equality. Eleven of the seventeen delegates present voted for it and none against, but Wilson, chairing, ruled that it needed unanimity; Australia's Billy Hughes had led the opposition.

## 1919: The Wilsonian Moment

Wilson's Fourteen Points promised that in settling colonial claims "the interests of the populations concerned must have equal weight" with those of the governments. Erez Manela's *The Wilsonian Moment* treats four upheavals of 1919 as one story. In **Egypt**, when Britain arrested the nationalist leader Saad Zaghlul for seeking a hearing in Paris, Muslims and Copts, men and women, rose together, and at least 800 were killed. In **India**, the Rowlatt Satyagraha protests were followed in April by the massacre at Jallianwala Bagh in Amritsar, which the chapter on the British Empire describes. In **Korea**, a Declaration of Independence was read in Seoul on 1 March 1919, and between 800,000 and 2 million people joined the protests that followed; Japanese repression killed between 798 and 7,509, depending on whose count is used. In **China**, news that Versailles had given Germany's Shandong rights to Japan brought thousands of students to Tiananmen on 4 May shouting "Give Qingdao back to us!"; the Chinese delegation refused to sign, and two of the movement's figures, Chen Duxiu and Li Dazhao, went on to found the Chinese Communist Party in 1921. In Paris, Vietnamese patriots petitioned the Allied leaders under the pen name Nguyễn Ái Quốc, whose public face was the future Ho Chi Minh; they were ignored.

Scholars debate whether Wilson ever meant self-determination to apply beyond the defeated empires. Manela's argument is that the disappointment itself mattered: it turned many nationalists towards radical anticolonialism and Soviet-style Marxism.

```checkpoint
q: What does Erez Manela mean by the "Wilsonian moment"?
a: The moment the United States entered the war in April 1917.
x: Manela's term refers to 1919 and the colonial world, not to American entry.
a*: The rise and disappointment, in 1919, of hopes in Egypt, India, China and Korea that Wilson's language of self-determination would apply to them.
a: Wilson's successful campaign to have the US Senate ratify Versailles.
x: The US Senate never ratified the treaty.
a: The adoption of Japan's racial equality proposal at Paris.
x: Wilson ruled that the proposal needed unanimity, so it was not adopted.
hint: Think of Cairo, Seoul and Tiananmen in 1919.
why: Manela argues that the failure of these hopes radicalised anticolonial nationalism.
---
q: Why are the figures for Germans killed by the Allied blockade disputed?
a: Because Germany kept no records of civilian deaths.
x: There were German reports and studies; the problem is how to interpret them.
a: Because the blockade ended in 1915.
x: It continued until mid-1919, after the armistice.
a: Because historians agree the blockade caused no deaths.
x: All estimates count hundreds of thousands of deaths; they disagree on how many.
a*: Because later studies revised the December 1918 German claim of 763,000 sharply downward, and hunger deaths are hard to separate from influenza.
hint: Compare the 1918 report with the 1928 study.
why: Casualty figures are arguments as well as numbers, and the blockade's toll fed postwar German politics.
```

## Poets, Dada and the Shattered Aesthetic

**Wilfred Owen** drafted "Dulce et Decorum est" in 1917, aiming it at the pro-war versifier Jessie Pope; he was killed a week before the armistice.

```quote
My friend, you would not tell with such high zest / To children ardent for some desperate glory, / The old Lie: Dulce et decorum est / Pro patria mori.
Wilfred Owen · Dulce et Decorum est · drafted 1917, published 1920
```

In neutral Zürich in 1916, Hugo Ball and Emmy Hennings founded the Cabaret Voltaire, where **Dada** was born: a protest against war, nationalism and conformity that used nonsense, chance and ridicule, and soon spread to Berlin, Paris and New York.

## Further exploration

- **Robert Gerwarth and Erez Manela (eds), *Empires at War: 1911–1923* (2014).** The war as a conflict of empires, empire by empire, over a longer span than 1914–18.
- **Eugene Rogan, *The Fall of the Ottomans: The Great War in the Middle East* (2015).** The Middle Eastern war told with Arab and Turkish sources.
- **Yiğit Akın, *When the War Came Home: The Ottomans' Great War and the Devastation of an Empire* (2018).** The Ottoman home front and its civilians.
- **Edward Paice, *Tip and Run: The Untold Tragedy of the Great War in Africa* (2007).** The East African campaign and the carriers who bore its cost.
- **Xu Guoqi, *Strangers on the Western Front: Chinese Workers in the Great War* (2011).** The Chinese labourers in France and what their service meant for China.
- **Santanu Das, *India, Empire, and First World War Culture: Writings, Images, and Songs* (2018).** Indian soldiers' and civilians' experience of the war.
- **Christopher Clark, *The Sleepwalkers: How Europe Went to War in 1914* (2012).** The July Crisis as shared, contingent decision-making.$mn_ww1_master$,
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
  select $mn_ww1_quiz$[
    {"type": "mcq", "prompt": "What was the 'blank cheque' of July 1914?", "options": ["Germany's assurance to Austria-Hungary that it could count on Germany's full support against Serbia, even if grave European complications followed", "Britain's promise to pay for France's war", "The reparations Germany agreed to pay in 1921", "Russia's promise to Serbia that it would not mobilise"], "answerIndex": 0, "explanation": "On 5 July 1914 Wilhelm II told the Austrian ambassador that Austria-Hungary could 'count on Germany's full support' even if 'grave European complications' ensued.", "id": "q1"},
    {"type": "mcq", "prompt": "Which statement best describes the carriers of the East African campaign?", "options": ["A few thousand volunteers who suffered light losses", "European soldiers who carried Lettow-Vorbeck's supplies", "Hundreds of thousands of African men, many conscripted, of whom an estimated 90,000–95,000 died", "Chinese labourers brought to Africa by France"], "answerIndex": 2, "explanation": "The British Carrier Corps alone recruited or conscripted over 400,000 men; deaths among the British side's carriers alone are estimated at about 90,000–95,000, among them 45,000 Kenyans.", "id": "q2"},
    {"type": "mcq", "prompt": "Why did students march to Tiananmen on 4 May 1919?", "options": ["To celebrate China's victory in the war", "Because the Versailles settlement handed Germany's rights in Shandong to Japan rather than back to China", "To demand that China declare war on Germany", "To protest against the Chinese Labour Corps' low pay"], "answerIndex": 1, "explanation": "Article 156 of Versailles transferred Germany's Shandong rights to Japan; students shouted 'Give Qingdao back to us!' and the Chinese delegation refused to sign.", "id": "q3"},
    {"type": "mcq", "prompt": "What happened to Japan's racial equality proposal at the Paris Peace Conference?", "options": ["It was rejected by a large majority of the commission", "It was adopted and written into the League Covenant", "Japan withdrew it before any vote", "A majority of the commission voted for it, but Wilson ruled that it required unanimity"], "answerIndex": 3, "explanation": "On 11 April 1919, 11 of 17 delegates voted for it with none against, but Wilson, chairing, ruled that unanimity was required; Australia's Billy Hughes had led the opposition.", "id": "q4"},
    {"type": "open", "prompt": "Explain the main positions in the debate over the causes of the First World War.", "rubric": "A strong answer covers Versailles's Article 231 and the German Foreign Ministry's edited document volumes of the 1920s; Fritz Fischer's 1961 argument that Germany's leaders deliberately sought a war of expansion, Ritter's defence, and Röhl's 1973 observation that most accepted Germany's main responsibility and the later view, noted by Mombauer, that few accepted premeditation; other emphases (Taylor's railway timetables, Williamson on Austro-Hungarian elites, McMeekin on Russia, Ferguson on British blunders); Clark's Sleepwalkers (2012) spreading responsibility among powers that risked but did not seek a general war, and critics such as Wehler and Mombauer who say it relativises deliberate decisions in Berlin and Vienna. It should recognise that the debate is unsettled.", "id": "q5"},
    {"type": "open", "prompt": "In what ways was the First World War a global war rather than a European one?", "rubric": "A strong answer discusses fighting beyond Europe (the Ottoman fronts at Gallipoli, the Caucasus, Mesopotamia and Palestine; the Arab Revolt; East Africa and earlier campaigns in Togoland and Kamerun; Japan's siege of Qingdao); colonial soldiers and labourers (about 1.3 million Indians, some 200,000 tirailleurs sénégalais, about 90,000 Indochinese, about 140,000 Chinese labourers, African carriers); civilian catastrophes such as the Armenian genocide and famines in Lebanon and East Africa; and the global aftermath of 1919, the Wilsonian moment in Egypt, India, Korea and China, and the Racial Equality Proposal. Figures should be given as estimates or ranges.", "id": "q6"}
  ]$mn_ww1_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/20th-century-history/world-wars/the-first-world-war-ww1', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

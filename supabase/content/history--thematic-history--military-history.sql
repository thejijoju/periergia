-- Military History — canonical master article, co-written and human-reviewed.
-- history/thematic-history/military-history @ research/advanced/read.
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
    'history/thematic-history/military-history',
    'research',
    'advanced',
    'read',
    $mn_milhist_master$> **War from Napoleon to the age of genocide, and how historians study it.** From the French Revolutionary Wars to the end of the twentieth century there was organised fighting somewhere in almost every year, and in every year if colonial, civil and frontier conflicts are counted. This chapter follows that history across the globe, from the Napoleonic Wars and colonial "small wars" through Paraguay, the Taiping war and the rehearsals of industrial war to the world wars and the proxy wars, civil wars and genocides after 1945, with conscription, logistics, the laws of war and memory along the way. It ends with the field of military history itself and its great debates: military revolutions, a "Western way of war", war and the state, and whether war is declining.

## Counting Wars, Counting the Dead

It is often said that there was a war somewhere in every single year of the nineteenth and twentieth centuries. Whether that is true depends on what counts as a war. Our World in Data finds no year without *armed conflict* for centuries, but under a stricter definition of war there have been between none and twelve active wars a year, and counting only wars between states, many years had none. The safe statement is: almost every year, and every year once colonial, civil and frontier conflicts are included.

Definitions matter because the main datasets use different thresholds. The **Correlates of War** project, begun in 1963 by the political scientist J. David Singer, lists wars from 1816 and counts a conflict as a war only when at least 1,000 combatants die in battle within a twelve-month period. The **Uppsala Conflict Data Program**, whose armed-conflict data run from 1946, counts an "armed conflict" from just 25 battle-related deaths in a year where at least one side is a state, and in later series also records fighting between non-state groups and "one-sided violence" against civilians.

Death tolls are just as slippery. Records are incomplete and evidence destroyed; for the Napoleonic Wars, calculating losses is to a large extent guesswork. Estimates for the Napoleonic Wars alone run from about 3 to 7 million dead. Numbers get revised: an official estimate of 1832 put French military dead at 1.7 million, but Jacques Houdaille, sampling muster rolls and civil registers, found 900,000 to a million, with roughly two non-combat deaths for every death in combat. Throughout the nineteenth century disease usually killed more soldiers than battle did.

## From the Nation in Arms to the Concert of Europe

The French Revolution changed who fought. On 23 August 1793 the National Convention decreed the ***levée en masse***, requisitioning unmarried able-bodied men aged 18 to 25 and summoning the whole nation to the war effort.

```quote
The young men shall fight; the married men shall forge arms and transport provisions; the women shall make tents and clothes and shall serve in the hospitals; the children shall turn old linen into lint.
National Convention · Decree of the levée en masse (English translation) · 23 August 1793
```

The army reached about 1.5 million by September 1794, though its real fighting strength probably never exceeded 800,000. The Jourdan Act of 1798 made conscription permanent; its first article declared that "Any Frenchman is a soldier and owes himself to the defense of the nation", and more than 2.6 million men were inducted between 1800 and 1813. The *levée* is often said to have opened the age of total war, replacing the limited "cabinet wars" of 1715–1792. The Napoleonic Wars spread mass conscription and guerrilla warfare; Spain alone lost more than 586,000 people including civilians. Britain, with about 16 million people against France's 30 million, made up the difference with industry and money. The chapter on Napoleon and the Remaking of Europe tells the campaigns themselves.

After 1815 the great powers tried to prevent another such war. The **Concert of Europe**, built at the Congress of Vienna and dominated by Austria, France, Prussia, Russia and Britain, was an understanding to maintain the balance of power and existing boundaries. Scholars dispute whether it fell apart in the 1820s or survived until 1914. It did not stop the Crimean War, the first war between great powers since Napoleon, nor the wars of Italian and German unification. And in its later phase it eased the growth of European control in Africa and Asia without wars between the great powers. Peace in Europe and war in the colonies went together.

## The Century of "Small Wars"

The British officer C. E. Callwell gave colonial fighting a name in *Small Wars: Their Principles and Practice* (1896, revised 1899 and 1906). By "small wars" he meant not small in scale but, roughly, every campaign in which regular troops did not face regular troops on both sides: in practice, campaigns against non-Western armies, guerrillas and "bandits". The IRA later read it. By 1914 the armies of continental Europe relied on mass conscription at home (Britain was the main exception), while colonial powers such as France fought overseas mainly with professional units.

Those on the receiving end were not passive. In West Africa the **Agojie**, the all-female Fon regiment of the Kingdom of Dahomey, numbered between 1,000 and 6,000 at their peak and fought the French from 1890 under King Béhanzin until they were disbanded in 1894. In India in 1857 Rani Lakshmi Bai made Jhansi a centre of the great rebellion against Company rule. In South Africa the British war against the Boers (1899–1902) ended with camps in which between 18,000 and 26,000 Boer internees, mostly women and children, died, alongside separate camps for Black Africans. The chapters on the British Empire and on Imperial Expansion and Resistance follow these wars, the Maxim gun, Omdurman and Adwa; for much of the world this "peaceful" century was a century of conquest.

## Latin America and China: The Deadliest Wars

The Spanish American wars of independence ran from 1808 to 1833 (see the chapter on Latin American Independence); the death toll is very uncertain, though some estimates put it around a million. Later came the Mexican–American War (1846–1848) and the War of the Pacific (1879–1884), in which Chile fought Bolivia and Peru.

The **Paraguayan War** (1864–1870), in which Paraguay fought Argentina, Brazil and Uruguay, is often described as the deadliest war between states in Latin American history. Paraguay's leader, Francisco Solano López, was killed at Cerro Corá on 1 March 1870. Paraguay's losses are hotly disputed. Fourteen estimates of its pre-war population range from 300,000 to 1,337,000. Vera Blinn Reber argued in 1988 that the losses had been "enormously exaggerated", while Whigham and Potthast estimated that Paraguay fell from 420,000–450,000 people to 150,000–160,000 survivors, a loss of 60 to 69 per cent; Jan Kleinpenning put it lower, at 43 to 51 per cent. Older claims of 90 per cent losses rest on an 1857 census that modern scholarship has shown to be a government invention. Post-war counts, of disputed reliability, recorded far more women than men. Pinker has written that if more than 60 per cent died, it was proportionally one of the most destructive wars of modern times. The yerba mate harvest fell by as much as 95 per cent between 1865 and 1867. The chapter on Latin America after Independence tells the story in full.

In China the **Taiping war** (1850–1864) set the Qing dynasty against Hong Xiuquan's Heavenly Kingdom. It is often called the deadliest civil war in history; the usual conservative estimate is 20 to 30 million dead, some 5 to 10 per cent of China's population; much higher estimates are contested. The Taiping were defeated mainly by provincial armies such as Zeng Guofan's Xiang Army, alongside the Western-officered "Ever Victorious Army", later commanded by Charles George Gordon. The chapter on the Taiping Rebellion and the Late Qing describes the war. The century's deadliest war was fought not in Europe but in China.

## Rehearsals of Industrial War

The **Crimean War** (1853–1856), in which Britain, France, Sardinia and the Ottoman Empire fought Russia, was among the first wars to use explosive naval shells, railways and the telegraph, and among the first to be documented by reporters and photographers. It quickly symbolised logistical and medical failure. In every army disease killed more men than combat; Britain lost 22,182 dead, of whom only 4,602 died in combat. Allied dead totalled at least about 165,000 and Russian dead 450,000 to 630,000 (estimates vary widely), and nearly 200,000 Crimean Tatars were displaced. Florence Nightingale and the Jamaican nurse Mary Seacole cared for the wounded, and defeat pushed Russia towards the emancipation of the serfs in 1861.

In 1859 France moved its army into Piedmont in the first massive military use of railways, and won at Solferino. In 1866 Prussia beat Austria, helped by a denser railway network, the breech-loading Dreyse needle gun and a large reserve produced by three-year universal conscription. In 1870–1871 German armies captured Napoleon III at Sedan and the German Empire was proclaimed, at a cost of about 139,000 French and 45,000 German military dead and some 450,000 French civilian excess deaths. Meanwhile the **American Civil War** (1861–1865), described in its own chapter, killed roughly 700,000 to 750,000 soldiers. Railways, telegraph, rifled breech-loaders and machine guns, first Gatling's hand-cranked model and then Maxim's automatic one, were changing war everywhere. When Japan defeated Russia in 1904–1905, some scholars argue, it set in motion a change in world order, with Japan emerging as the main Asian power; the chapter on the Meiji Restoration describes how Japan's own conscription law of 1873 built that army.

## Conscription and Logistics

Mass armies required mass conscription. In Russia the abolition of serfdom in 1861 made universal male conscription possible in 1874, and by 1914 universal male service on broadly Prussian lines was the norm in continental Europe. Armies also had to be fed and moved, the subject of Martin van Creveld's *Supplying War* (1977). Britain's mobilisation of industry and credit against Napoleon, the supply tramway that had to be built from Balaclava to the Crimean siege lines, and the collapse of Paraguay's harvests all show wars decided in economies as much as on battlefields.

```checkpoint
q: Why can different studies disagree about how many wars took place in a given year?
a*: Because datasets use different definitions; the Correlates of War requires 1,000 battle deaths within twelve months, while Uppsala counts an armed conflict from 25 battle-related deaths.
a: Because no records of any nineteenth-century war survive.
x: Records survive but are incomplete; the problem is thresholds and definitions, not total absence.
a: Because historians agree on all wars but disagree about calendars.
x: The disagreement is about what counts as a war, not about dating.
a: Because only interstate wars are ever counted.
x: The datasets also count civil wars, and Uppsala counts non-state conflict and one-sided violence.
hint: Compare the death thresholds used by the two main datasets.
why: Whether there was war "in every year" depends on whether colonial, civil and small conflicts are counted.
---
q: What is the best-supported statement about Paraguay's losses in the war of 1864–1870?
a: That exactly 90 per cent of Paraguayans died, as the 1857 census proves.
x: The 1857 census behind the 90 per cent figure has been shown to be a government invention.
a: That losses were negligible because the war was fought abroad.
x: Much of the war was fought in Paraguay, and post-war counts recorded far more women than men.
a*: That losses are hotly disputed, with Whigham and Potthast estimating 60 to 69 per cent and Reber arguing they were exaggerated.
a: That it was the deadliest civil war in history.
x: It was an inter-state war; the Taiping war is the one often called the deadliest civil war.
hint: Think about the pre-war population estimates.
why: Fourteen estimates of the pre-war population range from 300,000 to 1,337,000, so the proportion lost cannot be fixed precisely.
```

## Total War and the World Wars

The phrase "total war" seems to have arisen among French writers during the First World War; Léon Daudet published *La Guerre totale* in 1918, and Erich Ludendorff *Der totale Krieg* in 1935. The historian Stig Förster identifies four dimensions: total aims, total methods, total mobilisation and total control. When it began is debated. David A. Bell traces it to the French Revolutionary Wars (*The First Total War*, 2007); others point to the American Civil War, which Mark Neely questioned in "Was the Civil War a Total War?" (1991), or to the wars of 1861–1871 together. The Second World War has been called the quintessential total war of modernity.

The world wars killed on an unprecedented scale: some 15 to 22 million in the first, and about 60 to 75 million in the second, by some estimates more than 80 million. The chapters on the First and Second World Wars, and on the Holocaust, tell that history, including the soldiers and labourers from India, Africa, China and the Pacific. Women served as never before. Russia's Provisional Government raised Women's Battalions in 1917, the first commanded by Maria Bochkareva, and more than 800,000 women served in the Soviet armed forces in the Second World War, mostly as medics and nurses; 89 became Heroes of the Soviet Union, as pilots, snipers, machine gunners, tank crew and partisans.

## After 1945: Proxy Wars, Civil Wars and Genocides

In 1986 John Lewis Gaddis called the post-war decades the **"Long Peace"**, meaning the absence of war between the great powers. Much of the world saw it differently. Since 1945 wars between states have declined in number and deadliness, and most fighting has been in civil wars and insurgencies, many of them proxy wars, in which one side is directed or supported by an outside power. The Korean War, which ended in an armistice in 1953, killed about a million soldiers and an estimated 1.5 to 3 million civilians. In Nigeria's civil war (1967–1970) between 500,000 and 2 million Biafran civilians starved under a deliberate blockade, by one estimate. In Bangladesh in 1971 Pakistani soldiers and allied militias killed between 300,000 and 3 million Bengalis and raped 200,000 to 400,000 women, and about 10 million refugees fled to India. In Cambodia, 1.5 to 2 million people, a fifth to a quarter of the population, died under the Khmer Rouge before Vietnam's invasion ended its rule in 1979. In Rwanda in 1994, between 500,000 and 662,000 Tutsi were murdered in about a hundred days. Interstate wars did not vanish either, from Iran–Iraq (1980–1988) to the Russo-Ukrainian War. The chapters on the Global Cold War and the Arms Race and on Modern Conflicts since 1991 continue the story.

{{image: Henry Dunant | Henry Dunant, author of A Memory of Solferino (1862), shared the first Nobel Peace Prize in 1901.}}

## The Laws of War

Henry Dunant witnessed the aftermath of Solferino and in 1862 published *A Memory of Solferino* at his own expense. Fourteen states met in Geneva in 1863, and in 1864 twelve signed the First Geneva Convention; the Ottoman Empire acceded to it in 1865. The Lieber Code of 1863, drafted for the Union army, was the first official comprehensive codification of the laws of war. In 1868 the Saint Petersburg Declaration renounced explosive projectiles under 400 grams and affirmed that the only legitimate object of war is to weaken the enemy's armed forces. The Hague Conventions of 1899 and 1907, where Lu Zhengxiang represented China (leading its delegation in 1907), were among the first formal statements of the laws of war in secular international law, and the 1925 Geneva Protocol banned chemical and biological weapons. Many of the rules were broken in the First World War. After the Second came the four Geneva Conventions of 1949, now ratified by 196 states, and in 1977 a protocol covering civil wars, by then the commonest kind.

## Remembering War

Britain and France honoured unknown soldiers on Armistice Day 1920, and the United States and Portugal followed in 1921; New Zealand's main day of remembrance is Anzac Day, 25 April. Memory divides as well as unites. Japan's Yasukuni Shrine, founded in 1869 after the Boshin War, lists nearly 2.5 million dead, including Koreans and Taiwanese who served Japan and 1,068 convicted war criminals, 14 of them Class A, and it remains highly controversial in East Asia. Jay Winter's *Sites of Memory, Sites of Mourning* (1995) studies how Europeans mourned the Great War.

## How Historians Study War

Writing about war is as old as history: Herodotus and Thucydides in Greece, the *Arthashastra* in India, *The Art of War* and Sima Qian's account of the Warring States in China. *The Art of War*, attributed to Sunzi (Sun Tzu) and dated to roughly the fifth century BC, treats war as a matter of vital importance to the state; whether Sunzi existed has been questioned since about the twelfth century. It reached Europe through the Jesuit Jean Joseph Marie Amiot's translation of 1772, and Mao Zedong quoted its advice to "know your enemy and know yourself" (in an English translation of Mao's text). Carl von Clausewitz left *On War* unfinished at his death in 1831; his widow Marie von Brühl published it from 1832.

```quote
Der Krieg ist eine bloße Fortsetzung der Politik mit anderen Mitteln.
Carl von Clausewitz · Vom Kriege (On War), Book I, Chapter 1 · 1832 (modern spelling)
```

Translations vary: "war is merely the continuation of policy by other means" in the Howard and Paret version, or "the continuation of policy with other means". The German *Politik* means both "policy" and "politics", so the line can be read as subordinating war either to state aims or to political life more broadly.

Within universities the subject was long disdained; in 1980 William H. McNeill wrote that it "flourishes in an intellectual ghetto". From the 1960s a **"new military history"** widened the field from battles, campaigns and commanders to ordinary soldiers, institutions and the societies that waged war. Michael Howard, who helped found War Studies at King's College London, studied how armies reflected their societies (*The Franco-Prussian War*, 1961) and warned that the past offers no easy lessons. John Keegan, a lecturer at Sandhurst, asked in *The Face of Battle* (1976) what combat was actually like for soldiers at Agincourt, Waterloo and the Somme, and argued in *A History of Warfare* (1993) that war is cultural; Howard and others criticised his reading of Clausewitz. Cynthia Enloe showed how militarisation depends on women's labour and on ideas about gender (*Does Khaki Become You?*; *Bananas, Beaches and Bases*, 1989). Jeremy Black lists the field's inherited faults, including Eurocentrism, a bias towards technology and a focus on the leading powers and on war between states.

## Military Revolutions and the "Western Way of War"

In 1955 Michael Roberts proposed a **"military revolution"** in Sweden and the Netherlands between 1560 and 1660; Geoffrey Parker challenged and recast it around the *trace italienne* fortress and argued (1988) that it helped small European powers conquer much of the world. Critics such as Jeremy Black answered that the key period was later and that state growth drove army growth rather than the reverse; Clifford Rogers saw a series of revolutions, and Jason Sharman (*Empires of the Weak*, 2019) joined the critics. The chapter on the Rise of Absolutism places the debate in its European setting.

Marshall Hodgson and William McNeill called the Ottoman, Safavid and Mughal states "gunpowder empires", an explanation Douglas Streusand finds neither adequate nor accurate. Kenneth Chase argued that early guns were of little use against mounted steppe nomads, so China had less reason than Europe or Japan to improve them, a view criticised as geographical determinism. Tonio Andrade's *The Gunpowder Age* (2016) finds that China held its own with Europe except between 1839 and 1945, and that a "Great Military Divergence" opened only from the mid-eighteenth century, partly because China enjoyed relative peace after about 1760. John Thornton's *Warfare in Atlantic Africa* (1999) took African armies seriously on their own terms (see also the chapter on Kongo, Asante and Dahomey).

Victor Davis Hanson argued in *The Western Way of War* (1989) and *Carnage and Culture* (2001) that Western military success stems from a culture inherited from the Greeks: citizen soldiers, decisive battle and consensual government. John A. Lynn's *Battle* (2003) rejects any continuous Western way of war and the matching "Oriental way of war" posited by Keegan and Hanson, noting that its supposed features have parallels in European history.

## War, the State and the Decline of War

Charles Tilly argued, in a dictum usually paraphrased as war making states and states making war, that the costs of fighting drove the formation of European states. Critics call the model Eurocentric. Miguel Centeno's *Blood and Debt* (2002) turned it around for Latin America: because the region fought limited wars, financed by customs revenues and foreign loans rather than by building strong fiscal bureaucracies, its states stayed comparatively weak.

Pinker's *The Better Angels of Our Nature* (2011) and Joshua Goldstein treat the Long Peace as part of a long decline in violence. Bear Braumoeller's *Only the Dead* (2019) finds no decline in the rate at which international wars begin over two centuries, and stresses chance and clashes between rival international orders. The chapter on Modern Conflicts since 1991 sets out the statistical arguments; the Biafran, Bengali, Cambodian and Rwandan dead are a reminder of why the question matters.

```checkpoint
q: What did the "new military history" from the 1960s add to the field?
a: A focus on generals' decisions in famous battles only.
x: That was the older "drum and trumpet" history it moved beyond.
a*: Attention to ordinary soldiers, military institutions and the societies that waged war.
a: The first study of war in any culture outside Europe.
x: Writing on war is ancient in India and China, from the Arthashastra to The Art of War.
a: A rule that only statistical datasets may be used.
x: Its practitioners, such as Howard and Keegan, were historians of society and experience, not data compilers.
hint: Think of Keegan's question about what combat was like for the men who fought.
why: The new military history widened the field from campaigns and commanders to soldiers and society.
---
q: What does Bear Braumoeller's Only the Dead (2019) argue?
a: That the Long Peace proves war has ended.
x: Braumoeller is a leading critic of the decline-of-war thesis.
a: That war made the state and the state made war.
x: That paraphrases Charles Tilly's argument about European state formation.
a: That China fell behind Europe militarily because of the steppe nomads.
x: That is Kenneth Chase's argument about early firearms.
a*: That the rate at which international wars begin has not declined over two centuries.
hint: He is usually set against Steven Pinker.
why: Braumoeller stresses chance and clashes between rival international orders rather than a steady decline.
```

## Further exploration

- **John Keegan, *The Face of Battle* (1976).** The classic study of what combat was like at Agincourt, Waterloo and the Somme.
- **Michael Howard, *War in European History* (1976; rev. 2009).** A short classic linking war to society and the state.
- **Wayne E. Lee, *Waging War: Conflict, Culture, and Innovation in World History* (2015).** A global survey of military innovation from prehistory to the Islamic State.
- **Tonio Andrade, *The Gunpowder Age: China, Military Innovation, and the Rise of the West in World History* (2016).** China in the global history of gunpowder warfare.
- **John K. Thornton, *Warfare in Atlantic Africa, 1500–1800* (1999).** African armies and military culture in the era of the slave trade.
- **David A. Bell, *The First Total War: Napoleon's Europe and the Birth of Warfare as We Know It* (2007).** Total war's revolutionary origins.
- **Bear F. Braumoeller, *Only the Dead: The Persistence of War in the Modern Age* (2019).** The first book-length critique of the decline-of-war thesis.$mn_milhist_master$,
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
  select $mn_milhist_quiz$[
    {"type": "mcq", "prompt": "What death threshold does the Correlates of War project use to count a conflict as a war?", "options": ["At least 1,000 battle deaths within a twelve-month period", "At least 25 battle-related deaths in a year", "At least 100,000 deaths in total", "Any conflict involving two great powers"], "answerIndex": 0, "explanation": "The Uppsala Conflict Data Program, by contrast, counts an armed conflict from 25 battle-related deaths in a year, which is why counts of 'wars' differ.", "id": "q1"},
    {"type": "mcq", "prompt": "Which estimate of deaths in the Taiping war (1850–1864) is the usual conservative figure?", "options": ["About 750,000", "About 4 to 7 million", "About 20 to 30 million", "Exactly 100 million"], "answerIndex": 2, "explanation": "The 20–30 million range is some 5–10 per cent of China's population; much higher estimates are contested.", "id": "q2"},
    {"type": "mcq", "prompt": "Why do historians reject the claim that 90 per cent of Paraguayans died in the war of 1864–1870?", "options": ["Because Paraguay was not a belligerent", "Because Brazil's records show almost no Paraguayan deaths", "Because the war lasted only a few months", "Because the figure rests on an 1857 census that modern scholarship shows was a government invention"], "answerIndex": 3, "explanation": "Estimates now run from Reber's low figures to Whigham and Potthast's 60–69 per cent; the war is often called the deadliest war between states in Latin American history.", "id": "q3"},
    {"type": "mcq", "prompt": "What did Henry Dunant's A Memory of Solferino (1862) help bring about?", "options": ["The Concert of Europe", "The First Geneva Convention, signed by twelve states in 1864", "The Lieber Code for the Union army", "The levée en masse"], "answerIndex": 1, "explanation": "Fourteen states met in Geneva in 1863; the Convention followed in 1864, and the Ottoman Empire acceded to it in 1865. Dunant shared the first Nobel Peace Prize in 1901.", "id": "q4"},
    {"type": "open", "prompt": "Was the period after 1945 a 'long peace'?", "rubric": "A strong answer explains Gaddis's term (1986) as the absence of great-power war; sets against it the proxy and civil wars and genocides of the period (Korea, Biafra, Bangladesh 1971, Cambodia, Rwanda) and continuing interstate wars; notes that most post-1945 fighting was in civil wars and insurgencies; and weighs the decline-of-war thesis of Pinker and Goldstein against Braumoeller's finding of no decline in the initiation of international wars, mentioning how dataset definitions (Correlates of War, Uppsala) shape the answer.", "id": "q5"},
    {"type": "open", "prompt": "How have historians challenged a Eurocentric military history?", "rubric": "A strong answer discusses the shift from battle history to the new military history (Howard, Keegan) and Black's list of the field's biases; the military revolution debate (Roberts, Parker and critics such as Black and Sharman); global studies such as Andrade on China and the 'Great Military Divergence', Chase on firearms and steppe nomads, Thornton on Atlantic Africa, and the 'gunpowder empires' label and Streusand's critique; Lynn's rejection of Hanson's 'Western way of war'; Centeno's Latin American critique of Tilly; and gender (Enloe, the Agojie, Soviet women soldiers). It may note that the nineteenth century's deadliest war, the Taiping war, was fought outside Europe.", "id": "q6"}
  ]$mn_milhist_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/thematic-history/military-history', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

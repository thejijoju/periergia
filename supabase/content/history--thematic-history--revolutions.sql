-- Revolutions in Comparison — canonical master article, co-written and human-reviewed.
-- history/thematic-history/revolutions-in-comparison @ research/advanced/read.
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
    'history/thematic-history/revolutions-in-comparison',
    'research',
    'advanced',
    'read',
    $mn_revolutions_master$> **What makes a revolution, and do revolutions follow a pattern?** This chapter does not retell the great upheavals, which other chapters cover; it sets them side by side. It traces the word itself, compares the Atlantic revolutions from Paris to Saint-Domingue and the Andes and the European wave of 1848, and follows the theorists, generation by generation, from Tocqueville and Marx through Brinton, Arendt, Moore and Skocpol to Tilly, Goldstone and today's students of unarmed uprisings, testing their ideas against Russia, China, Cuba, Iran and others, against hard cases such as the Taiping and Meiji Japan, and against the crowds of Manila, Prague and Tunis.

## A Word That Turned Around

"Revolution" comes from the Latin *revolutio*, "a turn around". When the word entered French in the thirteenth century and English in the late fourteenth, it described the circling of heavenly bodies, as in the title of Copernicus's *De revolutionibus* of 1543. A sense of abrupt change in the social order appears in the mid-fifteenth century but became common only in the seventeenth.

Even then it could point backwards. Hannah Arendt argued in *On Revolution* (1963) that the word long kept its sense of a cyclical return: in seventeenth-century England "revolution" still meant a turning back, a restoration, in 1660, when the monarchy returned, and again in 1688. The modern sense, a break that cannot be undone, is traditionally illustrated by an exchange on the night of 14–15 July 1789, when the duc de La Rochefoucauld-Liancourt brought Louis XVI news of the fall of the Bastille. "Is it a revolt?" the king asked; "No, Sire, it is a revolution." The wording varies between sources and the story's authenticity is not established.

Scholars still disagree about what the word should cover. A broad definition often given in reference works is a rapid, fundamental transformation of a society's class, state, ethnic or religious structures. Jack Goldstone's broader definition is an effort to transform political institutions and the justifications for authority, accompanied by mass mobilisation and "noninstitutionalized actions that undermine authorities". That includes the largely peaceful revolutions of 1989 but excludes coups and revolts that make no effort to transform institutions, and gradual transitions such as Spain's after Franco. Charles Tilly set the "great revolution", which transforms social and economic structures as well as politics, as in France in 1789, Russia in 1917 and Iran in 1979, apart from coups, civil wars and revolts.

## The Atlantic Age in Comparison

The first great wave, the "Age of Revolution", was a name popularised by Eric Hobsbawm's *The Age of Revolution: Europe 1789–1848* (1962). Hobsbawm saw a "dual revolution", political in France and industrial in Britain, as the midwife of the modern world. The wider wave, as the chapter on The Age of Revolutions (c. 1760–1850) describes, ran from the United States and Poland–Lithuania to France, Haiti, Ireland and Spanish America, and its revolutionaries knew of and partly copied one another. In 1955 the American historian R. R. Palmer and the French historian Jacques Godechot presented a joint thesis of a single "Atlantic revolution". Launched in the Cold War, the thesis met hostility from much of French historiography.

Comparison shows how differently the revolutions treated the people at the bottom. The most radical was the Haitian Revolution. Begun by the enslaved in August 1791 and ending in independence on 1 January 1804, it is one of the only known slave rebellions to found a state free of slavery, though not of forced labour, and ruled by former captives. As the chapter on French and Haitian Revolutions shows, each revolution exposed the other's limits. The Trinidadian writer C. L. R. James made the case in *The Black Jacobins* (1938), arguing that liberty and equality "meant far more to them than to any Frenchman"; Edward Said wrote that in the book "events in France and in Haiti criss-cross and answer each other like voices in a fugue". The Haitian-American anthropologist Michel-Rolph Trouillot, in *Silencing the Past* (1995), called it "an unthinkable history", silenced in Western memory beside the French one.

Spanish America shows a third pattern, recounted in the chapter on Latin American Independence. After Napoleon's invasion of Spain in 1808, sovereignty "reverted" to juntas and town councils, and from 1810 attempts to rebuild authority turned into "mixed wars", at once civil, interstate and imperial, with Indigenous allies fighting on both sides. The links ran through Haiti. In 1816 Simón Bolívar, a wealthy Caracas creole, received military support from Haiti's president Alexandre Pétion after pledging to free slaves. José de San Martín crossed the Andes in 1817, secured Chile's independence in 1818 and declared Peru's independence in 1821; the two liberators met at Guayaquil in 1822, in a meeting whose content is still debated, and San Martín withdrew to France. The new republics abolished the Inquisition and noble titles, but creoles stayed at the top, and total abolition of slavery came in most countries only in the 1850s.

Historians have since widened the lens again. David Armitage and Sanjay Subrahmanyam's collection *The Age of Revolutions in Global Context, c. 1760–1840* (2010) set the Atlantic beside Bonaparte's army in Egypt, Java and Qing China.

## 1848: A Springtime That Failed?

The revolutions of 1848, the "springtime of the peoples", began in Sicily in January, spread after the February revolution in France and lasted into October 1849. Jonathan Sperber counts them the largest, most widespread and most violent political movement of nineteenth-century Europe; they reached more than fifty countries without significant coordination. Behind them lay repression after 1815 and an acute crisis: potato blight from 1845 and recession in 1847. Helge Berger and Mark Spoerer argue that "it was economic misery and the fear thereof that triggered them".

The coalitions of workers and middle-class reformers did not hold. In Paris the closure of the national workshops in June 1848 provoked the June Days, crushed by General Cavaignac; Alexis de Tocqueville, elected to the Constituent Assembly, supported the repression. Within a year and a half Prussia had seen a royal coup, French troops had ended the Roman Republic, and Hungary had surrendered to Austria and Russia, as the chapter on Nationalism and the Making of Nation-States describes.

Did 1848 fail? Not entirely. Serfdom was abolished in Austria and Hungary, absolute monarchy ended in Denmark, and France kept universal male suffrage; as the chapter on Abolition and Emancipation notes, France abolished slavery in its colonies that year. In New Granada, José Hilario López, in power from 1849, abolished slavery. Priscilla Robertson thought many of the revolutionaries' goals were achieved by the 1870s, largely by the revolutions' enemies. Christopher Clark sees a "revolution in government" afterwards, as states learned to manage the press and the public sphere.

## Founders: Hope or Misery?

Tocqueville's *The Old Regime and the Revolution* (1856) argued that the French Revolution, trying to break with the past, ended by restoring a powerful central government, and that revolutions come after improvement, not at the depths of oppression.

```quote
The regime that a revolution destroys is almost always better than the one that immediately preceded it, and experience teaches that the most dangerous time for a bad government is usually when it begins to reform.
Alexis de Tocqueville · The Old Regime and the Revolution (one English translation) · 1856
```

Karl Marx, by contrast, tied revolution to class struggle and the growing misery of the exploited. Writing on the French events of 1848 to 1850, he called revolutions "the locomotives of history". The argument between hope and misery runs on through James C. Davies's "J-curve" and Ted Robert Gurr's theory of relative deprivation.

Jack Goldstone has sorted later theory into "generations". The first was descriptive; the second, in the 1960s, looked to psychology and politics, with Gurr, Huntington and Tilly. The third was structural, led by Barrington Moore and Theda Skocpol. A fourth, from the late 1980s, has stressed agency, ideology, coalitions and large statistical datasets.

## Brinton's Anatomy and the Idea of Thermidor

The most influential search for a natural course was Crane Brinton's *The Anatomy of Revolution* (1938, revised 1952 and 1965), which compared England in the 1640s, America in 1775, France in 1789 and Russia in 1917, and likened revolutions to the progress of a fever. Old regimes, he found, showed similar symptoms: government deficits and complaints about taxes, a ruling class losing confidence in itself, intellectuals deserting the government. Revolutions were "born of hope" rather than misery.

His sequence ran from old regime to moderate regime to radical regime to Thermidor. After a "honeymoon", power passed "from Right to Center to Left". Moderates faced a rival, illegal authority, such as the Jacobin clubs, the soviets or the New Model Army, and the radicals won because they were "better organized, better staffed, better obeyed". Their rule was a reign of "Terror and Virtue". Brinton quoted the revolutionary Vergniaud: "the revolution, like Saturn, devours its children".

Then came convalescence. The original Thermidor, after Robespierre's fall on 27 July 1794, ended the Terror, closed the Jacobin Club and turned a "White Terror" on the left. Brinton called the New Economic Policy of 1921 "Russia's Thermidor" and dated England's to Cromwell's dissolution of the Rump. Trotsky had already denounced a "Soviet Thermidor" under Stalin in *The Revolution Betrayed* (1936). Its marks included a "tyrant" (Cromwell, Bonaparte, Stalin). The lasting results disappointed him: "The blood of the martyrs seems hardly necessary to establish decimal coinage."

The model shaped advice from Zbigniew Brzezinski to President Carter during the Iranian Revolution, but it rested on four Western cases, and Brinton admitted that America "does not quite follow this pattern". He declared in a later edition that "the Great Russian Revolution is quite over, finished", and he treated Haiti as a rare exception, remarking that "'Untouchables' very rarely revolt". He also conceded that the Industrial Revolution and the Meiji Restoration changed societies more lastingly than his four political revolutions.

## Arendt and the Social Question

Hannah Arendt's *On Revolution* compared the American and French revolutions and preferred the American. It aimed, she argued, at public freedom and a lasting constitution, whereas the French was swamped by the "social question" of mass poverty, which in her view unleashed violence. She admired the councils that arose spontaneously in revolutions, only to be suppressed by parties. Hobsbawm attacked her exclusion of non-Western revolutions, such as China's in 1911, and her "old-fashioned philosophical idealism"; others noted that her praise of America sidelined slavery and inequality.

```checkpoint
q: What did Crane Brinton mean by a revolution's "Thermidor"?
a*: The phase of convalescence after the radical regime, when terror ends and old habits and a strong ruler return.
a: The moment the old regime first faces tax revolts.
x: Tax complaints were among Brinton's symptoms of the old regime, at the start of his sequence, not its end.
a: The seizure of power by the radicals.
x: The radicals' triumph is the stage before Thermidor; Thermidor follows their fall.
a: The restoration of a monarchy.
x: Restorations sometimes came later, but Brinton's Thermidor is the reaction that follows the radical phase, named after the fall of Robespierre.
hint: Think of what happened in France on 9 Thermidor Year II.
why: Brinton's sequence ran from old regime to moderates to radicals to Thermidor, which he likened to recovery from a fever; he saw Russia's NEP of 1921 as its Thermidor.
---
q: How did Tocqueville's view of when revolutions break out differ from Marx's emphasis?
a: Tocqueville thought revolutions came only after defeat in foreign war.
x: That is closer to Skocpol's later stress on international pressure; Tocqueville pointed to improvement and reform.
a: Tocqueville thought revolutions came when the poor grew steadily poorer.
x: That is closer to the immiseration associated with Marx, the view Tocqueville's paradox challenges.
a*: Tocqueville argued that revolutions follow improvement, and that a bad government is most at risk when it begins to reform.
a: Tocqueville thought revolutions never succeeded in changing anything.
x: He argued that the French Revolution ended by restoring strong central government, but not that revolutions changed nothing.
hint: Think of rising expectations rather than deepening misery.
why: The "Tocqueville paradox" inspired later ideas such as Davies's J-curve and Gurr's relative deprivation, and Brinton's view that revolutions are "born of hope".
```

## Structures: Moore, Skocpol, Tilly and Goldstone

The twentieth century supplied new cases: Mexico from 1910, Russia in 1917, China's communist revolution, usually dated 1927 to 1949, Cuba, where Batista fled on 1 January 1959, and Ethiopia, where an army mutiny in January 1974 led to the Derg and the deposition of Haile Selassie that September. The chapters on The Mexican Revolution, The Soviet Union: History of the Soviet Empire, Modern China and Latin America in the Cold War tell these stories. Mao Zedong's Hunan report of 1927 put the case starkly: "A revolution is an insurrection, an act of violence by which one class overthrows another." C. L. R. James, adding an appendix "From Toussaint L'Ouverture to Fidel Castro" to *The Black Jacobins* in 1963, built a bridge from Haiti to Cuba.

Barrington Moore's *Social Origins of Dictatorship and Democracy* (1966) found three routes to the modern world: a liberal democratic route through "bourgeois revolution" (England, France and the United States, including its Civil War); a fascist route through "revolution from above" (Japan and Germany); and a communist route through peasant revolution (Russia and China). "No bourgeois, no democracy," he concluded, stressing the violence that preceded democracy. Later scholars found only limited support for his hypotheses; Valenzuela, for one, pointed out that Chile's landed elite supported democratisation.

Theda Skocpol's *States and Social Revolutions* (1979) compared France, Russia and China. Social revolutions, she argued, are "rapid, basic transformations of society's state and class structures", carried through in part by class-based revolts from below. They arise when agrarian states under international military pressure break down because landed elites resist the state's demands for resources, and peasant revolts then sweep the countryside. She endorsed the old abolitionist maxim that revolutions "are not made; they come"; England, Prussia and Japan served as negative cases, where no social revolution occurred. Critics said she neglected ideology and human choice, and Barbara Geddes found the theory failed when nine Latin American cases were added, a finding others dispute.

Tilly offered a different tool. In *From Mobilization to Revolution* (1978) he argued that a revolutionary situation means "multiple sovereignty", more than one bloc controlling a significant part of the state, an idea drawing on Trotsky's "dual power" in 1917 Russia. A revolutionary outcome is a transfer of state power, and situations can occur without outcomes. Goldstone's *Revolution and Rebellion in the Early Modern World* (1991) added demography: population growth on limited resources strained rigid institutions, producing state fiscal crisis, conflict within elites and the potential for mass mobilisation. The same causes, he argued, lay behind crises in England, France, the Ottoman Empire and China.

## Hard Cases: Taiping, Meiji and Iran

The Taiping (1850–1864), described in the chapter on The Taiping Rebellion and the Late Qing, sought the overthrow of the Qing and a general transformation of the state, at a cost of tens of millions of lives. Because it failed, Skocpol's terms make it a "rebellion" despite its revolutionary aims. Japan's Meiji Restoration of 1868 poses the opposite puzzle: a "restoration" that abolished the domains and eventually the samurai class's position. Moore saw it as a revolution from above leading towards fascism, and, as the chapter on The Meiji Restoration explains, its character has long been debated. Ellen Kay Trimberger's *Revolution from Above* (1978) set Meiji beside the Turkish War of Independence, Egypt in 1952 and Peru in 1968: takeovers by the old regime's own high officials, with little mass participation or violence, which, unlike a coup, destroyed the aristocracy's economic and political base.

Iran broke the theorists' expectations most sharply. As the chapter on The Making of the Modern Middle East shows, it came without defeat in war, financial crisis, peasant rebellion or a disaffected army, in a relatively prosperous country. The marches of 10–11 December 1978 drew 6 to 9 million people; Charles Kurzman, who called it *The Unthinkable Revolution in Iran* (2004), wrote that "even discounting for exaggeration, these figures may represent the largest protest event in history." Skocpol herself rethought her model in 1982: the social isolation of an oil-rentier state and the organisational and cultural resources of Shi'a Islam, she argued, allowed a revolution that was to a degree deliberately made. Iran, Nicaragua, where the Sandinistas overthrew the Somoza dictatorship in 1978–79 and lost power in the 1990 election, the Philippines and 1989 together launched Goldstone's fourth generation, with its stress on agency, ideology and coalitions.

## Unarmed Revolutions

Late in the century came revolutions by crowds rather than armies. In the Philippines in February 1986, over two million civilians ended Ferdinand Marcos's twenty-year dictatorship. In 1989, as the chapter on Collapse of the Soviet Union and Eastern Europe: the End of the Cold War describes, Poland's Solidarity and Czechoslovakia's Velvet Revolution brought down communist regimes, and the Baltic Way began the Baltic states' path to independence; only in Romania did violence overthrow the regime, and in China the protests ended in the crackdown of 4 June. The year is sometimes called the "Autumn of Nations", echoing 1848. The "colour revolutions" followed, from Serbia in 2000 to Georgia, Ukraine and Kyrgyzstan, mostly triggered by elections widely seen as rigged. They did not aim to redistribute property, and often failed to reduce corruption.

{{image: Baltic Way | The Baltic Way, August 1989: a human chain of about 675 kilometres, joined by perhaps two million people.}}

The Arab Spring began with the self-immolation of Mohamed Bouazizi in Sidi Bouzid, Tunisia, on 17 December 2010. Ben Ali fled in January 2011 and Mubarak resigned in February. The aftermath, followed in the chapter on The Post-Cold War Era, brought civil wars in Syria, Libya and Yemen, Bahrain's uprising crushed, and in Egypt the army's removal of the elected President Morsi in 2013. Tunisia was the success story until President Kais Saied's self-coup of July 2021.

Do unarmed revolutions work? Erica Chenoweth and Maria J. Stephan's *Why Civil Resistance Works* (2011) studied 323 violent and nonviolent campaigns from 1900 to 2006: 53 per cent of nonviolent campaigns succeeded against 26 per cent of violent ones, and nonviolent campaigns drew on average four times as many participants. Chenoweth later observed that nearly every campaign in the data that drew active participation of at least 3.5 per cent of the population succeeded. This "3.5% rule" comes with caveats Chenoweth stresses: it is a descriptive "rule of thumb", not a recipe, and some movements won with less. Critics point to Bahrain and Brunei, which passed the threshold and failed; Chenoweth notes that both were small monarchies with powerful foreign backers. Critics such as Alexei Anisin argue that the data omit failed nonviolent uprisings and count stone-throwing as "unarmed". In 2020 Chenoweth found that civil resistance had become more common in the 2010s but less effective, because states had grown savvier and movements relied on mass protest without prior organisation, coalition-building and discipline.

Mark Beissinger's *The Revolutionary City* (2022) traces a shift since 1900 from urban insurrection to rural social revolution and back to the city in "urban civic" revolutions, mostly nonviolent mobilisations in city centres that succeed more often and kill fewer, but producing regimes that are less durable and rarely deliver growth or reduce inequality. Steven Levitsky and Lucan Way find the reverse for violent revolutions: autocracies born of revolution, such as China, Cuba, Iran and Vietnam, last on average about three times as long as other autocracies. George Lawson's *Anatomies of Revolution* (2019) argues that revolutions are as international as they are national, and that theory has stalled even as events have multiplied.

```checkpoint
q: Why did the Iranian Revolution of 1978–79 trouble Theda Skocpol's 1979 theory?
a: Because Iran had just lost a major foreign war.
x: Iran came without defeat in war, which is exactly why it fitted the theory badly.
a*: Because it came without war, financial crisis, peasant revolt or army defection, and seemed in part deliberately made, which led Skocpol to rethink her model in 1982.
a: Because it was driven by a peasant revolt sweeping the countryside.
x: Iran lacked a peasant rebellion; its great mobilisations were urban marches.
a: Because it restored the monarchy.
x: The monarchy fell in February 1979 and an Islamic republic replaced it.
hint: Skocpol had endorsed the maxim that revolutions "are not made; they come".
why: In 1982 Skocpol pointed to the oil-rentier state's isolation and the resources of Shi'a Islam; Kurzman later called it "the unthinkable revolution".
---
q: Which statement about the "3.5% rule" is accurate?
a: It guarantees that any movement mobilising 3.5 per cent of a population will win.
x: Chenoweth calls it a descriptive rule of thumb, and critics point to Bahrain and Brunei, which passed the threshold and failed.
a: It was first proposed by Hannah Arendt in On Revolution.
x: It comes from Chenoweth's work of 2013, building on Mark Lichbach's suggestion of 5 per cent.
a: It shows that armed campaigns usually succeed more often than unarmed ones.
x: Chenoweth and Stephan found the opposite: 53 per cent of nonviolent campaigns succeeded against 26 per cent of violent ones.
a*: It describes a pattern in the data: nearly every campaign with active participation of at least 3.5 per cent of the population succeeded.
hint: Think of "rule of thumb", not law.
why: Critics also question the data, and Chenoweth's 2020 study found civil resistance becoming less effective in the 2010s.
```

## The Word's Wider Reach

The word has also spread far beyond politics. "Industrial revolution" was first recorded in 1799; Engels, in a book written in 1844–45 and published in 1845, used it for a revolution that "changed the whole of civil society", though economic historians question whether slow British growth deserves the name (see the chapter on The Industrial Revolution). V. Gordon Childe coined "Neolithic revolution" in 1936, a story told in the chapter on The Neolithic Revolution: Farming and Its Costs. The "Scientific Revolution" is contested: Steven Shapin began his 1996 book on it with "There was no such thing as the Scientific Revolution, and this is a book about it", as the chapter on The Scientific Revolution discusses. Mao's Cultural Revolution of 1966–1976, the subject of the chapter on The Cultural Revolution, made revolution a permanent purge launched from above.

Each use carries the political word's questions with it: whether change was sudden or slow, made or come, and who paid for it. C. L. R. James's warning applies to all of them: "Great men make history, but only such history as it is possible for them to make."

## Further exploration

- **Jack A. Goldstone, *Revolutions: A Very Short Introduction* (2014).** A short global survey by one of the leading theorists.
- **George Lawson, *Anatomies of Revolution* (2019).** Revolutions as international processes, with a critical history of theory.
- **Mark R. Beissinger, *The Revolutionary City: Urbanization and the Global Transformation of Rebellion* (2022).** A data-driven account of how revolutions have changed since 1900.
- **David Armitage and Sanjay Subrahmanyam (eds), *The Age of Revolutions in Global Context, c. 1760–1840* (2010).** The Atlantic age set beside Egypt, Java and Qing China.
- **Christopher Clark, *Revolutionary Spring: Fighting for a New World 1848–1849* (2023).** A panoramic history of 1848.
- **Michel-Rolph Trouillot, *Silencing the Past: Power and the Production of History* (1995).** Why the Haitian Revolution was "unthinkable".
- **Erica Chenoweth, *Civil Resistance: What Everyone Needs to Know* (2021).** An accessible account of unarmed revolution and its limits.$mn_revolutions_master$,
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
  select $mn_revolutions_quiz$[
    {"type": "mcq", "prompt": "What did the word \"revolution\" usually mean in seventeenth-century England, as Hannah Arendt stressed?", "options": ["A turning back, a restoration, as in 1660 and 1688", "A violent seizure of power by the poor", "A sudden scientific discovery", "A peasant uprising against landlords"], "answerIndex": 0, "explanation": "The word kept its astronomical sense of a cyclical return; as Arendt told it, its first political uses in England referred to restorations, in 1660 and again in 1688. The modern sense of an irreversible break spread with 1789.", "id": "q1"},
    {"type": "mcq", "prompt": "Which sequence did Crane Brinton find in The Anatomy of Revolution (1938)?", "options": ["Peasant revolt, state breakdown, social revolution", "Old regime, moderate regime, radical regime, Thermidor", "Reform, rising expectations, sudden setback", "Mass protest, election, democratic consolidation"], "answerIndex": 1, "explanation": "Comparing England, America, France and Russia, Brinton traced power passing from moderates to radicals and then to a 'Thermidor' of convalescence, though he admitted America did not quite fit.", "id": "q2"},
    {"type": "mcq", "prompt": "According to Theda Skocpol's States and Social Revolutions (1979), how do social revolutions arise?", "options": ["Through the plans of a disciplined revolutionary party", "Through rising expectations followed by a sudden setback", "When agrarian states under international military pressure break down and peasant revolts sweep the countryside", "Through peaceful mass protest in city centres"], "answerIndex": 2, "explanation": "Skocpol's structural theory, built on France, Russia and China, held that revolutions 'come' rather than being 'made'; she qualified this for Iran in 1982.", "id": "q3"},
    {"type": "mcq", "prompt": "What did Erica Chenoweth's 2020 study of nonviolent resistance find?", "options": ["That nonviolent campaigns had become almost always successful", "That the 3.5% rule had been proved a law", "That armed revolutions had become more effective than ever", "That civil resistance became more common in the 2010s but less effective"], "answerIndex": 3, "explanation": "Chenoweth pointed to savvier state responses and movements relying on mass protest without prior organisation, coalition-building and discipline; her data suggest armed resistance had also become less effective.", "id": "q4"},
    {"type": "open", "prompt": "Compare at least three theories of why revolutions happen, from Tocqueville and Marx to Brinton, Moore, Skocpol, Tilly and Goldstone, and test them against at least two revolutions.", "rubric": "A strong answer contrasts Marx's link between revolution and class struggle and misery with Tocqueville's paradox that revolutions follow improvement and reform, and Brinton's view that they are 'born of hope'; explains Moore's three routes to modernity ('No bourgeois, no democracy'), Skocpol's structural theory of state breakdown under international pressure plus peasant revolt (revolutions 'come', not 'made'), Tilly's 'multiple sovereignty' and the distinction between revolutionary situations and outcomes, and Goldstone's demographic-structural theory. It tests them against cases: France, Russia and China fit Skocpol; Iran (no war, no fiscal crisis, no peasant revolt) led Skocpol to rethink in 1982 and helped launch the 'fourth generation' stressing agency and ideology; the Taiping failed and so counts as a rebellion; Meiji Japan fits Trimberger's 'revolution from above'. Better answers note criticisms such as Geddes on Latin American cases and Hobsbawm on Arendt's Eurocentrism.", "id": "q5"},
    {"type": "open", "prompt": "Have unarmed revolutions, from the Philippines in 1986 and 1989 to the colour revolutions and the Arab Spring, changed what revolution means? Use the work of Chenoweth and Stephan, Beissinger and Levitsky and Way.", "rubric": "A strong answer describes People Power in 1986, the largely peaceful revolutions of 1989 (with Romania the violent exception and China's crackdown of 4 June), the colour revolutions triggered by disputed elections and not aimed at redistributing property, and the Arab Spring's mixed outcomes (Tunisia's success until the 2021 self-coup; civil war in Syria, Libya and Yemen; the 2013 coup in Egypt). It explains Chenoweth and Stephan's finding that 53 per cent of nonviolent campaigns succeeded against 26 per cent of violent ones, and the 3.5% rule with its caveats (a rule of thumb; critics' cases of Bahrain and Brunei; Anisin's data critique), plus Chenoweth's 2020 finding of declining effectiveness. It sets Beissinger's urban civic revolutions (more successful and less lethal but producing less durable regimes that rarely reduce inequality) against Levitsky and Way's finding that autocracies born of violent revolution last unusually long, and may use Goldstone's broad definition versus Skocpol's narrow one.", "id": "q6"}
  ]$mn_revolutions_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/thematic-history/revolutions-in-comparison', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

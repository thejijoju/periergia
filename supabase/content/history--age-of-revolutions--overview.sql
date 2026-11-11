-- The Age of Revolutions (c. 1760–1850) — chapter OVERVIEW master, co-written and human-reviewed.
-- history/age-of-revolutions @ research/advanced/read.
-- This node is a chapter (it has child topics); the app renders this overview
-- article above the chapter's topic list (see the section-overview branch in
-- src/app/learn/[subject]/[...node]/page.tsx).
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
    'history/age-of-revolutions',
    'research',
    'advanced',
    'read',
    $ar_overview_master$## Liberty, Slavery and Steam, c. 1760–1850

In 1763 Britain emerged from the French and Indian War as the victor, and with a national debt of £133 million. Within a generation the Atlantic world had been turned upside down. Thirteen British colonies argued their way out of an empire, declared independence in 1776, and built a republic under a written constitution whose government began in 1789. That same year France's Estates-General met for the first time since 1614, a Paris crowd stormed the Bastille, and the National Assembly declared that "men are born and remain free and equal in rights". In 1791 the enslaved people of Saint-Domingue, France's richest colony, rose against their masters; their revolution forced the French Republic to abolish slavery in 1794 and, on 1 January 1804, created Haiti. Napoleon Bonaparte seized power in France in 1799, and at his height ruled about 40 per cent of Europe's population. When he took the Spanish throne in 1808, Spain's American empire was left without a legitimate king, and within two decades almost all of mainland Spanish America was independent, while Brazil broke away in 1822 under a Portuguese prince.

At the same time a different kind of revolution was under way in Britain. Between about 1760 and 1840, production moved from the hand to machines driven by water and then by coal and steam, and workers were gathered into factories run by the clock. Britain used about 52 million pounds of raw cotton in 1800 and 588 million pounds in 1850. In 1830 the Liverpool and Manchester Railway linked the cotton port with the mills.

This block follows both kinds of upheaval, political and industrial, and the people they freed, excluded or bound more tightly.

## Why an "Age of Revolutions"?

Historians often group these decades together as an age of revolution. The label makes a claim: that the American, French, Haitian and Spanish American revolutions belong to one story, linked by ideas, wars, trade and people moving across the Atlantic. In *The Black Jacobins* (1938), C. L. R. James argued that the Haitian Revolution belonged at the centre of the revolutionary story, not its margins, and that the enslaved took revolutionary ideals more seriously than the French. The phrase "industrial revolution" is itself a product of the period: the French envoy Louis-Guillaume Otto used it in 1799, and Friedrich Engels in 1845.

Each part of the label is contested. Some economic historians question whether "revolution" fits the industrial change at all, since overall British growth was slower than once thought and concentrated in cotton and iron. Historians of Spanish America disagree about whether independence was a sharp break or, as Jaime Rodríguez O. argues, part of a Hispanic political revolution with more continuity than rupture. And the story reached far beyond the Atlantic: Napoleon's army invaded Egypt in 1798, where the Cairo scholar al-Jabarti recorded the occupation; the Second Anglo-Mysore War in India (1780–1784), fought with French support, was entangled with the American war; and competition from British machine-made cloth helped ruin much of India's export trade in cotton cloth. This block uses the label as a name for a period, not as a claim that every revolution had the same cause or the same meaning.

## The Promise and Its Limits

The revolutions spoke the language of universal rights. The Declaration of Independence held it "self-evident, that all men are created equal". Lafayette, consulting Thomas Jefferson, wrote early drafts of France's Declaration of the Rights of Man of 1789, and Toussaint Louverture's constitution of 1801 declared that "all men are born, live and die there free and French". Written constitutions, from Philadelphia in 1787 to Cádiz in 1812, tried to turn those words into law.

The words were claimed most urgently by those they left out. Jefferson enslaved more than 600 people over his lifetime. The French Assembly agreed that its principles should not apply in the colonies, and Olympe de Gouges answered it with a *Declaration of the Rights of Woman*. The Treaty of Paris of 1783 handed the lands of Britain's Native allies to the United States without mentioning them. The Cádiz constitution made Indigenous people citizens but admitted people of African descent only by naturalisation and excluded the enslaved. Napoleon's regime restored slavery in Guadeloupe and Guiana in 1802, and his Civil Code declared that "the husband owes protection to his wife, the wife obedience to her husband". After the cotton gin of 1793, slavery expanded into the American Deep South, where about a million enslaved African Americans were forcibly moved, and by 1860 Southern plantations supplied over three-quarters of Britain's cotton.

Yet the people left out did not wait to be included. The enslaved of Saint-Domingue won their own freedom; free pardos and Black soldiers fought, and bargained, on both sides of the wars in Spanish America; Black Loyalists sailed from Nova Scotia to found Freetown in Sierra Leone in 1792; and in England the Luddites broke machines while the crowd at Peterloo in 1819 demanded parliamentary reform.

## An Atlantic Web

The revolutions were connected by chains of cause and effect. France's help to the American rebels was paid for mainly with loans, and by 1788 half the French monarchy's revenue went on servicing its debt. Free men of colour and enslaved men from Saint-Domingue fought in the Franco-American siege of Savannah in 1779. Napoleon's defeat in Haiti helped persuade him to sell Louisiana to the United States in 1803. His seizure of the Spanish crown at Bayonne in 1808 led juntas across Spanish America to govern in the captive king's name, opening the road to independence. Haiti's president Alexandre Pétion gave Simón Bolívar refuge, arms and men in 1815–1816, asking him to abolish slavery in the lands he freed. And the Declaration of Independence founded a genre: Haiti's declaration of 1804 adopted the new genre, and Venezuela's of 1811 borrowed its language.

## The Chapters

1. **Declarations of Independence: the American Revolution**, from the Stamp Act to the Constitution, and what the Revolution meant for enslaved people, Native nations, women and Loyalists.
2. **French and Haitian Revolutions**, two revolutions that exposed each other's limits, from the Bastille to Haitian independence and the indemnity of 1825.
3. **Napoleon and the Remaking of Europe**, the general who ended the Revolution and carried it across a continent, from Egypt and the Civil Code to Waterloo and the Congress of Vienna.
4. **Latin American Independence**, how Spain's American empire became new states and Brazil an empire, and who fought in their wars.
5. **The Industrial Revolution**, why it began in Britain, the machines and the factory, and its costs for workers, the enslaved, India and the atmosphere.

## Questions to Carry Through

- **Whose liberty?** Each revolution proclaimed universal rights and limited them in practice. Who was included, who was left out, and how did the excluded use the revolutions' own words?
- **How connected was the Atlantic world?** Trace how a war, a debt, a slave rising or an abdication in one place set off events in another.
- **Political and industrial revolution: one story or two?** Cotton grown by enslaved people in the American South was spun in Lancashire mills. How were the age's political upheavals and its new economy linked?
- **What changed for the majority?** For peasants, factory children, Indigenous communities and the formerly enslaved, did the revolutions bring freedom, a new kind of subordination, or both?

## Further reading

- **C. L. R. James, *The Black Jacobins: Toussaint L'Ouverture and the San Domingo Revolution* (1938).** The classic anticolonial history linking Paris and Saint-Domingue.
- **David Armitage, *The Declaration of Independence: A Global History* (2007).** The Declaration as the first of a worldwide genre.
- **Sven Beckert, *Empire of Cotton: A Global History* (2014).** Cotton, slavery and "war capitalism".$ar_overview_master$,
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
  select $ar_overview_quiz$[
    {"type": "mcq", "prompt": "What did Napoleon's seizure of the Spanish throne at Bayonne in 1808 set in motion in Spanish America?", "options": ["The immediate recognition of independence by Spain", "Juntas that governed in the captive king's name, opening the road to independence", "A French invasion of Mexico", "The abolition of slavery throughout Spanish America"], "answerIndex": 1, "explanation": "With Ferdinand VII captive, juntas formed in America to rule in his name; acting for an absent king gave advocates of independence a platform.", "id": "q1"},
    {"type": "mcq", "prompt": "How did Haiti's president Alexandre Pétion help Simón Bolívar in 1815–1816?", "options": ["He refused him entry to Haiti", "He sent a Haitian army to conquer Venezuela for Haiti", "He paid Spain to recognise Venezuelan independence", "He gave him refuge, arms and men, asking in return that he abolish slavery in the lands he freed"], "answerIndex": 3, "explanation": "The first state founded by people who had freed themselves from slavery helped launch the liberation of northern South America.", "id": "q2"},
    {"type": "mcq", "prompt": "Which of these shows a revolution's universal language being limited in practice?", "options": ["The French Assembly agreed that the principles of the Declaration of the Rights of Man should not apply in the colonies", "Toussaint Louverture's constitution of 1801 declared slavery forever abolished", "The Convention abolished slavery in all French colonies in 1794", "Haiti declared independence in 1804"], "answerIndex": 0, "explanation": "Colonial landowners' delegates persuaded the Assembly to exclude the colonies; it was the enslaved of Saint-Domingue who forced the question.", "id": "q3"},
    {"type": "mcq", "prompt": "How was the Industrial Revolution in Britain connected to slavery in the Americas?", "options": ["Britain grew its own raw cotton in Lancashire", "It was not connected; British cotton came from Egypt", "After the cotton gin of 1793 slavery expanded into the Deep South, and by 1860 Southern plantations supplied over three-quarters of Britain's cotton", "Enslaved people worked the Lancashire mills"], "answerIndex": 2, "explanation": "Lancashire's mills spun cotton grown by enslaved people, a system Sven Beckert calls 'war capitalism'.", "id": "q4"},
    {"type": "open", "prompt": "Choose two revolutions of this era and explain how events in one helped to cause or shape the other.", "rubric": "A strong answer traces a specific chain of cause and effect, for example: French loans to aid the American rebels and the debt crisis that led to the Estates-General; the Declaration of the Rights of Man drafted by Lafayette in consultation with Jefferson; the French Revolution reaching Saint-Domingue and the 1794 abolition; Napoleon's defeat in Haiti and the sale of Louisiana; the Bayonne abdications of 1808 and the Spanish American juntas; or Pétion's aid to Bolívar. It explains the mechanism of the connection, not only its existence.", "id": "q5"},
    {"type": "open", "prompt": "'Whose liberty?' Using examples from at least two chapters, explain how the revolutions of this era both proclaimed universal rights and limited who enjoyed them, and how those left out responded.", "rubric": "A strong answer contrasts universal declarations (1776, 1789, Toussaint's 1801 constitution) with exclusions such as slavery in the new United States, the Treaty of Paris's silence on Native allies, the French Assembly's exclusion of the colonies, the Cádiz constitution's treatment of people of African descent, Napoleon's restoration of slavery and the Civil Code's subordination of wives. It also shows the excluded acting for themselves, for example the Saint-Domingue rising, Olympe de Gouges, Black Loyalists founding Freetown, pardo and Black soldiers bargaining for equality, or the Luddites and Peterloo.", "id": "q6"}
  ]$ar_overview_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/age-of-revolutions', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

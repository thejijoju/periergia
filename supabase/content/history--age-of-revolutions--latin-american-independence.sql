-- Latin American Independence — canonical master article, co-written and human-reviewed.
-- history/age-of-revolutions/latin-american-independence @ research/advanced/read.
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
    'history/age-of-revolutions/latin-american-independence',
    'research',
    'advanced',
    'read',
    $ar_latind_master$> **How an empire lost its king, and its subjects made new states.** When Napoleon seized the Spanish throne in 1808, Spain's American empire was left without a legitimate ruler. Within two decades almost all of mainland Spanish America was independent, through constitutional experiment, civil war and continental campaigns, while Brazil broke away under a Portuguese prince and became an empire. This chapter follows the crisis of 1808 and the Cortes of Cádiz; Hidalgo, Morelos and Mexico's unexpected conservative ending; the wars of Bolívar and San Martín; Brazil under Pedro I; and the collapse of Gran Colombia and the rise of the caudillos. Throughout, it asks who actually fought, Indigenous, Black, pardo and mestizo men and women on both sides, and what independence did and did not change for them.

## An Empire Without a King

As the chapter on Napoleon describes, in May 1808 at Bayonne Napoleon forced Charles IV and Ferdinand VII to renounce the Spanish throne and gave it to his brother Joseph. The Spanish world almost uniformly rejected Joseph. Drawing on old contractual theories of monarchy, such as Francisco Suárez's, Spanish provinces formed governing *juntas*, and in September 1808 a Supreme Central Junta of Spain and the Indies. Each peninsular kingdom sent two representatives; each great American territory, from New Spain to the Philippines, sent only one. Americans noticed the inequality.

In Mexico City, in September 1808, the peninsular elite had already staged a coup to stop a junta forming; in 1809 short-lived juntas at Chuquisaca, La Paz and Quito were suppressed within the year. In January 1810 the Central Junta, fleeing to Cádiz, dissolved itself in favour of a Regency, and a second wave of American juntas followed: Caracas on 19 April 1810, Buenos Aires on 25 May, then Chile and New Granada. Most claimed to govern in the name of the captive Ferdinand VII.

At first, as the historian David Bushnell put it, "there was little interest in outright independence". Venezuela and New Granada declared it in 1811 and Paraguay broke away that May, but the Río de la Plata waited until 1816 and Chile until 1818. Venezuela's declaration of 1811 joined the family of declarations that the chapter on the American Revolution traces back to 1776. Whether the early loyalty was sincere, or a "mask of Ferdinand VII", is still debated.

## Cádiz: A Constitution for Two Hemispheres

In besieged Cádiz a Cortes, a parliament for the whole empire and the first national assembly to claim sovereignty in Spain, opened in September 1810; by one count 303 deputies sat in it over its life, about 37 of them born overseas, though counts vary. Its constitution of March 1812 proclaimed national sovereignty, the separation of powers and press freedom, made Catholicism the only religion, and set the vote without property qualifications.

The fiercest argument was over race. American deputies, mostly creoles, wanted citizenship for all Indigenous, mixed-race and free Black people, which would have given America a majority in future Cortes. Peninsular deputies resisted. Indigenous people became citizens, but people of African descent could become citizens only by naturalisation, and the enslaved were excluded. The Mexican deputy José Miguel Guridi y Alcocer proposed the gradual abolition of slavery, and Agustín Argüelles a ban on the slave trade; both proposals failed. The Cortes did abolish Indigenous tribute in 1811 and the forced labour draft of the *mita* in 1812.

Restored in 1814, Ferdinand VII abolished the constitution and arrested liberal leaders; tribute returned as an Indigenous "contribution", and in 1815 Spain sent its largest force to America, 10,500 troops under Pablo Morillo. Yet the constitution lived on, as a model for Mexico's of 1824, and in 1820 troops gathered at Cádiz for another American expedition mutinied under Rafael Riego and forced Ferdinand to restore it. No more reinforcements reached America.

## Mexico: From Popular Insurgency to Empire

In New Spain the revolution began from below. When a conspiracy at Querétaro, organised by the *corregidor* Miguel Domínguez, his wife Josefa Ortiz de Domínguez and officers such as Ignacio Allende, was discovered, the parish priest **Miguel Hidalgo** rang the church bells at Dolores before dawn on 16 September 1810 and called his parishioners to arms. His exact words are unknown; one participant testified to the cry "¡Viva América!, ¡viva la religión y muera el mal gobierno!", death to bad government. Hidalgo took an image of the Virgin of Guadalupe, whose cult the chapter on colonial Latin America describes, as his banner.

Mestizos and Indigenous people, many hungry after years of bad harvests in the Bajío, joined in such numbers that the conspirators' creole aims were overwhelmed. At Guanajuato's granary, the Alhóndiga de Granaditas, insurgents killed an estimated 400 to 600 Spaniards and creoles who had taken refuge there. With some 100,000 followers Hidalgo came close to Mexico City but did not attack it. At Guadalajara in December 1810 he decreed the abolition of slavery and of Indigenous tribute. Defeated in January 1811, he was captured, defrocked and shot on 30 July 1811.

Another priest, **José María Morelos**, took up the struggle. His Congress of Chilpancingo declared independence on 6 November 1813, and his *Sentimientos de la Nación* prohibited "slavery forever, as [well as] the distinction of caste". He refused the title of generalissimo and asked to be called *Siervo de la Nación*, Servant of the Nation. His ancestry is disputed: his baptismal record calls him *español*, but he is often described as mixed-race or Afro-Mexican. He was executed in December 1815.

The insurgency survived in the south under **Vicente Guerrero**, a former muleteer generally considered to be of partly African descent, who objected to the Cádiz constitution's exclusion of Afro-Mexicans from citizenship. The end came from an unexpected direction. **Agustín de Iturbide**, a royalist officer who had written in 1814 of executing 300 rebels to celebrate Good Friday, allied with Guerrero. Their Plan of Iguala of February 1821 offered "Three Guarantees": Catholicism, independence under a constitutional monarchy, and the union and equality of all inhabitants. Guerrero and other Afro-Mexican insurgents joined only once Iturbide accepted equal citizenship. Mexico declared independence on 28 September 1821, and in 1822 Iturbide became Emperor Agustín I; he abdicated in 1823. The war had cost between 250,000 and 600,000 lives, yet in the end it was Mexico's own royal army that brought about independence. Central America broke away too, and its federal republic fell apart by about 1840.

```checkpoint
q: Why did Vicente Guerrero and other Afro-Mexican insurgents join Iturbide's Plan of Iguala in 1821?
a*: Because Iturbide accepted equal citizenship for all inhabitants, which the Cádiz constitution had denied to people of African descent.
a: Because Iturbide promised to make Guerrero emperor.
x: Iturbide himself became emperor in 1822.
a: Because the plan promised to restore the Cádiz constitution unchanged.
x: Guerrero objected to that constitution precisely because it excluded Afro-Mexicans from citizenship.
a: Because Spain had already recognised Mexican independence.
x: Spain did not recognise Mexican independence until 1836.
hint: Think of the third of the Three Guarantees.
why: Insurgents of African descent made legal equality their price for joining a conservative path to independence.
---
q: How did the Cádiz constitution of 1812 treat citizenship in the Americas?
a: It made all inhabitants citizens, including the enslaved.
x: The enslaved were excluded altogether.
a: It excluded Indigenous people but included free people of African descent.
x: It was the reverse: Indigenous people were included, while people of African descent needed naturalisation.
a*: It included Indigenous people as citizens, allowed people of African descent citizenship only by naturalisation, and excluded the enslaved.
a: It gave citizenship only to peninsular Spaniards.
x: American creoles and Indigenous people were included as citizens.
hint: Peninsular deputies feared an American majority in future Cortes.
why: Limiting the citizenship of people of African descent kept representation in Spain's favour, and caused lasting resentment in America.
```

## Bolívar and the War to the Death

After the fall of Venezuela's First Republic, **Simón Bolívar**, born in Caracas in 1783, blamed its federal system, too weak for wartime, in his *Cartagena Manifesto* of December 1812. In 1813 he declared a War to the Death: Spaniards who did not actively aid the patriots would be killed, American-born royalists spared.

His Second Republic was destroyed in 1814 not by Spanish troops but by Venezuelans. **José Tomás Boves**, an Asturian-born royalist, raised an army of *llaneros*, the mixed-race horsemen of the plains, and enslaved people, partly by attacking the white landowning class.

Bolívar went into exile, writing his *Jamaica Letter* in September 1815 to win British support. Real help came from Haiti. President **Alexandre Pétion** gave him sanctuary and material and military support, and Bolívar promised to abolish slavery. His expedition left Les Cayes in March 1816, and in mid-1816 he proclaimed the freedom of the enslaved; later that year Pétion helped him a second time. Haiti thus helped arm the liberation of Spanish South America, as the chapter on the French and Haitian Revolutions notes.

The patriots now won over the plains: after 1815 the llaneros switched sides, and in 1818 their leader **José Antonio Páez** accepted Bolívar's command. **Manuel Piar**, a Curaçao-born general whose mother was of partly African descent and who had faced colonial racial discrimination, won the battle of San Félix in 1817; later that year Bolívar had him court-martialled and shot, an execution still counted against him. At the Congress of Angostura in 1819 Bolívar called for centralised government and racial equality. That year he crossed flooded plains and the Andes with llaneros, New Granadan exiles under Francisco de Paula Santander, and British volunteers, and won at **Boyacá** on 7 August, taking Bogotá. Gran Colombia was proclaimed in December 1819; it would come to cover today's Colombia, Venezuela, Ecuador and Panama. Victory at **Carabobo** in 1821 secured Venezuela; **Antonio José de Sucre** won Quito at Pichincha in 1822; and in 1823 **José Prudencio Padilla**, whom the historian Aline Helg treats as a pardo admiral, won the naval battle of Lake Maracaibo.

## San Martín and the South

In Buenos Aires the May Revolution of 1810 removed the viceroy, and the Congress of Tucumán declared independence on 9 July 1816. Repeated campaigns from Buenos Aires into Upper Peru (today's Bolivia) failed; there, guerrilla *republiquetas* allied with rural and Indigenous people held the countryside but never the cities. Paraguay went its own way, ruled from 1814 to 1840 by the isolating dictator José Gaspar Rodríguez de Francia.

**José de San Martín**, born at Yapeyú, a former Guaraní Jesuit mission, and a veteran of the Spanish army, built the **Army of the Andes** at Mendoza, estimated at 3,500 to 6,000 men. He drafted enslaved men aged 16 to 30, later extending freedom-for-service to ages 14 to 55. Black soldiers formed most of three infantry battalions; John Lynch counted 1,554 freedmen recruits. In early 1817 the army crossed the Andes and won at **Chacabuco**; Chile declared independence in 1818, and victory at **Maipú** secured central Chile under Bernardo O'Higgins. Mapuche groups fought on both sides.

Peru, partly from rivalry with the Río de la Plata, remained strongly royalist. San Martín landed in 1820 hoping for a Peruvian rising that did not come, and proclaimed independence in Lima on 28 July 1821. He promised freedom to enslaved people who deserted Peruvian masters, but they did not come in the numbers he expected. After meeting Bolívar at Guayaquil in July 1822, he withdrew into exile. Bolívar and Sucre finished the war at Junín and then **Ayacucho**, on 9 December 1824, where the royalist army capitulated. Upper Peru became independent in 1825 and named itself Bolivia after Bolívar.

## Who Fought, and Why

Both sides recruited Indigenous communities, *castas* such as pardos and cholos, and enslaved Africans, promising improvements in their condition, and captured soldiers were often absorbed into the enemy army. The royalist armies were overwhelmingly American: Europeans were only about a tenth of them, and a small fraction at Ayacucho. In 1820 the royalist army in Venezuela counted 843 white, 5,378 casta and 980 Indigenous soldiers.

Royalism had popular roots. **Mateo Pumacahua**, an Indigenous noble of Cuzco, led militias that had helped crush Túpac Amaru II's rebellion, described in the chapter on colonial Latin America, and won battles for the crown in 1811; in 1814 he joined a Cuzco rebellion demanding that the Cádiz constitution be fully applied, and was executed. Pasto, in southern New Granada, held out for the king under its mestizo commander Agustín Agualongo until his execution in 1824, and in Patagonia the multiethnic Pincheira band, allied with Indigenous groups, fought on until 1832. Rebecca Earle argues that Spain's royalists inadvertently engineered their own defeat, not least through the harsh reconquest of 1815–1820.

What did the patriot promise of equality mean for people of colour? Marixa Lasso shows free pardos joining and leading the patriot cause in Cartagena; the promise of legal equality produced a "myth of racial harmony" that made complaints of racism seem unpatriotic and let elites brand pardo movements as Haitian-style race war. Aline Helg asks why race did not become an organising political category in Caribbean Colombia, and highlights Bolívar's fear of *pardocracia*, rule by pardos.

```checkpoint
q: Who made up most of the soldiers fighting for the Spanish king in Spanish America?
a: Spanish-born troops sent from Europe.
x: Europeans were only about a tenth of royalist forces, and a small fraction at Ayacucho.
a*: American-born soldiers, including castas, Indigenous people and some enslaved Africans.
a: British volunteers of the British Legions.
x: The British Legions fought for the patriots.
a: Haitian soldiers sent by Pétion.
x: Pétion supported Bolívar, not the royalists.
hint: Look at the 1820 count of the royalist army in Venezuela.
why: The wars were in large part civil wars among Americans, in which both sides recruited the majority.
---
q: What did Alexandre Pétion of Haiti do for Bolívar in 1815–1816?
a: He refused to receive him, fearing a Spanish invasion.
x: Pétion gave him sanctuary.
a: He sent a Haitian army to conquer Venezuela for Haiti.
x: He gave material and military support to Bolívar's own expedition.
a: He paid Spain to recognise Venezuelan independence.
x: Spain recognised the new states only after 1836.
a*: He gave him sanctuary and military and material support, twice, and Bolívar promised to abolish slavery.
hint: The expedition sailed from Les Cayes in 1816.
why: The first state founded by formerly enslaved people helped launch the liberation of northern South America.
```

## Women in the Wars

Most women's participation was supportive, gathering supplies, nursing, raising money and spying, but some fought. **Juana Azurduy de Padilla**, born at Chuquisaca in 1780 to a mother described as a *chola*, fought with her husband in the republiquetas of Upper Peru and in 1816 briefly captured the Cerro Rico of Potosí. Her husband was killed that year. Bolívar granted her a pension in 1825; it was revoked in 1857, and she died impoverished. Argentina posthumously promoted her general in 2009, and in 2015 her statue replaced one of Christopher Columbus in Buenos Aires.

{{image: Juana Azurduy de Padilla | Juana Azurduy de Padilla, who fought with the guerrilla republiquetas of Upper Peru.}}

**Policarpa Salavarrieta**, "La Pola", a seamstress, spied for the patriots during the reconquest of New Granada and was shot in Bogotá in 1817, reportedly refusing to kneel. In New Spain, Leona Vicario and Josefa Ortiz de Domínguez were conspirators and spies; in Chile, Javiera Carrera organised women. **Manuela Sáenz** of Quito, Bolívar's companion from 1822, wore a colonel's uniform in public and foiled an attempt on his life in 1828, after which he called her "Libertadora del Libertador"; she died in poverty in Peru in 1856. Sarah Chambers's study of Arequipa shows ordinary Peruvians using honour, a colonial value, to resist republican authorities, and protection of men's honour coming at women's expense.

## Brazil: Independence Under a Prince

Brazil took a different road. As the chapter on Napoleon describes, the Portuguese court fled to Rio de Janeiro under British escort, arriving in 1808. The Prince Regent João opened Brazil's ports and in 1815 raised it to a kingdom alongside Portugal. Rio's enslaved population grew sharply in the years that followed.

After Portugal's liberal revolution of 1820, João VI returned to Lisbon, leaving his son Pedro as regent. When the Lisbon Cortes ordered Pedro home, he refused, and on 7 September 1822, by the Ipiranga brook near São Paulo, he proclaimed independence, crying, as traditionally reported, "Independence or death!" Brazil fought Portuguese garrisons from Bahia to Grão-Pará, freeing slaves to enlist. Portugal recognised independence in 1825 in return for compensation, and Brazil agreed with Britain to ban the Atlantic slave trade, though its 1831 ban was rarely enforced before 1850. Pedro I abdicated in 1831. Brazil kept its monarchy and its slavery.

## Recognition and the Wider World

Britain gave covert support and blocked European aid to Spain; the United States began recognising the new states in 1822, and Britain recognised three in 1825. In December 1823 President James Monroe declared the Americas closed to new European colonisation, though for years the Royal Navy was in practice the only enforcer of what was later called the Monroe Doctrine.

```quote
The American continents, by the free and independent condition which they have assumed and maintain, are henceforth not to be considered as subjects for future colonization by any European powers.
James Monroe · Annual message to Congress · 2 December 1823
```

Spain renounced sovereignty over continental America only in 1836. Cuba and Puerto Rico remained Spanish until 1898.

## Why Gran Colombia Failed

Bolívar hoped for continental union, but his Congress of Panama of 1826 produced a treaty of confederation ratified only by Gran Colombia. His Bolivian constitution of 1826 provided a president for life, a post he wanted partly, in Arana's interpretation, to prevent pardo rule.

Gran Colombia came apart. Páez rebelled against Bogotá in 1826; federalists and centralists wrecked the Convention of Ocaña in 1828; Bolívar survived an assassination attempt that September. Padilla, in prison at the time and not part of the attempt, was nonetheless executed in October 1828, a fate Helg links to Bolívar's fear of *pardocracia*. In 1830 Ecuador seceded, Venezuela made Páez president, and Sucre was assassinated. Bolívar resigned and died of tuberculosis on 17 December 1830; Gran Colombia formally ended in 1831. Weeks before his death he wrote to Juan José Flores, who had led Ecuador's secession:

```quote
All who have served the Revolution have plowed the sea.
Simón Bolívar · Letter to Juan José Flores · 9 November 1830
```

Wartime armies never fully disbanded, and officers expected rewards. The result was the **caudillo**: Páez in Venezuela, Rosas in Argentina, Santa Anna in Mexico. "Before 1810, the caudillo was unknown," John Lynch wrote. "The caudillo entered history as a local hero whom larger events promoted to a military chieftain."

## What Changed, and What Did Not

For the enslaved, independence opened a slow road. Chile declared free wombs in 1811 and abolished slavery in 1823; Mexico banned the slave trade in 1824, and President Vicente Guerrero, the former muleteer, decreed abolition in 1829. Elsewhere free-womb laws, in the Río de la Plata in 1813 and Gran Colombia in 1821, came long before abolition: New Granada in 1851, Venezuela in 1854, Argentina in 1853. Peru re-legalised slave imports in the 1830s and abolished slavery only in 1854. Slavery lasted longest where the old order held: Puerto Rico until 1873, Cuba until 1886, and Brazil, the last country in the Americas, until 1888.

For Indigenous peoples the record was mixed at best. Tribute survived independence under new names; in Peru it ended only in 1854. Liberal reforms often hurt Native communities, which had benefited from protections in Spanish law such as corporate landholding, and foreign textiles undercut local, often Indigenous, producers. The new states fell into debt and entered world markets as exporters of raw materials. Through it all creole elites kept control, conceding some demands of the people whose service had won the wars.

## Interpreting Independence

Older accounts, such as John Lynch's, stressed creole grievances and elite fear of social revolution. Jaime Rodríguez O. sees independence as part of a Hispanic political revolution centred on Cádiz, with more continuity than rupture; Brian Hamnett disputes his claim that the Cortes offered autonomists a peaceful path to home rule. Jeremy Adelman argues that the new nations were "the effect, and not the cause, of the breakdown of European empires". And Bolívar himself, criticised early for Piar's execution and his authoritarianism, became from 1842 the object of a national cult promoted by the Venezuelan state.

## Further exploration

- **John Lynch, *Simón Bolívar: A Life* (2006).** The standard English biography, by the leading British historian of the era.
- **John Lynch, *The Spanish American Revolutions, 1808–1826* (2nd ed., 1986).** The classic continental synthesis.
- **Jaime E. Rodríguez O., *The Independence of Spanish America* (1998).** A revisionist account stressing Cádiz and Hispanic continuity.
- **Jeremy Adelman, *Sovereignty and Revolution in the Iberian Atlantic* (2006).** How imperial collapse produced nations, across the Spanish and Portuguese worlds.
- **Marixa Lasso, *Myths of Harmony: Race and Republicanism during the Age of Revolution, Colombia 1795–1831* (2007).** Pardo patriots in Cartagena and the making of a "myth of racial harmony".
- **Rebecca Earle, *Spain and the Independence of Colombia, 1810–1825* (2000).** How royalist policy undermined itself, and the royalist guerrillas of Pasto.
- **John Charles Chasteen, *Americanos: Latin America's Struggle for Independence* (2008).** A short, readable survey.$ar_latind_master$,
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
  select $ar_latind_quiz$[
    {"type": "mcq", "prompt": "What did Morelos's Sentimientos de la Nación (1813) prohibit?", "options": ["\"Slavery forever, as [well as] the distinction of caste\"", "The Catholic Church and all religious orders", "Trade with Britain and the United States", "Elections without property qualifications"], "answerIndex": 0, "explanation": "Morelos's programme, influenced by the Cádiz constitution, made Catholicism the sole religion and abolished slavery and caste distinctions.", "id": "q1"},
    {"type": "mcq", "prompt": "In which year did Peru abolish both slavery and Indigenous tribute, under Ramón Castilla?", "options": ["1821", "1854", "1824", "1888"], "answerIndex": 1, "explanation": "Peru had banned the slave trade in 1821 but re-legalised slave imports in the 1830s; tribute survived independence under new names until 1854.", "id": "q2"},
    {"type": "mcq", "prompt": "Who proclaimed Brazil's independence on 7 September 1822?", "options": ["Simón Bolívar", "King João VI", "Pedro, the Portuguese king's son and regent in Brazil", "José de San Martín"], "answerIndex": 2, "explanation": "Pedro, left as regent when João VI returned to Lisbon, refused the Lisbon Cortes' order to come home and proclaimed independence by the Ipiranga brook; he was crowned emperor that December.", "id": "q3"},
    {"type": "mcq", "prompt": "Which was the last country in the Americas to abolish slavery?", "options": ["Cuba", "Peru", "Venezuela", "Brazil"], "answerIndex": 3, "explanation": "Brazil abolished slavery with the Lei Áurea in 1888, two years after Cuba (1886).", "id": "q4"},
    {"type": "open", "prompt": "What did independence change, and what did it not change, for Indigenous, Black and mixed-race people in Spanish America?", "rubric": "A strong answer notes that both sides recruited Indigenous people, castas and the enslaved with promises of improvement; discusses the Cádiz constitution's exclusion of people of African descent and Guerrero's insistence on equal citizenship at Iguala; traces slavery's slow end through free-womb laws (Chile 1811, Río de la Plata 1813, Gran Colombia 1821) to abolition by the 1850s, and its survival in Cuba, Puerto Rico and Brazil; notes that tribute survived under new names (Peru until 1854) and that liberal reforms and foreign trade often hurt Native communities; mentions Lasso's 'myth of racial harmony' or Helg on pardocracia; and concludes that creole elites kept control while conceding some demands.", "id": "q5"},
    {"type": "open", "prompt": "Why did Bolívar's Gran Colombia break apart, and why did caudillos come to dominate many of the new states?", "rubric": "A strong answer discusses the federalist–centralist conflict, Páez's rebellion of 1826, the failed Convention of Ocaña and the 1828 assassination attempt, Bolívar's life presidency and his fear of pardo rule (Padilla's execution), the secession of Ecuador and Venezuela in 1830 and Sucre's assassination, and the failure of the Congress of Panama; and explains caudillos as products of the wars, armies that never fully disbanded and officers seeking rewards, citing Lynch and examples such as Páez, Rosas and Santa Anna.", "id": "q6"}
  ]$ar_latind_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/age-of-revolutions/latin-american-independence', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

-- The Mughal Empire — canonical master article, co-written and human-reviewed.
-- history/early-modern-period/the-mughal-empire @ research/advanced/read.
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
    'history/early-modern-period/the-mughal-empire',
    'research',
    'advanced',
    'read',
    $em_mughal_master$> **The Mughal empire** ruled most of the Indian subcontinent from the sixteenth to the eighteenth century, and survived as a symbolic power until 1857. At its height, under Akbar, Jahangir, Shah Jahan, and Aurangzeb, it governed perhaps 115 to 150 million people, built the Taj Mahal, and presided over one of the largest manufacturing economies in the world. It is often studied alongside the Ottoman and Safavid empires and, later, the British Raj. This chapter covers Babur's conquest and the Timurid inheritance, Akbar's policies of accommodation, the court and its arts, the Mughal economy, Aurangzeb and his contested reputation, the eighteenth-century fragmentation, the rise of the East India Company, the end of the dynasty in 1857, and the Mughal legacy in Indian politics today.

## Babur and the Timurid Inheritance

**Babur** (1483–1530), the founder of the dynasty, was a descendant of Timur on his father's side and of Chinggis Khan on his mother's, a prince of Central Asia who lost his ancestral kingdom of Ferghana and Samarkand to the Uzbeks and made himself ruler of Kabul. In 1526, at the battle of **Panipat** north of Delhi, his smaller army, using field artillery and matchlock muskets in the Ottoman style, defeated the last sultan of Delhi, as the chapter on the Delhi Sultanate described. Babur wrote a remarkably frank memoir in Chaghatai Turkic, the *Baburnama*, recording his campaigns, his love of gardens and fruit, and his low opinion of India's climate.

His son **Humayun** lost the new empire to the Afghan ruler **Sher Shah Suri**, who in his short reign (1540–1545) reformed land revenue, rebuilt and extended the Grand Trunk Road, and issued a silver coin, the *rupiya*, the ancestor of the rupee. Humayun spent fifteen years in exile, first in Sind and at the Safavid court in Iran, then, with Safavid troops, as ruler of Kandahar and Kabul from 1545, and recovered Delhi in 1555, shortly before his death. The Mughals called their dynasty *Gurkani*, after Timur's title, the "House of Timur"; "Mughal", from "Mongol", was a name used by others.

## Akbar's Synthesis

Humayun's son **Akbar** (reigned 1556–1605) turned a fragile conquest into a lasting empire. He expanded Mughal rule across northern India, from Afghanistan to Bengal and Gujarat, and into the Deccan. Above all, he built a ruling system that included India's non-Muslim majority.

- **Rajput alliances.** Akbar married daughters of Hindu Rajput rulers, without requiring their conversion, and made Rajput kings commanders and governors in the empire. They became pillars of Mughal power.
- **The mansabdari system.** Officials and nobles, Muslim and Hindu, held ranks (*mansabs*) that determined their status, pay, and the number of cavalry they had to maintain. They were paid through assignments of land revenue, *jagirs*, which were regularly transferred so that no official built a local power base.
- **Land revenue.** Akbar's finance minister, **Todar Mal**, a Hindu, organised a system of assessing land revenue based on measurement and average yields over several years.
- **Religious policy.** In 1564, according to his court historian Abu'l Fazl (another contemporary dates it to 1579), Akbar abolished the **jizya**, the tax on non-Muslims. From 1575, at his new capital of **Fatehpur Sikri**, he held debates in a "House of Worship", at first among Muslim scholars and from the late 1570s also with Hindu, Jain, Zoroastrian, Jewish, and Christian scholars, including Jesuits from Goa (from 1580), until he ended them in 1582. He developed a policy of *sulh-i kul*, "peace with all", treating all religious communities as equals under the emperor. He also gathered a small circle of devoted courtiers in a spiritual discipleship, later called the *din-i ilahi* ("divine faith"); historians debate whether it was a new religion or a form of personal loyalty to the emperor, but it attracted few followers.

Akbar's friend and historian **Abu'l Fazl** wrote the *Akbarnama*, a history of his reign, and the *Ain-i Akbari*, a detailed description of the empire's administration, a major source for historians.

```checkpoint
q: What was the purpose of the mansabdari system?
a*: To rank officials and nobles, Muslim and Hindu, determining their status, pay, and cavalry obligations, with revenue assignments rotated so no one built a local power base.
a: To give land permanently to nobles and their heirs.
x: Jagirs were regularly transferred precisely to prevent permanent local power bases.
a: To collect the jizya from non-Muslims.
x: Akbar abolished the jizya in 1564; the mansabdari system organised the nobility.
a: To train Jesuit missionaries.
x: The mansabdari system was an administrative and military system, not a religious one.
hint: Think of ranks and rotating revenue assignments.
why: The mansabdari system bound a diverse nobility to the emperor and kept power centralised.
---
q: What did Akbar's policy of sulh-i kul mean?
a: The conversion of all subjects to Islam.
x: Akbar did not force conversion; sulh-i kul meant the opposite.
a: The expulsion of all non-Muslims from the empire.
x: Non-Muslims, the majority, held high office under Akbar.
a*: "Peace with all", treating all religious communities as equals under the emperor.
a: An alliance with the Safavids against the Ottomans.
x: Sulh-i kul was a domestic religious policy, not a foreign alliance.
hint: Think of the debates at Fatehpur Sikri.
why: Akbar's inclusive policy secured the loyalty of a religiously diverse empire.
```

## Court, Art, and Architecture

The Mughal court was **Persianate**: Persian was the language of administration and high culture, and the court drew poets, painters, and scholars from Iran and Central Asia, alongside Indian artists. Imperial workshops produced **miniature paintings** combining Persian, Indian, and, from the late sixteenth century, European influences, brought by Jesuit missionaries. Under **Jahangir** (reigned 1605–1627), a great patron of naturalistic painting, the empress **Nur Jahan** became the most powerful woman in Mughal history, issuing coins in her name and directing policy. The English ambassador **Sir Thomas Roe**, who came to Jahangir's court in 1615 seeking trading privileges for the East India Company, was one supplicant among many.

**Shah Jahan** (reigned 1628–1658) was the greatest Mughal builder. He built the **Taj Mahal** at Agra, from 1632, as a tomb for his wife **Mumtaz Mahal**, who died in childbirth, and a new capital at Delhi, **Shahjahanabad**, with the Red Fort and the Jama Masjid. His jewelled **Peacock Throne** symbolised imperial magnificence. His eldest son **Dara Shikoh**, a scholar who translated the Upanishads into Persian and argued for the common truths of Islam and Hinduism, lost the war of succession to his brother Aurangzeb and was executed in 1659.

{{image: Taj Mahal | The Taj Mahal at Agra, built by Shah Jahan from 1632 as a tomb for Mumtaz Mahal.}}

## The World's Manufacturing Giant

The Mughal empire was immensely rich. Its agriculture supported a large population, and its manufactures, above all **cotton textiles**, from fine Bengal muslins to printed calicoes, were exported across the Indian Ocean, Southeast Asia, Africa, the Middle East, and Europe. The economic historian Paul Bairoch estimated that the Indian subcontinent still accounted for about a quarter of world manufacturing output in 1750, even after the empire's fragmentation, though such figures are rough. As the chapter on the Columbian exchange described, much American silver flowed to India to pay for its goods. By some estimates, Mughal revenue under Aurangzeb exceeded that of any contemporary European state.

## Aurangzeb and His Reputation

**Aurangzeb** (reigned 1658–1707) expanded the empire to its greatest extent, conquering the Deccan sultanates of Bijapur (1686) and Golconda (1687). He was a devout Sunni Muslim who reimposed the **jizya** in 1679, ordered the destruction of some temples, and executed the ninth Sikh guru, **Tegh Bahadur**, in 1675. He spent the last decades of his reign fighting the **Marathas**, Marathi-speaking Hindu warriors and landholders of the western Deccan, led by **Shivaji**, who was crowned king in 1674 and whose successors continued the war.

Aurangzeb's reputation is fiercely contested. Many accounts, colonial and later Hindu nationalist, portray him as a fanatical bigot whose intolerance destroyed the empire. Historians such as Audrey Truschke have argued that this picture is exaggerated: Aurangzeb employed more Hindu nobles than his predecessors, protected many temples, and was driven as much by politics as by religion; his wars, rather than his religion, overstretched the empire. The debate is as much about modern India as about the seventeenth century.

## Fragmentation and the Successor States

After Aurangzeb's death in 1707, a series of succession wars and short reigns weakened the central government. In 1739 the Iranian ruler **Nader Shah** invaded India, sacked Delhi, massacred tens of thousands of its inhabitants, and carried off the Peacock Throne and the Koh-i-Noor diamond.

Older historians described the eighteenth century as one of Mughal "decline" and chaos. Historians such as Muzaffar Alam and C. A. Bayly have shown that, as the centre weakened, regional states such as **Bengal**, **Awadh**, and **Hyderabad**, whose rulers were former Mughal governors, and the expanding **Maratha** confederacy, the **Sikh** chiefdoms (later a kingdom) of the Punjab, and **Mysore**, often flourished economically, continuing Mughal institutions while ruling independently. Power was decentralised rather than simply lost.

## The Company's Shadow Empire and 1857

Into this world came the **English East India Company**, as the chapter on trading companies describes. After defeating the nawab of Bengal at **Plassey** in 1757 and the Mughal emperor and his allies at **Buxar** in 1764, the Company received in 1765 the *diwani*, the right to collect the revenue of Bengal, Bihar, and Orissa, from the emperor Shah Alam II. The emperor lived for a time on a Company tribute, then under Maratha protection in Delhi, until the Company took Delhi in 1803 and ruled in his name.

In 1857 a great uprising against Company rule, known as the **Indian Rebellion** (and in India often as the First War of Independence), broke out among Indian soldiers and spread across northern India. The rebels proclaimed the elderly Mughal emperor **Bahadur Shah Zafar**, a poet, as their leader. After the British recaptured Delhi, they exiled him to Rangoon in Burma, where he died in 1862, and killed several of his sons. The Mughal dynasty ended, and the British crown took direct control of India.

## The Legacy in Indian Politics

The Mughal past is fiercely debated in modern India. To some, the Mughals were part of India's composite culture, builders of its great monuments, from the Taj Mahal to the Red Fort, where India's prime minister speaks on Independence Day. To Hindu nationalists, they were foreign Muslim invaders. In 1992 a mosque built in 1528–29 in Ayodhya, according to its inscriptions by Babur's commander Mir Baqi, the **Babri Masjid**, was demolished by Hindu nationalist activists who claimed it stood on the birthplace of the god Rama, setting off deadly riots; a Hindu temple has since been built on the site. Cities and roads named after Mughal rulers, such as Aurangzeb Road in Delhi and the city of Aurangabad, have been renamed. As with the Delhi Sultanate, the history of the Mughals remains a battleground over Indian identity.

```checkpoint
q: Why do historians such as Muzaffar Alam and C. A. Bayly question the idea of Mughal "decline" in the eighteenth century?
a: Because the Mughal emperors became more powerful after 1707.
x: The central government weakened after 1707; the argument concerns what happened in the regions.
a*: Because as the centre weakened, regional successor states such as Bengal, Awadh, and Hyderabad often flourished economically, continuing Mughal institutions, so power was decentralised rather than lost.
a: Because Nader Shah's invasion never happened.
x: Nader Shah sacked Delhi in 1739; the revisionists do not deny it.
a: Because the British ruled India from 1707.
x: British rule over large Indian territories began only after Plassey in 1757.
hint: Look at the regions rather than Delhi.
why: The revisionists show that political fragmentation did not necessarily mean economic or cultural collapse.
---
q: Why is Aurangzeb's reputation so contested?
a: Because there are no sources about his reign.
x: There are abundant sources; the contest is over interpretation.
a: Because he converted to Hinduism.
x: Aurangzeb was a devout Sunni Muslim.
a: Because he lost all his wars.
x: Aurangzeb expanded the empire to its greatest extent, though his wars overstretched it.
a*: Because colonial and Hindu nationalist accounts portray him as a fanatic, while historians such as Truschke argue his policies were driven by politics as much as religion, and the debate is bound up with modern Indian politics.
hint: Consider who has written about him and why.
why: Aurangzeb's image has been shaped by colonial and modern political agendas as much as by the evidence.
```

## Further exploration

- **John F. Richards, *The Mughal Empire* (1993).** The standard scholarly history.
- **Audrey Truschke, *Aurangzeb: The Life and Legacy of India's Most Controversial King* (2017).** A revisionist biography.
- **William Dalrymple, *The Last Mughal* (2006).** Bahadur Shah Zafar and the uprising of 1857.
- **Ira Mukhoty, *Akbar: The Great Mughal* (2020).** A biography of Akbar.
- **Wheeler M. Thackston (trans.), *The Baburnama: Memoirs of Babur, Prince and Emperor* (1996).** Babur's memoir.$em_mughal_master$,
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
  select $em_mughal_quiz$[
    {"type": "mcq", "prompt": "Where did Babur defeat the last sultan of Delhi in 1526?", "options": ["Plassey", "Panipat", "Sekigahara", "Chaldiran"], "answerIndex": 1, "explanation": "Babur's field artillery and muskets defeated Ibrahim Lodi at Panipat.", "id": "q1"},
    {"type": "mcq", "prompt": "What did Akbar do in 1564?", "options": ["He built the Taj Mahal", "He converted to Christianity", "He moved the capital to Rangoon", "He abolished the jizya, the tax on non-Muslims"], "answerIndex": 3, "explanation": "Abolishing the jizya was part of Akbar's inclusive policy towards the non-Muslim majority.", "id": "q2"},
    {"type": "mcq", "prompt": "Why did Shah Jahan build the Taj Mahal?", "options": ["As a tomb for his wife Mumtaz Mahal", "As a mosque for Akbar's debates", "As a fortress against the Marathas", "As the headquarters of the East India Company"], "answerIndex": 0, "explanation": "Construction began in 1632 after Mumtaz Mahal died in childbirth.", "id": "q3"},
    {"type": "mcq", "prompt": "What did the English East India Company receive from the Mughal emperor in 1765?", "options": ["The Peacock Throne", "The title of shah", "The diwani, the right to collect the revenue of Bengal, Bihar and Orissa", "Control of the Deccan sultanates"], "answerIndex": 2, "explanation": "After Plassey and Buxar, the diwani gave the Company the revenues of Bengal and left the emperor dependent on others.", "id": "q4"},
    {"type": "open", "prompt": "Was eighteenth-century India a story of Mughal 'decline'? Evaluate the debate.", "rubric": "A strong answer describes succession wars after 1707, Nader Shah's sack of Delhi in 1739 and the weakening of the centre; then the revisionist view of Alam and Bayly that successor states such as Bengal, Awadh, Hyderabad, the Marathas, the Sikhs and Mysore flourished and continued Mughal institutions; and the opening this gave the East India Company. It reaches a reasoned conclusion about decentralisation versus collapse.", "id": "q5"},
    {"type": "open", "prompt": "Why is Aurangzeb's reign so contested, and how should historians assess it?", "rubric": "A strong answer outlines his conquests in the Deccan, reimposition of the jizya in 1679, temple destructions, execution of Tegh Bahadur and wars with the Marathas; contrasts colonial and Hindu nationalist portrayals with revisionists such as Truschke (Hindu nobles, temple protection, political motives, overstretch); and links the debate to modern Indian politics, while weighing the evidence.", "id": "q6"}
  ]$em_mughal_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/early-modern-period/the-mughal-empire', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

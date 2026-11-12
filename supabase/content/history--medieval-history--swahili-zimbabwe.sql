-- The Swahili Coast and Great Zimbabwe — canonical master article, co-written and human-reviewed.
-- history/medieval-history/africa/the-swahili-coast-and-great-zimbabwe @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- The Swahili city-states, Indian Ocean trade, African roots and Shirazi
-- myths with the 2023 ancient-DNA evidence, Mapungubwe and Great
-- Zimbabwe, the colonial refusal, and the Portuguese arrival.
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
    'history/medieval-history/africa/the-swahili-coast-and-great-zimbabwe',
    'research',
    'advanced',
    'read',
    $swahili_master$> **The Swahili coast and Great Zimbabwe** were the centres of a medieval East African commercial world that stretched from the Somali coast to Mozambique and inland to the gold-bearing plateau of Zimbabwe. On the coast, Swahili city-states such as Kilwa and Mombasa built coral-stone mosques and palaces and traded with Arabia, Persia, India, and China across the Indian Ocean. Inland, the builders of Great Zimbabwe raised the largest precolonial stone structures in southern Africa. For much of the colonial era, outsiders refused to believe that Africans had built either. This chapter describes both worlds and the long struggle to recognise them as African achievements.

## The Swahili City-States

From around the ninth century, towns grew along some 3,000 kilometres of the East African coast and its islands: Mogadishu in the north, Lamu, Malindi, and **Mombasa** in modern Kenya, **Zanzibar** and **Kilwa** in Tanzania, and Sofala in Mozambique. By the twelfth to fifteenth centuries, the most important were independent city-states ruled by Muslim sultans or councils of leading families.

The people of these towns spoke **Swahili** (Kiswahili), a Bantu language closely related to other languages of the Kenyan and Tanzanian coast, with many words borrowed from Arabic; its name comes from the Arabic *sawahil*, "coasts". The townspeople were Muslims, and their towns had mosques, many built of coral stone, cut from reefs and dressed with fine carving. The **Great Mosque of Kilwa**, founded perhaps in the tenth century, rebuilt in the eleventh to thirteenth, and expanded in the fourteenth, was the largest mosque of its kind on the coast, and the nearby palace of **Husuni Kubwa**, built in the early fourteenth century, had courtyards, a bathing pool, and over a hundred rooms. Kilwa minted its own copper coins; five were found in 1944, together with four Dutch coins, on Marchinbar Island off northern Australia, though how they got there is unknown.

The **Moroccan traveller Ibn Battuta** visited Kilwa in about 1330–31 and called it, in H. A. R. Gibb's translation, "one of the finest and most beautifully built towns".

## Trade Across the Indian Ocean

The Swahili towns were intermediaries between the African interior and the Indian Ocean world. Using the monsoon winds, ships from Arabia, the Persian Gulf, and India arrived with cloth, beads, and ceramics and left with African goods:

- **Gold** from the Zimbabwe plateau, exported through Sofala and controlled by Kilwa in the fourteenth century.
- **Ivory**, much prized in India and China.
- **Iron**, mangrove timber, tortoiseshell, rhinoceros horn, and ambergris.
- **Enslaved people**, taken to Arabia, the Persian Gulf, and Iraq, as the chapter on slavery describes.

Chinese porcelain, found in large quantities in Swahili towns and set into the walls and tombs of mosques as decoration, reflects long-distance connections. In the early fifteenth century, the Ming admiral **Zheng He**'s fleets visited East Africa, and envoys from Malindi brought a giraffe to the Chinese court in 1415, where courtiers hailed it as a qilin, a mythical auspicious animal.

## African Roots, Arabian Myths

For centuries, Swahili origins were described in terms of foreign settlement. Swahili chronicles, such as the *Kilwa Chronicle*, told of founders who came from Shiraz in Persia, and colonial historians concluded that the towns were essentially Arab or Persian colonies on the African coast, with Africans as servants.

Archaeology overturned this view. Neville Chittick's excavations at Kilwa provided the basic chronology, though he himself favoured a foreign-settlement reading; later work by Mark Horton at **Shanga** in the Lamu archipelago, and by others, showed that the towns grew from local African farming and fishing villages, using local pottery traditions, and that stone buildings and Islam developed gradually within these communities from the eighth and ninth centuries onward. The Shirazi origin stories were long read mainly as claims to prestige, linking local elites to the wider Islamic world; ancient DNA now suggests they also preserve a memory of real Persian newcomers, who joined towns that were African in origin.

Genetics has added nuance. A study published in 2023, analysing ancient DNA from people buried at Swahili sites between about 1250 and 1800, found that roughly half of their ancestry came from African women and most of the rest from Asian men, chiefly of Persian origin, with a smaller Indian contribution, with mixing beginning around 1000 CE. The Swahili were, in other words, an African society that incorporated people from across the Indian Ocean through marriage, consistent with both the archaeology and the importance of foreign connections in their own traditions.

```checkpoint
q: What did archaeological excavations at sites such as Shanga and Kilwa show about Swahili origins?
a*: That the towns grew from local African farming and fishing communities, with stone building and Islam developing gradually within them.
a: That the Swahili towns were founded as Persian colonies with no African roots.
x: Archaeology showed the opposite: the towns grew from local African villages.
a: That the Swahili towns were founded by the Portuguese.
x: The towns flourished for centuries before the Portuguese arrived in 1498.
a: That no one lived on the coast before the fifteenth century.
x: Settlement on the coast dates back to at least the eighth century.
hint: Compare the pottery and the earliest layers of the sites.
why: Archaeology replaced colonial myths of foreign foundation with evidence of African origins and gradual development.
---
q: What did the 2023 ancient DNA study of Swahili burials find?
a: That Swahili ancestry was entirely Arabian.
x: About half of the ancestry was African, mainly from women.
a: That Swahili ancestry was entirely African, with no foreign component.
x: Most of the non-African ancestry came from Asian, mainly Persian, men.
a*: That roughly half of their ancestry came from African women and most of the rest from Asian men, mainly Persian, with a smaller Indian share, with mixing beginning around 1000 CE.
a: That the Swahili were descended from the Chinese crews of Zheng He.
x: The study found mainly Persian and some Indian, not Chinese, ancestry.
hint: Note the different contributions of women and men.
why: Genetics shows an African society that incorporated Indian Ocean newcomers through marriage, consistent with archaeology and Swahili tradition.
```

## Great Zimbabwe

Inland, on the plateau between the Zambezi and Limpopo rivers, the ancestors of the **Shona** people built a series of states whose wealth rested on cattle and on gold, which they mined and traded to the coast. An early centre at **Mapungubwe**, near the Limpopo, flourished from about 1220 to 1300; its royal burials contained gold objects, including a small rhinoceros of gold foil over a wooden core, now the emblem of South Africa's highest honour, the Order of Mapungubwe.

The greatest centre was **Great Zimbabwe**, built between the eleventh and fifteenth centuries and at its height from about 1300 to 1450, when it was traditionally estimated to have had up to 18,000 inhabitants, though a 2017 survey concluded that it probably never exceeded about 10,000. Its builders raised massive walls of carefully cut granite blocks fitted together without mortar. The largest structure, the **Great Enclosure**, has an outer wall about 250 metres long and up to 11 metres high, enclosing a solid conical tower. The **Hill Complex** on a granite hill above probably served as a royal and religious centre. Eight carved soapstone birds found at the site have become the national emblem of Zimbabwe, which took its name from the site at independence in 1980. The name probably comes from the Shona *dzimba dza mabwe*, "houses of stone" (another derivation gives "venerated houses").

Great Zimbabwe was the capital of a state that controlled the gold trade to the coast. Glass beads, Persian pottery, and Chinese ceramics found there reflect its connections, through the Swahili ports, to the Indian Ocean world. It lost its dominance after about 1450, for reasons still debated: perhaps the exhaustion of local grazing, timber, and fertile soil, falling demand for gold, and a new trade route along the Zambezi that bypassed it. The site itself was still occupied in the sixteenth century. Its successors, the **Mutapa** state to the north and the **Torwa** state centred at Khami to the west, continued the tradition of stone building and gold trade.

{{image: Great Zimbabwe | The Great Enclosure at Great Zimbabwe, whose mortarless granite walls reach up to 11 metres high.}}

## The Colonial Refusal

Great Zimbabwe became the subject of one of the most notorious episodes of racist pseudo-history. When the German explorer **Karl Mauch** saw the ruins in 1871, he concluded that they were a copy of the Queen of Sheba's palace or Solomon's temple, built by foreigners. European settlers in what became Rhodesia, named after the imperialist **Cecil Rhodes**, eagerly adopted such theories, attributing the ruins to Phoenicians, Arabs, or other non-Africans, because evidence of a sophisticated African civilization undermined their justifications for colonial rule. Early treasure hunters and amateur excavators destroyed much of the archaeological evidence.

Professional archaeologists proved otherwise. In 1905–06 **David Randall-MacIver**, and in 1929 **Gertrude Caton-Thompson**, excavated the site and concluded that it was African (Bantu) in origin and medieval in date. Even so, the white minority government of Rhodesia continued to promote foreign-origin theories; in the 1960s and 1970s archaeologists were pressured to avoid stating clearly that Africans built the site, and Peter Garlake, the country's Inspector of Monuments, was forced out in 1970. When Zimbabwe became independent in 1980, the new nation took its name from the ruins, a deliberate reclaiming of an African past that colonialism had tried to deny.

The same pattern, outsiders refusing to credit Africans with their own achievements, appears in the history of the Swahili coast, of Egypt, as the chapter on Ancient Egypt described, and of Africa more widely. Recognising it is part of the work of history.

## The Portuguese Arrival

In 1498 **Vasco da Gama**, having rounded the Cape of Good Hope, sailed up the East African coast. At Malindi he found a pilot to guide him across the Indian Ocean to India. Within a few years the Portuguese returned with armed fleets, seeking to control the gold trade and the Indian Ocean commerce by force. In 1505 they sacked **Kilwa** and **Mombasa** and built forts along the coast. The Swahili towns survived, and Swahili culture and language continued to flourish, but the independence and prosperity of the medieval city-states were broken. The story of the Indian Ocean in the age of European empires continues in later chapters.

```checkpoint
q: Why did European settlers in Rhodesia promote theories that Great Zimbabwe was built by foreigners?
a: Because there was strong archaeological evidence for foreign builders.
x: Professional archaeology showed the site was African; the foreign theories had no sound evidence.
a*: Because evidence of a sophisticated African civilization undermined their justifications for colonial rule.
a: Because the Shona people denied building it.
x: The site is part of Shona heritage; the foreign theories came from outsiders.
a: Because the site was built in the twentieth century.
x: Great Zimbabwe was built between the eleventh and fifteenth centuries.
hint: What did colonialism need to believe about Africans?
why: Denying African achievement served colonial ideology, which is why the myth persisted despite archaeological evidence.
---
q: What was the significance of Zimbabwe taking its name from the ruins at independence in 1980?
a: It showed that the new government planned to rebuild the walls.
x: The renaming was symbolic, not a building plan.
a: It honoured Cecil Rhodes, who discovered the site.
x: Rhodes promoted foreign-origin theories; the new name rejected Rhodesia's colonial identity.
a: It was required by the Portuguese.
x: Zimbabwe was a British colony as Rhodesia, and the Portuguese played no role in its naming at independence.
a*: It was a deliberate reclaiming of an African past that colonial ideology had tried to deny.
hint: Consider the earlier name, Rhodesia.
why: Renaming the nation after Great Zimbabwe asserted African authorship of the past against colonial denial.
```

## Further exploration

- **Mark Horton and John Middleton, *The Swahili: The Social Landscape of a Mercantile Society* (2000).** A history of the Swahili coast.
- **Stephanie Wynne-Jones and Adria LaViolette (eds.), *The Swahili World* (2018).** A comprehensive collection on Swahili history and archaeology.
- **Innocent Pikirayi, *The Zimbabwe Culture: Origins and Decline of Southern Zambezian States* (2001).** The archaeology of Great Zimbabwe and its successors.
- **Peter Garlake, *Great Zimbabwe* (1973).** The archaeologist's account, published after the Rhodesian government forced him out of the country.
- **François-Xavier Fauvelle, *The Golden Rhinoceros* (2018).** Includes chapters on Mapungubwe and the Swahili coast.$swahili_master$,
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
  select $swahili_quiz$[
    {"type": "mcq", "prompt": "What kind of language is Swahili?", "options": ["A dialect of Arabic", "A Persian language", "A Bantu language with many words borrowed from Arabic", "A creole of Portuguese"], "answerIndex": 2, "explanation": "Swahili is closely related to other Bantu languages of the coast; its name comes from Arabic sawahil, 'coasts'.", "id": "q1"},
    {"type": "mcq", "prompt": "Which traveller called Kilwa 'one of the finest and most beautifully built towns'?", "options": ["Vasco da Gama", "Ibn Battuta", "Zheng He", "Al-Bakri"], "answerIndex": 1, "explanation": "Ibn Battuta visited Kilwa in about 1330–31, when it controlled the gold trade from Sofala.", "id": "q2"},
    {"type": "mcq", "prompt": "What is the Great Enclosure at Great Zimbabwe?", "options": ["A mortarless granite structure with walls up to 11 metres high enclosing a conical tower", "A Portuguese fort", "A mosque", "A colonial museum"], "answerIndex": 0, "explanation": "Built by the ancestors of the Shona, it is the largest precolonial stone structure in southern Africa.", "id": "q3"},
    {"type": "mcq", "prompt": "Which archaeologist confirmed in 1929 that Great Zimbabwe was African and medieval?", "options": ["Karl Mauch", "Cecil Rhodes", "Neville Chittick", "Gertrude Caton-Thompson"], "answerIndex": 3, "explanation": "Following Randall-MacIver's 1905–06 work, Caton-Thompson's excavations established the site's African origins.", "id": "q4"},
    {"type": "open", "prompt": "How did archaeology and genetics change understanding of Swahili origins?", "rubric": "A strong answer explains the older view based on Shirazi origin stories and colonial assumptions of Arab or Persian colonies; excavations (Chittick's chronology at Kilwa, then Horton at Shanga and later archaeologists) showing growth from local African villages, local pottery, and gradual development of stone building and Islam; the reading of Shirazi traditions as prestige claims, now nuanced by ancient DNA; and the 2023 ancient DNA study showing roughly half African ancestry (mainly from women) and Asian, mainly Persian, ancestry (mainly from men) mixing from about 1000 CE.", "id": "q5"},
    {"type": "open", "prompt": "Why did colonial writers deny that Africans built Great Zimbabwe, and what does this episode teach about history?", "rubric": "A strong answer explains Mauch's 1871 Queen of Sheba theory, settler and Rhodes-era attribution to foreigners, destruction by treasure hunters, the professional archaeology of Randall-MacIver and Caton-Thompson, Rhodesian government pressure in the 1960s and 1970s and Garlake's forced departure in 1970, and the 1980 naming of Zimbabwe. It draws lessons about how ideology shapes interpretations of evidence, connecting to similar denials regarding Egypt and the Swahili coast.", "id": "q6"}
  ]$swahili_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/medieval-history/africa/the-swahili-coast-and-great-zimbabwe', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

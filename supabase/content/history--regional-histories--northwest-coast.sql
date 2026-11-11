-- Indigenous Oral Literatures of the Northwest Coast of North America — canonical master article, co-written and human-reviewed.
-- history/regional-histories/americas/indigenous-oral-literatures-of-the-northwest-coast-of-north-america @ research/advanced/read.
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
    'history/regional-histories/americas/indigenous-oral-literatures-of-the-northwest-coast-of-north-america',
    'research',
    'advanced',
    'read',
    $mn_nwcoast_master$> **Stories that are owned, witnessed and argued over.** On the Pacific coast of North America, the Haida, Tlingit, Tsimshian, Kwakwaka'wakw, Nuu-chah-nulth, Coast Salish and their neighbours hold oral literatures of great richness: Raven stories of how the world came to be, transformer stories written into the land, and crest histories recording which house owns which names, songs and territories. This chapter treats them as their own peoples do, as law, title and property as well as art. It follows their telling at the potlatch and Canada's ban on it, the Indigenous writers such as George Hunt and William Beynon who worked with collectors such as Franz Boas, the argument over how to put performance on the page, oral histories as evidence in *Delgamuukw v British Columbia*, and the storytellers and language learners carrying the tradition forward.

## A Coast of Many Nations

The peoples of the Northwest Coast do not speak one language. **Haida**, spoken on Haida Gwaii and on Prince of Wales Island in Alaska, is generally considered a language isolate, though some linguists place it in the Na-Dené family. **Kwak'wala** and **Heiltsuk** belong to the Wakashan family; the **Nuu-chah-nulth** live on Vancouver Island, where Cook's encounter at Yuquot in 1778 gave them the outsiders' name "Nootka". The Coast Tsimshian speak **Sm'algyax**, "real or true tongue", related to the languages of the Gitxsan and Nisga'a. The **Coast Salish** speak fourteen Salishan languages around the Salish Sea. Chinook Jargon, a trade language from the Columbia River, gave English the word *potlatch*, "to give away", originally from Nuu-chah-nulth.

They shared a social order in which stories were property. Haida and Tlingit society is divided into two halves, or moieties, Raven and Eagle, subdivided into clans and houses. Among the Tlingit, Tsimshian and Gitxsan descent is matrilineal, and Gitxsan clans are divided into Houses, each with a high chief, territories and fishing sites. These were ranked societies of nobles, commoners and slaves, as the chapter on North America before Columbus describes; the wider history of Indigenous nations, and of the field that studies them, is the subject of the chapter on Native American and Indigenous Studies.

Haida oral history itself begins with arrival: the coming to Haida Gwaii of the ancestresses of the matrilineages, among them SGuuluu Jaad (Foam Woman), Jiila Kuns (Creek Woman) and KalGa Jaad (Ice Woman).

## Raven and the Transformers

The best-known stories of the coast are the **Raven tales**, creation stories most prominent among the Haida, Tsimshian, Tlingit and Tahltan. Raven is a shape-shifter, a keeper of secrets, and a trickster often driven by his own gluttony, yet his appetites make the world. In a widespread episode the world is dark, because its owner keeps daylight in boxes. Raven turns himself into a speck of dirt, is swallowed by the owner's daughter, is reborn as her child, and cries and fusses until he is given the boxes of light, which he releases.

The Haida call Raven *Yáahl*, and see him as more than a trickster: magician, transformer, creative force, ravenous debaucher, but always a cultural hero. He released the sun from a box, and he found the first humans in a clamshell. That scene is the subject of the Haida artist **Bill Reid**'s sculpture *The Raven and the First Men*, carved in yellow cedar with a team of assistants and unveiled at the University of British Columbia's Museum of Anthropology in 1980.

{{image: The Raven and the First Men | Bill Reid's sculpture The Raven and the First Men (1980), showing Raven coaxing the first Haida from a clamshell.}}

These are not folk tales open to anyone. Some storytellers distinguish Raven stories from tall tales and children's stories: they are not entertainment, and can be the cultural property of a clan or an individual.

Further south, stories of **transformers** tie narrative to place. Stó:lō elders on the Fraser River say "we have always been here", and describe a landscape transformed by Xexá:ls, the Transformers, whose work is marked by transformer stones at sites such as Xá:ytem (Hatzic). Among the Kwakwaka'wakw, a *numaym*, or house, descended from a founder, usually a mythical animal who came down to earth and took off his mask, becoming human; mask and name passed to the house's leader, who embodied the founder. Boas came to argue that *numaym* is best understood as a bundle of privileges for which English has no word.

## Owned Stories: Crests, Houses and the Potlatch

Crest histories record how a house came by its rights. The Nisga'a record family histories called *adaawak* on their totem poles; the Nisga'a scholar Amy Parent has called one such pole, the Ni'isjoohl pole, "a living constitutional and visual archive". The Gitxsan *adaawḵ* are histories of a house's bloodline, and the Wet'suwet'en, partners of the Gitxsan in the court case described below, keep oral histories, including songs called *kungax*.

Such histories become valid by being performed and witnessed, above all at the **potlatch**. The potlatch was traditionally the primary governmental institution, legislative body and economic system of these peoples, held for births, deaths, adoptions, weddings and succession. The honouring of the supernatural and the recitation of oral histories were central to many potlatches. Titles associated with masks were "fastened on" to new holders, and ranked seats carried rights to hunting, fishing and berrying territories. The Haida Nation has rooted its democracy in potlatch law.

Practice varied. Tlingit potlatches were held for succession and funerals; Kwakwaka'wakw potlatches for marriages and the incorporation of new members. The most detailed knowledge comes from the Kwakwaka'wakw around Fort Rupert between 1849 and 1925, a period of crisis in which depopulation and government pressure intensified potlatching, so generalising about "the potlatch" from those records is risky.

## The Potlatch Ban and the Return of the Treasures

The missionary William Duncan called the potlatch in 1875 "by far the most formidable of all obstacles in the way of Indians becoming Christians, or even civilized". An amendment to the Indian Act banning the "Potlatch" and the "Tamanawas" dance was **passed in 1884 and in force from 1885**, with a penalty of two to six months' imprisonment. Indigenous opinion was divided: in 1883 Coast Tsimshian and Nisga'a chiefs at Port Simpson, Kincolith and Greenville had petitioned that potlatching "be put down". Others resisted. When Boas visited Fort Rupert in 1886, a Kwagu'ł chief made the case for the law his people actually lived under.

```quote
We will dance when our laws command us to dance, we will feast when our hearts desire to feast. Do we ask the white man, 'Do as the Indian does'? No, we do not. Why, then, will you ask us, 'Do as the white man does'? It is a strict law that bids us to dance.
Chief O'wax̱a̱laga̱lis of the Kwagu'ł · speech to Franz Boas, as recorded by Boas · published 1888
```

Boas himself opposed the ban, writing in 1888 that the law "is not a good one, and can not be enforced without causing general discontent." The first person charged, the Stó:lō man Bill Uslick, was arrested in 1896, and arrests remained few.

The decisive raid followed Chief **Dan Cranmer**'s potlatch at Christmas 1921 at 'Mimkwamlis on Village Island. Counts differ: one account has 45 people charged and 20 men and women sent to Oakalla Prison, and others give somewhat higher figures; the arrests followed in early 1922. Participants were offered suspended sentences if they surrendered their regalia. According to U'mista, the Kwakwaka'wakw later showed that the Indian agent William Halliday had illegally pressured them. The regalia, about 750 items by one count, were dispersed among museums in Canada and the United States. The ban was dropped only in the Indian Act revision of 1951.

The return was an Indigenous achievement. Cultural centres opened at Cape Mudge in 1979 and, as the **U'mista Cultural Centre**, at Alert Bay on 1 November 1980; *u'mista* is a Kwak'wala word for the return of something important that had been taken. The Royal Ontario Museum returned its portion in 1988. A driving force was Dan Cranmer's daughter, **Gloria Cranmer Webster**, who helped develop a Kwak'wala orthography. A founding board member explained why U'mista was a cultural centre rather than a museum: "Indians don't go to museums." Crest poles too have come home: the Nisga'a Ni'isjoohl pole, removed in 1929 and held in Edinburgh, arrived back at Lax̱g̱alts'ap in September 2023.

## Tellers and Collectors

Much of the written record was made between the 1880s and 1930s by outside collectors, working jointly, and often unequally, with Indigenous writers.

**Franz Boas**, who made a three-month trip to British Columbia in 1886, is the central outside figure. His Kwakwaka'wakw work depended on **George Hunt** (1854–1933), born at Fort Rupert to a Hudson's Bay Company man and Mary Ebbetts, or Anislaga, a Tlingit master Chilkat weaver. Boas met Hunt on his 1886 trip, and their collaboration grew from the late 1880s; Boas taught Hunt to write Kwak'wala, and Hunt wrote as many as ten thousand pages for him. Boas credited Hunt as co-author of *Kwakiutl Texts*, published in the series of the **Jesup North Pacific Expedition**, which Boas organised from 1897; the first series appeared in parts in 1902–1905. Boas deferred to him, writing in 1931: "In some cases, I can guess what is wrong but I had rather have you correct it than use my own uncertain knowledge of Kwakiutl." Judith Berman's study "George Hunt and the Kwak'wala Texts" (1994) is the key work on Hunt's authorship.

The entanglements were real. Hunt collected hundreds of objects for the 1893 World's Columbian Exposition in Chicago and brought a group of Kwakwaka'wakw to live in a mock village there and perform ceremonies banned in Canada. In 1904 he helped buy the Nuu-chah-nulth Whalers' Shrine from Yuquot for the American Museum of Natural History, a purchase long contested; the museum returned the shrine to the Mowachaht/Muchalaht in 2025. Boas himself posed as a Hamatsa figure for a museum display, an example of how sacred material passed into museums.

Among the Tsimshian, **Henry Tate** mailed transcribed narratives to Boas from 1903; they probably never met. Ralph Maud's *Transmission Difficulties* (2000) analyses how Boas's editing of *Tsimshian Mythology* (1916) distorted Tate's work. **William Beynon** (1888–1958), a Tsimshian hereditary chief, interpreted for the anthropologist **Marius Barbeau** from 1914, sent Boas about 250 narratives in the 1930s, and wrote a long account of a potlatch at Gitsegukla in 1945. Barbeau is controversial: he sought only "authentic" non-political stories, removed the Ni'isjoohl pole (the Nisga'a say without consent, while people were away), and he theorised that the Tsimshian, Haida and Tlingit were recent migrants from Asia. Yet under Beynon's influence he also promoted the idea that the region's oral histories of migration have real historical value.

Among the Haida, **John R. Swanton** of the Bureau of American Ethnology spent the winter of 1900–01 transcribing in Haida, assisted by Henry Moody. **Skaay** of the Qquuna Qiighawaay, born around 1827, who could neither read nor write, dictated works including the *Qquuna Cycle*, the longest poem recorded in Haida. **Ghandl** of the Qayahl Llaanas, blinded by one of the epidemics, dictated in November 1900, when epidemics had killed around ninety per cent of the Haida.

The scholar Guy Buchholtzer's verdict on this era is pointed: "The anthropological discourse had too often become a long monologue, in which the Kwakwa̱ka̱ʼwakw had nothing to say."

```checkpoint
q: What did an Indian Act amendment do to the potlatch in the 1880s?
a*: It banned the potlatch, in a measure passed in 1884 and in force from 1885, which lasted until the revision of 1951.
a: It protected the potlatch as part of Indigenous law.
x: The amendment criminalised the potlatch, with a penalty of two to six months' imprisonment.
a: It banned the potlatch only among the Tsimshian and Nisga'a, at their chiefs' request.
x: Some Tsimshian and Nisga'a chiefs petitioned against potlatching in 1883, but the ban applied generally.
a: It was repealed after Chief Dan Cranmer's potlatch of 1921.
x: The 1921 potlatch led to arrests and confiscations; the ban lasted until 1951.
hint: Think of the "strict law" and when it was finally dropped.
why: The ban shows how colonial law targeted the institution in which oral histories were recited and validated.
---
q: What was George Hunt's role in the making of the Kwakwaka'wakw texts?
a: He was a missionary who opposed the potlatch.
x: That was William Duncan; Hunt was raised in Kwakwaka'wakw culture and recorded it.
a: He was Boas's student at Columbia who never visited the coast.
x: Hunt was born at Fort Rupert and worked on the coast throughout.
a*: Raised at Fort Rupert, he wrote as many as ten thousand pages in Kwak'wala for Boas, who credited him as co-author of Kwakiutl Texts.
a: He removed the Ni'isjoohl pole to Edinburgh.
x: The pole was removed by Marius Barbeau in 1929.
hint: Think of who actually held the pen.
why: Hunt's authorship challenges the image of the lone outside ethnographer.
```

## How to Write a Performance

In the 1960s the poet Jerome Rothenberg coined the word **ethnopoetics**, and two scholars, Dennis Tedlock and Dell Hymes, developed it as a field. Both set texts out in lines, verses and stanzas rather than prose paragraphs, but they differed in emphasis.

**Dennis Tedlock**, working on Zuni and Maya rather than Northwest Coast material, used pauses to mark line breaks and made his texts something like musical scores, marking loudness, tone, silence and gesture. **Dell Hymes** worked from the region's own archive. His dissertation was a grammar of Kathlamet Chinook drawn from Boas's texts, and he argued that stories dictated long ago and printed as prose still contain a poetic organisation that can be recovered from grammatical and syntactic repetition: what he called **measured verse**. He worked with the Clackamas Chinook texts of **Victoria Howard**, dictated to Melville Jacobs from 1928, and the Kathlamet texts told by **Charles Cultee** to Boas. Comparing Cultee's two tellings of the "Salmon's Myth", in 1891 and 1894, Hymes argued that the teller had deliberately reshaped the story for different effect. The tellers were artists making choices. Tedlock and Hymes disagreed on details but shared aims; critics of both ask whether verse lines impose Western poetics on these stories.

A different solution came from the Interior, beyond the coast. **Harry Robinson**, an Okanagan (Syilx) storyteller of the Similkameen Valley, told his stories in English to Wendy Wickwire, whom he met in 1977. In *Write It on Your Heart* (1989) she set his English narratives in lines to keep his voice, making an elder's own English the literary medium, a contrast with the coastal texts dictated in Haida or Kwak'wala.

## Bringhurst and the Haida Classics

The sharpest argument about translation concerns the poet and typographer **Robert Bringhurst**. Drawn to the Haida texts through his friendship with Bill Reid, with whom he co-wrote *The Raven Steals the Light* (1984), he began in 1987 to work on Swanton's Haida transcriptions. His trilogy, *Masterworks of the Classical Haida Mythtellers*, set them as poetry and treated Skaay and Ghandl as named classical poets. The first volume, *A Story as Sharp as a Knife* (1999), was nominated for the Governor General's Award.

Critics accused him of exploitation and cultural appropriation. A 2001 CBC *Ideas* series featured Haida critics who said the work was about keeping them in their place, had been done without asking them, and was full of serious errors. The linguist Jeff Leer questioned Bringhurst's Haida in a review favouring John Enrico's rival translations; the journal later retracted the review and apologised. Defenders included Dell Hymes, who said the trilogy "should become a classic reference point", Margaret Atwood, and the Cree elder Wilna Hodgson, and it won the 2004 Edward Sapir Prize. Bringhurst replied that "culture is not genetic" and that his books were exercises in literary history, not interpretations of present-day Haida culture.

Who owns stories told in 1900 by Haida tellers? Can texts dictated to an outsider, in a speech community shattered by epidemics, be read as the classics of individual poets? And whose authority counts more, a non-Haida translator's or that of Haida speakers and linguists?

## Stories as Law: Delgamuukw

In *Calder v British Columbia* (1973), brought by the Nisga'a, the courts first acknowledged that Aboriginal title predated colonisation. In 1984, 35 Gitxsan and 13 Wet'suwet'en hereditary chiefs filed a claim to title and jurisdiction over 58,000 square kilometres of northwest British Columbia, on behalf of their Houses. The lead plaintiff, Delgamuukw, was Earl Muldoe; Gisday'wa (Alfred Joseph) spoke for the Wet'suwet'en, who, unlike their Gitxsan partners, speak an Athabaskan (Dene) language, Witsuwit'en.

The trial ran for 374 days between 1987 and 1990. Of 61 witnesses, many spoke in their own languages through translators, and some sang or described the ceremonial songs that relate the *adaawḵ* and *kungax*. In 1991 Chief Justice Allan McEachern dismissed the title claims. He was "unable to accept adaawk, kungax and oral traditions as reliable bases for detailed history", allowing them only to confirm findings based on other evidence, and he described pre-contact life as "nasty, brutish, and short". The Canadian Anthropology Society called the judgment "laced with ethnocentric bias", and the anthropologist Julie Cruikshank critiqued it in an article titled "Invention of Anthropology in British Columbia's Supreme Court".

On 11 December 1997 the Supreme Court of Canada reversed course on evidence. Chief Justice Lamer, for the majority, held that the trial judge had erred in his treatment of oral histories.

```quote
Notwithstanding the challenges created by the use of oral histories as proof of historical facts, the laws of evidence must be adapted in order that this type of evidence can be accommodated and placed on an equal footing with the types of historical evidence that courts are familiar with, which largely consists of historical documents.
Chief Justice Lamer · Delgamuukw v British Columbia, para 87 · 1997
```

The Court also defined Aboriginal title as a *sui generis* right of exclusive use and occupation. But it did **not** itself grant the Gitxsan and Wet'suwet'en title. Because of errors in the pleadings, which had merged 51 House claims into two, and in the treatment of evidence, it ordered a **new trial**, which has never been held. Commentators still debate whether the courts, while admitting oral histories, constrain them to fit legal categories.

## Stories and the Earth

Oral histories can also preserve events science later confirms. Japanese tsunami records and the tree rings of "ghost forests" date a great Cascadia earthquake to about 9 p.m. on 26 January 1700. Oral traditions from British Columbia to northern California tell of a great earthquake and flood. The Huu-ay-aht (Nuu-chah-nulth) account of Pachena Bay places it on a winter night after people had gone to sleep, consistent with the reconstructed time; every village on the bay was destroyed except Masit, on a mountainside above it. Kwakwaka'wakw, Cowichan, Makah and Quileute stories also describe a night-time quake or flood.

Caution runs both ways. The stories give no dates, and not every earthquake story in the region can be ascribed to 1700; Barbeau's Asian-migration theories show the opposite danger of forcing stories into outsiders' schemes. How historians treat oral tradition critically, as a source with its own genres and distortions, is discussed in the chapter What is History?. The Huu-ay-aht have drawn their own lesson, rebuilding their administration building on high ground as a tsunami refuge.

```checkpoint
q: What did the Supreme Court of Canada decide in Delgamuukw v British Columbia (1997)?
a: It granted the Gitxsan and Wet'suwet'en title to their territories.
x: The Court ordered a new trial rather than granting title itself; no second trial has been held.
a*: It held that oral histories must be placed on an equal footing with documentary evidence, and ordered a new trial.
a: It upheld the trial judge's view that oral traditions were unreliable.
x: The Court held that the trial judge's treatment of oral histories was an error.
a: It ruled that Aboriginal title had been extinguished.
x: Blanket extinguishment had already been rejected by the BC Court of Appeal in 1993, and the Supreme Court defined title as a sui generis right.
hint: Think of "equal footing" and what the Court did not do.
why: Delgamuukw changed the status of oral histories as evidence while leaving the title question unresolved.
---
q: How did Dell Hymes's ethnopoetics differ from Dennis Tedlock's?
a: Hymes worked only with sound recordings; Tedlock only with written texts.
x: It was closer to the reverse: Tedlock emphasised the recorded voice, Hymes the old dictated texts.
a: Hymes translated Haida texts; Tedlock translated Tlingit ones.
x: Hymes worked mainly on Chinookan texts, Tedlock on Zuni and Maya.
a: Hymes rejected setting stories in lines; Tedlock favoured it.
x: Both set stories in lines, verses and stanzas.
a*: Hymes recovered "measured verse" from patterns of repetition in old dictated texts such as Cultee's and Victoria Howard's; Tedlock scored pauses, loudness and tone from live performance.
hint: Think of the page versus the voice.
why: The debate is about what a written text can preserve of an oral performance.
```

## The Living Tradition

The literature is not a closed canon in archives. After 1951 potlatching revived openly, gaining strength in the 1970s and 1980s. On 22 August 1969 the Haida artist **Robert Davidson** raised a pole at Masset, widely described as the first on Haida Gwaii in roughly a century. In 2018 *SGaawaay K'uuna* (*Edge of the Knife*), the first feature film acted entirely in Haida, was shown first on Haida Gwaii and had its public premiere in Toronto.

The languages are fragile. Tlingit and Haida are critically endangered, and a 2022 report on all 34 First Nations languages in British Columbia counted about 3,370 fluent speakers (about 10,355 counting semi-speakers), but about 17,000 learners, some 3,000 more than four years before. Old texts find new uses: the Barbeau–Beynon collection serves the nations' own research into territories and oral traditions, and linguists see Beynon's digitised texts as a tool for reviving Sm'algyax.

Indigenous scholars now set the terms. The Tlingit writer **Nora Marks Dauenhauer**, whose first language was Tlingit, and Richard Dauenhauer edited *Classics of Tlingit Oral Literature*, volumes of narrative, oratory and life stories beginning with *Haa Shuká, Our Ancestors* (1987). The Stó:lō scholar **Jo-ann Archibald** (Q'um Q'um Xiiem), in *Indigenous Storywork* (2008), set out seven principles learned from Stó:lō and Coast Salish elders, respect, responsibility, reciprocity, reverence, holism, interrelatedness and synergy, likened to the strands of a cedar basket. Writers carry the stories into new forms: the Stó:lō writer **Lee Maracle**'s *Ravensong* (1993) blends oral tradition with struggles against racism and sexism, and the Haisla and Heiltsuk writer **Eden Robinson**'s *Monkey Beach* (2000) and *Son of a Trickster* (2017) bring Haisla spiritual tradition and the trickster into contemporary fiction. Raven is still travelling.

## Further exploration

- **Robert Bringhurst, *A Story as Sharp as a Knife: The Classical Haida Mythtellers and Their World* (1999).** The poet-translator's study of Skaay and Ghandl; brilliant and contested.
- **Nora Marks Dauenhauer and Richard Dauenhauer (eds.), *Haa Shuká, Our Ancestors: Tlingit Oral Narratives* (1987).** Bilingual Tlingit texts with Tlingit-led editing and commentary on clan ownership.
- **Jo-ann Archibald (Q'um Q'um Xiiem), *Indigenous Storywork: Educating the Heart, Mind, Body, and Spirit* (2008).** A Stó:lō scholar's principles for using stories respectfully.
- **Dell Hymes, *"In Vain I Tried to Tell You": Essays in Native American Ethnopoetics* (1981).** The essays in which Hymes set out "measured verse".
- **Harry Robinson, comp. and ed. Wendy Wickwire, *Write It on Your Heart: The Epic World of an Okanagan Storyteller* (1989).** Told-to narratives in an Okanagan elder's English.
- **Julie Cruikshank, *The Social Life of Stories: Narrative and Knowledge in Northern Canada* (1998).** How stories work as knowledge in Yukon communities.
- **Daniel Heath Justice, *Why Indigenous Literatures Matter* (2018).** A Cherokee scholar's case for Indigenous literatures on their own terms.$mn_nwcoast_master$,
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
  select $mn_nwcoast_quiz$[
    {"type": "mcq", "prompt": "What did Chief Justice McEachern decide at the Delgamuukw trial in 1991?", "options": ["He dismissed the title claims and said he could not accept adaawk, kungax and oral traditions as reliable bases for detailed history, except to confirm other evidence", "He granted the Gitxsan and Wet'suwet'en title to 58,000 square kilometres", "He ordered a new trial because of errors in the pleadings", "He ruled that oral histories must be placed on an equal footing with documents"], "answerIndex": 0, "explanation": "McEachern dismissed the claims and called pre-contact life 'nasty, brutish, and short'; the Supreme Court of Canada later held his treatment of oral histories to be an error and ordered a new trial in 1997.", "id": "q1"},
    {"type": "mcq", "prompt": "Who wrote as many as ten thousand pages of Kwak'wala texts for Franz Boas and was credited as co-author of Kwakiutl Texts?", "options": ["Henry Tate", "William Beynon", "George Hunt", "Charles Cultee"], "answerIndex": 2, "explanation": "George Hunt, raised at Fort Rupert, collaborated with Boas from 1886; Tate and Beynon were Tsimshian writers, and Cultee was a Kathlamet Chinook storyteller.", "id": "q2"},
    {"type": "mcq", "prompt": "Which honour did Robert Bringhurst's A Story as Sharp as a Knife (1999) receive?", "options": ["It won the Governor General's Award", "It was retracted by its publisher", "It was endorsed by a CBC Ideas series as authoritative", "It was nominated for the Governor General's Award, and the trilogy later won the 2004 Edward Sapir Prize"], "answerIndex": 3, "explanation": "The book was nominated, not a winner, for the Governor General's Award; the trilogy won the Sapir Prize, while a 2001 CBC Ideas series aired Haida criticism of it.", "id": "q3"},
    {"type": "mcq", "prompt": "Why did Dell Hymes compare Charles Cultee's two tellings of the 'Salmon's Myth' (1891 and 1894)?", "options": ["To prove that oral stories never change", "To show, through measured verse analysis, that the teller had deliberately reshaped the story for different effect", "To date the 1700 Cascadia earthquake", "To show that Boas had invented the texts"], "answerIndex": 1, "explanation": "Hymes argued that the patterning of the two tellings revealed deliberate artistic choices by Cultee.", "id": "q4"},
    {"type": "open", "prompt": "Explain how Northwest Coast oral histories function as law and title, using the potlatch and the Delgamuukw case.", "rubric": "A strong answer explains that crest histories (adaawak/adaawḵ, kungax) record house rights to names, songs and territories and are validated by being recited and witnessed at the potlatch, the traditional governmental and legal institution; notes the potlatch ban (passed 1884, in force from 1885 until 1951) and the 1921 Cranmer arrests; describes the Delgamuukw trial (61 witnesses, songs and adaawḵ as evidence), McEachern's 1991 rejection, and the Supreme Court of Canada's 1997 ruling that oral histories be placed on an equal footing with documents, while noting that the Court ordered a new trial and did not itself grant title.", "id": "q5"},
    {"type": "open", "prompt": "Who has authority over Northwest Coast stories recorded by outsiders? Discuss with reference to Boas and Hunt, Barbeau, and Bringhurst.", "rubric": "A strong answer recognises that published texts were co-produced by Indigenous writers (Hunt, Tate, Beynon) often under-credited, citing Berman and Maud; notes colonial entanglements (the 1893 Chicago fair, the Whalers' Shrine, Barbeau's removal of the Ni'isjoohl pole); weighs the Bringhurst controversy (Haida critics on appropriation and errors, Leer's retracted review, versus Hymes, Atwood and the Sapir Prize, and Bringhurst's 'culture is not genetic'); and points to Indigenous-led work and repatriation (U'mista, the Dauenhauers, Archibald's storywork principles).", "id": "q6"}
  ]$mn_nwcoast_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/regional-histories/americas/indigenous-oral-literatures-of-the-northwest-coast-of-north-america', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

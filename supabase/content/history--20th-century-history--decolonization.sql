-- Decolonization — canonical master article, co-written and human-reviewed.
-- history/20th-century-history/european-decolonization @ research/advanced/read.
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
    'history/20th-century-history/european-decolonization',
    'research',
    'advanced',
    'read',
    $mn_decol_master$> **The end of the European empires.** In 1945 the United Nations had 51 founding members; by 1980 its membership had tripled, and much of that growth came from the end of the empires of Britain, France, the Netherlands, Belgium and Portugal. This chapter follows how the colonised made that happen, from Indonesia's revolution and Dien Bien Phu to Ghana, the African wave of 1960, the Algerian War and the guerrillas who brought down Portugal's dictatorship. It also covers Suez, the anticolonial internationalism of Bandung, the theorists Fanon and Nkrumah, and the arguments that continue over borders, the Commonwealth, Françafrique, apologies and the balance sheet of empire.

## Promises of War

In August 1941 Britain and the United States declared in the Atlantic Charter that they would "respect the right of all peoples to choose the form of government under which they will live", and wished to see self-government "restored to those who have been forcibly deprived of them". Colonised nationalists took this as a promise. Free France made a narrower one: at Brazzaville in early 1944, de Gaulle offered the end of forced labour, elected territorial assemblies and representation in Paris, but explicitly rejected independence.

The colonised were already organising. In October 1945 the Fifth Pan-African Congress met in Manchester, with **Kwame Nkrumah** of the Gold Coast and **George Padmore** of Trinidad among its principal organisers. It called for a federal United States of Africa.

Decolonisation came in waves: first in Asia straight after 1945, then the Middle East, then sub-Saharan Africa in the 1960s, and finally, mostly, small islands. It was rarely planned, coming in response to politics in the colonies, politics at home and international pressure.

## Asia First: India, Indonesia, the Philippines and Malaya

British India became independent as two states, India and Pakistan, on 14–15 August 1947. As the chapter on Partition describes, it was accompanied by mass violence and flight: estimates of the dead range from 200,000 to 2 million, and between 12 and 20 million people were displaced. Burma and Ceylon followed in 1948.

In the Dutch East Indies, **Sukarno** and **Mohammad Hatta**, pressed by radical *pemuda* (youth), proclaimed Indonesia's independence on 17 August 1945, as the chapter on Japan's empire describes. The Dutch returned behind British and British-Indian troops sent to accept the Japanese surrender. At Surabaya in October and November 1945, the bloodiest single battle of the revolution, somewhere between 6,300 and 15,000 Indonesian fighters were killed. The revolution had its own violence: in the *bersiap* of 1945–46, pemuda killed Dutch internees, Eurasians, Ambonese, Chinese and others; estimates of the European and Eurasian dead alone range from 3,500 to as many as 30,000, the higher figures disputed.

{{image: Proclamation of Indonesian Independence | Sukarno, with Mohammad Hatta beside him, proclaims Indonesia's independence on 17 August 1945.}}

The Netherlands launched two large offensives which it called "police actions". The first, in July 1947, seized valuable regions of Java and Sumatra; the second, in December 1948, took the Republican capital Yogyakarta and exiled Sukarno and Hatta, while General Sudirman led a guerrilla war. In South Sulawesi in 1946–47 Westerling's unit carried out summary executions; Dutch scholars estimate that several thousand civilians were killed there, while Indonesia commemorates 40,000. At the village of Rawagede on 9 December 1947, Dutch troops killed almost all the men, 431 by most estimates, for refusing to reveal a guerrilla's whereabouts. In 2011 a Dutch court found the state liable, and the widows received compensation.

American pressure, sharpened because the Republic had crushed a communist rising at Madiun in 1948, forced the Dutch to negotiate. Sovereignty passed on 27 December 1949, on hard terms: Indonesia took on the colonial government's debt of 4.5 billion guilders, in effect paying for the wars waged against it. Indonesian deaths are estimated at around 100,000, with some estimates as high as 250,000; more than 4,000 Dutch soldiers died. In 2022 a review by three Dutch research institutes concluded that extreme violence by Dutch forces "was not only widespread, but often deliberate, too", and Prime Minister Mark Rutte apologised.

The Philippines became independent from the United States on 4 July 1946, but the Americans kept dozens of military bases, and the Bell Trade Act, a condition of war-rehabilitation aid, gave Americans "parity rights" to Philippine natural resources.

In **Malaya** an Emergency was declared in June 1948 against the Malayan Communist Party's guerrillas, led by Chin Peng and overwhelmingly ethnic Chinese, many of them veterans of the wartime resistance Britain had helped arm. The British forcibly resettled rural people, hundreds of thousands and by some counts a million, into guarded "New Villages". At Batang Kali in December 1948, Scots Guards shot 24 unarmed men on a rubber estate; there was one survivor, Chong Hong. Malaya became independent in August 1957; the Emergency outlasted independence until 1960.

## Indochina and Dien Bien Phu

In Vietnam, the Viet Minh declared independence in September 1945. France fought to restore its rule from December 1946, and from 1950, when China and the Soviet Union recognised the Viet Minh's government and the United States recognised the rival State of Vietnam, the colonial war became part of the Cold War.

The war was decided at **Dien Bien Phu**. From 13 March to 7 May 1954, Võ Nguyên Giáp's forces besieged it from the surrounding heights, where they had hauled their artillery; tens of thousands of porters carried supplies. The Viet Minh took about 11,000 prisoners; only 3,290 came back. The Geneva Conference took up Indochina the day after the fall, and the accords of July 1954 divided Vietnam at the 17th parallel, pending elections in 1956 that were never held. The defeat brought a profound psychological shock to France. Six months later, on 1 November 1954, Algeria's National Liberation Front (FLN) began its war.

## Suez, 1956

On 26 July 1956 Egypt's leader, **Nasser**, announced the nationalisation of the Suez Canal Company. Britain, France and Israel secretly planned an attack, launched at the end of October; France also wanted to stop Egyptian support for the FLN. Egyptians, who lost an estimated 1,650 to 3,000 soldiers and about 1,000 civilians, call it the "Tripartite Aggression". But American financial pressure, which Britain's reserves could not withstand, Soviet threats and action at the United Nations forced a withdrawal. The crisis showed that Britain and France could no longer pursue independent foreign policies without American consent. It marked the end of imperial pretension, as the chapters on the British Empire and the global Cold War also mention.

## Ghana and the African Wave

The Gold Coast, Britain's "model colony", exploded in 1948. Prices had soared after the war, and townspeople boycotted shops; cocoa farmers were furious that officials destroyed trees infected with swollen-shoot disease; and many of some 63,000 returned Second World War veterans were out of work. On 28 February 1948 police shot dead three veterans on a petition march, setting off riots across the colony. "The African Revolution had begun," wrote Nkrumah's biographer David Birmingham.

The British arrested the "Big Six" nationalist leaders, among them Nkrumah. In June 1949 he founded the **Convention People's Party**, a mass party of the young, ex-servicemen and market women, demanding "Self-Government Now". Its "Positive Action" general strike in 1950 landed him in prison, but in the February 1951 election, the first under universal franchise in colonial Africa, the CPP won 34 of 38 contested seats, and the governor released Nkrumah to form a government. At midnight on 5–6 March 1957, Ghana became independent, the first of Britain's African colonies to gain majority-rule independence. "Ghana, your beloved country, is free forever," Nkrumah declared.

France tried to keep its African territories in a "French Community". In de Gaulle's referendum of September 1958, every territory voted yes except **Guinea**, led by Ahmed Sékou Touré, whose reply is usually translated as "We prefer poverty in freedom to riches in slavery." Guinea became independent on 2 October 1958, and France punished it, cutting aid and, after Guinea left the franc zone in 1960 to issue its own currency, flooding it with counterfeit notes.

Then came 1960, the "Year of Africa". Seventeen African countries became independent, fourteen of them from France, and the number of independent African states rose from 9 to 26. In February 1960 Harold Macmillan told South Africa's parliament that "the wind of change is blowing through this continent". In December the UN General Assembly adopted **Resolution 1514**, declaring foreign rule a violation of human rights, by 89 votes to none; the nine abstainers included Britain, France, Belgium, Portugal, South Africa and the United States. The historian Adom Getachew argues that anticolonial nationalists turned the UN into a forum for their own project of worldmaking.

Independence did not always mean what it promised. In the Belgian Congo, independent on 30 June 1960 with almost no preparation, the Belgian general Émile Janssens wrote for Congolese non-commissioned officers "Before Independence = After Independence". They mutinied, Katanga seceded with Belgian backing, and the crisis that followed, including the killing of **Patrice Lumumba** in January 1961, is told in the chapter on the global Cold War.

```checkpoint
q: What set off the Accra riots of February 1948 in the Gold Coast?
a*: Police shot dead three ex-servicemen on a petition march, amid inflation, a shop boycott and cocoa farmers' anger.
a: Nkrumah's proclamation of independence.
x: Independence came only in 1957; in 1948 Nkrumah was still secretary of the UGCC and was arrested after the riots.
a: The Suez crisis.
x: Suez came in 1956, eight years later.
a: The Gold Coast's vote in de Gaulle's referendum.
x: De Gaulle's 1958 referendum was held in French territories; the Gold Coast was British.
hint: Think of the veterans of the Second World War.
why: Postwar grievances and the shooting of veterans turned a "model colony" into the starting point of mass nationalism in British Africa.
---
q: Why did France punish Guinea in 1958?
a: Because Guinea joined the Algerian FLN's war.
x: Guinea's offence was political, not military: its vote in the referendum.
a: Because Guinea refused to send troops to Indochina.
x: The Indochina war had ended in 1954; the issue in 1958 was the referendum.
a*: Because it was the only French African territory to vote "no" to the French Community and so took immediate independence.
a: Because Guinea nationalised the Suez Canal.
x: It was Egypt's Nasser who nationalised the Suez Canal Company, in 1956.
hint: Think of de Gaulle's referendum of September 1958.
why: France's response to Guinea's "no" showed the price of breaking with Paris, which shaped the choices of the territories that became independent in 1960.
```

## Algeria, 1954–1962

Algeria was not legally a colony at all but part of France, with about a million European settlers, the *pieds-noirs*, around a tenth of the population. Many date the war's roots to **Sétif and Guelma** in May 1945, as the chapter on France under Nazi occupation notes: after police fired on a demonstration on VE Day, Algerians killed 102 settlers, and French forces and settler militias then killed thousands. Estimates range from the official 1,020, through 3,000 to 8,000 by several French historians, to 45,000, broadcast by Radio Cairo at the time and still Algeria's official figure.

The FLN's coordinated attacks of 1 November 1954 called for the "restoration of the Algerian state – sovereign, democratic and social …" within the framework of Islamic principles. By 1956 France had more than 400,000 troops in Algeria. In the **Battle of Algiers** from 1956, FLN women including **Djamila Bouhired** and **Zohra Drif** planted bombs, one of them at the Milk Bar café, and General Massu's paratroopers broke the FLN's network by systematic torture. The historian Pierre Vidal-Naquet estimated "hundreds of thousands of instances of torture" during the war. The death of the mathematician Maurice Audin in army custody in 1957 and Henri Alleg's book *La Question* made it public. The army also moved more than 2 million Algerians from their villages into army-controlled camps.

A settler and army revolt in Algiers in May 1958 brought de Gaulle back to power and gave France a new constitution, the Fifth Republic, but in 1959 he accepted the principle of self-determination. Settlers and soldiers formed the terrorist OAS to stop him. The Évian Accords of March 1962 ended the war, and Algerians voted almost unanimously for independence in July 1962.

The dead are still counted differently. Estimates of Algerian deaths run from about 400,000 to 1.5 million: French officials and historians have mostly given around 350,000 to 400,000, the historian Alistair Horne about a million, and the official Algerian figure is 1.5 million. About 25,000 French soldiers died. Close to a million Europeans left in 1962. The harkis, Algerians who had served France as auxiliaries, paid heavily: estimates run from at least 30,000 to as many as 150,000 harkis and their dependants were killed in Algeria. France officially called the conflict "operations to maintain order" until 1999. Testimony such as Louisette Ighilahriz's in *Le Monde* in 2000 reopened the issue; in 2018 President Macron recognised the state's responsibility for Audin's death, and in 2021 he asked the harkis' forgiveness.

## Settlers and the Long Wars

Algeria fitted a pattern. Decolonisation was longest and bloodiest where European settlers held land and power and could lobby, vote and fight. In **Kenya**, as the chapter on the British Empire describes, the Mau Mau war brought mass detention, 1,090 executions and deaths estimated from at least 11,000 to 25,000 or more. In **Southern Rhodesia**, self-governing since 1923 with a white minority of about 5 per cent, Ian Smith's government declared independence unilaterally in November 1965, rejecting Britain's condition that the terms be acceptable to the people of the country as a whole. A guerrilla war waged from 1964 by Mugabe's ZANLA and Nkomo's ZIPRA killed about 20,000 people before the Lancaster House Agreement of December 1979 led to an independent Zimbabwe in 1980.

## Portugal's Last Empire

Portugal's dictatorship, the Estado Novo, called its colonies "overseas provinces" and refused to leave them, and the settler population of Angola and Mozambique roughly doubled between 1960 and the mid-1970s. War began in Angola in 1961 and spread to Guinea-Bissau in 1963 and Mozambique in 1964. Some 800,000 Portuguese men served in Africa, and by some estimates the wars took up to 40 per cent of the budget in the 1970s. By the early 1970s about half of Portugal's operational troops in Africa were Africans. Estimates suggest some 70,000 to 110,000 civilians died. At Wiriyamu in Mozambique in December 1972, Portuguese troops massacred villagers, estimates range from about 150 to about 400, with the historian Mustafah Dhada counting 385; in 2022 Prime Minister António Costa called it "an unforgivable act that dishonours Portuguese history".

In Guinea-Bissau, **Amílcar Cabral**, an agronomist, led the PAIGC. In its "liberated zones" it ran a roving hospital, people's courts and a mobile bazaar selling staples below colonial prices, and it set up a women's union, requiring women on village councils: "our revolution will never be victorious," Cabral argued, "if we do not achieve the full participation of women". He was assassinated in Conakry in January 1973. In Mozambique, FRELIMO's first leader, Eduardo Mondlane, was killed by a parcel bomb in 1969, and Samora Machel became its leader in 1970.

The wars broke the regime. On 25 April 1974, officers radicalised by them overthrew the dictatorship in the Carnation Revolution. Portugal recognised Guinea-Bissau's independence in September 1974, and Mozambique became independent on 25 June 1975 and Angola on 11 November 1975, where independence led straight into civil war. Hundreds of thousands of *retornados* returned to Portugal.

## Bandung and the Third World Project

The new states did not only escape empire; they tried to change the world order. At **Bandung** in Indonesia in April 1955, delegates from 29 Asian and African countries condemned colonialism, and in 1961 the **Non-Aligned Movement** was founded at Belgrade, with Nkrumah among its leaders; the chapter on the global Cold War tells both stories. In 1963 African states founded the Organisation of African Unity to eradicate colonialism and white minority rule. In 1974 the UN General Assembly adopted a declaration for a **New International Economic Order**, which said the existing order had been "established at a time when most of the developing countries did not even exist as independent states", and demanded sovereignty over natural resources and fairer terms of trade. The 1980s debt crisis sank most of it. Getachew calls such efforts "worldmaking".

## The Theorists: Fanon and Nkrumah

The most influential theorist of decolonisation came from the Caribbean. **Frantz Fanon**, born in Martinique in 1925, served in the Free French army, and headed a service at a psychiatric hospital in Algeria before joining the FLN. He dictated *The Wretched of the Earth* while dying of leukaemia in 1961.

```quote
…decolonization is always a violent phenomenon.
Frantz Fanon · The Wretched of the Earth · 1961
```

Fanon argued that because colonial rule rested on force, its overthrow would too, and Jean-Paul Sartre's preface celebrated violence. Some scholars argue that translations made Fanon sound like an apostle of violence, and that his most prophetic pages warned against a "national bourgeoisie" that would merely take the colonisers' place. He quoted Gabon's president Léon M'ba: "Gabon is independent, but between Gabon and France nothing has changed; everything goes on as before."

Nkrumah named that worry. The term "neocolonialism" is usually traced to Sartre in 1956, though Nkrumah is sometimes credited with it; he popularised it, applied it to decolonising Africa, and gave it its classic definition in his book of 1965.

```quote
The essence of neo-colonialism is that the State which is subject to it is, in theory, independent and has all the outward trappings of international sovereignty. In reality its economic system and thus its political policy is directed from outside.
Kwame Nkrumah · Neo-Colonialism, the Last Stage of Imperialism · 1965
```

Ghana's own experience was his evidence: the price of cocoa fell from £250 a ton in 1960 to £91 in 1965, and the Volta dam was built on terms set by Kaiser Aluminum. Critics such as Brian Crozier replied in 1965 that neocolonialism was "not a system but a state of affairs". Nkrumah himself had made Ghana a one-party state in 1964 and was overthrown by a coup in February 1966. Later, Walter Rodney's *How Europe Underdeveloped Africa* (1972) and Ngũgĩ wa Thiong'o's *Decolonising the Mind* (1986), a call to write in African languages, carried the argument on.

## Contested Legacies

**Borders.** The new states kept the boundaries their colonisers had drawn, with all the divisions they contained.

**The Commonwealth.** The London Declaration of 1949 let republics such as India remain members. Today the Commonwealth has 56 members, including Mozambique, Rwanda, Gabon and Togo, which Britain never ruled.

**Françafrique.** France kept a sphere of influence in its former African colonies, run from the Élysée by Jacques Foccart, through business networks and defence agreements that allowed intervention. The CFA franc, created in 1945 and now pegged to the euro, is still used in 14 countries, though in 2020 the French parliament voted to end France's role in the West African version's reserves. In the 2020s the military governments of Mali, Burkina Faso and Niger ended their military agreements with France.

**Archives and apologies.** In "Operation Legacy", Britain destroyed or removed embarrassing files from at least 23 territories before independence; secretly kept files emerged only after 2011. Apologies came late, from the Netherlands, France, Britain and Portugal.

**The balance sheet.** Defenders of Britain's record describe its decolonisation as "peaceful, orderly and consensual". Historians who stress emergencies, detention and torture reject that view, as postcolonial societies always did; Erik Linstrum argues that the British public knew a good deal about colonial violence. The wider argument over empire's balance sheet, including Caroline Elkins's work, is set out in the chapter on the British Empire. Todd Shepard argues that France "invented" decolonisation as an inevitable stage of history to escape responsibility for Algeria. Frederick Cooper argues that African states inherited "gatekeeper" structures, strong at the interface with the world economy but weak inside, making control of the state a prize worth a coup.

**Is it finished?** Seventeen territories remain on the UN's list of non-self-governing territories. In 1965 Britain detached the Chagos Archipelago from Mauritius as a condition of Mauritian independence, and between 1967 and 1973 expelled its inhabitants for an American base on Diego Garcia. In 2019 the International Court of Justice advised that Mauritius's decolonisation "was not lawfully completed". A 2025 treaty would transfer sovereignty to Mauritius, but it had not entered into force by late 2026.

```checkpoint
q: What did Nkrumah mean by "neo-colonialism"?
a: The settlement of new European colonists in Africa after 1945.
x: Nkrumah's concern was formally independent states, not new settlement.
a*: A situation in which a state is formally independent but its economy, and so its policy, is directed from outside.
a: A new colonial empire built by African states.
x: He meant outside control of African states, not empires built by them.
a: A term he coined for the Commonwealth.
x: The term is usually traced to Sartre in 1956, and Nkrumah did not mean the Commonwealth.
hint: Think of "the outward trappings of international sovereignty".
why: The idea explains why independence often felt incomplete, and it remains central to debates over Françafrique and the CFA franc.
---
q: Why do some argue that decolonisation is still not complete?
a: Because no African state has joined the United Nations.
x: The UN grew from 51 members in 1945 to 193 today, many of them former colonies.
a: Because Britain still rules Ghana.
x: Ghana became independent in 1957.
a: Because Resolution 1514 was voted down in 1960.
x: Resolution 1514 passed by 89 votes to none.
a*: Because territories remain on the UN's non-self-governing list and the ICJ found Mauritius's decolonisation not lawfully completed over Chagos.
hint: Think of the Chagos Archipelago.
why: Formal empire has almost vanished, but disputes over remaining territories and economic dependence keep the question open.
```

## Further exploration

- **Jan C. Jansen and Jürgen Osterhammel, *Decolonization: A Short History* (2017).** A compact global survey linking decolonisation to a shift in global norms.
- **Adom Getachew, *Worldmaking after Empire: The Rise and Fall of Self-Determination* (2019).** African and Caribbean anticolonial nationalists as builders of a new international order.
- **Frederick Cooper, *Africa since 1940: The Past of the Present* (2002).** Late colonialism, independence and the "gatekeeper state".
- **Todd Shepard, *The Invention of Decolonization: The Algerian War and the Remaking of France* (2006).** How France recast the loss of Algeria as inevitable.
- **David Van Reybrouck, *Revolusi: Indonesia and the Birth of the Modern World* (2020; English 2024).** A narrative history of the Indonesian revolution as a world event.
- **Erik Linstrum, *Age of Emergency: Living with Violence at the End of the British Empire* (2023).** What the British public knew of colonial violence.
- **Frantz Fanon, *The Wretched of the Earth* (1961; English trans. 1963 and 2004).** The classic anticolonial text, with its warning about post-independence elites.$mn_decol_master$,
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
  select $mn_decol_quiz$[
    {"type": "mcq", "prompt": "What did the Indonesian Republic agree to at the 1949 transfer of sovereignty that critics see as paying for the wars waged against it?", "options": ["Taking on the Netherlands East Indies debt of 4.5 billion guilders", "Remaining a colony until 1960", "Giving up Java and Sumatra", "Joining NATO"], "answerIndex": 0, "explanation": "Sovereignty passed on 27 December 1949 to a federal United States of Indonesia, which took on the colonial debt of 4.5 billion guilders, in effect paying for the Dutch 'police actions'.", "id": "q1"},
    {"type": "mcq", "prompt": "What did the Suez crisis of 1956 show about Britain and France?", "options": ["That they could still defeat any rival without allies", "That the Soviet Union controlled their foreign policy", "That they could no longer pursue independent foreign policies without American consent", "That Egypt would rejoin the British Empire"], "answerIndex": 2, "explanation": "After Nasser nationalised the Suez Canal Company, Britain, France and Israel attacked Egypt, but American financial pressure, Soviet threats and UN action forced them to withdraw: the end of imperial pretension.", "id": "q2"},
    {"type": "mcq", "prompt": "Which statement about the origin of the term 'neocolonialism' is accurate?", "options": ["Nkrumah invented it in 1965", "It is usually traced to Sartre in 1956, and Nkrumah popularised it and applied it to decolonising Africa", "It was first used in the Atlantic Charter", "Fanon coined it in Black Skin, White Masks"], "answerIndex": 1, "explanation": "The word is traced to Sartre in 1956 and appears in the OAU Charter of 1963; Nkrumah popularised it and gave it its classic definition in Neo-Colonialism, the Last Stage of Imperialism (1965).", "id": "q3"},
    {"type": "mcq", "prompt": "What brought down Portugal's Estado Novo dictatorship in April 1974?", "options": ["An invasion by Spain", "A general election lost by Salazar", "A UN Security Council resolution", "A coup by officers radicalised by the colonial wars in Africa"], "answerIndex": 3, "explanation": "The Carnation Revolution of 25 April 1974 was a military coup by officers radicalised by wars that by some estimates took up to 40 per cent of Portugal's budget; independence for the African colonies followed by 1975.", "id": "q4"},
    {"type": "open", "prompt": "Why were the wars of decolonisation longest and bloodiest where European settlers lived? Use at least two examples.", "rubric": "A strong answer explains that settlers held land and political power and could lobby, vote and fight, and that governments feared settler revolt as well as nationalist revolt. Examples might include Algeria (about a million pieds-noirs; Algeria legally part of France; the May 1958 revolt and the OAS), Kenya (Mau Mau, mass detention and 1,090 executions), Southern Rhodesia (a white minority of about 5 per cent; UDI in 1965; a war that killed about 20,000) and Portuguese Africa (settler populations in Angola and Mozambique roughly doubled after 1960). Credit answers that note the exodus of settlers after independence.", "id": "q5"},
    {"type": "open", "prompt": "Was decolonisation a peaceful 'transfer of power' or a struggle won by the colonised? Discuss with evidence from at least two empires.", "rubric": "A strong answer sets out the 'peaceful, orderly and consensual' view of British decolonisation and the challenges to it: emergencies in Malaya and Kenya, Batang Kali, Operation Legacy's destruction of files, and Linstrum's argument that the British public knew of colonial violence. It shows how the colonised forced the pace (the Accra riots of 1948, Positive Action, Guinea's 'no', the Algerian and Portuguese wars) and may contrast Dutch violence in Indonesia (Rawagede, the 2022 review) or Shepard's argument that France 'invented' decolonisation as inevitable. Credit balanced answers that note where negotiation did matter, as in Ghana's elections of 1951.", "id": "q6"}
  ]$mn_decol_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/20th-century-history/european-decolonization', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

-- British Empire — canonical master article, co-written and human-reviewed.
-- history/modern-era-19th-century/british-empire @ research/advanced/read.
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
    'history/modern-era-19th-century/british-empire',
    'research',
    'advanced',
    'read',
    $mn_britemp_master$> **The largest empire in history, seen from both sides.** By 1913 Britain ruled about 412 million people, roughly 23 per cent of the world's population, and by 1920 its empire covered about a quarter of the Earth's land. This chapter follows that empire from the plantations of Ireland and the sugar islands of the Caribbean, through the conquest of India and the Raj, the settler colonies built on Indigenous land, and the occupations of Egypt and West Africa, to the world wars, Partition, Suez, the Kenya Emergency and the handover of Hong Kong in 1997. It gives as much weight to the people who were ruled, and who resisted, as to the rulers, and it ends with a debate that is still fierce: how to weigh the empire's balance sheet.

## An Empire of Many Empires

The phrase "the empire on which the sun never sets" was applied to the Spanish Habsburg empire of Charles V and Philip II before it was applied to Britain. The term "British Empire" itself goes back to John Dee in the late sixteenth century. By 1920 the empire covered 35.5 million square kilometres, the largest in history. Yet the Victorians were not always sure how they had acquired it.

```quote
We seem, as it were, to have conquered and peopled half the world in a fit of absence of mind.
J. R. Seeley · The Expansion of England · 1883
```

Seeley told the story as the expansion of the English nation and defended British rule in India as in India's interest; his book inspired Cromer, Curzon and other imperial figures. Later historians have argued instead about design, profit and violence, and asked how the empire looked to those on its receiving end. They distinguish a "First British Empire", built on settler migration and Caribbean sugar until the loss of the Thirteen Colonies, from a "Second" based on trading ports, naval bases and India, though Timothy Parsons suggests that "there were several British empires that ended at different times and for different reasons."

## The First Empire: Ireland, the Atlantic and Sugar

England's first modern colonisation was in Ireland. In the sixteenth century English and Welsh Protestants were settled on "plantations", and between 1585 and 1603 England completed its conquest. The official Plantation of Ulster began in 1609 under James I, mostly on land confiscated from Gaelic chiefs. Cromwell's conquest in the 1650s completed the process, and the Act of Union of 1800 joined Ireland to Great Britain. During the Great Famine of 1845–52, which killed between 775,000 and 1.5 million people, large quantities of food were still exported from Ireland; the chapter on nationalism traces what followed.

Across the Atlantic, the Virginia Company's settlement at Jamestown (1607) became the first permanent English settlement in the Americas. In the Caribbean, England settled St Kitts, Barbados and Nevis in the 1620s and took Jamaica from Spain in 1655. From the 1640s Barbados turned to large sugar plantations, worked first by white indentured servants and then by enslaved Africans. British ships carried over a quarter of all Africans shipped across the Atlantic, some 3.2 to 3.5 million people, until the trade was abolished in 1807; on average one in seven died on the Middle Passage. Between 1650 and 1780 people of African descent rose from a quarter to about 80 per cent of the British Caribbean's population.

After the Seven Years' War (1756–63), the Royal Proclamation of 1763, which reserved the land west of the Appalachians as an "Indian Reserve" closed to new settlement, became one of the first quarrels between London and its colonists. As the chapter on the American Revolution describes, that quarrel ended in 1783 with American independence. Tens of thousands of Loyalists moved north to British North America.

## The Swing to the East

As the chapter on Trading Companies and Empires describes, the East India Company turned a trading presence into rule over Bengal after Plassey in 1757. The Bengal famine of 1770 followed, with estimates ranging from 1 to 10 million deaths, while Company revenue was "violently kept up to its former standard". After Tipu Sultan of Mysore was killed in 1799 and the Maratha Peshwa surrendered in 1818, the Company controlled most of the subcontinent, with armies made up overwhelmingly of Indian sepoys.

Historians disagree about what this meant. Rajat Kanta Ray calls the new economy "plunder". P. J. Marshall argues that the British were actors in what was primarily an Indian story, dependent on Indian elites and bankers, though he admits his view is contested. The Company also set out to remake Indian minds: in 1835 T. B. Macaulay argued for English education to form "a class of persons, Indian in blood and colour, but English in taste, in opinions, in morals, and in intellect." Meanwhile British cloth flooded in, from about 1 million yards in 1814 to over 2,000 million in 1890, a deindustrialisation the chapter on the Industrial Revolution discusses.

## 1857 and the Raj

The rising that began at Meerut on 10 May 1857 had many causes, among them the annexation of Awadh in 1856, the Doctrine of Lapse that denied adopted heirs and let the Company take states such as Jhansi, dispossessed landholders, and fear of missionary interference. Rumours that new rifle cartridges were greased with cow and pig fat became the spark, although the historian Kim Wagner finds little evidence that many such cartridges were actually issued. Rebels reached Delhi on 11 May and proclaimed the 81-year-old Bahadur Shah Zafar Emperor of Hindustan, as the chapter on the Mughal Empire recounts.

Both sides committed atrocities. At Kanpur, after the siege, about 200 British women and children held in the Bibighar were killed; but Colonel James Neill's punitive killings at Allahabad and Fatehpur had begun earlier, and British troops later blew captured sepoys from cannon. Rani Lakshmibai of Jhansi died fighting at Gwalior in June 1858. Much of India did not rise: many princely states, which Lord Canning called "breakwaters in a storm", stayed out, Sikh princes and Punjabi troops helped retake Delhi, and about 80 per cent of the forces that crushed the revolt were Indian. Some 6,000 of the 40,000 British in India were killed; for Indians there are only rough estimates, of perhaps 800,000 dead and very likely more, including deaths from famine and disease. Even the name is contested: "Mutiny" in Britain, the "First War of Independence" in India and Pakistan.

In 1858 the Crown took over from the Company. Queen Victoria's Proclamation promised Indians the same rights as her other subjects and disclaimed any desire to impose her convictions on them; Indians would later quote it when those rights were withheld. Under the Royal Titles Act of 1876, promoted by Disraeli and opposed by Gladstone as despotic, Victoria was proclaimed **Empress of India** at a Delhi durbar opening on 1 January 1877, which she did not attend. It coincided with one of the worst famines in India's history.

The Raj built railways, from 1,349 kilometres in 1860 to 25,495 in 1890, with private investors guaranteed returns and Indian taxpayers carrying the risk, and by 1900 the world's largest irrigation system. Yet India's share of world output fell over the colonial period, by one rough reconstruction from above 20 per cent to under 5, and per capita income grew little, if at all.

## Famine and the Drain

About 15 million people died in 24 major famines in India between 1850 and 1899. In the Great Famine of 1876–78, estimates of excess deaths range from 5.6 to 9.6 million, with one careful demographic estimate of 8.2 million. While it raged, a record 6.4 million hundredweight of wheat was exported to England, Lytton's government refused to interfere with food prices, and the Famine Commissioner, Sir Richard Temple, cut relief rations to a pound of grain and one anna for a day's hard labour. Temple held that "everything must be subordinated to the financial consideration of disbursing the smallest sum of money"; the critic William Digby replied that "a famine can scarcely be said to be adequately controlled which leaves one-fourth of the people dead." The disaster led to the Famine Commission of 1880 and the Famine Codes of 1883, and after 1902 there was no major famine until 1943.

The famines fed an Indian economic critique. Dadabhai Naoroji, whose *Poverty and Un-British Rule in India* (1901) the chapter on nationalism introduces, estimated that £200–300 million of India's revenue had been drained to Britain. In 1892 he became the first British Indian MP, four years after Lord Salisbury doubted any British constituency would elect "a black man". Romesh Chunder Dutt, a civil servant who had managed famine relief, traced the same story in *Indian Famines* (1901) and his two-volume economic history.

{{image: Dadabhai Naoroji | Dadabhai Naoroji, the first British Indian MP and author of the "drain theory"}}

The debate continues. A recent estimate by Utsa Patnaik, as popularised by Jason Hickel, puts the drain at about $45 trillion between 1765 and 1938, by compounding it over time; critics reply with Tirthankar Roy's reported estimate of about 1 per cent of national income a year from 1868 to the 1930s, an annual flow rather than a compounded total. Both figures are contested. Mike Davis's *Late Victorian Holocausts* (2000) argued that laissez-faire and imperial policy turned El Niño droughts into mass death.

```quote
Millions died, not outside the 'modern world system', but in the very process of being forcibly incorporated into its economic and political structures.
Mike Davis · Late Victorian Holocausts · 2000
```

Davis has critics: Alexander Morrison called his "ignorance of Indian history" "profound", and Roy argues that famines were better documented under the Raj rather than more frequent, and rooted in India's ecology. Amartya Sen links them to the absence of democracy and a free press.

```checkpoint
q: What happened to India's grain during the Great Famine of 1876–78?
a*: A record quantity of wheat was exported to England, while relief was kept to a minimum.
a: All exports were banned to keep food in India.
x: Lytton's government refused to interfere in the grain trade, and wheat exports reached a record.
a: Britain shipped large grain imports to India free of charge.
x: Temple's priority was spending "the smallest sum of money", not free imports.
a: Grain was plentiful, so famine deaths were few.
x: Estimates of excess deaths range from 5.6 to 9.6 million.
hint: Think of laissez-faire and the "Temple wage".
why: The famine showed how an economic doctrine could shape life and death, and it became central to the Indian critique of British rule.
---
q: What did Dadabhai Naoroji's "drain theory" argue?
a: That India was too poor to be worth ruling.
x: Naoroji's argument was about wealth leaving India, not about whether it was worth ruling.
a: That British investment had made India rich.
x: He argued the opposite: that India's revenue was flowing out to Britain.
a*: That a large part of India's revenue was sent to Britain and never spent in India, impoverishing it.
a: That Indian princes were hoarding the country's wealth.
x: His target was the cost of British rule, such as salaries and charges paid in Britain.
hint: Think of where India's taxes ended up.
why: The drain theory gave Indian nationalism an economic case against British rule.
```

## Settlers and the Peoples Before Them

In Canada, the rebellions of 1837–38 prompted Lord Durham's *Report* (1839), which found "two nations warring within the bosom of a single state", called French Canadians "a people with no history, and no literature", and recommended both their assimilation and "responsible government". Nova Scotia gained responsible government in 1848, and the Dominion of Canada was created in 1867. Eleven Numbered Treaties with First Nations (1871–1921) opened the west to settlement, and the Indian Act of 1876 defined "status Indians". The Dominion's residential schools, run with the churches, took about 150,000 children; the Truth and Reconciliation Commission documented about 3,200 deaths (its successor centre has since named over 4,100) and called the system "cultural genocide".

Australia was claimed by proclamation, not treaty. Aboriginal Australians had lived there for at least 50,000 years, but in 1819 British law officers advised that New South Wales had been acquired as "desert and uninhabited"; only in *Mabo* (1992) did the High Court reject *terra nullius* as a legal basis. Frontier wars lasted from 1788 to at least 1928, and estimates of the dead vary widely, from 11,000–14,000 in documented massacres to "probably no less than 100,000" by one contested reckoning. At Myall Creek in 1838 stockmen killed at least 28 unarmed Aboriginal people; seven were hanged, one of the few massacres proven in court. In Tasmania's Black War some 600 to 900 Aboriginal people died and the survivors were removed to Flinders Island; whether this was genocide is debated. In 1968 W. E. H. Stanner called historians' long neglect of all this "the great Australian silence".

In New Zealand the Treaty of Waitangi was first signed on 6 February 1840, as William Hobson told each chief "He iwi tahi tātou" ("We are one people"). About 530 to 540 Māori signed the Māori text, only 39 the English one, and the two differ: the English cedes "all the rights and powers of sovereignty", the Māori grants *kawanatanga* (governorship) while guaranteeing *tino rangatiratanga* (full chieftainship). The wars that followed are described in the chapter on Imperial Expansion and Resistance. In 1877 a chief justice called the treaty "a simple nullity"; since 1975 the Waitangi Tribunal has given extra weight to the Māori text.

In southern Africa, Britain occupied the Cape in 1795 and acquired it formally in 1806. In 1856–57, amid cattle disease and decades of frontier war, the Xhosa prophet Nongqawuse, a girl of about 15, foretold that killing cattle would bring back the ancestors and drive out the settlers; some 40,000 people starved. In the Second Boer War (1899–1902) between 18,000 and 26,000 Boer civilians died in concentration camps, and in separate camps for Black Africans at least 14,000, and probably about 20,000, died. The Natives Land Act of 1913, passed by the self-governing Union, barred land sales between Black and white South Africans and left reserves of about 7 per cent of the land. Sol Plaatje wrote that on the morning after the Act the Black South African found himself "not actually a slave, but a pariah in the land of his birth".

## Abolition and the Caribbean

As the chapter on Abolition and Emancipation describes, Britain abolished the slave trade in 1807 and slavery in 1833, compensating owners, not the enslaved, and then shipped more than 1.6 million Indians abroad under indenture. After the Morant Bay rising of 1865, when Governor Eyre's martial law killed 439 people outright and hundreds more were executed, the Jamaican Assembly gave up two centuries of elected representation and Jamaica became a Crown colony. Between 1934 and 1939 strikes and riots swept the British West Indies, with women central to them; in Jamaica Alexander Bustamante and Norman Manley laid the foundations of party politics, and Jamaica and Trinidad became independent in 1962.

## Egypt and West Africa

In 1875 Disraeli bought the Egyptian ruler's 44 per cent stake in the Suez Canal, and the chapter on nationalism tells how 'Urabi's movement was crushed in 1882. Robinson and Gallagher saw the invasion as defence of the route to India; A. G. Hopkins argued that the Canal was never really threatened and that the British bondholders' interests counted. Egypt stayed formally Ottoman, but Lord Cromer ruled it in all but name from 1883 to 1907. At Denshawai in 1906 British officers shooting villagers' pigeons led to an incident in which one officer died, of heatstroke according to the main account; 52 villagers were tried and four hanged, and the episode became a turning point for Egyptian nationalism. In March 1919, after Saad Zaghlul's arrest, Egyptian men and women, Muslims and Copts, struck and demonstrated; at least 800 were killed. Britain recognised Egyptian independence in 1922 while keeping major powers, and a 1936 treaty kept British troops in the Canal Zone.

In West Africa abolition became a reason for expansion. Britain bombarded Lagos in 1851 and imposed a treaty (1852) abolishing the slave trade, then annexed the port in 1861 under threat of force. After the conquest of the Sokoto Caliphate, Frederick Lugard ruled northern Nigeria through its emirs, a cheaper system called **indirect rule**; where no suitable chiefs existed, the British appointed "warrant chiefs". Mahmood Mamdani called the system "decentralised despotism". In November 1929 thousands of Igbo, Ibibio and Annang women rose against the warrant chiefs after a woman named Nwanyeruwa was told to count her goats and people and retorted, "Was your widowed mother counted?" About 55 women were killed in this Women's War, but in 1930 the warrant-chief system was abolished. The wider Scramble for Africa belongs to the chapter on Imperial Expansion and Resistance.

## Informal Empire and the World Wars

British power also reached beyond its flag. Trade dominance gave Britain "informal empire" over countries such as China, Argentina and Siam, and in 1953 Gallagher and Robinson argued that informal and formal empire were continuous throughout the nineteenth century. Cain and Hopkins later located the empire's driving force in the "gentlemanly capitalism" of the City of London and landed interests rather than provincial industry.

The world wars were imperial wars. Over 2.5 million men served in Dominion armies in the First World War, and over a million Indians served. In April 1919, at Jallianwala Bagh in Amritsar, Brigadier-General Reginald Dyer's troops fired 1,650 rounds into an unarmed crowd without warning. The official count was 379 dead; the Congress inquiry put it at about 1,000. Rabindranath Tagore renounced his knighthood; the Commons voted against Dyer, though many Britons hailed him. In 1926 Britain and the Dominions were declared "autonomous Communities within the British Empire, equal in status".

In 1939 Britain declared war on India's behalf without consulting Indian leaders, and the Indian Army grew to over 2.5 million, the largest volunteer army in history. In 1943 famine struck Bengal. Estimates range from 0.8 to 3.8 million deaths, with a scholarly consensus of about 2.1 million; the Viceroy, Wavell, called it "one of the greatest disasters that has befallen any people under British rule". Its causes are fiercely argued: Sen stresses wartime inflation that priced the poor out, others crop failure, and Madhusree Mukerjee blames Churchill's War Cabinet for refusing imports, while Tirthankar Roy blames the provincial government. Britain ended the war essentially bankrupt.

## Ending an Empire

India and Pakistan became independent at midnight on 14–15 August 1947. The Radcliffe Line split Punjab and Bengal; between 12 and 20 million people were displaced, and estimates of the dead range from 200,000 to 2 million. India claimed that 33,000 Hindu and Sikh women had been abducted, Pakistan that 50,000 Muslim women had been. The London Declaration of 1949 let India remain in the **Commonwealth** as a republic; today it has 56 members, including states Britain never ruled.

In 1956 Nasser nationalised the Suez Canal. Britain secretly agreed with France and Israel to invade, but under American financial pressure withdrew, and Eden resigned. In Kenya, where the "White Highlands" had been taken for settlers, the British fought the Mau Mau rising from 1952: officially 80,000 people were detained, though Caroline Elkins puts the number at 160,000 to 320,000, and 1,090 were executed. Estimates of the dead run from David Anderson's about 25,000 to Elkins's "tens of thousands, perhaps hundreds of thousands", which others dispute; many Kikuyu fought against Mau Mau too. In 2013 Britain agreed to pay £19.9 million to 5,228 Kenyan claimants and said it "sincerely regrets" the abuses, while denying liability.

In 1960 Harold Macmillan said in Cape Town: "The wind of change is blowing through this continent." Sudan, the Gold Coast (as Ghana, in 1957) and Malaya had become independent in the 1950s; nearly ten times as many colonies followed in the 1960s. Southern Rhodesia's unilateral declaration of independence in 1965 led to civil war, and only after the Lancaster House agreement of 1979 did Zimbabwe emerge in 1980, the last British possession in Africa. Finally, at midnight on 1 July 1997, Hong Kong, whose island the chapter on the Opium Wars shows Britain seizing, was handed to China, a moment often taken as the end of empire.

## Weighing the Balance Sheet

The argument over the empire's legacy is unusually heated. Niall Ferguson argues that its law, institutions and global trade did more good than harm. Caroline Elkins replies that violence and emergency law were integral to Britain's "liberal" empire. Shashi Tharoor's *Inglorious Empire* (2017) is a polemical Indian indictment; Nigel Biggar's broadly favourable moral verdict (2023) was widely criticised by historians. Priya Satia argues that faith in progress itself licensed imperial violence, and Priyamvada Gopal shows how rebels from Morant Bay to Kenya shaped British critics of empire. Even the numbers are contested: a 2023 study by Sullivan and Hickel estimated 165 million excess deaths in India between 1880 and 1920, but the figure depends heavily on its disputed baseline, and an alternative one yields about 50 million for a shorter period. British public attitudes to the empire have been described as broadly positive, a reminder that the debate is about Britain as well as its former subjects.

```checkpoint
q: Why does the Treaty of Waitangi remain disputed?
a: Because no Māori chiefs signed it.
x: About 530 to 540 Māori signed the Māori text.
a*: Because the English text cedes sovereignty, while the Māori text grants only governorship and guarantees full chieftainship.
a: Because it was signed only in English.
x: Most signatures were on the Māori text; only 39 signed the English one.
a: Because New Zealand courts have always treated it as binding.
x: In 1877 a chief justice called it "a simple nullity".
hint: Compare *kawanatanga* and *tino rangatiratanga*.
why: The gap between the texts lies at the heart of debates over whether Māori ceded sovereignty.
---
q: How do estimates of the dead in Kenya's Mau Mau Emergency differ?
a: All historians agree on exactly 1,090 deaths.
x: 1,090 is the number executed, not the total dead.
a: The British government has never acknowledged any abuses.
x: In 2013 Britain paid compensation and said it "sincerely regrets" the abuses, while denying liability.
a: Historians agree the deaths were fewer than 1,000.
x: David Anderson, at the lower end, estimates about 25,000 deaths in all.
a*: They range from about 25,000 to Caroline Elkins's "tens of thousands, perhaps hundreds of thousands", a figure others dispute.
hint: Think of the gap between Anderson and Elkins.
why: The size of the disagreement shows how much of the empire's violence is still being counted.
```

## Further exploration

- **John Darwin, *The Empire Project: The Rise and Fall of the British World-System, 1830–1970* (2009).** A leading single-volume synthesis.
- **Caroline Elkins, *Legacy of Violence: A History of the British Empire* (2022).** Argues that violence was integral to liberal imperialism.
- **Niall Ferguson, *Empire: How Britain Made the Modern World* (2003).** The best-known case that the empire was, on balance, beneficial.
- **Priyamvada Gopal, *Insurgent Empire: Anticolonial Resistance and British Dissent* (2019).** How colonial rebellions shaped British critics of empire.
- **Priya Satia, *Time's Monster: How History Makes History* (2020).** How ideas of progress licensed imperial actions.
- **Mike Davis, *Late Victorian Holocausts: El Niño Famines and the Making of the Third World* (2000).** The famines of the late nineteenth century as products of empire; contested.
- **Shashi Tharoor, *Inglorious Empire: What the British Did to India* (2017).** A polemical Indian indictment of British rule.$mn_britemp_master$,
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
  select $mn_britemp_quiz$[
    {"type": "mcq", "prompt": "How did Queen Victoria become Empress of India?", "options": ["She was proclaimed Empress under the Royal Titles Act of 1876, at a Delhi durbar opening on 1 January 1877 that she did not attend", "She was crowned in person in Delhi in 1858", "The Mughal emperor Bahadur Shah Zafar transferred the title to her in 1857", "The Indian National Congress offered her the title at its first meeting in 1885"], "answerIndex": 0, "explanation": "Disraeli encouraged the Royal Titles Act of 1876, which Gladstone opposed as despotic. Victoria was proclaimed, not crowned, at the Delhi durbar of 1877, which was attended by Viceroy Lytton.", "id": "q1"},
    {"type": "mcq", "prompt": "What did the official count and the Congress inquiry give as the death toll at Jallianwala Bagh in April 1919?", "options": ["Both agreed on exactly 1,650", "About 50 officially; about 100 according to Congress", "379 officially; about 1,000 according to the Congress inquiry", "No one was killed; the troops fired over the crowd"], "answerIndex": 2, "explanation": "The official figure was 379 dead, while the Congress inquiry put the toll at about 1,000. The 1,650 figure is the number of rounds Dyer reported firing.", "id": "q2"},
    {"type": "mcq", "prompt": "What was 'indirect rule', as practised by Frederick Lugard and his successors in Nigeria?", "options": ["Rule from London with no officials in Africa", "Ruling through existing authorities such as the northern emirs, and appointing 'warrant chiefs' in the south-east", "Handing power to elected African parliaments", "Governing through the Royal Niger Company's shareholders alone"], "answerIndex": 1, "explanation": "Ruling through the emirs after the conquest of the Sokoto Caliphate was cheaper and needed fewer officials; in south-eastern Nigeria, where no suitable chiefs existed, the British appointed warrant chiefs. Mahmood Mamdani called the system 'decentralised despotism'.", "id": "q3"},
    {"type": "mcq", "prompt": "What is the scholarly consensus figure for deaths in the Bengal famine of 1943, according to Ó Gráda (2007)?", "options": ["About 10,000", "About 15 million", "Exactly 800,000", "About 2.1 million, within estimates ranging from 0.8 to 3.8 million"], "answerIndex": 3, "explanation": "Estimates range from 0.8 to 3.8 million deaths; Ó Gráda (2007) wrote that the scholarly consensus is about 2.1 million. Over half the deaths came in 1944, from disease.", "id": "q4"},
    {"type": "open", "prompt": "Explain the 'drain theory' of Dadabhai Naoroji and Romesh Chunder Dutt, and why it remains debated today.", "rubric": "A strong answer explains that Naoroji (Poverty and Un-British Rule in India, 1901) and Dutt argued that much of India's revenue, through salaries, charges and unfair trade, flowed to Britain and was not spent in India, and that the famines of the late nineteenth century fed this critique. It notes Naoroji's estimate of £200–300 million. It recognises that modern estimates differ enormously, from Utsa Patnaik's compounded figure of about $45 trillion to Tirthankar Roy's reported estimate of about 1 per cent of national income a year, and that both are contested.", "id": "q5"},
    {"type": "open", "prompt": "How have historians disagreed about the balance sheet of the British Empire? Refer to at least two historians or writers.", "rubric": "A strong answer contrasts Niall Ferguson's argument that the empire's institutions, law and global trade were, on balance, beneficial with Caroline Elkins's argument that violence and emergency law were integral to liberal imperialism. It may also mention Shashi Tharoor's indictment, Nigel Biggar's broadly favourable moral verdict and its critics, Priya Satia on faith in progress, Priyamvada Gopal on anticolonial resistance, or contested mortality estimates such as Sullivan and Hickel's. It should treat the question as an open debate and use evidence such as famine deaths, Jallianwala Bagh or the Kenya Emergency.", "id": "q6"}
  ]$mn_britemp_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/modern-era-19th-century/british-empire', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

-- The Victorian Era — canonical master article, co-written and human-reviewed.
-- history/modern-era-19th-century/the-victorian-era @ research/advanced/read.
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
    'history/modern-era-19th-century/the-victorian-era',
    'research',
    'advanced',
    'read',
    $mn_victorian_master$> **Britain in the age of Victoria, and the world in Britain.** Queen Victoria reigned from 1837 to 1901 over a country that called itself the "workshop of the world" and was also a country of workhouses, cholera and child labour. This chapter follows Victorian Britain itself: the Queen as the age's symbol; Chartism and the widening vote; poverty, the workhouse and the sanitary reformers; trade unions and the matchwomen of Bow; respectability, "separate spheres" and the women who challenged them; Darwin and the crisis of faith; and the novelists of the "Condition of England". It sets that story in its global entanglements: the Irish Famine, India and Jamaica as seen from London, Lancashire's cotton workers in the American Civil War, and the African, Indian and Chinese visitors who looked back at Britain.

## A Queen and Her Age

The Victorian era is usually defined as the reign of Queen Victoria, from 20 June 1837 to her death on 22 January 1901, 63 years and seven months, longer than any predecessor's. Michael Sadleir warned that "in truth, the Victorian period is three periods, and not one": unsettled to 1850, prosperous in mid-century, and imperial from 1880.

Victoria was 18 when her uncle William IV died, and wrote in her journal that she had been told the King was no more, "and consequently that I am Queen". When her husband, Prince Albert, died in 1861, she wore black for the rest of her life and withdrew from public view; as the "widow of Windsor" grew unpopular, republicanism grew. By the 1880s and 1890s she was well liked again, a "benevolent matriarchal figure" of empire.

Joseph Chamberlain made her Diamond Jubilee of 1897 a "Festival of the British Empire"; in Dublin, James Connolly answered with a mock funeral whose coffin, marked "British Empire", was thrown into the Liffey. Disraeli's Royal Titles Act of 1876 had made her Empress of India, over Liberal protests that the title was "un-British". For the last years of her reign she was taught Urdu by Abdul Karim, from near Jhansi, who had come to court as a waiter in 1887 and became her "Munshi"; she dismissed her household's complaints about him as racial prejudice.

## The Workshop of the World

The mid-Victorian decades were, in G. M. Trevelyan's phrase, years of "quiet politics and roaring prosperity", and real wages in 1901 were 65 per cent higher than in 1871. Its industrial roots, and the debate over early industrialisation's effect on workers, belong to the chapter on the Industrial Revolution; its later steel, cables and telephones, to the chapter on the Second Industrial Revolution.

The age's showcase was the Great Exhibition of 1851 in Hyde Park, in Joseph Paxton's Crystal Palace of iron and glass. More than six million visitors came, equivalent to a third of the population of England and Wales; one-shilling days drew working people. Colonial raw materials had places of prestige, and a star of the India exhibit was the Koh-i-Noor diamond: the workshop of the world was also the centre of an empire, whose history is told in the chapter on the British Empire.

## Chartism and the Vote

The Reform Act of 1832 defined voters as a "male person", formally excluding women, and left most men without a vote too. In 1838 a committee of six MPs and six working men, formed the year before, published the **People's Charter**: a vote for every man, the secret ballot, no property qualification for MPs, payment of MPs, equal constituencies and annual parliaments. The Chartist *Northern Star*, often read aloud, even denounced the First Opium War, the subject of the chapter on the Opium Wars.

Parliament rejected petitions in 1839, of about 1.3 million signatures, and in 1842, of over three million; at least ten, and perhaps over twenty, Chartists were killed at the Newport Rising of 1839, and strikes followed the second rejection. For the historian Dorothy Thompson, "1842 was the year in which more energy was hurled against the authorities than in any other of the 19th century".

{{image: Chartism | The Great Chartist Meeting on Kennington Common, 10 April 1848, photographed by W. E. Kilburn.}}

On 10 April 1848, amid a revolutionary scare, Chartists met on Kennington Common in London. The government recruited 100,000 special constables; Feargus O'Connor called off the procession, and the petition went to Parliament in three cabs. He claimed 5,706,000 signatures; a Commons committee counted about 1.98 million and found many plainly forged, among them "Mr Punch", "No Cheese" and the names of Victoria and Wellington. That figure was the committee's total count, not a count of fakes. Among the rally's organisers was **William Cuffay**, a tailor and the son of a formerly enslaved man from St Kitts, whom the press attacked in racist language; convicted later in 1848 of conspiring to levy war, he was transported to Tasmania and went on organising there. Chartism had a strong Irish side too, from O'Connor himself to the Irish MPs who backed the 1842 petition.

Change came piecemeal. In 1846 Peel repealed the Corn Laws on imported grain, with the Irish famine forcing the issue, and split his party. The Reform Act of 1867, passed after demonstrations in Hyde Park, doubled an electorate in which only one adult man in seven in England and Wales could vote; the secret ballot followed in 1872; and the Act of 1884 extended the household vote to the counties. Even then all women and 40 per cent of men had no vote. Full manhood suffrage came only in 1918.

## Poverty and the Workhouse

The New Poor Law of 1834 aimed to give the able-bodied relief only inside a workhouse, where conditions were meant to be worse than the worst outside ("less eligibility"). Inmates were divided into classes, so families were split up; critics called the workhouses "Poor Law bastilles". In *Oliver Twist* (1838) Dickens gave the system its most famous line, "Please, sir, I want some more," and mocked a law that "took his family away from him, and made him a bachelor!"

Victorians argued over whether the poor were victims or culprits. Samuel Smiles's *Self-Help* (1859), a best-seller, blamed poverty largely on irresponsible habits. Henry Mayhew's *London Labour and the London Poor* (1851) sorted the poor into "those that will work, those that cannot work, and those that will not work". From 1886 the shipowner Charles Booth surveyed London, mapping poverty in colour with researchers such as Beatrice Potter (later Webb); he found 30.7 per cent of Londoners in poverty and argued for old-age pensions.

## Cholera and the Sanitary Idea

By 1901 more than three in four Britons lived in towns, against one in five a century before, and seven or eight to a room was common. Edwin Chadwick's *Report on the Sanitary Condition of the Labouring Population of Great Britain* (1842) led to the Public Health Act of 1848, the first time the British government took responsibility for its citizens' health.

Cholera killed tens of thousands of Londoners in successive epidemics. In the Broad Street outbreak in Soho, from 31 August 1854, 127 people died in three days and 420 by the end. John Snow, helped by the Reverend Henry Whitehead, traced the deaths to the Broad Street pump; after Snow addressed the parish Board of Guardians, the handle was removed the next day. But officials afterwards rejected his theory, and most still blamed bad air, or miasma. What moved Parliament was the "Great Stink" of the Thames in the summer of 1858, which led it to adopt Joseph Bazalgette's intercepting sewers, built from 1859 to 1875; they ended cholera outbreaks in central London.

## Work, Unions and the Matchwomen

Reform at work went on after the Ten Hours Act of 1847, mentioned in the chapter on the Industrial Revolution.

The most famous strike of the age was made by women. At Bryant & May's match factory in Bow, East London, most workers were women and girls, many of them Irish or of Irish descent. They were fined for dirty feet or lateness, and white phosphorus caused "phossy jaw". On 23 June 1888 Annie Besant exposed their conditions in *The Link*. When management demanded a repudiation and a worker was dismissed, about 1,400 women and girls struck, and by 6 July the whole factory had stopped. They won, and their union became the largest of women and girls in the country. Besant is often credited with the strike, but she did not start it: she learned of it only when about a hundred strikers came to ask her help. Sarah Chapman was among the women who had already put their demands to the management.

The matchwomen and the gasworkers inspired the London dock strike of mid-August 1889, when about 100,000 strikers won the "dockers' tanner" of sixpence an hour, a landmark of the "New Unionism" of unskilled workers. It was an imperial event too: about £30,000 came from Australia, by some counts more than was raised in Britain, and a young Indian law student, Gandhi, called on Cardinal Manning, whose mediation had ended the strike.

```checkpoint
q: What did the Commons committee find when it examined the Chartist petition of 1848?
a*: It counted about 1.98 million signatures, against O'Connor's claim of over 5.7 million, and found many plainly forged names.
a: It confirmed that all 5.7 million signatures were genuine.
x: The committee counted far fewer than O'Connor claimed, and found forgeries such as "Mr Punch".
a: It found that only "Mr Punch" and "No Cheese" had signed.
x: Those were among the forged names, but the committee's total count was about 1.98 million.
a: It recommended granting all six points of the Charter.
x: The petition was rejected; the secret ballot came only in 1872 and annual parliaments never.
hint: Compare O'Connor's claim with the committee's count.
why: The committee's figure was a total count, not a tally of fakes, and the ridicule over forged names obscured the movement's breadth.
---
q: What was Annie Besant's role in the matchwomen's strike of 1888?
a: She organised the walkout and led it from the first day.
x: She learned of it only when the strikers came to her; the women made the strike themselves.
a: She opposed the strike and sided with Bryant & May.
x: She had attacked the company's treatment of its workers in The Link.
a*: Her article in The Link exposed conditions, but the women started the strike; she learned of it only when the strikers came to ask her help.
a: She had no connection with the matchwomen at all.
x: Her article of 23 June 1888 set off the dispute.
hint: Who walked out after a worker was dismissed?
why: Historians such as Louise Raw stress the matchwomen's own organisation, correcting older accounts that credited Besant.
```

## Home, Respectability and Separate Spheres

A fast-growing middle class became the dominant cultural influence, to a large extent replacing the aristocracy. As home and workplace drew apart, women were expected to concentrate on it and rely on male earners. Coventry Patmore's poem *The Angel in the House* (1854) gave the ideal its name. Virginia Woolf later mocked the Angel, who, "if there was a draught she sat in it ... Above all, she was pure", and wrote that she so tormented her "that at last I killed her".

The law gave the ideal hard edges. Under coverture a wife's property passed to her husband. Caroline Norton, denied access to her three sons, campaigned for the Custody of Infants Act of 1839 and the divorce law of 1857, which kept a double standard: a husband could divorce for adultery alone, while a wife had to prove adultery plus a further offence such as cruelty, desertion or incest. Under the Contagious Diseases Acts of the 1860s, police in garrison and port towns could detain women suspected of prostitution for compulsory examination; men were not examined. Josephine Butler co-founded the Ladies National Association after the men's repeal campaign excluded women, and printed one woman's testimony: "By men we are examined, handled, doctored." The Acts were repealed in 1886.

In 1867 J. S. Mill moved to replace "man" with "person" in the Reform Bill, and lost by about 196 votes to 73. His *The Subjection of Women* (1869), developed with Harriet Taylor Mill, called "the legal subordination of one sex to the other" "wrong in itself". Millicent Fawcett's National Union of Women's Suffrage Societies was founded in 1897, but women had no parliamentary vote until 1918.

## Earnestness and Hypocrisy

Harold Perkin described the change in national character:

```quote
Between 1780 and 1850 the English ceased to be one of the most aggressive, brutal, rowdy, outspoken, riotous, cruel and bloodthirsty nations in the world and became one of the most inhibited, polite, orderly, tender-minded, prudish and hypocritical.
Harold Perkin · The Origins of Modern English Society · 1969
```

William Acton's *Prostitution* (1857) reported a police estimate of about 8,600 prostitutes in London; Judith Walkowitz shows that prostitution was often short-term and driven by poverty and the scarcity of women's work. The image of the hypocritical, repressed Victorian owes much to Lytton Strachey's *Eminent Victorians* (1918) and to Steven Marcus's *The Other Victorians* (1966). Michel Foucault rejected this "repressive hypothesis", and Peter Gay and Michael Mason stress that Victorian reticence about sex was not ignorance of it.

## Darwin and the Crisis of Faith

William Whewell coined the word "scientist" in the 1830s. Tennyson's *In Memoriam* (1850) pictured "Nature, red in tooth and claw" nine years before Darwin's *On the Origin of Species*. The *Origin* appeared on 24 November 1859, after Alfred Russel Wallace's essay on the same idea had, in June 1858, made Darwin fear that "all my originality ... will be smashed".

At the British Association in Oxford on 30 June 1860, Wilberforce supposedly asked Huxley whether he descended from a monkey through his grandfather or his grandmother. No verbatim record exists and what either man actually said is uncertain; Huxley's famous retort survives only in letters and later recollections that disagree on the wording. The episode fed the "conflict thesis" of an inevitable war between science and religion, popularised by John William Draper, the speaker before the exchange. Historians of science now regard that thesis as discredited and prefer a "complexity thesis". Doubt was real, though, and Matthew Arnold's "Dover Beach" heard the Sea of Faith's "melancholy, long, withdrawing roar".

## Novels of the Condition of England

Fiction became social investigation. Dickens, who had worked in a blacking warehouse at 12, gave Gradgrind in *Hard Times* (1854) the creed "Now, what I want is Facts." Elizabeth Gaskell's *Mary Barton* (1848) followed a Manchester worker into Chartism and trade unionism. Disraeli's *Sybil, or The Two Nations* (1845) contrasted the privileged few with the deprived working classes; its famous phrase, "Two nations; between whom there is no intercourse and no sympathy", is spoken by a character, the radical Stephen Morley, not by Disraeli in his own voice, though he later became the figurehead of "one-nation" Conservatism.

Sympathy for the English poor could coexist with racial fury. After the Indian rebellion of 1857, amid press demands for revenge and lurid atrocity stories that an official enquiry later found lacked convincing evidence, Dickens wrote in a private letter of October 1857 that he wished he could "do my utmost to exterminate the Race upon whom the stain of the late cruelties rested". It was a private letter, not a policy, but a revealing one.

## Ireland: Famine in the United Kingdom

In the Great Famine of 1845–1852 about a million people died (estimates range from 775,000 to 1.5 million), more of disease than of starvation, and a million or more emigrated. Peel bought American maize; Russell's government relied on the Poor Law, local rates and the market. The "Gregory clause" of 1847 denied relief to anyone holding more than a quarter-acre, driving families off the land. Charles Trevelyan, the civil servant most responsible, called the famine "a direct stroke of an all-wise and all-merciful Providence". Peter Gray calculates that relief came to less than half of one per cent of British national product over five years, against £20 million paid to West Indian slave-owners.

Criticism came from inside government too. In April 1849 Lord Clarendon, the Lord Lieutenant, who headed the administration in Ireland, wrote privately to the Prime Minister, Russell, that no other legislature in Europe would "disregard such suffering as now exists in the west of Ireland, or coldly persist in a policy of extermination". He was condemning a policy of neglect, not describing a plan to kill.

Help came from far away: donations from Calcutta, including from Irish soldiers there, and $170 from a group of Choctaws, sixteen years after the Trail of Tears. According to a story that may be legend, the Ottoman Sultan was asked to cut his gift so as not to exceed the Queen's. Victoria in fact gave £2,000, more than any other individual donor; the tale that she gave only £5 is a myth from the late nineteenth century. Yet in Ireland she was "the Famine Queen".

```quote
The Almighty, indeed, sent the potato blight, but the English created the Famine.
John Mitchel · The Last Conquest of Ireland (Perhaps) · 1861
```

Was it genocide? Cormac Ó Gráda says no academic historian takes the claim seriously, while a case of neglect is easier to sustain; Christine Kinealy argues the famine was "neither inevitable nor unavoidable"; some genocide scholars disagree. Its legacy in Irish nationalism is followed in the chapter on Nationalism.

## The Empire Seen from London

After 1857 India was ruled in the Crown's name. The rebellion itself, the great Indian famines and Dadabhai Naoroji's "drain" theory are treated in the chapter on the British Empire. One juxtaposition captures the age: the Delhi Durbar proclaiming Victoria Empress of India met on 1 January 1877, in the middle of a famine that killed millions in southern and western India.

Indians also argued with Britain in Britain. Cornelia Sorabji became the first woman to study law at Oxford, and in 1888 Lord Salisbury doubted that a British constituency would yet "elect a black man", meaning Naoroji; in 1892 Finsbury Central elected him, by five votes, as the first British Indian MP.

Africans and Chinese observed Britain too. Cetshwayo, the defeated Zulu king, met Victoria in 1882. In 1895 Khama III and two other Tswana kings toured Britain to lobby against annexation by Rhodes's British South Africa Company, and won. The wider scramble for Africa is the subject of the chapter on Imperial Expansion and Resistance. Guo Songtao, the first Qing minister posted to a Western country, admired British railways during his time in London in 1877–79, but his travel record was ordered burned in China.

## Jamaica, Lancashire and the Atlantic

In October 1865 Paul Bogle led a protest march at Morant Bay in Jamaica. Under Governor Edward Eyre's martial law soldiers killed 439 people directly, 354 more were arrested and later executed, many without proper trials, and the Assembly member George William Gordon was hanged. The chapter on Abolition and Emancipation places the rising in Jamaica's history after slavery; in Britain it split the intellectuals. A Jamaica Committee including John Bright, Darwin and Huxley sought to prosecute Eyre, while his Defence Committee included Carlyle, Ruskin, Tennyson, Kingsley and Dickens. Eyre was never brought to criminal trial.

The American Civil War blockade, on top of overproduction, threw Lancashire's cotton workers out of work. On 31 December 1862 working people at Manchester's Free Trade Hall nonetheless wrote to Lincoln supporting the Union against "that foul blot on civilisation and Christianity – chattel slavery", and Lincoln praised their "sublime Christian heroism". Working-class opinion was not uniform: Confederate flags flew in many cotton towns. The Jamaican healer Mary Seacole, who ran a "British Hotel" in the Crimean War, published in 1857 what is described as the first autobiography by a Black woman in Britain, and told readers she was proud to be related "to those poor mortals whom you once held enslaved".

```checkpoint
q: What did Lord Clarendon mean in 1849 when he wrote to Russell of "a policy of extermination" in Ireland?
a: He was announcing a government plan to depopulate Ireland deliberately.
x: He was criticising his own government's policy as callous neglect, not announcing a plan to kill.
a*: As Lord Lieutenant, he was privately condemning Parliament's disregard of the suffering in the west of Ireland.
a: He was praising the Poor Law for ending the famine.
x: He wrote that no other legislature in Europe would disregard such suffering.
a: He was describing the Trail of Tears.
x: That was the forced removal of the Choctaw, who later sent aid to Ireland.
hint: Clarendon headed the government's own administration in Ireland.
why: The letter shows criticism inside government, and why historians weigh "neglect" against "genocide".
---
q: How did Victorian intellectuals respond to Governor Eyre's suppression of the Morant Bay rising?
a: They united in praising Eyre.
x: They split: the Jamaica Committee sought his prosecution.
a: They united in demanding his execution.
x: Eyre had prominent defenders, and he was never brought to criminal trial.
a: They ignored it, as Jamaica had no link to Britain.
x: Jamaica was a British colony, and the controversy divided British opinion sharply.
a*: They split, with Bright, Darwin and Huxley seeking his prosecution and Carlyle, Ruskin, Tennyson and Dickens defending him.
hint: Think of two rival committees.
why: The Eyre controversy showed race and empire dividing even Britain's leading thinkers.
```

## Interpreting the Victorians

How imperial was Britain at home? Bernard Porter's *The Absent-Minded Imperialists* (2004) argued that empire touched most ordinary Britons little; John MacKenzie replied that it saturated popular culture, and Catherine Hall and Antoinette Burton are counted on his side. On Chartism, Gareth Stedman Jones read it in the language of political radicalism, while Dorothy Thompson re-centred class, the Irish and women. Amanda Vickery has questioned the chronology and premises of "separate spheres" as Davidoff and Hall described them, and Mike Davis's *Late Victorian Holocausts*, which blames the era's colonial famines on liberal political economy, is criticised as overstated by Amartya Sen, Tirthankar Roy and others.

When Victoria died at Osborne House in 1901, her son and her grandson Wilhelm II at her side, she had come to stand for an age of sewers, steam and the ballot, and also of the workhouse, the Irish Famine and imperial violence. Many Victorians, from Chadwick and Cuffay to Butler, the matchwomen and Naoroji, spent their lives pressing on the second.

## Further exploration

- **K. Theodore Hoppen, *The Mid-Victorian Generation, 1846–1886* (1998).** The standard large survey, treating the United Kingdom's nations and empire together.
- **Dorothy Thompson, *The Chartists: Popular Politics in the Industrial Revolution* (1984).** Chartism with class, the Irish and women at its centre.
- **Leonore Davidoff and Catherine Hall, *Family Fortunes: Men and Women of the English Middle Class 1780–1850* (1987).** The classic study of middle-class domesticity and separate spheres.
- **Catherine Hall, *Civilising Subjects: Metropole and Colony in the English Imagination, 1830–1867* (2002).** Birmingham and Jamaica as one story, through emancipation to Morant Bay.
- **Cormac Ó Gráda, *Black '47 and Beyond: The Great Irish Famine in History, Economy, and Memory* (1999).** An economic historian's account of the Famine and its memory.
- **Antoinette Burton, *At the Heart of the Empire: Indians and the Colonial Encounter in Late-Victorian Britain* (1998).** Indians in late-Victorian London, including Cornelia Sorabji.
- **Neil Parsons, *King Khama, Emperor Joe, and the Great White Queen: Victorian Britain Through African Eyes* (1998).** The 1895 visit of three Tswana kings.$mn_victorian_master$,
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
  select $mn_victorian_quiz$[
    {"type": "mcq", "prompt": "How many people died in the 1854 Broad Street cholera outbreak, and what happened after John Snow addressed the parish Board of Guardians?", "options": ["About 420 died; the pump handle was removed the next day, though officials later rejected Snow's theory", "About 6,000 died; Snow was honoured and his theory was accepted at once", "About 14,000 died; Parliament immediately banned all public pumps", "About 127 died; the Guardians refused to act"], "answerIndex": 0, "explanation": "127 died in three days and 420 by the end. The handle was removed the day after Snow spoke to the Guardians, but officials afterwards rejected his theory, and miasma theory still dominated.", "id": "q1"},
    {"type": "mcq", "prompt": "Who speaks the line \"Two nations; between whom there is no intercourse and no sympathy\" in Disraeli's Sybil (1845)?", "options": ["Queen Victoria", "Disraeli himself, in a speech to the Commons", "The character Stephen Morley", "Feargus O'Connor"], "answerIndex": 2, "explanation": "The words belong to a character in the novel, the radical Stephen Morley, not to Disraeli speaking in his own voice, although Disraeli later became the figurehead of 'one-nation' Conservatism.", "id": "q2"},
    {"type": "mcq", "prompt": "What is true of Queen Victoria's donation to Irish famine relief?", "options": ["She gave only £5, the same as she gave to Battersea Dogs Home", "She refused to give anything", "She gave £10,000 and asked the Ottoman Sultan to give less", "She gave £2,000, more than any other individual donor, though in Ireland she was called 'the Famine Queen'"], "answerIndex": 3, "explanation": "Victoria gave £2,000 to the British Relief Association. The £5 story is a myth from the late nineteenth century, and the tale of the Sultan reducing his gift is described as legend.", "id": "q3"},
    {"type": "mcq", "prompt": "What is known about the exchange between Wilberforce and Huxley at Oxford on 30 June 1860?", "options": ["A verbatim transcript records Huxley's exact reply", "No verbatim record exists, and what either man actually said is uncertain", "Darwin himself debated Wilberforce", "It ended with the Church accepting evolution"], "answerIndex": 1, "explanation": "Darwin was too ill to attend, and Huxley's famous retort survives only in letters and later recollections that disagree on the wording. The episode later fed the 'conflict thesis', which historians of science now regard as discredited.", "id": "q4"},
    {"type": "open", "prompt": "How did events outside Great Britain, in Ireland, India, Jamaica and the United States, shape politics and opinion in Victorian Britain? Use at least three examples.", "rubric": "A strong answer uses specific examples: the Irish Famine (about a million dead, the Gregory clause, Trevelyan's 'Providence', Clarendon's private criticism, Corn Law repeal in 1846, and the genocide-or-neglect debate with Ó Gráda and Kinealy); India (Victoria as Empress from 1876, the Durbar of 1877 during famine, Naoroji's election in 1892 after Salisbury's remark, Dickens's letter after 1857); Jamaica (Morant Bay and the split between the Jamaica Committee and the Eyre Defence Committee); and Lancashire's working people writing to Lincoln in 1862, noting that opinion was not uniform. It reflects on the Porter–MacKenzie debate over how far empire touched ordinary Britons.", "id": "q5"},
    {"type": "open", "prompt": "Assess the part played by working-class people and women in changing Victorian Britain. Did change come from below or from above?", "rubric": "A strong answer discusses Chartism (the six points, the petitions and the 1848 count of about 1.98 million against O'Connor's claim, treated as a total count rather than a tally of fakes; William Cuffay; Dorothy Thompson's view), the matchwomen's strike of 1888 (made by the women themselves, Besant learning of it only when the strikers came to her) and the 1889 dock strike; and women's campaigns (Caroline Norton, Josephine Butler and the Contagious Diseases Acts, Mill's 1867 amendment lost by about 196 to 73). It weighs these against reform from above (the Reform Acts of 1867 and 1884, Chadwick and the Public Health Act, Bazalgette's sewers), and notes that full manhood suffrage and women's votes came only in 1918.", "id": "q6"}
  ]$mn_victorian_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/modern-era-19th-century/the-victorian-era', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

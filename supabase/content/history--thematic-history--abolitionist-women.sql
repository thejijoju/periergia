-- Abolitionist Women — canonical master article, co-written and human-reviewed.
-- history/thematic-history/abolitionist-women @ research/advanced/read.
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
    'history/thematic-history/abolitionist-women',
    'research',
    'advanced',
    'read',
    $mn_abwomen_master$> **Women made abolition a mass movement, and abolition made many of them feminists.** From the 1780s to the 1880s, women boycotted slave-grown sugar, formed their own anti-slavery societies, gathered hundreds of thousands of signatures and spoke in public when that was itself a scandal. This chapter begins with enslaved women who seized freedom for themselves, then follows Britain's pioneers of immediate emancipation, America's organisers and orators, the Black women abolitionists whose words were often edited by others, *Uncle Tom's Cabin*, and the road from the 1840 World's Anti-Slavery Convention to Seneca Falls and the split over the Fifteenth Amendment. It ends in Brazil and with the historians' debates, including the reminder that many women were themselves enslavers.

## Freedom Seized: Enslaved Women's Resistance

The first women to fight slavery were those it held, and what survives of their resistance is often filtered through hostile records or later memory.

In Jamaica, **Nanny of the Maroons** (c.1686 – c.1760) led the Windward Maroons. Most of what is known about her comes from Maroon oral tradition, which makes her an Asante; little textual evidence exists. A 1733 colonial record rewards a man for "having killed Nanny, the rebels old obeah woman", yet a Nanny received a grant of five hundred acres after the British made peace with the Windward Maroons by treaty in 1740; whether these were the same woman is unclear. Under the treaties, the Maroons agreed not to harbour new runaways and to help catch them for bounties, so Nanny is best understood as a fighter for her own community's freedom rather than as an abolitionist in the nineteenth-century sense.

In Massachusetts, **Elizabeth Freeman**, known as "Mum Bett" (c.1744 – 1829), was enslaved in Sheffield by John Ashley. After hearing the Massachusetts Constitution of 1780 declare that "All men are born free and equal", she sought out the lawyer Theodore Sedgwick. Her case, *Brom and Bett v. Ashley*, was heard in August 1781 by the County Court of Common Pleas at Great Barrington, and the jury found for her, awarding thirty shillings in damages; Ashley dropped his appeal. The case was cited in the Quock Walker cases, which ended slavery in Massachusetts.

The revolution in Saint-Domingue, told in the chapter on the French and Haitian Revolutions, had its women fighters. **Sanité Bélair**, a free woman of colour from Verrettes, served as a lieutenant in Toussaint Louverture's forces against the Leclerc expedition; she was captured, her husband gave himself up to stay with her, and both were executed in October 1802.

**Mary Prince**, born in Bermuda around 1788, was brought to London by her owner in 1828. She left his household, but he refused to free her, so she could not return to her husband in Antigua without being re-enslaved. *The History of Mary Prince* (1831), dictated to Susanna Strickland in the household of Thomas Pringle, secretary of the Anti-Slavery Society, was the first account of the life of a Black enslaved woman published in Britain. "I have been a slave myself—I know what slaves feel," it declared.

## Britain: Sugar, Societies and "Immediate, Not Gradual"

British women took part in the movement from the 1780s. The first great sugar boycott came in 1791, born of frustration at Parliament's delays. William Fox's *Address* urging Britons to refrain from West India sugar and rum went through 26 editions in under a year. "In every pound of sugar used," Fox wrote, "... we may be considered as consuming two ounces of human flesh." Women, who could not vote, could promote and join a boycott. Thomas Clarkson estimated that some 300,000 families took part; other estimates exceed 400,000 people. The boycott faded as the French Revolution turned violent in 1792.

The boycott returned in the 1820s, when sugar bowls advertised "East India Sugar not made by Slaves". Its most radical voice was **Elizabeth Heyrick** (1769–1831), a Leicester Quaker. In 1824 she published *Immediate, Not Gradual Abolition*, rejecting the gradualism of Wilberforce and others and appealing to the public and to consumers rather than to government. With Susanna Watts she canvassed Leicester for a boycott of West Indian sugar; by June 1825 almost a quarter of the town's population had stopped using it.

Women also began to organise on their own. The **Birmingham Ladies' Society for the Relief of Negro Slaves**, the first women's anti-slavery society, was founded on 8 April 1825 by Lucy Townsend and Mary Lloyd; Heyrick and Sarah Wedgwood were members. The Sheffield Female Anti-Slavery Society, founded the same year with Mary Anne Rawson among its founders, was the first anti-slavery society in Britain to campaign for immediate rather than gradual emancipation. Between 1825 and 1833, 73 female anti-slavery societies were created in Britain. In Clare Midgley's words, they "marked the change from abolition as an individual woman's commitment, to antislavery as a collective female endeavour".

In 1830 the Birmingham women resolved to pay their annual £50 donation to the national Anti-Slavery Society only once it dropped "gradual" from its title. Sources differ on whether this was in April or May, and on whether Heyrick's influence or Sarah Wedgwood's proposal lay behind it; it was a conditional donation, which some accounts describe as a threat. The national society soon abandoned gradualism.

Petitions were the other great weapon. In 1833 a national women's petition, organised with the London Female Anti-Slavery Society (Anne Knight is credited), carried nearly 300,000 women's signatures by most accounts (one source gives a lower figure), and Midgley describes it as the largest single anti-slavery petition presented to Parliament. The chapter on Abolition and Emancipation tells how Parliament ended slavery itself.

Britain was not alone. In France, the playwright **Olympe de Gouges**, one of France's earliest public opponents of slavery, published *Réflexions sur les hommes nègres* (1788), and her play *Zamore et Mirza* was staged at the Comédie-Française in December 1789 as *L'Esclavage des Noirs*.

```checkpoint
q: What did Elizabeth Heyrick argue in her 1824 pamphlet?
a*: That slavery should be abolished immediately, and that the public and consumers, not only government, could bring this about.
a: That slavery should be ended gradually, as Wilberforce proposed.
x: She explicitly rejected the gradualism of Wilberforce and others.
a: That women should be given the vote before slavery was ended.
x: Her pamphlet was about West Indian slavery, not women's suffrage.
a: That slave owners should be paid compensation for twenty years.
x: She appealed to public conscience and consumer action, not to schemes of compensation.
hint: Think of the pamphlet's title.
why: Heyrick's *Immediate, Not Gradual Abolition* helped push British anti-slavery away from gradualism.
---
q: Which statement best describes the Birmingham women's £50 episode of 1830?
a: They threatened to dissolve the national Anti-Slavery Society.
x: The sources describe a conditional donation, not a threat to dissolve anything.
a: They paid £50 to buy the freedom of Mary Prince.
x: Mary Prince's owner refused to free her; this episode concerned the national society's title.
a*: They made their annual donation to the national society conditional on its dropping "gradual" from its title.
a: They gave £50 to William Fox to print his sugar pamphlet.
x: Fox's pamphlet appeared in 1791, decades earlier.
hint: Think of what they wanted the national society to stop saying.
why: Women's money gave them leverage over a movement in which they could not hold office.
```

## The United States: Societies, Speakers and the "Woman Question"

**Maria W. Stewart** (1803–1879), a free Black woman born in Hartford, was inspired by David Walker's *Appeal* (1829), and Garrison's *Liberator* printed her lectures. Her 1831 pamphlet *Religion and the Pure Principles of Morality* asked "how long shall the fair daughters of Africa be compelled to bury their minds and talents beneath a load of iron pots and kettles?", and she gave her first lecture at Franklin Hall in Boston on 21 September 1832. Speaking to mixed audiences of men and women, Black and white, she was among the first American-born women to lecture publicly on politics to such audiences; her public career ended with a farewell address in 1833.

**Lydia Maria Child** (1802–1880), a popular author, published at her own expense *An Appeal in Favor of That Class of Americans Called Africans* (1833), which argued for immediate, uncompensated emancipation and against racial prejudice. It cost her much of her readership. She went on to edit the *National Anti-Slavery Standard* in the early 1840s, the first woman to edit a national political paper.

When the American Anti-Slavery Society (AASS) was founded in Philadelphia in December 1833, women could not join. Days later eighteen women founded the **Philadelphia Female Anti-Slavery Society**: among them Lucretia Mott, a Quaker minister whose home was an Underground Railroad stop; the Black Forten women, Charlotte and her daughters; Grace and Sarah Mapps Douglass; and Hetty Reckless. It was racially integrated, which was rare at the time. Black members under Hetty Reckless also aided fugitives through the Vigilance Association, work Mott thought outside the society's role, a disagreement shaped by race. The society dissolved only in 1870, after the Fifteenth Amendment.

The most controversial speakers were **Sarah and Angelina Grimké**, daughters of a slaveholding Charleston judge, who moved north and became Quakers. Their 1837 speaking tour of New England to mixed audiences provoked a *Pastoral Letter* from the Massachusetts Congregational ministers. Sarah's *Letters on the Equality of the Sexes* (1838) declared in one letter, "I ask no favors for my sex"; Angelina told Catharine Beecher that "it is the woman's right to have a voice in all the laws and regulations by which she is to be governed". In February 1838 Angelina became the first woman in the United States to address a legislative body, a committee of the Massachusetts legislature, defending women's right to petition.

Women also met nationally. The Anti-Slavery Convention of American Women in New York in May 1837 drew about 175 women, only five of them Black; the historian Ann D. Gordon calls it the first convention at which women discussed women's rights. When the second convention met at Pennsylvania Hall in Philadelphia in May 1838, Angelina spoke for an hour while a mob broke the windows, and the women left arm in arm, Black and white. The next day a mob burned the hall down.

The question of women's place divided the movement. When Abby Kelley was elected to the AASS business committee, conservatives left, and in 1839–40 the Tappans' American and Foreign Anti-Slavery Society was formed without admitting women. Under the House "gag rule" (1836–1844), thousands of petitions carrying hundreds of thousands of signatures were tabled unread, with women's signatures a large share. Susan Zaeske's study of women's petitions shows their tone changing from deference in 1835 to an open claim of political right by the 1840s.

## Black Women's Voices: Truth, Tubman, Harper and Jacobs

**Sojourner Truth**, born Isabella around 1797 and enslaved in Ulster County, New York, spoke Dutch as her first language. Late in 1826 she left with her infant daughter: "I did not run off ... I walked off." Her most famous speech, at the Woman's Rights Convention in Akron, Ohio, on 29 May 1851, survives most reliably in the transcript of Marius Robinson, the convention's recording secretary, published in the *Anti-Slavery Bugle* on 21 June 1851 after he had gone over it with her.

```quote
I am a woman's rights. I have as much muscle as any man, and can do as much work as any man. I have plowed and reaped and husked and chopped and mowed, and can any man do more than that?
Sojourner Truth · speech at Akron, as reported in the Anti-Slavery Bugle · 1851
```

The famous refrain "Ain't I a Woman?" does not appear in Robinson's text. It comes from a very different version published by Frances Dana Gage in 1863, twelve years later, in a Southern dialect, although Truth had grown up in New York speaking Dutch. Gage added the refrain, a claim that Truth could "bear de lash", and a claim that she had borne thirteen children, most sold away; Truth had about five, one of them sold. Gage's version became standard until Nell Irvin Painter's 1996 biography separated the woman from the symbol.

{{image: Sojourner Truth | Sojourner Truth in a photograph from her later years.}}

**Harriet Tubman**, born Araminta Ross in Dorchester County, Maryland, escaped in 1849 and reached Philadelphia. From 1850 to 1860 she made about thirteen expeditions, rescuing some seventy people and giving instructions to fifty or sixty more who escaped on their own; she was never captured. "I never ran my train off the track and I never lost a passenger," she said years later. During the Civil War she helped lead the Combahee Ferry raid of June 1863 with about 150 Black soldiers, which freed more than 700 people; she is widely credited as the first woman to lead an armed military operation in the United States.

**Frances Ellen Watkins Harper** (1825–1911), born free in Baltimore, began lecturing against slavery in 1854, first for the Maine Anti-Slavery Society. Her *Poems on Miscellaneous Subjects* (1854) sold well, and "The Two Offers" (1859) was the first short story published by a Black woman.

**Harriet Jacobs**, born enslaved in North Carolina, escaped her harasser, Dr James Norcom, by hiding for about seven years in a crawlspace under her grandmother's roof before fleeing to Philadelphia in 1842. She asked Stowe to write her story and was rebuffed, so she wrote it herself. *Incidents in the Life of a Slave Girl, Written by Herself* (1861), published under the name "Linda Brent" and edited by Lydia Maria Child, was long dismissed as a novel by Child, until Jean Fagan Yellin's documentary research in the 1980s established Jacobs's authorship and the book's autobiographical truth.

## Harriet Beecher Stowe and *Uncle Tom's Cabin*

**Harriet Beecher Stowe** (1811–1896), who had lived in Cincinnati across the river from slaveholding Kentucky, wrote *Uncle Tom's Cabin* in response to the Fugitive Slave Act of 1850. Published as a book on 20 March 1852 after serialisation, it sold 300,000 copies in the United States in its first year, and over 1.5 million copies, mostly pirated, soon circulated in Britain. It was the best-selling novel of the nineteenth century in the United States. Stowe drew on Josiah Henson's narrative and on *American Slavery As It Is* (1839), compiled by Theodore Weld with the Grimké sisters.

Some, following Tompkins, call its influence "incalculable"; others stress that its racial stereotypes and its passive Tom shaped American images of Black people. The story that Lincoln greeted Stowe as the little woman who started the war is reported only later by her son and is likely apocryphal, and the claim that the novel "caused" the war is overstated. The chapter on Histories of Emotions places the book in the history of sentimental fiction.

## From Exclusion to Women's Rights

In June 1840 the British and Foreign Anti-Slavery Society held a **World's Anti-Slavery Convention** in London, having issued a circular limiting it to "gentlemen". American societies nevertheless sent women, including Lucretia Mott, one of six women delegates. After a day of debate, the women were seated in the gallery, unable to speak or vote; Garrison, Charles Lenox Remond and a few other men sat with them. Elizabeth Cady Stanton, there as a delegate's wife on her honeymoon, later recalled that as she and Mott walked home arm in arm they resolved "to hold a convention as soon as we returned home, and form a society to advocate the rights of women".

That convention came eight years later. Organised by Mott, Stanton and three other women, the **Seneca Falls Convention** met on 19–20 July 1848. About 300 attended, and 100 people, 68 women and 32 men, signed a Declaration of Sentiments modelled on the Declaration of Independence: "all men and women are created equal". The resolution demanding the vote was the most contested; Mott urged its removal, and Frederick Douglass, the only African American present, argued for it until it passed. Stanton later promoted Seneca Falls as the movement's beginning, but that was her own framing: the women's anti-slavery convention of 1837 had already discussed women's rights. In Britain, Anne Knight, who had been at the 1840 convention, produced what is thought the first leaflet for women's suffrage in 1847.

During the Civil War, Stanton and Susan B. Anthony's Women's Loyal National League gathered nearly 400,000 signatures for a constitutional amendment abolishing slavery, as the chapter on the American Civil War describes. Peace brought division. The American Equal Rights Association, founded in 1866 for suffrage regardless of race or sex, split over the Fifteenth Amendment, which barred racial but not sex discrimination in voting. Stanton and Anthony opposed it and resorted to racist rhetoric; Harper, Douglass and Abby Kelley supported it. Truth warned in 1867 that "if colored men get their rights, and not colored women theirs, you see the colored men will be masters over the women". Harper had already named the gap in 1866.

```quote
You white women speak here of rights. I speak of wrongs.
Frances Ellen Watkins Harper · National Woman's Rights Convention, New York · 1866
```

```checkpoint
q: Why is the 1851 *Anti-Slavery Bugle* text preferred for Sojourner Truth's Akron speech?
a: Because it is the version written by Frances Dana Gage.
x: Gage's very different version appeared in 1863; the Bugle text is Marius Robinson's.
a*: Because it was published within weeks by the convention's recording secretary, who went over it with Truth.
a: Because it contains the refrain "Ain't I a Woman?"
x: That refrain does not appear in Robinson's text; it comes from Gage's 1863 version.
a: Because Truth wrote it down herself in Southern dialect.
x: Robinson, not Truth, recorded it, and the dialect belongs to Gage's later version.
hint: Think of who recorded it and when.
why: Robinson's near-contemporary report is closer to what Truth said than the version that became famous.
---
q: How should the claim that Seneca Falls (1848) was "the beginning" of the women's rights movement be treated?
a: As settled fact, since no women had discussed their rights before 1848.
x: The 1837 Anti-Slavery Convention of American Women already discussed women's rights.
a: As a myth invented by twentieth-century historians.
x: The framing came from Stanton herself, not from later historians.
a: As a claim made by Frederick Douglass to win support for suffrage.
x: Douglass argued for the suffrage resolution, but the origin story was Stanton's.
a*: As Stanton's own framing, since women in the anti-slavery movement had already debated their rights, notably at the 1837 convention.
hint: Think of who wrote the history of woman suffrage.
why: The longer roots of women's rights lay in women's anti-slavery activism.
```

## Beyond the Anglo-American World: Brazil and Cuba

In Brazil, which abolished slavery only in 1888, women wrote and organised too. **Maria Firmina dos Reis**, a schoolteacher in Maranhão, published *Úrsula* (1859), considered the first Brazilian abolitionist novel; she is considered Brazil's first Black woman novelist. As abolitionist societies multiplied in the 1880s, in Recife the seamstress and designer **Leonor Porto**, who freed the people she still held, was a founder and later president of **Ave Libertas**, an all-women society created in 1884. Through bazaars and theatre benefits it bought manumissions, freeing 200 captives in its first year. The historian Celso Castilho, with Camillia Cowling, has shown how enslaved people, especially women, used the emancipation funds of the 1880s to win their freedom. The chapter on Abolition and Emancipation covers the Golden Law of 1888.

In Cuba, Ana Betancourt linked the freeing of the enslaved to women's emancipation at Guáimaro in 1869, as the chapter on Latin America after Independence describes.

## Historians' Debates

**Helpers or foundation?** Older accounts treated women's societies as auxiliaries of marginal interest. Clare Midgley for Britain (1992) and Julie Roy Jeffrey for the United States (1998) argue that women's money, petitions, fairs and boycotts were the movement's foundation, though Midgley also notes that many women denied they were challenging the idea of separate spheres.

**A cradle of feminism, and whose?** Historians once called the Philadelphia society a "cradle of feminism"; newer work by Shirley Yee, Janice Sumler-Lewis and Julie Winch stresses free Black women's own community activism and their more militant agenda. Kathryn Kish Sklar has documented how women's rights emerged within the anti-slavery movement, and Martha S. Jones centres Black women's insistence on rights for all.

**Whose voice?** Black women's words often reached print through white editors: Prince through Strickland and Pringle, Truth through Robinson and Gage, Jacobs through Child. Painter and Yellin recovered the women behind the texts.

**Women as enslavers.** Stephanie Jones-Rogers (2019) shows that Southern white women owned, bought, sold and brutally managed enslaved people, treating slaveholding as a route to wealth and independence; about 40 per cent of eighteenth-century South Carolina bills of sale had a female buyer or seller. Women were not naturally anti-slavery: the Grimkés came from a slaveholding household, and Leonor Porto freed people she had owned. The chapter on Women and Gender in World History sets these questions in a longer history, and Modern American History carries the struggle for women's and civil rights into the twentieth century.

## Further exploration

- **Clare Midgley, *Women Against Slavery: The British Campaigns, 1780–1870* (1992).** The founding study of British women's anti-slavery activism.
- **Julie Roy Jeffrey, *The Great Silent Army of Abolitionism: Ordinary Women in the Antislavery Movement* (1998).** The rank-and-file women of fairs, petitions and sewing circles.
- **Nell Irvin Painter, *Sojourner Truth: A Life, a Symbol* (1996).** Separates the woman from the symbol Gage created.
- **Jean Fagan Yellin, *Harriet Jacobs: A Life* (2004).** A biography by the scholar who authenticated *Incidents*.
- **Kate Clifford Larson, *Bound for the Promised Land: Harriet Tubman, Portrait of an American Hero* (2003).** The careful modern account of Tubman's rescues.
- **Stephanie E. Jones-Rogers, *They Were Her Property: White Women as Slave Owners in the American South* (2019).** White women as active, profit-seeking enslavers.
- **Manisha Sinha, *The Slave's Cause: A History of Abolition* (2016).** Puts enslaved resistance and Black and women abolitionists at the centre.$mn_abwomen_master$,
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
  select $mn_abwomen_quiz$[
    {"type": "mcq", "prompt": "Which body heard Elizabeth Freeman's freedom suit, Brom and Bett v. Ashley, in August 1781?", "options": ["The County Court of Common Pleas at Great Barrington, where a jury found for her", "The United States Supreme Court", "The Massachusetts Supreme Judicial Court, which decided her case on appeal", "The Massachusetts legislature, which passed a private act freeing her"], "answerIndex": 0, "explanation": "Her case was won before a jury in the county court at Great Barrington, which awarded her thirty shillings in damages; Ashley dropped his appeal, and the case was later cited in the Quock Walker cases.", "id": "q1"},
    {"type": "mcq", "prompt": "What was distinctive about the Sheffield Female Anti-Slavery Society, founded in 1825?", "options": ["It was the first anti-slavery society in the United States", "It was the first society to admit men and women equally", "It was the first anti-slavery society in Britain to campaign for immediate rather than gradual emancipation", "It organised the 1791 sugar boycott"], "answerIndex": 2, "explanation": "Sheffield's women, with Mary Anne Rawson among the founders, were the first British anti-slavery society to call for immediate emancipation, ahead of the national society.", "id": "q2"},
    {"type": "mcq", "prompt": "Where does the refrain \"Ain't I a Woman?\" attributed to Sojourner Truth come from?", "options": ["Marius Robinson's report in the Anti-Slavery Bugle, June 1851", "Truth's own written memoir of 1843", "The Declaration of Sentiments signed at Seneca Falls", "Frances Dana Gage's very different version published in 1863, in a Southern dialect"], "answerIndex": 3, "explanation": "The refrain does not appear in Robinson's 1851 transcript, the most reliable text. Gage added it in 1863, along with other invented details such as thirteen children, most sold away.", "id": "q3"},
    {"type": "mcq", "prompt": "How did Jean Fagan Yellin change the reading of Harriet Jacobs's Incidents in the Life of a Slave Girl (1861)?", "options": ["She showed it had been written by Harriet Beecher Stowe", "Her documentary research established Jacobs's authorship and the book's autobiographical truth, after it had long been dismissed as a novel by Lydia Maria Child", "She proved it was a work of fiction", "She discovered that it had first been published in Brazil"], "answerIndex": 1, "explanation": "Child edited the book, and it was long treated as her novel; Yellin's research in the 1980s established that Jacobs wrote it and that it was true.", "id": "q4"},
    {"type": "open", "prompt": "Explain how women's exclusion within the anti-slavery movement contributed to the rise of the women's rights movement, and why historians question the idea that Seneca Falls (1848) was its beginning.", "rubric": "A strong answer mentions the 1840 World's Anti-Slavery Convention in London, where women delegates such as Lucretia Mott were seated in the gallery unable to speak or vote, and Stanton's recollection that she and Mott resolved there to hold a women's rights convention; the Seneca Falls Convention of 1848 and the Declaration of Sentiments; and earlier conflicts such as the Pastoral Letter against the Grimkés or the 1839–40 split over women's role. It should note that the 'beginning' was Stanton's own framing and that the 1837 Anti-Slavery Convention of American Women had already discussed women's rights.", "id": "q5"},
    {"type": "open", "prompt": "Did women's anti-slavery activism unite women across lines of race? Use examples from the chapter, including the debate over the Fifteenth Amendment and the evidence on women as enslavers.", "rubric": "A good answer weighs cooperation (the racially integrated Philadelphia Female Anti-Slavery Society; Black and white women leaving Pennsylvania Hall arm in arm) against tension (Mott's view that aid to fugitives was outside the society's role; the split over the Fifteenth Amendment, with Stanton and Anthony using racist rhetoric while Harper, Douglass and Kelley supported it; Harper's 'You white women speak here of rights. I speak of wrongs'; Truth's warning in 1867). It should also use Jones-Rogers's evidence that Southern white women owned and profited from enslaved people, and the mediation of Black women's words by white editors, to show that women were not naturally anti-slavery.", "id": "q6"}
  ]$mn_abwomen_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/thematic-history/abolitionist-women', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

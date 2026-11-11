-- The American Civil War — canonical master article, co-written and human-reviewed.
-- history/modern-era-19th-century/the-american-civil-war @ research/advanced/read.
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
    'history/modern-era-19th-century/the-american-civil-war',
    'research',
    'advanced',
    'read',
    $mn_acw_master$> **How slavery broke the American union, and how the war that followed destroyed slavery.** For forty years the United States held together by compromises over slavery's spread westward, until they failed and eleven slaveholding states seceded in 1860–61, saying plainly that they did so to protect slavery. The war killed roughly 700,000–750,000 soldiers, and its effects reached Lancashire, Egypt, India and Mexico. This chapter follows the sectional crisis, the war, the enslaved people who freed themselves, Black soldiers, women, Native nations, the war's global links, Reconstruction and its violent overthrow, and the argument over its memory.

## A Union Divided by Slavery

On the eve of the war about four million people were enslaved in the United States. By 1860 cotton made up almost 60 per cent of American exports, and Southern plantations grew about two-thirds of the world's cotton and supplied over three-quarters of Britain's, as the chapter on the Industrial Revolution describes. The recurring question was whether slavery could spread west.

With the Senate split eleven free states to eleven slave, the **Missouri Compromise** of 1820, steered through the House by Henry Clay, admitted Missouri as a slave state and Maine as a free one, and banned slavery in the rest of the Louisiana Purchase north of latitude 36°30′. In 1832 South Carolina declared federal tariffs void within the state; this **nullification**, theorised by John C. Calhoun, ended in 1833 with a Force Bill and a compromise tariff. By the 1850s slavery in the territories had replaced the tariff as the central states'-rights conflict.

The war with Mexico (1846–48) reopened the question. In 1846 Congressman David Wilmot proposed banning slavery from any territory gained from Mexico; his **Proviso** passed the House on sectional lines and failed in the Senate. The **Compromise of 1850**, designed by Clay and Stephen A. Douglas, admitted California as a free state, left New Mexico and Utah to "popular sovereignty", banned the slave trade (but not slavery) in Washington, D.C., and passed a stringent **Fugitive Slave Act** forcing free states to help return people who had escaped. It heightened Northern fears of a "slave power conspiracy".

## From Kansas to Harpers Ferry

In 1854 Douglas's **Kansas–Nebraska Act** organised two territories under popular sovereignty, in effect repealing the Missouri Compromise line. At a schoolhouse meeting in Ripon, Wisconsin, in March 1854, opponents of the act suggested the name "Republican" for a new anti-slavery party.

In 1857 the Supreme Court decided ***Dred Scott v. Sandford*** by seven votes to two. Chief Justice Roger B. Taney held that people of African descent "are not included, and were not intended to be included, under the word 'citizens' in the Constitution", and struck down the Missouri Compromise ban as a violation of slaveholders' property rights. It is widely considered the Court's worst decision. In 1858 Abraham Lincoln, running for the Senate in Illinois, warned: "A house divided against itself cannot stand. I believe this government cannot endure, permanently half slave and half free."

In October 1859 the abolitionist **John Brown** led 21 men, among them the Black raiders Shields Green, John Anthony Copeland and Dangerfield Newby, against the armory at Harpers Ferry, Virginia. Frederick Douglass thought the plan suicidal and stayed away, but Green, who was living in Douglass's house, chose to go: "I believe I'll go with the old man," as Douglass reported it. Ten raiders were killed and seven, Brown among them, were executed. On the day he was hanged Brown wrote that "the crimes of this guilty land will never be purged away, but with Blood."

## Secession in the Secessionists' Own Words

In November 1860 Lincoln, whose party promised not to touch slavery where it existed but opposed its extension, won the presidency with 39.7 per cent of the vote and electoral votes only from free states. He received no votes in ten Southern states, not because he was removed from the ballot, but because parties printed ballots and the Republicans were absent there.

South Carolina seceded on 20 December 1860, and six more Deep South states followed by February 1861, forming the Confederate States of America under Jefferson Davis. Four states published declarations of causes. South Carolina's complained of "an increasing hostility on the part of the non-slaveholding States to the institution of slavery", and of Northern states' refusal to enforce the Fugitive Slave Act: it objected, in other words, to Northern states' rights. Mississippi's declared: "Our position is thoroughly identified with the institution of slavery—the greatest material interest of the world." The Confederate vice president was blunter still:

```quote
Our new government is founded upon exactly the opposite idea; its foundations are laid, its corner-stone rests, upon the great truth that the negro is not equal to the white man; that slavery, subordination to the superior race, is his natural and normal condition.
Alexander H. Stephens · Cornerstone Speech, Savannah · 21 March 1861
```

After the war Stephens claimed the reporter's notes were "very imperfect"; historians doubt that so many errors could have crept into the report. On 12 April 1861 Confederate guns opened fire on **Fort Sumter**. When Lincoln called for 75,000 militia, Virginia, Arkansas, North Carolina and Tennessee joined the Confederacy, making eleven states, while four slaveholding border states (Maryland, Delaware, Kentucky and Missouri) stayed in the Union.

## Strategy and Turning Points

About 2.2 million men served in the Union armies and perhaps 750,000 to a million in the Confederacy's. Winfield Scott's "Anaconda Plan" aimed to strangle the South by blockade; by 1865 the Union navy had 671 vessels, and the South could export less than a tenth of its cotton. The Confederacy fought defensively, hoping to outlast the North's will.

In 1862 New Orleans, the South's largest city, fell to the Union navy. At **Antietam** in Maryland, on 17 September 1862, 22,726 men were killed, wounded or missing, the bloodiest single day in American history. The strategic Union victory gave Lincoln his occasion for emancipation. In July 1863 two blows fell together: **Gettysburg** (1–3 July) cost about 50,000 casualties; and on 4 July Pemberton surrendered **Vicksburg** to Grant, giving the Union the Mississippi and cutting the Confederacy in two.

In 1864 Grant, now general-in-chief, fought Lee through the Overland Campaign and a nine-month siege of Petersburg. Atlanta's fall in September secured Lincoln's re-election. William T. Sherman's **March to the Sea** then waged "hard war" on Georgia's infrastructure and property, followed by thousands of freed people. Richmond fell in April 1865, entered by the Black troops of the XXV Corps, and Lee surrendered at Appomattox Court House on 9 April. Five days later John Wilkes Booth shot Lincoln, who died the next morning.

## Freedom Made from Below

In late May 1861 Frank Baker, Shepard Mallory and James Townsend, forced to build a Confederate battery, crossed Hampton Roads to Union-held Fort Monroe. General Benjamin Butler refused to return them as "contraband of war", a policy Congress soon adopted, as the chapter on Abolition and Emancipation describes. Records are incomplete, but hundreds of thousands of people, perhaps half a million, fled to Union lines. The historian Chandra Manning describes the hundreds of contraband camps they formed as "simultaneously humanitarian crises and incubators for a new relationship between African Americans and the U.S. government". In May 1862 Robert Smalls, an enslaved pilot, sailed the Confederate transport *Planter* out of Charleston harbour to the Union fleet with other enslaved crewmen and their families. His example helped persuade Lincoln to accept Black soldiers.

{{image: Contraband (American Civil War) | A contraband camp at Baton Rouge, around 1863: one of hundreds of camps built near Union lines by people who had freed themselves.}}

Lincoln moved more slowly. He reversed his generals' early emancipation orders, urged compensated emancipation and the "colonisation" of freed people abroad, and told the editor Horace Greeley in August 1862 that "My paramount object in this struggle is to save the Union, and is not either to save or to destroy slavery." Five days after Antietam he issued a preliminary proclamation. The **Emancipation Proclamation** of 1 January 1863, justified "upon military necessity", applied only to areas in rebellion. Estimates of those freed at once range from about 25,000 to 75,000, but freedom spread as Union armies advanced, ultimately reaching about 3.5 million people. Lincoln himself confessed in 1864 that "events have controlled me." The **Thirteenth Amendment** of December 1865 ended slavery nationwide.

```checkpoint
q: What did the secession declarations of South Carolina and Mississippi give as the cause of secession?
a*: The defence of slavery, including Northern states' hostility to it and their refusal to enforce the Fugitive Slave Act.
a: The federal tariff, which South Carolina had already nullified.
x: South Carolina's declaration did not complain of tariffs; tariffs had been the issue of the 1832 nullification crisis.
a: Lincoln's plan to abolish slavery immediately everywhere.
x: The Republican platform promised not to interfere with slavery where it existed; it opposed only its extension.
a: Lincoln's removal from Southern ballots.
x: Lincoln was not removed; parties printed ballots and the Republicans were absent in the South.
hint: Read Mississippi's phrase "the greatest material interest of the world".
why: The seceding states' own documents are the clearest evidence that slavery caused secession.
---
q: Who were Frank Baker, Shepard Mallory and James Townsend?
a: Union generals who issued early emancipation orders.
x: Those orders came from generals such as Frémont and Hunter, and Lincoln reversed them.
a: Black raiders who joined John Brown at Harpers Ferry.
x: Brown's Black raiders included Shields Green, John Anthony Copeland and Dangerfield Newby.
a*: Enslaved men who escaped to Fort Monroe in May 1861 and whom Butler refused to return as "contraband of war".
a: Former Confederate officers who founded the Ku Klux Klan.
x: The Klan was founded in Tennessee in December 1865; these men had escaped slavery in 1861.
hint: Think of Hampton Roads at night in 1861.
why: Their escape shows emancipation beginning with enslaved people's own actions, before federal policy changed.
```

## Black Soldiers

The Proclamation opened the army to Black men. About 180,000 to 200,000 served (army and navy counts differ), most in the 175 regiments of the United States Colored Troops, about a tenth of the army. More than 36,000 died, about a fifth, a far higher rate than among white troops. Offered \$7 a month after deductions, against \$13 for white privates, they and their supporters lobbied until they won equal pay. More than a dozen won the Medal of Honor, among them William Harvey Carney of the 54th Massachusetts at Fort Wagner. Douglass, two of whose sons enlisted in it, argued that service would earn citizenship:

```quote
Once let the black man get upon his person the brass letters U.S.; let him get an eagle on his button, and a musket on his shoulder, and bullets in his pocket, and there is no power on the earth or under the earth which can deny that he has earned the right of citizenship in the United States.
Frederick Douglass · Speech at National Hall, Philadelphia · 6 July 1863
```

Black soldiers faced particular dangers. Prisoner exchanges collapsed in 1863 when the Confederacy refused to exchange Black prisoners, and at **Fort Pillow**, Tennessee, in April 1864, Nathan Bedford Forrest's troops massacred Union soldiers, many of them Black, as they tried to surrender. Women freed people too: in June 1863 Harriet Tubman guided the Combahee raid, as the chapter on Abolition and Emancipation describes.

## Home Fronts: Women, the Draft and Riots

Women organised much of the war's relief. Dorothea Dix placed women nurses in some 350 hospitals, and estimates of the women who enlisted disguised as men range from about 400 to 1,000. Susan B. Anthony and Elizabeth Cady Stanton's Women's Loyal National League gathered nearly 400,000 signatures for abolition. In the South, white women managed plantations and "increasingly rebellious slaves", while enslaved women and children became the core workforce as enslaved men were impressed for army labour. Hungry women led the bread riots of 1863.

The Confederacy introduced the first American draft in 1862; the Union's of 1863 let a man pay \$300 or hire a substitute. In New York in July 1863, rioters, mainly Irish Americans, turned from the draft to attacking Black New Yorkers and burned the Colored Orphan Asylum, whose children were all escorted out. The official toll was about 120 dead.

## Native Nations

For Native nations the war years brought terrible violence. In Minnesota in August 1862, after crop failure, late annuities and the withholding of food, the Dakota went to war; the trader Andrew Myrick had reportedly said the hungry could "eat grass or their own dung". Several hundred settlers and soldiers were killed in about five weeks. A military commission sentenced 303 Dakota men to death; Lincoln approved 39, and 38 were hanged at Mankato on 26 December 1862, the largest one-day mass execution in US history. The Dakota and Ho-Chunk were then exiled from Minnesota. From 1864 the Navajo were forced on the **Long Walk** to Bosque Redondo; with the march, perhaps 2,500–3,500 died. On 29 November 1864 Colorado troops under John Chivington attacked Black Kettle's Cheyenne and Arapaho camp at **Sand Creek**, though he had come in under a peace parley and flew a US flag; Chivington boasted of 500–600 killed, eyewitnesses gave lower figures, and most historians estimate about 150 dead, two-thirds of them women and children.

In Indian Territory the Five Tribes (Cherokee, Chickasaw, Choctaw, Creek and Seminole) were divided. Most leaders signed Confederate treaties, and many thousands of Native men fought for the South, though the Creek leader Opothleyahola led Union loyalists to Kansas. The Cherokee Stand Watie, a slaveholder, was the last Confederate general to surrender; yet in 1863 the Union-aligned Cherokee National Council voted to emancipate all slaves in the Nation. Postwar treaties required the tribes to abolish slavery. The wartime Homestead Act and Pacific railroad laws opened the West to settlers.

## A War for the World's Cotton

"No power on the earth dares to make war upon it. Cotton is king," Senator James Henry Hammond had boasted in 1858. In 1861 planters withheld cotton to force British and French intervention. The gamble failed: Britain held large stocks, Europe's poor harvests made Northern grain vital, and Britain turned to India, Egypt and Brazil. Britain declared neutrality in May 1861, recognising the Confederacy as a belligerent, but no government ever recognised the Confederacy. The British cabinet weighed mediation in autumn 1862, but Antietam and emancipation ended that moment. For damage done by British-built raiders such as CSS *Alabama*, a tribunal at Geneva in 1872 awarded the United States \$15.5 million.

In Lancashire, whose mills employed 440,000 people, most of them women, the "Cotton Famine" slashed wages. On 31 December 1862 a meeting at Manchester's Free Trade Hall wrote to Lincoln backing the Union, and he praised their "sublime Christian heroism". How representative they were is disputed: Mary Ellison argued for wide Lancashire sympathy with the South, while R. J. M. Blackett finds opinion divided in ways that did not follow class lines neatly. Egypt roughly tripled or quadrupled its cotton exports. Napoleon III exploited the crisis to land troops in Mexico in 1862 and install Maximilian of Habsburg as emperor; Washington kept recognising Benito Juárez's republic, whose resistance the chapter on Nationalism describes. In 1862, with Southern members gone from Congress, the United States at last recognised Haiti. The historian Don H. Doyle argues that a Confederate victory would have meant a new birth of slavery, not of freedom.

## Counting the Dead

For over a century the standard figure was about 620,000 soldiers dead, from 19th-century counts that missed many Confederate deaths and men who died after discharge. In 2011 J. David Hacker used census samples to estimate about 752,000, with an upper bound near 851,000, and "750,000" was widely adopted. In 2024 a study using full census records put soldier deaths at about 698,000. Recent estimates therefore lie at roughly 700,000–750,000. Two-thirds died of disease. No count of civilian deaths was kept, and the historian Jim Downs estimates that tens of thousands to hundreds of thousands of freed and fleeing enslaved people died of disease, starvation and exposure.

## Reconstruction

Congress created the **Freedmen's Bureau** in March 1865. Sherman's Special Field Orders No. 15 had set aside some 400,000 coastal acres in plots of up to 40 acres for freed families, but President Andrew Johnson reversed it and almost all the land returned to former owners. The **Black Codes** of 1865–66 used vagrancy laws to force freedpeople into labour. Massacres such as Memphis in May 1866, where 46 Black people were killed, strengthened the Radical Republicans, who passed the Reconstruction Acts of 1867–68, putting the former Confederacy under military rule, and the **Fourteenth Amendment** (1868), which granted birthright citizenship and equal protection, overturning *Dred Scott*. The **Fifteenth Amendment** (1870) barred denial of the vote "on account of race, color, or previous condition of servitude". The Fourteenth had protected only male voters, and the women's movement split over the Fifteenth.

More than 1,500 African Americans held public office in the South; within a few years of 1867, James McPherson notes, "about 15 percent of the officeholders in the South were Black—a larger proportion than in 1990". Hiram Revels of Mississippi became the first African American in Congress in 1870, and Reconstruction conventions created tax-funded public schools.

## Overthrow

White terror answered. Against the **Ku Klux Klan**, founded in 1865 by six Confederate veterans, Congress passed Enforcement Acts in 1870–71. On Easter Sunday 1873, at **Colfax**, Louisiana, between 62 and 153 Black men were killed while surrendering, which Eric Foner describes as the bloodiest single instance of racial carnage in the Reconstruction era. In *United States v. Cruikshank* (1876) the Supreme Court overturned the convictions, ruling that the Fourteenth Amendment bound states, not individuals. Under the "Mississippi Plan", Democrats used organised violence and intimidation to retake that state, "peaceably if we can, forcibly if we must"; and in 1876 South Carolina's Red Shirts killed six Black men at Hamburg. The disputed election of 1876 ended in the Compromise of 1877, an informal bargain whose details historians still debate, and the last federal troops left the South. Between 1890 and 1908 most Black Southerners were effectively stripped of the vote. In Du Bois's words, "The slave went free; stood a brief moment in the sun; then moved back again toward slavery."

## Arguing over the War

The **Lost Cause**, named in Edward Pollard's book of 1866, recast the Confederacy as a heroic struggle for states' rights, not slavery. Spread through monuments, textbooks and films such as *The Birth of a Nation* (1915), it was fully developed by about 1900; Alan Nolan called it "a caricature of the truth", and the secession declarations refute it. Historians of Reconstruction divided too. William A. Dunning's school portrayed it as a failure of corrupt "negro rule". W. E. B. Du Bois's *Black Reconstruction in America* (1935) challenged that picture, arguing that enslaved people's flight to Union lines was a "general strike". Eric Foner's *Reconstruction* (1988) built on Du Bois, presenting an unfinished revolution overthrown by violence, and David Blight has shown how white reconciliation came at the expense of the memory of emancipation.

Historians still debate "who freed the slaves". Ira Berlin stressed the enslaved freeing themselves while granting the Proclamation a secure place; James McPherson kept Lincoln as the primary agent, warning that attacking one myth risks creating another. No reputable scholar denies a role to either.

```checkpoint
q: What did W. E. B. Du Bois mean by calling enslaved people's actions a "general strike"?
a: That Northern factory workers struck in support of emancipation.
x: Du Bois was describing enslaved people in the South, not Northern factory workers.
a*: That by withdrawing their labour and fleeing to Union lines, enslaved people helped destroy slavery and the Confederacy themselves.
a: That freedpeople refused to vote during Reconstruction.
x: Freedpeople voted and held office; more than 1,500 served as officials in the South.
a: That Lancashire mill workers stopped work to support the Confederacy.
x: Du Bois's argument concerned the American South; Lancashire's response is a separate debate.
hint: Think of the contraband camps.
why: Du Bois made enslaved people actors in their own emancipation, against the Dunning School's picture.
---
q: Which statement best describes current estimates of Civil War soldier deaths?
a: Exactly 620,000, as counted at the time.
x: That traditional figure missed many Confederate deaths and men who died after discharge.
a: Over two million, most killed in battle.
x: About 2.2 million served in the Union armies, and two-thirds of those who died were killed by disease.
a: About 360,000, all from the Union.
x: That is roughly the Union's traditional figure alone.
a*: Roughly 700,000–750,000, from census-based studies in 2011 and 2024.
hint: Think of Hacker's 2011 study and the 2024 full-census study.
why: New methods revised the old count upwards, and they still leave civilians and freedpeople uncounted.
```

## Further exploration

- **James M. McPherson, *Battle Cry of Freedom: The Civil War Era* (1988).** The standard one-volume history of the war and its causes.
- **Eric Foner, *Reconstruction: America's Unfinished Revolution, 1863–1877* (1988).** The standard history of Reconstruction, with freedpeople at its centre.
- **W. E. B. Du Bois, *Black Reconstruction in America* (1935).** The classic rebuttal of the Dunning School and source of the "general strike" argument.
- **Steven Hahn, *A Nation Under Our Feet: Black Political Struggles in the Rural South from Slavery to the Great Migration* (2003).** Black politics from slavery to the Great Migration.
- **Thavolia Glymph, *The Women's Fight: The Civil War's Battles for Home, Freedom, and Nation* (2020).** The wars of Black and white, enslaved and free women.
- **Don H. Doyle, *The Cause of All Nations: An International History of the American Civil War* (2015).** The war as a global contest over democracy and slavery.
- **David W. Blight, *Race and Reunion: The Civil War in American Memory* (2001).** How reconciliation buried the memory of emancipation.$mn_acw_master$,
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
  select $mn_acw_quiz$[
    {"type": "mcq", "prompt": "What did the Missouri Compromise of 1820 do?", "options": ["It admitted Missouri as a slave state and Maine as a free state, and banned slavery in the rest of the Louisiana Purchase north of 36°30′.", "It abolished slavery in Washington, D.C.", "It allowed the territories of Kansas and Nebraska to decide on slavery by popular sovereignty.", "It declared that people of African descent could not be citizens."], "answerIndex": 0, "explanation": "The 1820 compromise kept the Senate balance by pairing Missouri and Maine and drew the 36°30′ line. The Kansas–Nebraska Act of 1854 in effect repealed it, and Dred Scott (1857) declared its ban unconstitutional.", "id": "q1"},
    {"type": "mcq", "prompt": "What does recent research suggest about the number of soldiers who died in the Civil War?", "options": ["It confirms the traditional figure of about 620,000 exactly.", "It shows that fewer than 400,000 soldiers died.", "Census-based studies of 2011 and 2024 put soldier deaths at roughly 700,000–750,000, above the traditional 620,000.", "It shows that most soldiers died in battle rather than of disease."], "answerIndex": 2, "explanation": "J. David Hacker's 2011 census study estimated about 752,000 deaths, and a 2024 full-census study about 698,000. Two-thirds of soldier deaths were from disease.", "id": "q2"},
    {"type": "mcq", "prompt": "Why did the Confederacy's 'King Cotton' strategy fail to bring British intervention?", "options": ["Britain had already recognised the Confederacy in 1861.", "Britain had large cotton stocks, needed Northern grain after poor European harvests, and turned to cotton from India, Egypt and Brazil.", "The Confederacy sold all its cotton to France instead.", "British workers unanimously supported the Confederacy."], "answerIndex": 1, "explanation": "No government ever recognised the Confederacy. Britain's stocks, its need for Northern grain and new cotton sources weakened the strategy, and Antietam and emancipation ended talk of mediation in 1862.", "id": "q3"},
    {"type": "mcq", "prompt": "What did the Supreme Court decide in United States v. Cruikshank (1876)?", "options": ["That the Fifteenth Amendment was unconstitutional.", "That the Ku Klux Klan must be disbanded.", "That Black men could serve in the Union army.", "That the Fourteenth Amendment bound state governments, not individuals, overturning the federal convictions for the Colfax massacre."], "answerIndex": 3, "explanation": "Cruikshank overturned the convictions after the Colfax massacre of 1873, crippling federal prosecutions under the Enforcement Acts and helping white violence overthrow Reconstruction.", "id": "q4"},
    {"type": "open", "prompt": "Historians debate 'who freed the slaves'. Explain the two main positions and how the evidence supports each.", "rubric": "A strong answer explains the self-emancipation case (Ira Berlin; Du Bois's 'general strike'): enslaved people fled to Union lines from Fort Monroe in May 1861 onward, hundreds of thousands (perhaps half a million) in all, forming hundreds of contraband camps, and some 180,000–200,000 Black men served in Union forces. It explains the case for Lincoln as primary agent (McPherson): the Emancipation Proclamation of 1 January 1863, its use of 'military necessity', and the Thirteenth Amendment. It notes that the Proclamation applied only to areas in rebellion and that freedom spread as armies advanced, and that no reputable scholar denies a role to either.", "id": "q5"},
    {"type": "open", "prompt": "How was Reconstruction overthrown, and how have historians' interpretations of it changed?", "rubric": "A strong answer describes the achievements (Thirteenth to Fifteenth Amendments; more than 1,500 Black officeholders; Hiram Revels; tax-funded public schools) and the overthrow: Black Codes, the Klan, massacres at Memphis (1866) and Colfax (1873), the Cruikshank decision (1876), the Mississippi Plan and Hamburg (1876), the Compromise of 1877 (whose details are debated) and the withdrawal of federal troops, and disfranchisement by 1905. It contrasts the Dunning School's picture of failed 'negro rule' with Du Bois's Black Reconstruction (1935) and Foner's Reconstruction (1988), which treat it as an unfinished revolution overthrown by violence, and may mention the Lost Cause and Blight's work on memory.", "id": "q6"}
  ]$mn_acw_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/modern-era-19th-century/the-american-civil-war', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

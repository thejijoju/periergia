-- Modern American History: the United States in the Twentieth Century — canonical master article, co-written and human-reviewed.
-- history/regional-histories/americas/modern-american-history-the-united-states-in-the-twentieth-century @ research/advanced/read.
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
    'history/regional-histories/americas/modern-american-history-the-united-states-in-the-twentieth-century',
    'research',
    'advanced',
    'read',
    $mn_modamerica_master$> **A society remade, and fought over.** This chapter treats the twentieth-century United States as a society arguing about who counted as fully American, from the Progressive Era and the Great Migration through the culture wars of the 1920s, the New Deal and those it left out, the wartime home front and the incarceration of Japanese Americans, postwar affluence and McCarthyism, the freedom movements of the 1950s to 1970s, the conservative turn, deindustrialisation and mass incarceration, to the divided 1990s, with the debates historians still have about each.

## An American Century?

In *Life* on 17 February 1941 the publisher Henry Luce urged Americans to give up isolationism and "to create the first great American Century". David Harvey noted that Luce preferred "century" to "empire". In *The Short American Century* (2012), edited by Andrew Bacevich, Bacevich judged that "to the extent that an American Century ever did exist, that moment has now definitively passed", and Walter LaFeber wrote that it "was stillborn", while Emily Rosenberg and David M. Kennedy dissented.

Luce meant power abroad, covered in other chapters: The Second World War, Global Cold War and the Arms Race, The Vietnam War, and Latin America in the Cold War. This chapter treats the United States as a society. Native American history has its own chapter, Native American and Indigenous Studies.

## Reform, Migration and Terror, 1900–1920

The **Progressive Era**, roughly the 1890s to the 1920s, targeted monopolies and city political machines. Muckrakers such as Ida Tarbell, on Standard Oil, exposed both, and Upton Sinclair's *The Jungle* (1906) led to the Meat Inspection Act and the Pure Food and Drug Act ("I aimed at the public's heart," Sinclair said, "and by accident I hit it in the stomach"). In 1911 the Triangle Shirtwaist Factory fire in New York killed 146 garment workers, 123 of them women and girls. Reformers won direct primaries, the direct election of senators and, eventually, women's suffrage. Yet Woodrow Wilson, who created the Federal Reserve, also accelerated the segregation of federal employees, and in the South progressivism coexisted with Jim Crow and Black disenfranchisement.

Black Southerners answered by leaving. In the **Great Migration** about 6 million Black Americans moved from the rural South to the Northeast, Midwest and West between 1910 and 1970. The First World War cut European immigration and drew northern labour agents south; Jim Crow terror pushed from behind. The share of African Americans living outside the South rose from 8 per cent in 1900 to 47 per cent in 1970. Isabel Wilkerson tells it as a flight from the terror of Jim Crow to an uncertain life in the North, Midwest and West.

The North was not safe. In the "Red Summer" of 1919, a term coined by the NAACP's James Weldon Johnson, white supremacist terrorism and race riots struck more than three dozen cities, including Chicago, and a rural county of Arkansas, the scene of the Elaine massacre. The death toll of the Tulsa race massacre of 1921 is unknown; a 2001 state commission gave estimates from the official count of 36 to about 300. The Tuskegee Institute recorded 3,446 Black victims of lynching between 1882 and 1968. A federal anti-lynching law, named after Emmett Till, passed only in 2022.

The **Nineteenth Amendment** gave women the vote in 1920, won by Carrie Chapman Catt's mainstream campaign and the militant National Woman's Party of Alice Paul and Lucy Burns, with Black clubwomen organised nationally since 1896. But about three million southern women remained disfranchised: Black women faced poll taxes and violence (women trying to register in Birmingham, Alabama, were beaten in 1926) until the Voting Rights Act of 1965.

## The Twenties: Who Counts as American?

The **Immigration Act of 1924** banned immigration from Asia and capped quotas for the world outside the Western Hemisphere at 165,000 a year, an 80 per cent cut from the pre-1914 average. Quotas based first on the 1890 census, and from 1929 on "national origins", urged by a eugenics subcommittee under Madison Grant, favoured northern and western Europeans, and the Act created the Border Patrol. Its House sponsor, Albert Johnson, called it a bulwark against "a stream of alien blood"; Mae Ngai has shown how quotas and border policing created the category of the "illegal alien". The **second Ku Klux Klan**, founded in 1915, supported the law; its membership at the 1924–25 peak is estimated at anywhere from about 1.5 to 6 million, far beyond the South. Prohibition ran from 1920 to 1933, and in 1925 the Scopes trial in Tennessee pitted William Jennings Bryan against Clarence Darrow over the teaching of evolution.

Against this rose the **Harlem Renaissance**, or New Negro movement, named after Alain Locke's anthology *The New Negro* (1925) and fed by Caribbean immigrants. In 1926 Langston Hughes declared that younger Black artists intended "to express our individual dark-skinned selves without fear or shame". Marcus Garvey's Universal Negro Improvement Association, founded in Jamaica in 1914, became a mass movement in the United States, preaching a return to Africa.

## Depression and the New Deal

The stock market crashed in October 1929; The Interwar Period describes the world slump and the launch of the New Deal. American unemployment in the 1930s is an estimate, because the government did not measure it. Stanley Lebergott's widely accepted series puts the peak at 24.9 per cent in 1933; Michael Darby, counting workers on federal relief projects as employed, put it at 22.5 per cent in 1932. It fell sharply after 1933, then jumped again in the "Roosevelt recession" of 1937–38.

About 3.5 million people left the Plains states of the Dust Bowl in the 1930s, many for California. In the **Mexican Repatriation** about 82,000 people were formally deported, and estimates of all who left for Mexico range from 300,000 to 2 million. An estimated 40 to 60 per cent of the "voluntary" repatriates were US citizens, mostly American-born children.

The **Social Security Act** and the Wagner Act, both of 1935, created old-age and unemployment insurance and guaranteed collective bargaining, but both excluded agricultural and domestic workers. Social Security at first left out 65 per cent of the African American workforce, and 27 per cent of white workers. Ira Katznelson argues that southern Democrats, who controlled Congress's key committees, shaped programmes to exclude Black workers and keep administration local. Larry DeWitt, writing in the *Social Security Bulletin* in 2010, rejects racism as the cause of those exclusions, citing administrative reasons, and other accounts point to Treasury Secretary Morgenthau's worry that taxes would be hard to collect from farm and domestic workers.

## The Second World War at Home

The war, described in The Second World War, ended mass unemployment: 7.7 million were out of work in spring 1940, only 700,000 by autumn 1944. The number of working women rose from about 12 million to 19 or 20 million, by different counts. Facing a march on Washington planned by A. Philip Randolph of the Brotherhood of Sleeping Car Porters, Roosevelt banned racial discrimination in defence industries in June 1941. In 1942 the *Pittsburgh Courier*, prompted by a letter from James G. Thompson of Wichita, launched the **Double V** campaign: victory over fascism abroad and racism at home.

The gravest injustice was the **incarceration of Japanese Americans**. Under Executive Order 9066 of 19 February 1942, about 120,000 people of Japanese descent on the West Coast, two-thirds of them US citizens, were held in ten camps; in Hawaii, where they were over a third of the population, only 1,200–1,800 were. Roosevelt himself called the camps "concentration camps" in October 1942, and in 1946 Harold Ickes wrote: "We gave the fancy name of 'relocation centers' to these dust bowls, but they were concentration camps nonetheless." In 2022 the AP stylebook advised "incarceration" over "internment", since most of those held were citizens. The Supreme Court upheld the removals in *Korematsu v. United States* (1944); in 1988 the Civil Liberties Act blamed "race prejudice, war hysteria, and a failure of political leadership" and paid \$20,000 to each survivor.

In June 1943 servicemen in Los Angeles attacked Mexican American, Filipino and Black youths in the Zoot Suit Riots. From 1942 to 1964 the **Bracero Program** brought Mexican farmworkers north, issuing 4.6 million work contracts: contracts, not distinct individuals.

```checkpoint
q: Why do historians disagree about the New Deal's exclusion of farm and domestic workers from Social Security?
a*: Katznelson argues southern Democrats designed the exclusions to keep Black workers out, while DeWitt and others point to administrative and fiscal reasons.
a: Because the exclusions never existed and were invented by later historians.
x: The Social Security Act did exclude agricultural labour and domestic service, leaving out 65 per cent of the Black workforce at first.
a: Because the exclusions applied only to white workers.
x: They affected both, but fell far more heavily on Black workers (65 per cent against 27 per cent).
a: Because Roosevelt vetoed the Social Security Act.
x: The Act became law in 1935.
hint: Think of Congress's committee chairs and the Treasury's worries about collecting the tax.
why: The debate is about motive: the effect on Black workers is not in dispute.
---
q: Why is the figure of 4.6 million attached to the Bracero Program easily misread?
a: Because it counts only workers who settled permanently in the United States.
x: It counts contracts under a guest-worker scheme, not settlers.
a: Because it includes the people expelled in the Mexican Repatriation.
x: The Repatriation was a separate episode of the 1930s.
a*: Because it counts employment contracts, not distinct individuals.
a: Because it covers only the year 1942.
x: The programme ran from 1942 to 1964.
hint: Ask what exactly was being counted.
why: Reading contracts as people overstates the number of individuals involved.
```

## Affluence and Fear, 1945–1960

Postwar America was, in J. K. Galbraith's 1958 title, *The Affluent Society*, and the **GI Bill** of 1944 helped: by 1956, 7.8 million veterans had used its education benefits, and it offered low-interest, no-deposit mortgages. Katznelson argues the law "was deliberately designed to accommodate Jim Crow"; in the New York and northern New Jersey suburbs, fewer than 100 of 67,000 mortgages it insured went to non-white veterans. The economists Sarah Turner and John Bound found a regional pattern: large educational gains for white men and for Black men born outside the South, little for Black southerners.

Government also drew housing's colour line. From 1935 the Home Owners' Loan Corporation mapped 239 cities, often marking Black neighbourhoods red, and Federal Housing Administration rules penalised "inharmonious racial groups"; Levittown, New York, leased only to members of "the Caucasian race". Richard Rothstein argues that segregation is therefore *de jure*, the work of government at every level. Price Fishback and colleagues reply that HOLC refinanced Black homeowners roughly in proportion to their numbers, and did 90 per cent of its refinancing before the maps were drawn; the case against the FHA is stronger. Covenants became unenforceable in 1948, but housing discrimination was outlawed only in 1968. At the border, "Operation Wetback" in 1954 brought an immigration-service claim of 1.1 to 1.3 million expulsions; Department of Homeland Security statistics for fiscal year 1955 show 17,695 removals and 232,769 "returns". The headline is a claim, not a count.

The Cold War brought a **Red Scare** at home. Truman's 1947 loyalty programme screened federal employees; Julius and Ethel Rosenberg were executed for atomic espionage in 1953. Senator Joseph McCarthy rose with a speech in Wheeling, West Virginia, in February 1950, usually quoted as claiming "a list of 205" communists in the State Department. In 1954 the Army's counsel Joseph Welch asked him, "Have you no sense of decency, sir?", and the Senate censured him that December. In the "lavender scare" the State Department reported firing 425 employees in 1953 on allegations of homosexuality. Ellen Schrecker suggests "Hooverism", after the FBI's J. Edgar Hoover, as a better name for the whole apparatus. Soviet archives and decrypted cables confirm substantial espionage in the 1940s, which some cite to temper the liberal account, but they do not vindicate McCarthy's own charges.

## The Freedom Struggle

In 1947 *Mendez v. Westminster* ended the segregation of Mexican American pupils in California. On 17 May 1954 a unanimous Supreme Court, in **Brown v. Board of Education**, accepted Thurgood Marshall's argument that separate schools were inherently unequal; Chief Justice Earl Warren told the American Bar Association that year, with an eye on the Cold War, that "our American system like all others is on trial". A second ruling ordered desegregation only "with all deliberate speed".

In August 1955 fourteen-year-old Emmett Till was lynched in Mississippi, and his killers were acquitted. That December Rosa Parks was arrested in Montgomery, Alabama, for refusing to give up her bus seat, as Claudette Colvin, aged 15, and Mary Louise Smith, 18, had been before her. Jo Ann Robinson's Women's Political Council and E. D. Nixon organised a **bus boycott** that lasted 381 days and made Martin Luther King Jr. a national figure. On 28 August 1963 about 250,000 people joined the March on Washington organised by Bayard Rustin and A. Philip Randolph.

{{image: March on Washington for Jobs and Freedom | The March on Washington for Jobs and Freedom, 28 August 1963.}}

```quote
I have a dream that my four little children will one day live in a nation where they will not be judged by the color of their skin but by the content of their character.
Martin Luther King Jr. · "I Have a Dream", March on Washington · 28 August 1963
```

In Freedom Summer, 1964, James Chaney, Andrew Goodman and Michael Schwerner were murdered in Mississippi, and Fannie Lou Hamer led the Mississippi Freedom Democratic Party's challenge to the Democratic convention. "They kicked me off the plantation, they set me free," Hamer said. "… Now I can work for my people." The **Civil Rights Act**, signed on 2 July 1964, outlawed discrimination by race, colour, religion, sex or national origin. After "Bloody Sunday" on the Edmund Pettus Bridge at Selma on 7 March 1965, the **Voting Rights Act** suspended literacy tests in the mostly southern states and counties it covered (a nationwide ban followed in 1970) and imposed federal "preclearance"; a quarter of a million new Black voters registered by the end of 1965. *Shelby County v. Holder* disabled preclearance in 2013.

Jacquelyn Dowd Hall's "long civil rights movement" argues that this classic story is too narrow and triumphant: the movement grew from the labour radicalism of the 1930s and 1940s, outlasted the 1960s and was national, not merely southern. Sundiata Keita Cha-Jua and Clarence Lang reply that the "long movement" becomes a "vampire", making the struggle virtually eternal and erasing regional distinctions; Eric Arnesen has also questioned it.

## Black Power and Other Movements

Malcolm X left the Nation of Islam in 1964 and urged self-defence "by any means necessary"; he was assassinated in New York on 21 February 1965. In 2021 two of the three men convicted of his murder, Muhammad Abdul Aziz and Khalil Islam, were exonerated after a review found the FBI and New York police had withheld evidence. In June 1966 Stokely Carmichael, the Trinidad-born chair of SNCC, raised the cry of "Black Power" in Greenwood, Mississippi; that October Huey P. Newton and Bobby Seale founded the Black Panther Party in Oakland, which became the target of 233 of the FBI's nearly 300 authorised COINTELPRO actions against "Black nationalist" groups. Against older accounts of Black Power as civil rights' "evil twin", Peniel E. Joseph argues that the two overlapped, that Black Power helped transform postwar America, and that Malcolm X and King converged as radicals.

After more than 150 riots, notably in Detroit, the Kerner Commission was set up, and its 1968 report warned:

```quote
Our nation is moving toward two societies, one black, one white—separate and unequal.
Kerner Commission · Report · 1968
```

Meanwhile, during Johnson's War on Poverty and Great Society, which brought Medicare, Medicaid and Head Start, the official poverty rate fell from 19.5 per cent in 1963 to 11.1 per cent in 1973.

In September 1965 Filipino farmworkers led by Larry Itliong began the **Delano grape strike**; César Chávez and Dolores Huerta's mainly Mexican union joined a week later, and their merged union won contracts in 1970. In March 1968 thousands of Mexican American students walked out of East Los Angeles schools. Yuji Ichioka and Emma Gee coined "Asian American" in 1968, and the multiracial Third World Liberation Front strikes at San Francisco State and Berkeley won ethnic studies programmes. The **Hart–Celler Act** of 1965 abolished the 1924 quotas; Johnson called it "not a revolutionary bill", but immigration from Asia and Africa rose sharply afterwards. The student and antiwar movements appear in Power and Protest in the Long 1960s.

Betty Friedan's *The Feminine Mystique* (1963) sold over a million copies, and in 1966 Friedan, Pauli Murray and others founded the National Organization for Women. The Equal Rights Amendment passed Congress in 1972 but fell three states short of ratification, after a campaign against it led by Phyllis Schlafly. *Roe v. Wade* (1973) grounded abortion rights in a right to privacy; *Dobbs* overruled it in 2022. A police raid on New York's Stonewall Inn on 28 June 1969 set off several nights of riots, and anniversary marches became Pride parades. AIDS was first recognised in 1981 among gay men, and the Reagan administration's slow response is widely criticised.

## The Conservative Turn

Barry Goldwater voted against the 1964 Civil Rights Act and told that year's Republican convention that "extremism in the defense of liberty is no vice!" He won only 52 electoral votes to Johnson's 486, but carried five Deep South states that, Louisiana in 1956 apart, had not voted Republican since Reconstruction. Ronald Reagan, launched by his 1964 speech "A Time for Choosing", was elected governor of California in 1966; Nixon ran in 1968 on "law and order" and "states' rights", the so-called Southern strategy.

Racial backlash as the driver of this realignment is the scholarly consensus. Matthew Lassiter, Kevin Kruse and Joseph Crespino accept that race was central but reject southern exceptionalism and stress suburban, class-inflected politics: "demographic change played a more important role than racial demagoguery," Lassiter and Kruse write. Lisa McGirr's *Suburban Warriors* found a prototype in Orange County, California, built not by marginal people but by affluent, educated suburbanites, defence workers and evangelicals; one critic notes she did not press them on their dependence on federal defence spending. The Moral Majority, founded in 1979, grew partly from anger at the IRS's moves against segregated Christian academies. In 1980 Reagan spoke near Philadelphia, Mississippi, where three civil rights workers had been murdered in 1964: "I believe in states' rights." His economics belong to The Neoliberal Age.

```checkpoint
q: What did Lisa McGirr argue about the origins of the New Right?
a: That it was built mainly by marginal people left behind by modern life.
x: McGirr argued the opposite: her suburban activists were affluent and educated.
a*: That it was built from the bottom up by affluent, educated suburbanites, as in Orange County, California.
a: That it was created entirely by Nixon's campaign strategists.
x: Hers is a grassroots account, not a top-down one.
a: That it was driven mainly by the Moral Majority after 1979.
x: Her subject is the grassroots milieu of Orange County, which she treats as a prototype of the new right.
hint: Think of the title Suburban Warriors.
why: McGirr shifted attention from Washington to grassroots suburban activism.
---
q: What did the Hart–Celler Act of 1965 change?
a: It created national-origins quotas favouring northern and western Europeans.
x: Those quotas came from the Immigration Act of 1924; Hart–Celler abolished them.
a: It banned immigration from Asia.
x: The 1924 Act banned Asian immigration; after 1965 immigration from Asia rose sharply.
a: It ended the Bracero Program.
x: The Bracero Program ended in 1964; Hart–Celler dealt with the quota system.
a*: It abolished the national-origins quotas, and immigration from Asia and Africa rose sharply afterwards.
hint: Johnson called it "not a revolutionary bill".
why: A law presented as modest reshaped who came to the United States.
```

## Rust Belt and Prison Nation

As the Sun Belt boomed, the Great Lakes heartland became the **Rust Belt**. On "Black Monday", 19 September 1977, Youngstown Sheet and Tube closed its Campbell Works and furloughed 5,000 workers. Cleveland, Detroit, Buffalo and Pittsburgh lost about 45 per cent of their population between 1970 and 2006. In 1982 the Chinese American draftsman Vincent Chin was beaten to death in Highland Park, a city within Detroit, by a Chrysler supervisor and his laid-off stepson, who got probation and a fine; the case galvanised Asian American activism.

Incarceration soared. Nixon called drug abuse "public enemy number one" in 1971, and Reagan signed the drug laws discussed in History and Drugs. The number held in American jails and prisons rose from 328,020 in 1970 to 1,148,702 in 1990 and about 2.3 million at its peak around 2008–09. The 1994 crime act, whose Senate version Joe Biden drafted, funded 100,000 police and \$9.7 billion for prisons, though crime was already falling. Michelle Alexander's *The New Jim Crow* (2010) calls the result a "racial caste" system driven by the drug war; Elizabeth Hinton traces it to Johnson's war on crime. James Forman Jr. says Alexander obscures African American support for tougher laws; John Pfaff shows that most prisoners are held for violent crimes in state and county systems; and Michael Javen Fortner argues that Black Harlem activists helped build support for the 1973 Rockefeller drug laws, though reviewers dispute his evidence.

## The 1990s and After

After the acquittal of the officers who beat Rodney King, Los Angeles burned from 29 April to 3 May 1992: 55 people died (63 counting eight unrelated deaths), and Koreatown was disproportionately hit. NAFTA took effect in 1994; that year Newt Gingrich's "Contract with America" gave Republicans the House for the first time in 40 years. In 1996 Bill Clinton signed welfare reform to "end welfare as we know it"; and Clinton was impeached in December 1998 and acquitted in February 1999.

The century ended on the questions it began with: who belonged, and whether the freedom movements' gains would hold; some were later undone, in *Shelby County* and *Dobbs*. Whether the "American century" was a triumph, a short episode or a misnomer, migrants, strikers, marchers and voters made it as much as presidents did.

## Further exploration

- **Isabel Wilkerson, *The Warmth of Other Suns: The Epic Story of America's Great Migration* (2010).** The Great Migration told through three migrants' lives.
- **Mae M. Ngai, *Impossible Subjects: Illegal Aliens and the Making of Modern America* (2004).** How the 1924 quotas and border policing created the "illegal alien", with Asian and Mexican migrants at the centre.
- **Ira Katznelson, *When Affirmative Action Was White: An Untold History of Racial Inequality in Twentieth-Century America* (2005).** How New Deal programmes and the GI Bill favoured white Americans.
- **Richard Rothstein, *The Color of Law: A Forgotten History of How Our Government Segregated America* (2017).** Housing segregation as the work of government.
- **Lisa McGirr, *Suburban Warriors: The Origins of the New American Right* (2001).** A grassroots history of Orange County conservatism.
- **Peniel E. Joseph, *Waiting 'Til the Midnight Hour: A Narrative History of Black Power in America* (2006).** Black Power taken seriously as a movement.
- **Elizabeth Hinton, *From the War on Poverty to the War on Crime: The Making of Mass Incarceration in America* (2016).** The carceral state's roots in the 1960s.$mn_modamerica_master$,
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
  select $mn_modamerica_quiz$[
    {"type": "mcq", "prompt": "Why is the peak unemployment rate of the Great Depression given as an estimate?", "options": ["Because the government did not calculate unemployment rates in the 1930s, so historians reconstruct them, with Lebergott at 24.9% (1933) and Darby at 22.5% (1932)", "Because all records were destroyed in the 1929 crash", "Because unemployment rose steadily every year until 1941", "Because Roosevelt banned the publication of economic statistics"], "answerIndex": 0, "explanation": "Lebergott's widely accepted series peaks at 24.9% in 1933; Darby, counting relief workers as employed, puts the peak at 22.5% in 1932.", "id": "q1"},
    {"type": "mcq", "prompt": "What did the Immigration Act of 1924 do?", "options": ["It abolished national-origins quotas", "It created the Bracero Program", "It banned immigration from Asia, set national-origins quotas favouring northern and western Europeans, and created the Border Patrol", "It granted citizenship to all immigrants already in the country"], "answerIndex": 2, "explanation": "The quotas were based first on the 1890 census and from 1929 on national origins; the quota system lasted until the Hart–Celler Act of 1965.", "id": "q2"},
    {"type": "mcq", "prompt": "How do official figures for 'Operation Wetback' (1954) compare?", "options": ["The INS and DHS figures agree on about 1.2 million removals", "No records of the operation survive", "DHS statistics show far more expulsions than the INS claimed", "The INS claimed 1.1–1.3 million expulsions, but DHS statistics show 17,695 removals and 232,769 returns in fiscal year 1955"], "answerIndex": 3, "explanation": "The headline figure is an official claim, not a count.", "id": "q3"},
    {"type": "mcq", "prompt": "What happened in 2021 in the case of the assassination of Malcolm X?", "options": ["The case was closed for lack of evidence", "Two of the three men convicted, Muhammad Abdul Aziz and Khalil Islam, were exonerated after a review found the FBI and NYPD had withheld evidence", "A fourth man confessed", "The Nation of Islam was found responsible in a civil suit"], "answerIndex": 1, "explanation": "The review found that evidence had been withheld by the FBI and the New York police.", "id": "q4"},
    {"type": "open", "prompt": "Did the New Deal and the GI Bill widen or narrow racial inequality in the United States? Use the historians' debate.", "rubric": "A strong answer explains the Social Security and Wagner Act exclusions of agricultural and domestic workers (65% of Black workers excluded at first, 27% of white), Katznelson's argument that southern Democrats designed programmes and local administration to accommodate Jim Crow, DeWitt's administrative explanation and Morgenthau's worries about collecting the tax, and Turner and Bound's finding that the GI Bill helped Black men outside the South but widened the gap in the South; it may add HOLC and FHA housing policy and the Rothstein–Fishback debate.", "id": "q5"},
    {"type": "open", "prompt": "Assess Michelle Alexander's argument that mass incarceration is a 'New Jim Crow'.", "rubric": "A strong answer sets out Alexander's claim of a racial caste system driven by the drug war, uses the growth in incarceration (328,020 in 1970 to about 2.3 million around 2008–09) and laws such as the 1973 Rockefeller laws and the 1994 crime act, notes the crime drop from the early 1990s, and weighs Hinton's longer chronology from Johnson's war on crime against the critiques of Forman (African American support for tougher laws), Pfaff (most prisoners held for violent crimes in state systems) and Fortner (Black support for the Rockefeller drug laws, with his evidence disputed).", "id": "q6"}
  ]$mn_modamerica_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/regional-histories/americas/modern-american-history-the-united-states-in-the-twentieth-century', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

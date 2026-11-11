-- Technological Advancements and the Digital Age — canonical master article, co-written and human-reviewed.
-- history/contemporary-history/technological-advancements-and-the-digital-age @ research/advanced/read.
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
    'history/contemporary-history/technological-advancements-and-the-digital-age',
    'research',
    'advanced',
    'read',
    $mn_digital_master$> **How the digital revolution remade the world.** In 1945 the most advanced calculating machines filled whole rooms and were operated largely by women whose names went unrecorded. Eighty years later about three-quarters of humanity is online. This chapter follows the transformation from Bletchley Park and ENIAC through the chip, the internet and the smartphone to the platform giants, the biotechnology revolution and artificial intelligence. It is told globally, from Kyiv and Santiago to Hsinchu, Mumbai, Nairobi and Kolwezi, and it ends with the debates that define the age: privacy, misinformation, automation and work, and who governs these technologies.

## War, Secrecy and the First Computers

As the overview of the twentieth century notes, the computer was born in war. One starting point was "On Computable Numbers", a paper by the English mathematician **Alan Turing** delivered for publication on 28 May 1936. At **Bletchley Park**, Britain's code-breaking centre, Turing helped specify the "bombe", a machine for attacking the German Enigma cipher that improved on a Polish design: in July 1939 the Polish Cipher Bureau had given the British and French the Enigma rotor wiring and its own decryption methods.

To break another German cipher, the Lorenz, the Post Office engineer **Tommy Flowers**, working from plans by Max Newman, designed **Colossus**, working by December 1943; ten were in use by the war's end. It was programmable, electronic and digital, but built for one purpose, and it stayed secret until the mid-1970s. In January 1945 Bletchley and its outstations employed 8,995 people, about three-quarters of them women; Wrens of the Women's Royal Naval Service operated Colossus.

In the United States, John Mauchly and J. Presper Eckert at the University of Pennsylvania built **ENIAC** to calculate artillery tables for the Army. Completed in 1945, it is usually called the first programmable, electronic, *general-purpose* digital computer, with about 17,000–18,000 vacuum tubes. Its first practical job, in December 1945, was a feasibility study for the hydrogen bomb; the press called it a "Giant Brain". At Manchester, Frederic Williams, Tom Kilburn and Geoff Tootill built the **Manchester Baby**, the first electronic stored-program computer, which ran its first program on 21 June 1948.

{{image: ENIAC | ENIAC at the University of Pennsylvania, the room-sized machine completed in 1945.}}

Which was "the first computer"? It depends on the definition: Colossus was the first programmable electronic digital machine, ENIAC the first general-purpose one, the Baby the first to store its program. Wartime secrecy helped make the story an American one for decades.

The British catering firm J. Lyons and Co. built **LEO I**, the first computer used for business, which ran its first job, "Bakery Valuations", in September 1951. Near Kyiv, a team under **Sergei Lebedev** built **MESM**, the first universally programmable electronic computer in the USSR, which made its first useful calculations on 4 January 1951.

## The Women Who Programmed

The Moore School had hired at least 200 women as human "computers", and six, Kay McNulty, Betty Jennings, Betty Snyder, Marlyn Wescoff, Fran Bilas and Ruth Lichterman, became ENIAC's primary programmers; they were long unrecognised, honoured only late in life or after death. **Grace Hopper**, later a US Navy rear admiral, built what she called a compiler by 1952, and her FLOW-MATIC language strongly influenced COBOL. **Katherine Johnson**, a Black mathematician at NACA and then NASA, calculated trajectories for Alan Shepard's flight and, at John Glenn's request, checked the electronic computer's orbital figures for his Friendship 7 flight.

The historian Mar Hicks writes that "women were the largest trained technical workforce of the computing industry during the second world war and through to the mid-sixties". Hicks and Janet Abbate argue that as computing gained prestige, women were pushed out and written out. In Britain, Stephanie Shirley founded a firm of women programmers working from home, signing her letters "Steve" to win clients.

## From Transistor to Microprocessor

ENIAC's tubes were replaced by a device from Bell Labs, where John Bardeen and Walter Brattain invented the point-contact **transistor** in late 1947 and William Shockley the junction transistor in 1948; the three shared the 1956 Nobel Prize in Physics. Its silicon MOS form, developed by Mohamed Atalla and Dawon Kahng in 1959–60, is the most numerously produced artificial object in history. In Japan, Sony's TR-63 of 1957 was the first transistor radio to sell in the millions.

Jack Kilby of Texas Instruments demonstrated a hybrid prototype **integrated circuit** in September 1958; Robert Noyce of Fairchild Semiconductor devised the monolithic chip, using Jean Hoerni's planar process, and the first working one on his design was made in 1960. Modern chips descend from Noyce's design, but the Nobel went to Kilby in 2000, and the press of the 1960s had named four inventors, Kilby, Lehovec, Noyce and Hoerni, before memory shortened the list to two.

In 1965 Gordon Moore observed that the number of components on a chip was doubling every year, revising this in 1975 to every two years. This became **Moore's Law**, though Moore was modest about it:

```quote
I just did a wild extrapolation saying it's going to continue to double every year for the next 10 years.
Gordon Moore · interview on his 1965 article · 2015
```

Progress has slowed since around 2010. An early landmark was the **Intel 4004** microprocessor of November 1971, with about 2,300 transistors; it began as a commission from the Japanese calculator firm Busicom.

## Chips and East Asia

Taiwan's semiconductor industry began in 1974, under Chiang Ching-kuo's direction; in 1976 the government persuaded the American firm RCA to transfer technology. In 1987 **Morris Chang**, born in Ningbo in 1931 and formerly at Texas Instruments, founded **TSMC**, the world's first dedicated chip foundry, as a joint venture of the government, its research institute ITRI, private investors and Philips. By TrendForce's count it took about 70 per cent of contract-foundry revenue in 2025, though broader measures of the chip-making market give it far less. In South Korea, **Samsung Electronics**, founded in 1969, was for decades the world's largest memory-chip maker. On 7 October 2022 the United States imposed export controls restricting China's access to advanced chips and chip-making equipment, a contest traced in Chris Miller's *Chip War*.

## Networks: From ARPANET to the Web

In the early 1960s Paul Baran at RAND studied networks that could survive partial destruction, and in 1965 Donald Davies at Britain's National Physical Laboratory independently arrived at **packet switching**. Bob Taylor initiated the **ARPANET** in 1966, and its manager Larry Roberts incorporated Davies's design. Its builders denied the popular myth that it was meant to survive nuclear war; its purpose was sharing computing resources. On 29 October 1969 a UCLA student, Charley Kline, tried to log in to a computer at SRI; the system crashed after two letters, so the first message was "lo". France's CYCLADES network, led by Louis Pouzin, pioneered the end-to-end design that influenced the TCP/IP protocols published by Vint Cerf and Bob Kahn in 1974; ARPANET adopted them on 1 January 1983.

Others imagined networks for planning. In the Soviet Union, Viktor Glushkov proposed in 1962 **OGAS**, a national computer network to run the economy with up to 20,000 terminals; it was denied funding in 1970. In Allende's Chile, whose overthrow is told in the chapter on Latin America in the Cold War, the British cybernetician Stafford Beer, with a Chilean team led by Fernando Flores, built **Project Cybersyn** from 1971 to coordinate the nationalised economy. Its telex network helped coordinate about 200 trucks during the employers' and truckers' strike of October 1972, and by May 1973, according to the historian Eden Medina, 26.7 per cent of nationalised industries were linked to some degree. After the coup of 11 September 1973 the military destroyed its operations room.

At CERN, **Tim Berners-Lee** proposed the **World Wide Web** in March 1989. It opened to the whole internet on 23 August 1991, and on 30 April 1993 CERN made its code royalty-free. The graphical browser Mosaic, released that January, made it popular. At the London Olympics of 2012 Berners-Lee tweeted: "This is for everyone."

```checkpoint
q: Which statement best describes the debate over "the first computer"?
a*: It depends on the definition: Colossus was the first programmable electronic digital machine, ENIAC the first general-purpose one, and the Manchester Baby the first electronic stored-program computer.
a: ENIAC was the first computer of any kind, and no other machine has a claim.
x: Colossus was working earlier, by December 1943, though it was special-purpose and secret.
a: The Manchester Baby came first because it was built in 1943.
x: The Baby ran its first program on 21 June 1948.
a: Colossus was the first computer and was celebrated publicly from 1945.
x: Colossus stayed secret until the mid-1970s, which helped make the story an American one.
hint: Think about what "first" means: programmable, general-purpose, or stored-program.
why: Each machine was first by a different definition, and wartime secrecy shaped which one became famous.
---
q: What was Project Cybersyn?
a: The Soviet national computer network proposed by Viktor Glushkov.
x: That was OGAS, which was denied funding in 1970.
a: The first ARPANET connection, between UCLA and SRI.
x: That connection took place on 29 October 1969 in the United States.
a*: A system built in Allende's Chile, with Stafford Beer, to coordinate the nationalised economy, abandoned after the 1973 coup.
a: CERN's project to build the World Wide Web.
x: The Web was proposed by Tim Berners-Lee at CERN in 1989.
hint: Think of Chile in 1971–73.
why: Cybersyn shows that computer networks were imagined for socialist planning as well as for research and commerce.
```

## Computers in Every Pocket

The computer became personal in the 1970s. The Altair 8800 is widely seen as the first commercially successful personal computer; and in August 1981 IBM released its PC, with an open architecture and Microsoft's MS-DOS. In April 1973 Martin Cooper of Motorola made the first public call from a handheld mobile phone, on a Manhattan pavement. The iPhone (2007) and Android, the best-selling operating system on all devices since 2013, made the phone a pocket computer, and mobile subscriptions exceeded 9.1 billion by 2024.

In Kenya, Safaricom and Vodafone launched the mobile-money service **M-Pesa** in March 2007; it has since spread to Tanzania, Ghana, Egypt, Ethiopia and elsewhere. Its effect is debated. Suri and Jack estimated in 2016 that it lifted 194,000 Kenyan households, about 2 per cent, out of poverty, a figure widely cited by development institutions; Milford Bateman and colleagues replied in 2019 that the study was so flawed it helped create "a largely false narrative" about fintech.

India built a software economy. Its IT industry was born in Mumbai in the late 1960s with Tata Consultancy Services (founded 1968), which began exporting software through a 1977 partnership with Burroughs; Infosys was founded in Pune in 1981 by seven engineers. The sector grew from 1.2 per cent of GDP in 1998 to 7 per cent in 2019.

## Platforms, Attention and Surveillance

The twenty-first century belonged to platforms. Amazon (1994), Google (1998) and Facebook (2004) joined Microsoft and Apple as "Big Tech", together nearly a quarter of the S&P 500 in 2020, while Baidu, Alibaba, Tencent and Xiaomi became their Chinese counterparts. Much of this wealth rests on advertising: about 73 per cent of the revenue of Google's parent, Alphabet, in 2025. In 1971 the economist Herbert Simon had warned that "a wealth of information creates a poverty of attention", the root of the idea of an "attention economy".

China built a separate internet. The phrase "Great Firewall of China" was first used in print in 1997 by the Australian sinologist Geremie Barmé, and the Golden Shield surveillance and censorship project, launched in 1998, was operating from 2003. Inside it grew Alibaba, founded in Hangzhou in 1999, and Tencent's WeChat (2011), a "super-app" for messaging and payments that censors politically sensitive topics. In November 2020 Chinese regulators, reportedly on Xi Jinping's orders, halted the stock-market listing of Ant Group.

How should these firms be understood? In *The Age of Surveillance Capitalism* (2019), **Shoshana Zuboff** argues that Google and Facebook invented a new logic of accumulation, turning behavioural data into "prediction products". **Cory Doctorow** replied in 2020 that this credits Big Tech with a "mind control" it lacks, and that the real problem is monopoly; **Evgeny Morozov** also criticised her. The dispute bears on the **Cambridge Analytica** scandal of 2018, when the whistleblower Christopher Wylie revealed that an app had harvested data from up to 87 million Facebook profiles, later used in the 2016 Cruz and Trump campaigns. Facebook was fined \$5 billion in the United States, yet Britain's investigation found that Cambridge Analytica had no role in the Brexit referendum "beyond some initial enquiries", feeding doubts about how effective it really was.

## The Hidden Costs

The digital world rests on hidden labour. Content moderation is largely outsourced to low-wage countries; outsourced moderators for Meta in Kenya and Ghana reported mental illness and self-harm, and on 1 May 2023 some 150 moderators working for contractors of Meta, ByteDance and OpenAI founded the first African Content Moderators Union in Nairobi. Kenyan workers employed through the contractor Sama labelled violent and sexual-abuse content for \$1.32–\$2 an hour to build ChatGPT's safety filters, the kind of hidden labour Mary Gray and Siddharth Suri call "ghost work".

It rests, too, on minerals. The Democratic Republic of the Congo supplied about three-quarters of the world's cobalt in 2024, on a US Geological Survey estimate, a metal key to the lithium-ion batteries in phones and electric cars; artisanal mining is dangerous and child labour is widespread. At the other end lies e-waste. The Basel Action Network called Agbogbloshie in Accra, Ghana, a "digital dumping ground", but its widely cited claims that most imports were waste lacked peer-reviewed evidence, a US government study found little sign of unprocessed American e-waste shipped to Africa, and part of the trade was in second-hand electronics. Burning scrap for metals remains a serious health hazard.

And the digital world is unequal. The International Telecommunication Union counted about 6 billion people, 74 per cent of humanity, online in 2025, but 2.2 billion offline, 96 per cent of them in low- and middle-income countries; 94 per cent of people in high-income countries use the internet, against 23 per cent in low-income ones.

## The Biotech Revolution

The digital age was also an age of biology. On 2 May 1952 Raymond Gosling, the PhD student of **Rosalind Franklin** at King's College London, took Photo 51, an X-ray image of DNA; Maurice Wilkins showed it to James Watson without their permission. Watson and Crick's double helix appeared in *Nature* in 1953 beside papers by Franklin and Gosling and by Wilkins's group. Franklin died in 1958, aged 37; the 1962 Nobel went to Crick, Watson and Wilkins. She has long been remembered as a wronged heroine; in 2023 the historians Matthew Cobb and Nathaniel Comfort used a 1953 letter and an unpublished news article to argue that she was instead "an equal member of a quartet who solved the double helix", though the question of credit remains contested.

The Human Genome Project, launched in 1990, joined centres in six countries, including China and Japan. A working draft was announced in 2000 and published in February 2001; the project was declared complete in April 2003, covering about 92 per cent of the genome, and a nearly complete gapless sequence came only in 2022.

In 2012 **Jennifer Doudna** and **Emmanuelle Charpentier** proposed CRISPR-Cas9 as a programmable tool for editing genomes, and shared the 2020 Nobel Prize in Chemistry. Credit is again disputed: the Lithuanian Virginijus Šikšnys, who shared the Kavli Prize for the same discovery, was left out of the Nobel, and the Broad Institute, where Feng Zhang worked, won key US patents. The first CRISPR therapy, for sickle-cell disease, was approved in Britain in 2023. The dangers became plain in November 2018, when **He Jiankui** of SUSTech in Shenzhen announced the birth of twin girls whose genes he had edited; a court sentenced him to three years in prison, and China has since criminalised illegal human gene editing.

COVID-19 showed the new biology's speed. **Katalin Karikó**, who left Hungary in 1985 with £900 hidden in a teddy bear and was later demoted by the University of Pennsylvania, published studies with **Drew Weissman** from 2005 showing that nucleoside-modified mRNA avoids triggering immune reactions; their 2023 Nobel Prize honoured discoveries that "enabled the development of effective mRNA vaccines against COVID-19". The vaccine of BioNTech, co-founded in Mainz by Uğur Şahin and Özlem Türeci, with Pfizer, was the first COVID-19 vaccine authorised by a stringent regulator, in Britain in December 2020. But vaccines were shared unequally: the global scheme COVAX suffered shortages blamed on richer nations' "vaccine nationalism" and on India's diversion of 400 million doses made by the Serum Institute of India.

## Artificial Intelligence

The term "artificial intelligence" is credited to a 1955 proposal for a workshop at Dartmouth College the following summer, by John McCarthy, Marvin Minsky, Nathaniel Rochester and Claude Shannon:

```quote
every aspect of learning or any other feature of intelligence can in principle be so precisely described that a machine can be made to simulate it.
John McCarthy, Marvin Minsky, Nathaniel Rochester and Claude Shannon · Proposal for the Dartmouth Summer Research Project on Artificial Intelligence · 1955
```

Early **symbolic AI** wrote intelligence down as rules; the Logic Theorist of 1955–56 proved 38 theorems from *Principia Mathematica*. Funding collapsed in two "AI winters", roughly 1974–1980 and 1987–2000, after critical reports such as Britain's Lighthill report (1973) and the unmet goals of Japan's Fifth Generation project.

A rival approach, learning from data with networks of artificial neurons, had international roots: Ivakhnenko and Lapa in the Soviet Union (1965), Shun'ichi Amari and Kunihiko Fukushima in Japan, and Seppo Linnainmaa in Finland, whose 1970 work gave backpropagation its modern form, popularised by Rumelhart, Hinton and Williams in 1986. In October 2012 the network AlexNet won the ImageNet image-recognition contest by a wide margin. Bengio, Hinton and LeCun received the 2018 Turing Award, though a credit debate points to the earlier Soviet, Japanese and Finnish work. In 2016 the program AlphaGo beat the Go champion Lee Sedol in Seoul, and in 2024 Nobel Prizes went to Hinton and John Hopfield in physics and, for protein-structure work, to Demis Hassabis, John Jumper and David Baker in chemistry.

In 2017 eight Google researchers introduced the **transformer** architecture in "Attention Is All You Need", and **large language models** followed. ChatGPT, released on 30 November 2022, reportedly reached 100 million users in two months; in January 2025 China's DeepSeek released an open-weight model reported to perform comparably at much lower cost. Such systems "hallucinate", confidently asserting unjustified claims, and whether they understand anything is disputed. In 2021 Emily Bender, Timnit Gebru and colleagues called them "stochastic parrots"; Google had asked for the paper's retraction, leading to Gebru's contested departure. They also consume power: the International Energy Agency estimated that data centres used about 1.5 per cent of the world's electricity in 2024, and projected that their use could more than double by 2030, with large uncertainty.

```checkpoint
q: Why is the credit for CRISPR gene editing disputed?
a: Because the technique was invented by He Jiankui in 2018.
x: He Jiankui used gene editing on embryos and was imprisoned; he did not invent CRISPR.
a*: Because Doudna and Charpentier won the Nobel, but Virginijus Šikšnys was left out and the Broad Institute won key US patents.
a: Because no Nobel Prize has ever been awarded for it.
x: Doudna and Charpentier shared the 2020 Nobel Prize in Chemistry.
a: Because Rosalind Franklin's Photo 51 first revealed it.
x: Photo 51 (1952) was an X-ray image of DNA, decades before CRISPR editing.
hint: Think of a Nobel Prize, another prize, and a patent fight.
why: As with the integrated circuit and deep learning, prizes and patents simplify work done by several people in several countries.
---
q: What did Emily Bender, Timnit Gebru and colleagues mean by calling large language models "stochastic parrots"?
a: That the models are trained on recordings of birdsong.
x: The phrase is a metaphor, not a description of training data.
a: That the models are certain to replace all human jobs.
x: The paper concerned language and understanding, not job-loss estimates.
a: That the models were invented at Dartmouth in 1956.
x: Dartmouth gave AI its name; large language models rest on the transformer of 2017.
a*: That the models produce plausible language without genuine understanding.
hint: Think of a bird that repeats words.
why: The phrase anchors a live debate over whether these systems understand anything.
```

## The Debates of the Age

**Privacy.** In June 2013 documents leaked by **Edward Snowden**, an NSA contractor, revealed surveillance programmes such as PRISM; in 2020 a US appeals court ruled the bulk phone-records programme he exposed illegal and possibly unconstitutional. The European Union's **General Data Protection Regulation**, in force from 25 May 2018, allows fines of up to 4 per cent of worldwide turnover and became a model for laws in Brazil, Japan, South Africa and elsewhere; Meta was fined €1.2 billion under it for unlawful data transfers.

**Misinformation.** The gravest charge concerns Myanmar, where only about 1 per cent of people had internet access before 2015, and Facebook then had just two Burmese-speaking employees monitoring content. In the military's campaign against the Rohingya from 25 August 2017, at least 6,700 people were killed in the first month and over 700,000 fled to Bangladesh. In 2018 the head of a UN fact-finding mission said that social media, which in Myanmar effectively meant Facebook, had played a "determining role", and the company conceded that "we weren't doing enough to help prevent our platform from being used to foment division and incite offline violence". Some see platforms as passive conduits, but Amnesty International argued in 2022 that engagement-driven algorithms "proactively amplified" anti-Rohingya content and that Meta owes reparations.

**Automation and work.** In the 1930s Keynes called technological unemployment "only a temporary phase of maladjustment". In 2013 Carl Benedikt Frey and Michael Osborne estimated that 47 per cent of US jobs were at high risk of automation; a 2016 OECD study, assessing tasks rather than whole occupations, found 9 per cent across 21 countries and warned that low-skilled workers would bear the costs. Daron Acemoglu and Simon Johnson argue in *Power and Progress* (2023) that technology's gains depend on whether it creates new tasks and on workers' countervailing power; critics question their mechanism and examples.

**Who governs?** The European Union regulates: its Digital Services Act came into force in November 2022, and its **AI Act**, in force from 1 August 2024, sorts AI by risk, banning practices such as social scoring from 2 February 2025 and applying rules to general-purpose AI from 2 August 2025. But a "Digital Omnibus on AI", in force from 27 July 2026, postponed obligations for high-risk systems to December 2027 and August 2028. The United States relies more on antitrust courts: in August 2024 a judge ruled that Google held an illegal monopoly in search, though in September 2025 he declined to order it to sell Chrome or Android. China exercises direct state control. And over all three hangs a rivalry over chips concentrated in Taiwan and contested through export controls.

The digital revolution was built by Polish cryptanalysts and British Wrens, Soviet engineers and Chilean planners, Taiwanese foundries, Indian programmers, Kenyan moderators and Congolese miners, as well as by famous names in California. Who shares its benefits, and who decides, remain open questions.

## Further exploration

- **Mar Hicks, *Programmed Inequality: How Britain Discarded Women Technologists and Lost Its Edge in Computing* (2017).** How Britain's computing industry pushed out its women workforce.
- **Eden Medina, *Cybernetic Revolutionaries: Technology and Politics in Allende's Chile* (2011).** The history of Project Cybersyn.
- **Chris Miller, *Chip War: The Fight for the World's Most Critical Technology* (2022).** The semiconductor industry from Silicon Valley to Taiwan, Korea and China.
- **Shoshana Zuboff, *The Age of Surveillance Capitalism: The Fight for a Human Future at the New Frontier of Power* (2019).** An influential critique of data extraction.
- **Kate Crawford, *Atlas of AI: Power, Politics, and the Planetary Costs of Artificial Intelligence* (2021).** AI's mines, labour and data.
- **Mary L. Gray and Siddharth Suri, *Ghost Work: How to Stop Silicon Valley from Building a New Global Underclass* (2019).** The hidden human labour behind "automated" services.
- **Daron Acemoglu and Simon Johnson, *Power and Progress: Our Thousand-Year Struggle Over Technology and Prosperity* (2023).** Why technology's benefits depend on who holds power.$mn_digital_master$,
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
  select $mn_digital_quiz$[
    {"type": "mcq", "prompt": "What were the first characters ever transmitted over the ARPANET, on 29 October 1969?", "options": ["\"lo\", because the system crashed after two letters of \"login\"", "\"hello\"", "\"This is for everyone\"", "\"Giant Brain\""], "answerIndex": 0, "explanation": "A UCLA student, Charley Kline, tried to log in to a computer at SRI; the system crashed after two letters.", "id": "q1"},
    {"type": "mcq", "prompt": "Who founded TSMC, the world's first dedicated semiconductor foundry, in 1987?", "options": ["Gordon Moore", "Robert Noyce", "Morris Chang", "Jack Kilby"], "answerIndex": 2, "explanation": "Morris Chang, born in Ningbo in 1931 and formerly at Texas Instruments, founded TSMC as a joint venture of the Taiwanese government, ITRI, private investors and Philips.", "id": "q2"},
    {"type": "mcq", "prompt": "What did the 2016 OECD study by Arntz, Gregory and Zierahn find about automation, compared with Frey and Osborne's 2013 estimate?", "options": ["That 47 per cent of US jobs were at high risk", "That 54 per cent of EU jobs were at high risk", "That no jobs could be automated", "That assessing tasks rather than whole occupations, about 9 per cent of jobs across 21 OECD countries were automatable"], "answerIndex": 3, "explanation": "Frey and Osborne estimated 47 per cent of US jobs at high risk; the OECD's task-based method gave 9 per cent and warned that low-skilled workers would bear the adjustment costs.", "id": "q3"},
    {"type": "mcq", "prompt": "What did Katalin Karikó and Drew Weissman show in studies published from 2005?", "options": ["That DNA has a double-helix structure", "That nucleoside-modified mRNA avoids triggering immune reactions", "That CRISPR-Cas9 can edit genomes", "That the human genome contains about 92 per cent of its sequence"], "answerIndex": 1, "explanation": "Their 2023 Nobel Prize honoured discoveries that enabled effective mRNA vaccines against COVID-19.", "id": "q4"},
    {"type": "open", "prompt": "Who should get the credit for the key inventions of the digital and biotech age? Discuss using at least two examples.", "rubric": "A strong answer uses examples such as 'the first computer' (Colossus as the first programmable electronic digital machine, secret until the mid-1970s; ENIAC as the first general-purpose one; the Manchester Baby as the first stored-program one); the integrated circuit (Kilby's 1958 hybrid prototype vs Noyce's monolithic chip using Hoerni's planar process; the 1960s press naming four inventors including Lehovec); deep learning (Ivakhnenko and Lapa, Amari, Fukushima, Linnainmaa vs the 2018 Turing laureates); CRISPR (Doudna and Charpentier's Nobel, Šikšnys left out, the Broad Institute's patents); Rosalind Franklin (wronged heroine vs Cobb and Comfort's 'equal member of a quartet'); and the women of ENIAC and Bletchley written out of the story (Hicks, Abbate). It explains how secrecy, prizes, patents and prestige shape memory.", "id": "q5"},
    {"type": "open", "prompt": "Assess the debates over the power of digital platforms, drawing on at least two cases.", "rubric": "A strong answer contrasts Zuboff's 'surveillance capitalism' (behavioural data turned into prediction products) with Doctorow's view that the real problem is monopoly, not 'mind control', and notes Morozov's critique; uses Cambridge Analytica (87 million profiles, the $5 billion fine, doubts about its effectiveness since the UK found no significant Brexit role); Myanmar (the UN's 'determining role', Facebook's 2018 admission, Amnesty's 2022 argument that algorithms 'proactively amplified' hate); and compares ways of governing platforms: EU regulation (GDPR, DSA, AI Act and its 2026 postponement), US antitrust (the 2024 Google ruling and 2025 remedies), and Chinese state control (Great Firewall, the 2020 Ant Group IPO block). It may mention hidden labour (content moderators, Sama) and the digital divide.", "id": "q6"}
  ]$mn_digital_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/contemporary-history/technological-advancements-and-the-digital-age', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

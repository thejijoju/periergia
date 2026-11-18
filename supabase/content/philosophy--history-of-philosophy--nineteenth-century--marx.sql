-- Marx — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/nineteenth-century/marx @ research/advanced/read.
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
    'philosophy/history-of-philosophy/nineteenth-century/marx',
    'research',
    'advanced',
    'read',
    $marx_master$> **Karl Marx (1818–1883) set out to explain why a society of unprecedented wealth left so many people poor, powerless and estranged from their own lives, and to show how it might be changed.** This chapter follows his path from the Young Hegelians to *Capital* and his partnership with Engels; his ideas of alienation, historical materialism, ideology, class struggle and exploitation; his sketches of communism; and his late writings on India and Russia. Three arguments are set out step by step, with objections and replies. It ends with the hardest problem: separating Marx from the Marxisms built in his name.

## From Trier to London

Karl Marx was born on 5 May 1818 in Trier, in the Kingdom of Prussia. His father, a lawyer and Enlightenment liberal, came from a line of Trier rabbis; the family had converted, and Karl was baptised a Lutheran in 1824. He studied law at Bonn and from 1836 at Berlin, where he joined the "Doctors' Club" and, through it, the **Young Hegelians**, the radical followers of Hegel around Bruno Bauer, whose quarrels over religion are described in *German Idealism: Fichte, Schelling and Hegel*. With a doctorate on Democritus and Epicurus (Jena, 1841), Marx was, in the Stanford Encyclopedia of Philosophy's (SEP's) words, "trained academically as a philosopher".

Official hostility to the Young Hegelians closed the universities to him, and he turned to journalism, editing the *Rheinische Zeitung* in Cologne until 1843. In June 1843 he married Jenny von Westphalen. In Paris, on 28 August 1844, he met Friedrich Engels at the Café de la Régence. Expelled from France, he moved to Brussels in 1845. In 1848–49 he edited the *Neue Rheinische Zeitung* in Cologne until he was ordered out of Prussia, and in 1849 he settled in London for the rest of his life.

The London years were poor. Marx was European correspondent of the *New-York Daily Tribune* from 1852 to 1862 (Engels wrote many of "his" articles), sat on the General Council of the International Workingmen's Association from 1864, and defended the Paris Commune in *The Civil War in France* (1871). His daughter Eleanor (1855–1898) became a socialist activist and translator of his work. Volume 1 of *Capital* appeared in 1867; its first 1,000 copies took four years to sell. Jenny died in 1881, and Marx on 14 March 1883. Speaking at his grave in Highgate Cemetery, Engels said that "the greatest living thinker ceased to think".

## The Partnership with Engels

Friedrich Engels (1820–1895), son of a Barmen textile manufacturer, was at first "the more well-established figure" among German radicals. In 1842 he attacked Schelling's Berlin lectures in anonymous pamphlets (there is no good evidence that Marx heard them; see *Schopenhauer and Kierkegaard*). His "Outlines of a Critique of Political Economy" (1844) "made a strong impression on Marx" and is usually seen as having turned him towards economics; *The Condition of the Working Class in England* (1845), written after a stay in Salford and Manchester (see *The Industrial Revolution*), is "still widely regarded as Engels's masterpiece".

Together they wrote *The Holy Family* (1845), *The German Ideology* (1845–46) and the *Manifesto of the Communist Party* (1848). From 1850 Engels worked for two decades in the family firm in Manchester to support Marx. He called their arrangement a "division of labour" (Marx on the critique of political economy, Engels writing for wider audiences) and said he played "second fiddle" willingly. Yet his books shaped how the world read Marx: *Anti-Dühring* (1878), whose excerpt *Socialism: Utopian and Scientific* was for decades the most influential popular introduction; *Ludwig Feuerbach* (1886); and his editions of the second and third volumes of *Capital* (1885 and 1894).

## Alienation

Marx started from Feuerbach's *The Essence of Christianity* (1841): humans invent God in their own image and project their powers onto him, estranging their "species essence". Marx accepted this but said Feuerbach could not explain *why* people fall into religious alienation: religion responds to alienation in material life, and will wither only when material life is set free. Hence his most quoted line on religion, written in 1843 and early 1844 and published in February 1844 in the "Introduction" to his critique of Hegel's philosophy of right: "Religious suffering is, at one and the same time, the expression of real suffering and a protest against real suffering. Religion is the sigh of the oppressed creature, the heart of a heartless world, and the soul of soulless conditions. It is the opium of the people." The SEP reads religion here as "a harmful, illusion-generating painkiller"; Avineri hears "empathy, not scorn". (*History and Drugs* sets the metaphor against the opium trade of the time.)

In "On the Jewish Question" (1843), against Bauer, Marx argued that liberal rights are "rights of separation", protecting each person from the others; political emancipation improved on feudalism but fell short of human emancipation (compare *Liberty and Rights*). Whether the essay is itself antisemitic is debated: Paul Johnson, Bernard Lewis and Robert Wistrich read it so, while Wendy Brown, David McLellan and Francis Wheen disagree.

The *Economic and Philosophic Manuscripts* (1844, published 1932) give the fullest account. **Alienation** in general is "a separation between a subject and an object that properly belong together". Under capitalism, Marx argued, the worker is alienated in four ways:

1. From the **product**, which workers "neither own nor control, indeed, which comes to dominate them".
2. From productive **activity**, work that is "mentally and/or physically debilitating".
3. From **other people**, whom they come to see "as merely means to their own particular ends".
4. From their **species-being** (*Gattungswesen*), their own human nature: "the human capacities for community and for free, conscious, and creative, work".

This is the SEP's order; in Marx's manuscript species-being comes third. Two clarifications prevent misreadings. Alienation is not low pay: alienated labour "could—even if it is typically not—be highly remunerated, limited in duration, and relatively secure". And it is not the same as **objectification** (*Vergegenständlichung*), the putting of oneself into an object, which happens in all production; the "Christian" view of work as a necessary evil, the SEP's David Leopold notes, confuses the two. Nor did Marx blame machines: alienation came from capitalist social relations, not technology, and he rejected the "romantic critique of capitalism".

**The objection.** As the SEP observes, "it is the implicit claim about human nature (the fourth separation) which identifies the other three separations as dysfunctional." Everything rests on a contested picture of what humans are; and many people seem content. If someone does not feel alienated, by what right does the philosopher say they are?

**The reply.** Marx distinguished felt (subjective) alienation from real (objective) alienation. In *The Holy Family* he describes capitalists as objectively alienated while feeling "at ease" in their condition. Alienation concerns whether a life realises human capacities, not how it feels, as a person can be unhealthy without feeling ill. Defenders such as Geras (1983) argue that Marx kept a universal human nature, with constant and variable elements, into his mature work. The price is that the critique stands or falls with that account of human flourishing.

## Changing the World: Feuerbach and *The German Ideology*

In Brussels in 1845 Marx jotted eleven notes on Feuerbach, published, edited, only in 1888. Their point is a double rejection. Older **materialism** (the view that physical reality is basic) understood the world but left out the active human subject; **idealism**, Hegel's above all, grasped activity but only as the activity of thought. Marx placed world-changing activity in material practice. The eleventh note became his epitaph:

```quote
The philosophers have only interpreted the world in various ways; the point is to change it.
Karl Marx · Theses on Feuerbach, XI (Collected Works, vol. 5, pp. 3–5) · 1845
```

The familiar "the point, however, is to change it" is Engels's 1888 version: he added the "however" (*aber*), and that is the wording carved on Marx's tomb.

*The German Ideology* (1845–46), written with Engels, was left to "the gnawing criticism of the mice", as Marx put it; most scholars now think it was meant as a series of articles, not a book. Its "premises" are "real human beings", who must first produce their means of subsistence. How they produce shapes, or at least "conditions", the rest of social life and, finally, consciousness.

## Historical Materialism

Marx's most compact statement of his theory of history came in the Preface to *A Contribution to the Critique of Political Economy* (1859). People, he wrote (in S. W. Ryazanskaya's translation), "inevitably enter into definite relations, which are independent of their will, namely relations of production appropriate to a given stage in the development of their material forces of production". These form "the economic structure of society, the real foundation, on which arises a legal and political superstructure". Hence "it is not the consciousness of men that determines their existence, but their social existence that determines their consciousness". At a certain stage the relations of production become "fetters" on the forces: "Then begins an era of social revolution."

The **productive forces** are the means of production (tools, machines, land) plus human labour power. The **relations of production** are relations of ownership and control, such as lord and serf or capitalist and wage-worker; together they make up the **economic structure**, or "base". The **superstructure** is the legal and political order that rises on it. This theory of history is known as **historical materialism**.

In *Karl Marx's Theory of History: A Defence* (1978), G. A. Cohen reconstructed it with analytic rigour. In the SEP's presentation:

1. **Development thesis:** the productive forces tend to develop over time (because humans are "somewhat rational", face scarcity, and have the intelligence to improve their situation).
2. **Primacy thesis:** the economic structure is explained by the level of development of the productive forces.
3. The superstructure, and ideology, are explained by the economic structure.
4. When a structure stops developing the forces, it "fetters" them and is "burst asunder", replaced by one better suited to their growth.
5. But the *Manifesto* also says that "the bourgeoisie cannot exist without constantly revolutionising the instruments of production", which seems to make the structure explain the forces, not the reverse.
6. The two are reconciled by **functional explanation**: capitalism exists *because* it develops the forces; were it to stop doing so, it would disappear. "Fettering" is simply dysfunction.

A functional explanation explains something by the good effects it has, as we explain a bird's hollow bones by their usefulness in flight.

**The objection.** Elster, in *Making Sense of Marx* (1985), replied that a functional explanation needs a *mechanism*. Without one, it appeals to "purposes" in history that are no one's purposes. Simone Weil had anticipated it: Marx attributed "to matter what is the very essence of mind—an unceasing aspiration towards the best".

**The reply.** Cohen answered from biology. Naturalists rightly explained hollow bones by their function before Darwin supplied the mechanism of natural selection. Functional explanations need "elaborations", but so do causal ones; enough inductive evidence can justify one before the mechanism is known.

**The remaining dilemma.** Two difficulties remain. History shows long periods of stagnation and regression without revolution. And if the elaboration is Darwinian (chance variations in economic structure, with the productive ones selected), history becomes contingent, which undercuts Marx's prediction of communism. As the SEP puts it, "the best model for developing the theory makes predictions based on the theory unsound." Cohen's book has also been criticised as technological determinism, and Cohen himself later worried that its emphasis on production was one-sided. Some readers deny Marx had a general theory at all, finding only analyses of particular episodes such as *The Eighteenth Brumaire* (1852); dialectical readers such as Sean Sayers reject Cohen's method outright.

One notable absence in Cohen's account is **class struggle**, because the 1859 Preface does not mention it explicitly. Yet the Preface implies it, speaking of "an era of social revolution" and of the ideological forms in which people "fight it out", and Marx may have had the censor in mind.

```checkpoint
q: In Marx's four aspects of alienation, which one does the SEP say identifies the other three as dysfunctional?
a*: Alienation from species-being, the claim about human nature.
a: Alienation from the product.
x: Losing control of the product is only shown to be bad by a further claim about what humans need.
a: Alienation from other people.
x: This is one of the separations that needs a baseline; it is not the baseline itself.
a: Alienation from wages.
x: Marx's alienation is not about pay; alienated work could be well paid and secure.
hint: Alienation is a separation from something that properly belongs to us; what fixes what belongs to us?
why: The capacities for community and free, creative work supply the baseline against which the other separations count as losses.
---
q: What was Jon Elster's main objection to Cohen's functional reading of historical materialism?
a: That Marx never wrote the 1859 Preface.
x: The Preface is Marx's, and it is the text Cohen reconstructs.
a: That productive forces never develop at all.
x: Elster's point is about the form of explanation, not the fact of development.
a*: That without a mechanism it appeals to purposes in history that are no one's purposes.
a: That functional explanation is impossible even in biology.
x: Cohen's reply relies on biology; Elster's complaint is a missing mechanism, not the impossibility of all functional explanation.
hint: Ask what would make economic structures "select" themselves for their usefulness.
why: Elster demanded a mechanism; Cohen replied that biology justified functional claims before Darwin, and the dilemma that remains is that a Darwinian mechanism makes history contingent.
```

## Ideology

Marx never gave "a clear and sustained discussion of ideology". The core idea is that a class society is stabilised not only by force but by ideas that are "false or misleading in a fashion that works to the advantage of the economically dominant class". Ideology presents ruling-class interests as the general interest and historical arrangements as natural. *The German Ideology* likens it to the inverted image in a camera obscura, and states: "The ideas of the ruling class are in every epoch the ruling ideas, i.e. the class which is the ruling material force of society, is at the same time its ruling intellectual force." Ideology is only part of the story; there is also what the SEP calls "dull economic pressure".

A phrase must be corrected here. "**False consciousness**" is not Marx's. Engels used it in a letter to Franz Mehring of 14 July 1893: "Ideology is a process accomplished by the so-called thinker consciously, it is true, but with a false consciousness", the real motives remaining unknown to the thinker. Lukács developed the idea in 1923. The phrase is older still: Destutt de Tracy, who coined the word "ideology", wrote in 1817 of "a false and blind consciousness" and conceived ideology as its *remedy*. Marx had read him.

Elster objected that Marx never explains why the ruling ideas should be those of the ruling class, which is functionalism again. The reply is that Marx does name mechanisms: the ruling class controls the "means of mental production", and people have a psychological need for consolation, which religion meets. Ricoeur later grouped Marx with Nietzsche and Freud as "masters of suspicion", thinkers who taught readers to ask what interests lie behind beliefs (see *Nietzsche*).

## Class Struggle and the *Manifesto*

The *Manifesto*, commissioned by the Communist League and published anonymously in London in February 1848, opens its first chapter: "The history of all hitherto existing society is the history of class struggles" (Samuel Moore's 1888 translation). Accounts of its authorship differ: the SEP's entry on Engels says Engels drafted it and Marx revised it; others credit the final text to Marx alone, and Engels wrote in 1883 that its basic thought belonged "solely and exclusively to Marx".

The *Manifesto* also calls the modern state "but a committee for managing the common affairs of the whole bourgeoisie". Elster finds three models of the state in Marx: this **instrumental** one, largely abandoned from the early 1850s; a **class-balance** model; and an **abdication** model, in which the bourgeoisie gives up the "crown" to save its "purse", which the SEP judges closest to his considered view.

## *Capital*: Value, Surplus Value and Exploitation

Marx called his project a critique of political economy; his subject was the "capitalist mode of production" (see *Global History of Capitalism: Past, Present, Future*). A **commodity** is a useful thing produced for exchange; it has a **use-value** (its usefulness) and an **exchange-value**. On the **labour theory of value** (compare the labour theory of property in *Locke*), a commodity's value is set by the "socially necessary" labour time needed to produce it, at average skill and intensity. Marx's case for this has two steps: if two commodities can be equated, there must be a "third thing" of identical magnitude in both, and labour is the only plausible candidate. The SEP calls both steps "highly contestable".

On that basis Marx argues as follows:

1. The capitalist buys the worker's **labour power**, the capacity to work, for a day, at its value.
2. That value equals the value of what the worker needs to keep going: say, four hours' labour.
3. But the worker works longer, say eight to twelve hours. The hours beyond the "necessary labour" are **surplus labour**, and create **surplus value**.
4. Labour power is the only commodity that creates more value than it costs; machines and materials ("constant capital") only pass on their own value.
5. So surplus value is the source of all profit, and workers, who own no means of production, are forced to yield it: they are **exploited**.

Like a serf's unpaid labour for his lord, this is labour for another, but hidden: wage-workers "appear to work entirely for the benefit of themselves".

**Objections.** First, the **transformation problem**: if only labour creates surplus value, labour-intensive industries should earn higher rates of profit, which is false and inconsistent with competition equalising profit rates. Marx's own solution in volume 3, with prices deviating systematically from values, "suffers from technical difficulties". Eugen von Böhm-Bawerk's *Karl Marx and the Close of His System* (1896) argued that volume 3 contradicts volume 1; Hilferding replied for Marx, and some defenders still deny any inconsistency. Second, the **marginalist revolution** of the 1870s, which explained value by the usefulness of an extra unit to buyers rather than by labour, led economists largely to abandon the labour theory of value. Third, **why labour?** Roemer and R. P. Wolff showed that a formally identical "corn theory of value" could be built, so that nothing in the formal argument singles out labour. Nozick (1974) drew the moral: if the labour theory of value fails, Marx's theory of exploitation collapses with it.

**Replies.** G. A. Cohen (1979) argued that exploitation does not need the labour theory of value at all, and may even conflict with it: "Labor may not produce value, but it is the only thing that produces what has value." Roemer (1985) redefined exploitation as an unequal exchange of labour for goods, and others, such as Vrousalis (2013), locate the wrong in unfreedom or domination. On these readings Marx's charge survives the failure of his economics.

Was exploitation, for Marx, *unjust*? He never says so directly. Wood (1972) argued he did not think capitalism unjust; Husami (1978) argued he did; Cohen quipped that Marx "believed that capitalism was unjust, but did not believe that he believed it was unjust" (see *Justice and Equality*).

{{image: Das Kapital | Title page of the first German edition of Volume I of *Capital* (1867).}}

*Capital* also analyses **commodity fetishism**. A fetish is an object credited with powers of its own. In a market, Marx argued, the relations between producers appear as relations between things, prices and markets that seem to move by themselves:

```quote
It is nothing but the definite social relation between men themselves which assumes here, for them, the fantastic form of a relation between things.
Karl Marx · Capital, vol. 1, trans. Ben Fowkes, p. 165 · 1867
```

Fetishism, in which "human creations escape our control, achieve the appearance of independence, and come to oppress us", is one form of alienation, not the whole of it.

```checkpoint
q: In Marx's argument, why is labour power special among commodities?
a: Because it is the only commodity sold below its value.
x: Marx assumes the capitalist pays labour power's full value; the surplus arises anyway.
a*: Because it is the only commodity that creates more value than it costs.
a: Because machines create surplus value along with it.
x: Machines are "constant capital": they only pass on their own value.
a: Because the worker owns the means of production.
x: The worker owns none, which is why she must sell labour power.
hint: Compare what labour power is paid with what it produces.
why: Labour power is paid at the value of the worker's subsistence but works beyond the "necessary labour", producing surplus value.
---
q: How did G. A. Cohen answer Nozick's claim that Marx's theory of exploitation collapses with the labour theory of value?
a: He proved the labour theory of value correct.
x: Cohen conceded that labour may not produce value.
a: He replaced labour with corn as the source of value.
x: The corn theory is an objection by Roemer and Wolff, not Cohen's reply.
a: He argued that exploitation is just after all.
x: Cohen's point concerns whether exploitation can be identified without the theory, not whether it is just.
a*: He argued that exploitation does not depend on it, since labour is the only thing that produces what has value.
hint: Cohen distinguished producing value from producing valuable things.
why: Cohen held that exploitation is independent of, even incompatible with, the labour theory of value; Roemer and Vrousalis offered other value-free definitions.
```

## Communism and the Gotha Programme

Marx refused to write "recipes" for the "restaurants" of the future. His fullest glimpse came in marginal notes of 1875, written against Lassallean influence on the draft programme for the German socialists' Gotha unity congress; they were suppressed and published by Engels only in 1891. The *Critique of the Gotha Programme* distinguishes a lower phase of communism, in which goods are distributed according to labour contributed, from a higher phase whose banner reads: "From each according to his ability, to each according to his needs!" The slogan was not Marx's invention. It is attributed to Louis Blanc (the date of his version is disputed; Engels credited Blanc in 1851), with precursors in Cabet, Morelly's *Code of Nature* (1755) and the Acts of the Apostles (4:35).

The *Critique* also speaks of a transition whose state "can be nothing but the revolutionary dictatorship of the proletariat". Marx used this phrase rarely; the term was probably first used by Blanqui. In his day "dictatorship" still meant emergency rule on the Roman model, not totalitarian government, and the SEP reads his usage as a democratic, temporary transition. Engels, pointing to the Commune's elected and recallable officials on workers' wages, wrote: "Look at the Paris Commune. That was the dictatorship of the proletariat."

## Beyond Europe: India, Russia and Late Marx

In 1853 Marx's *Tribune* article "The British Rule in India" condemned the devastation Britain had caused, a misery "infinitely more intensive" than before, yet called the village communities "the solid foundation of Oriental despotism" and England "the unconscious tool of history in bringing about that revolution". Said, in *Orientalism*, took these articles to reproduce Orientalist assumptions and used as an epigraph a line from Marx's *Eighteenth Brumaire*, written about French peasants: "They cannot represent themselves; they must be represented". Critics such as Aijaz Ahmad and Irfan Habib replied that Said relied on two passages and ignored Marx's other writings on India.

Late Marx looks different. In 1881 Vera Zasulich asked whether the Russian peasant commune could pass directly to socialism. After several drafts, Marx replied that the "historical inevitability" described in *Capital* was "expressly restricted to the countries of Western Europe", and that the commune could be "the fulcrum of social regeneration in Russia". Kevin B. Anderson's *Marx at the Margins* (2010) argues that Marx moved from a single-track to a "multilinear and nonreductionist" view of history; in Algeria in 1882 he noted colonial torture. The Japanese scholar Kohei Saito reads late Marx, more controversially, as an ecosocialist and even a "degrowth communist". These debates continue in *Race, Colonialism and Philosophy* and *Philosophy in an Age of Empire*.

## Engels, the Family and Gender

From Marx's notes on Lewis Morgan, Engels wrote *The Origin of the Family, Private Property, and the State* (1884), though its arguments are "distinctively Engels's own". He placed in the material base not only the production of subsistence but "the propagation of the species", and claimed that "the first class antithesis which appears in history coincides with the development of the antagonism between man and woman in monogamous marriage". Second-wave and Marxist-feminist theories of "social reproduction", the unpaid work of sustaining and raising people, took up this lead (see *Feminist Philosophy*).

## Young Marx and Mature Marx

The publication of the 1844 Manuscripts and *The German Ideology* in 1932 revealed a humanist Marx. Louis Althusser, in *For Marx* and *Reading Capital* (both 1965), answered with an "epistemological break" in 1845: the humanist, Feuerbachian young Marx gave way to a scientific Marx who rejected "species-being" as bourgeois ideology. Against him, the SEP judges that the claim that Marx wrote about alienation only early "is not sustained by the textual evidence". The mature Marx still holds a universal human nature (Geras), and many see commodity fetishism as a deeper version of alienation.

## Marx and the Marxisms

Engels reported, in letters of 1882 and 1890, that Marx had told Paul Lafargue, of certain French "Marxists", that one thing was certain: he himself was not a Marxist (the French wording varies between reports). The remark marks the problem. After Marx's death the Second International (1889–1914) made Kautsky's "orthodox Marxism" a science that proved capitalism's collapse inevitable. The term "**dialectical materialism**" was coined in the 1880s–90s and is usually credited to Joseph Dietzgen and G. V. Plekhanov; neither Marx nor Engels used it, though editorial headings in posthumous editions of Engels gave the mistaken impression that it was his. Stalin codified it in 1938 as compulsory Soviet doctrine, the backdrop to *Global Cold War and the Arms Race*.

Engels's role remains disputed. Lukács (1923) blamed him for extending dialectics to nature; Norman Levine (1975) accused him of misrepresenting Marx and laying foundations for Stalinism; Terrell Carver took a middle position. **Western Marxism**, the line from Lukács, Korsch and Gramsci to the Frankfurt School (see *Critical Theory: the Frankfurt School and Habermas*), was faulted by Perry Anderson (1976) for its "structural divorce from political practice". **Analytical Marxism**, the "September Group" that grew from London meetings on exploitation convened by Elster, with Cohen's support, in 1979 and joined by Roemer and others (it was nicknamed the "Non-Bullshit Marxism Group"), tested Marx's claims with the methods of analytic philosophy (see *Analytic Philosophy since 1950*); Elster and Przeworski left in 1993, and Przeworski later judged that "not much of Marxism is left".

The SEP's verdict is the right note to end on. Marx's thought is "less systematic than sometimes thought", and it is "a mistake to think that all the various threads … form a 'system' which has to be swallowed or rejected in its entirety". One can reject the labour theory of value and still take the critique of alienation seriously, or doubt the theory of history and still use the idea of ideology.

## Further exploration

- **Gareth Stedman Jones, *Karl Marx: Greatness and Illusion* (2016).** A major biography that sets Marx firmly in his own century.
- **David Leopold, *The Young Karl Marx* (2007).** A careful study of the early writings, alienation and human emancipation.
- **G. A. Cohen, *Karl Marx's Theory of History: A Defence* (1978; expanded edition 2001).** The analytic reconstruction of historical materialism discussed in this chapter.
- **Kevin B. Anderson, *Marx at the Margins: On Nationalism, Ethnicity, and Non-Western Societies* (2010).** Marx on India, Russia, Ireland and Poland, and the case for a multilinear late Marx.
- **Kohei Saito, *Karl Marx's Ecosocialism: Capital, Nature, and the Unfinished Critique of Political Economy* (2017).** Late Marx read as an ecological thinker.
- **Vanessa Christina Wills, *Marx's Ethical Vision* (2024).** Argues that Marx's critique of capitalism is at heart an ethical one.
- **Terrell Carver, *Friedrich Engels: His Life and Thought* (1990).** Engels as a thinker in his own right.$marx_master$,
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
  select $marx_quiz$[
    {"type": "mcq", "prompt": "Who used the phrase \"false consciousness\" in the Marxist tradition's best-known source for it?", "options": ["Engels, in a letter to Franz Mehring of 14 July 1893", "Marx, in the 1859 Preface", "Marx, in the Theses on Feuerbach", "Stalin, in 1938"], "answerIndex": 0, "explanation": "The phrase is not Marx's. Engels used it in his 1893 letter to Mehring, and Destutt de Tracy had written of 'a false and blind consciousness' as early as 1817.", "id": "q1"},
    {"type": "mcq", "prompt": "What did Engels change in his 1888 edition of Marx's eleventh thesis on Feuerbach?", "options": ["He removed the word 'philosophers'", "He replaced 'change' with 'understand'", "He added 'however', giving 'the point, however, is to change it'", "He moved it to the start of the theses"], "answerIndex": 2, "explanation": "Marx's original reads 'the point is to change it'; Engels added 'however' (aber), and that edited wording is on Marx's tomb.", "id": "q2"},
    {"type": "mcq", "prompt": "What is the 'transformation problem' in Marx's economics?", "options": ["How to turn feudal serfs into wage-workers", "Labour-intensive industries should earn higher profit rates, which is false and conflicts with competition equalising profit rates", "Why religion turns into ideology", "How the lower phase of communism becomes the higher phase"], "answerIndex": 1, "explanation": "If only labour creates surplus value, profit should vary with labour intensity. Marx's volume 3 solution has technical difficulties; Böhm-Bawerk argued in 1896 that volume 3 contradicts volume 1.", "id": "q3"},
    {"type": "mcq", "prompt": "What did Marx's 1881 reply to Vera Zasulich say about the 'historical inevitability' described in Capital?", "options": ["That it applied to every society on earth", "That it applied only to Britain and India", "That he had abandoned it entirely", "That it was expressly restricted to the countries of Western Europe"], "answerIndex": 3, "explanation": "Marx wrote that the inevitability was restricted to Western Europe and that the Russian commune could be 'the fulcrum of social regeneration in Russia'; Kevin Anderson reads this as part of a multilinear late Marx.", "id": "q4"},
    {"type": "open", "prompt": "Set out G. A. Cohen's functional reconstruction of Marx's theory of history, Elster's objection to it, and Cohen's reply. What difficulty remains?", "rubric": "A strong answer states the development thesis and the primacy of the productive forces, the apparent conflict with the bourgeoisie's revolutionising of production, and its resolution by functional explanation (capitalism exists because it develops the forces). It gives Elster's demand for a mechanism (and Weil's earlier charge), Cohen's reply from pre-Darwinian biology, and the remaining dilemma: stagnation without revolution, and a Darwinian elaboration making history contingent and undercutting the prediction of communism.", "id": "q5"},
    {"type": "open", "prompt": "Does Marx's charge that capitalism exploits workers depend on the labour theory of value?", "rubric": "A strong answer explains the surplus-value argument (labour power bought at its value, surplus labour beyond necessary labour), the objections (transformation problem, marginalism, the 'corn theory of value'), and Nozick's claim that exploitation falls with the theory. It then weighs the replies: Cohen's 'labour is the only thing that produces what has value', Roemer's unequal-exchange account, and domination accounts such as Vrousalis's; it may note the Wood–Husami debate on whether Marx thought capitalism unjust.", "id": "q6"}
  ]$marx_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/nineteenth-century/marx', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

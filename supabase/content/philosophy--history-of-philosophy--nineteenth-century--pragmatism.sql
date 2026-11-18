-- American Pragmatism: Peirce, James and Dewey — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/nineteenth-century/pragmatism @ research/advanced/read.
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
    'philosophy/history-of-philosophy/nineteenth-century/pragmatism',
    'research',
    'advanced',
    'read',
    $pragmatism_master$> **Pragmatism, the first philosophical movement born in the United States, holds that the meaning of an idea lies in its practical consequences and that knowledge is a tool of living, always open to correction.** This chapter follows its three founders: Charles Sanders Peirce on meaning, inquiry and signs; William James on the stream of thought, the right to religious belief and truth; and John Dewey on experience, education and democracy. It sets out their main arguments with the strongest objections, widens the circle to Jane Addams, W. E. B. Du Bois and others, and ends with pragmatism's revival.

## A Club in Cambridge

The usual story begins in Cambridge, Massachusetts, in the early 1870s (Louis Menand dates it to 1872). A group of Harvard-educated men, among them Charles Sanders Peirce, William James, the future Supreme Court Justice Oliver Wendell Holmes Jr. and Chauncey Wright, met to argue about philosophy. Peirce later said that pragmatism was born in their discussions, and that they called themselves, "half-ironically, half-defiantly", the Metaphysical Club.

The name rests on slender evidence: it is known only from Peirce's recollection in a paper of around 1906, more than thirty years later, and no other member's writings record a club so called. (A later club Peirce founded at Johns Hopkins did bear the name; the young John Dewey belonged to that one, not the Cambridge group.) Menand's prize-winning book of 2001 made the Cambridge club famous, but the philosopher Maurice Hamington argues that it "has taken on a mythical status", and that the impact of Jane Addams's Hull House in Chicago "dwarfs that of the Cambridge intellectuals". Others trace pragmatism's roots to Emerson or to Native American thought; its founding is itself debated.

Two Cambridge figures mattered especially. The lawyer Nicholas St. John Green urged the Scottish psychologist Alexander Bain's definition of belief as "that upon which a man is prepared to act"; Peirce wrote that "from this definition, pragmatism is scarce more than a corollary", and called Green "the grandfather of pragmatism". Chauncey Wright, an early American defender of Darwin, pressed a fallibilist empiricism on his friends; the Stanford Encyclopedia of Philosophy (SEP) thinks him better remembered as an original thinker in the tradition of John Stuart Mill (see *Bentham, Mill and Utilitarianism*). The word "pragmatism" first reached print in 1898, in an address James gave at Berkeley crediting it to Peirce. (Quotations follow the critical editions: *The Essential Peirce* and Peirce's *Writings*, the Harvard *Works of William James*, Dewey's *Collected Works*.)

## Peirce: a Life on the Margins

Peirce was born in Cambridge in 1839, the son of Harvard's professor of mathematics. He took a chemistry degree summa cum laude and worked for the U.S. Coast and Geodetic Survey from 1859 to 1891, measuring gravity with pendulums often of his own design. As a teenager he spent three years on Kant's *Critique of Pure Reason* (see *Kant*).

His only academic post was teaching logic at Johns Hopkins from 1879 to 1884; his students included Christine Ladd(-Franklin), Thorstein Veblen and Dewey. He lost it amid scandal over his separation from his first wife and open cohabitation with Juliette, whom he married after his divorce in 1883. He spent his last decades "on the edge of penury" in rural Pennsylvania, helped at times by James. He died in 1914, leaving about 12,000 published pages and some 80,000 pages of manuscript. Long seen as an eccentric who merely named pragmatism, he is now widely regarded as a major thinker.

{{image: Charles Sanders Peirce | Charles Sanders Peirce (1839–1914), logician, scientist and founder of pragmatism.}}

## How Belief Gets Fixed

Peirce began by attacking "Cartesianism": the ideas that we can doubt everything at once and that certainty is tested in the individual consciousness. "Let us not pretend to doubt in philosophy what we do not doubt in our hearts," he wrote in 1868, answering the method discussed in *Descartes*. Philosophy's reasoning should be not "a chain which is no stronger than its weakest link, but a cable whose fibres may be ever so slender, provided they are sufficiently numerous and intimately connected."

His positive account came in "The Fixation of Belief" (1877), in *Popular Science Monthly*. Its argument runs:

1. Doubt is "an uneasy and dissatisfied state from which we struggle to free ourselves and pass into the state of belief"; belief is "a calm and satisfactory state" and a habit that guides action.
2. "The irritation of doubt causes a struggle to attain a state of belief". This struggle is **inquiry**, and only real doubt starts it, not a "hyperbolic" doubt.
3. So "the sole object of inquiry is the settlement of opinion".
4. **Tenacity**, clinging to one's belief and ignoring contrary evidence, fails because of the "social impulse": we meet others whose opinions seem as good as ours.
5. **Authority**, in which a state or church dictates belief, works, sometimes brutally, but cannot regulate every opinion, and people learn of societies that believe otherwise.
6. The **a priori method**, adopting what seems "agreeable to reason", makes opinion "something like tastes", following fashion in circles.
7. **Science** supposes a reality independent of what anyone thinks, and alone admits that it can go wrong, so it tests and corrects itself.
8. Therefore only the method of science can settle belief stably.

The obvious objection is that this proves too little: if the sole aim is settled opinion, any method that settles it should do, and Peirce himself grants that authority's successes have been majestic and long-lasting, and in an 1898 lecture he added that in practical affairs slow reasoning is often dangerously inferior to instinct and traditional sentiment. The reply, as the SEP reconstructs it, is that some of us are disturbed by inconsistent beliefs and then ask which ways of fixing belief are correct; science is "the only method of inquiry that can make sense of" that fact. The resulting attitude is **fallibilism**, the view that any belief might be mistaken, which makes us "contrite fallibilists", not sceptics. Hence the rule Peirce drew from what he called the first rule of reason: "Do not block the way of inquiry!"

## The Pragmatic Maxim and the End of Inquiry

"How to Make Our Ideas Clear" (1878) distinguished three grades of clarity: familiar use of a word, verbal definition, and a third rule, the pragmatic maxim:

```quote
Consider what effects, which might conceivably have practical bearings, we conceive the object of our conception to have. Then, our conception of these effects is the whole of our conception of the object.
Charles S. Peirce · "How to Make Our Ideas Clear", Popular Science Monthly (Writings of Charles S. Peirce, vol. 3, 1986, p. 266) · 1878
```

To call something "hard" is to say that "it will not be scratched by many other substances". Peirce used the maxim against the doctrine of transubstantiation (that the wine of the Mass becomes Christ's blood): talk of something with all the sensible characters of wine that is really blood is "senseless jargon". He later decided that even a diamond never tested really *would* resist scratching, so meaning must be spelled out in conditionals about what would happen. The maxim is often compared with the logical positivists' verification principle (see *Logical Positivism and Its Critics: the Vienna Circle, Popper and Quine*), but Peirce wanted to make metaphysics scientific, not abolish it.

The same essay applied the maxim to truth: "The opinion which is fated to be ultimately agreed to by all who investigate, is what we mean by the truth, and the object represented in this opinion is the real." The "end" of inquiry is its goal, not a finishing date, and reality is independent "not necessarily of thought in general, but only of what you or I or any finite number of [persons] may think about it".

Objections pull both ways. Bertrand Russell asked whether the assumed convergence was "an empirical generalization from the history of research" or "an optimistic belief in the perfectibility of man". Peirce himself, decades earlier (1908), had come to treat convergence as a guiding hope: "I do not say that it is infallibly true that there is any belief to which a person would come if he were to carry his inquiries far enough. I only say that that alone is what I call Truth." Others say the view is not realist enough, since some facts, such as how many cakes were eaten at a long-forgotten party, seem lost for ever; Peirce replied, "Who can be sure of what we shall not know in a few hundred years?" The chapter on *Truth* takes up these theories.

## Guesses and Signs

Besides **deduction** (from a general rule to what must follow from it) and **induction** (from a sample to a general rule), Peirce identified **abduction**: forming a hypothesis that would explain something surprising. In his mature account, abduction proposes a hypothesis, deduction works out what we should observe if it is true, and induction tests it (see *Induction, Probability and Inference to the Best Explanation*).

He also built a theory of signs, "semeiotic", independently of Ferdinand de Saussure. Peirce's sign has three parts: the **sign** itself, the **object** it stands for, and the **interpretant**, roughly the understanding it produces, which is itself a further sign. Signs relate to objects in three ways. An **icon** shares a quality with its object, as a portrait or map does; an **index** is causally connected to it, as smoke is to fire; a **symbol** is connected by convention, as words are.

When James and the Oxford philosopher F. C. S. Schiller popularised "pragmatism", Peirce announced in 1905 "the birth of the word 'pragmaticism', which is ugly enough to be safe from kidnappers." He thought James and Dewey too nominalistic, that is, too unwilling to grant that general laws and dispositions are real.

```checkpoint
q: In "The Fixation of Belief", why does Peirce think the method of tenacity fails?
a*: Because our social impulse brings us up against other people whose opinions seem as good as our own.
a: Because no one is able to hold a belief for very long.
x: Peirce grants that tenacity can give comfort and decisiveness; its weakness is social, not a matter of duration.
a: Because the state forbids people to keep private opinions.
x: State control of belief is the method of authority, the second method, not the first.
a: Because it is the same as the a priori method.
x: The a priori method adopts what seems agreeable to reason; tenacity simply clings to whatever one already believes.
hint: Think about what happens when a tenacious believer meets other people.
why: Tenacity gives a settled mind only until one meets others who disagree; Peirce calls the pressure this creates the "social impulse".
---
q: What did Peirce mean by the "end" of inquiry when he defined truth as the opinion fated to be agreed by all who investigate?
a: The date on which science will be finished.
x: Peirce did not predict a finishing date; he even declined to call convergence "infallibly true".
a: Whatever the majority of people believe today.
x: Truth for Peirce is independent of what "you or I or any finite number" of people think.
a*: The goal towards which inquiry aims, the opinion that further investigation could not improve.
a: Whatever belief proves most useful to the person who holds it.
x: That is closer to James's language of expedience, which Peirce did not share.
hint: "End" can mean a stopping point or a purpose.
why: The end of inquiry is a goal or ideal limit, not a date; Peirce later spoke of "the ideal limit towards which endless investigation would tend".
```

## William James and the Stream of Thought

William James was born in New York City in 1842, brother of the novelist Henry James. He studied painting, then medicine, taking a degree he never used. A depression from 1869 began to lift after, reading Charles Renouvier in 1870, he resolved to believe in his own free will. At Harvard he taught physiology, then psychology, setting up the first American psychology laboratory, and then philosophy; his students included Du Bois, Gertrude Stein, Walter Lippmann and the psychologist Mary Whiton Calkins. He died in 1910.

*The Principles of Psychology* (1890), twelve years in the writing, rejects the picture of the mind as a chain of separate ideas. Consciousness "does not appear to itself chopped up in bits ... It is nothing jointed; it flows", so "let us call it the stream of thought, of consciousness, or of subjective life." It is always changing yet continuous, and selective, guided by interest. James's theory of emotion reverses common sense: "we feel sorry because we cry, angry because we strike, afraid because we tremble". The book influenced Husserl, Russell, Wittgenstein and Dewey (see *Consciousness*).

## The Will to Believe

In "The Ethics of Belief" (1877), W. K. Clifford imagined a ship-owner who sends an unseaworthy emigrant ship to sea, sincerely believing it safe, and is guilty because "he had no right to believe on such evidence as was before him". His conclusion: "it is wrong always, everywhere, and for anyone, to believe anything upon insufficient evidence." James's "The Will to Believe" (1896) is the classic reply. A hypothesis is **live** for someone if they would act on it; an **option** is a choice between hypotheses; it is **forced** if one cannot avoid choosing, and **momentous** if the chance is unique, the stakes high and the decision irreversible. An option that is living, forced and momentous is **genuine**. The argument:

1. Some genuine options cannot by their nature be decided on intellectual grounds.
2. We have two distinct duties, to know the truth and to avoid error: "Believe truth! Shun error!" are "two materially different laws".
3. Clifford's rule ranks avoiding error above gaining truth. That ranking is not dictated by evidence; it is a preference, a "private horror of becoming a dupe", like "a general informing his soldiers that it is better to keep out of battle forever than to risk a single wound".
4. So refusing to decide such an option is "itself a passional decision", with the same risk of losing truth.
5. Sometimes faith even helps make the fact: whether someone likes me may depend partly on my believing they might.
6. Therefore "our passional nature not only lawfully may, but must, decide an option between propositions, whenever it is a genuine option that cannot by its nature be decided on intellectual grounds."

Religion, James argued, can be such an option: scepticism avoids error if religion is false but loses the good if it is true.

```quote
In truths dependent on our personal action, then, faith based on desire is certainly a lawful and possibly an indispensable thing.
William James · "The Will to Believe", section X (The New World, vol. 5) · 1896
```

Peirce called the essay "a very exaggerated utterance", and deplored confusing active willing ("willing to control thought, to doubt, and to weigh reasons") with "willing to believe". The sharpest modern objection is Walter Kaufmann's (1958): James's appeal "depends entirely on blurring the distinction" between those who demand 100 per cent proof where any reasonable person would settle for 90 per cent, and those who simply refuse a belief whose only support is that "it could conceivably be true". The best reply is that James's thesis is narrow: it covers only genuine options that evidence cannot settle; for most scientific questions he says we should wait for evidence; and the sceptic who suspends judgement is also choosing. James later called his doctrine "the right to believe". The debate continues in *God: Arguments For and Against*.

His Gifford Lectures, *The Varieties of Religious Experience* (1902), studied religion as individual experience: the "healthy-minded" and the "sick soul", conversion and mysticism.

## Truth as What Works?

*Pragmatism* (1907) was dedicated "to the memory of John Stuart Mill from whom I first learned the pragmatic openness of mind". Pragmatism, James said, is "a method for settling metaphysical disputes that might otherwise be interminable". His example: a man walks round a tree, but a squirrel on the trunk keeps the trunk between them. Does the man go round the squirrel? If "going round" means passing north, east, south and west of it, yes; if it means being in front of it, then to its right, behind and to its left, no. The dispute dissolves once we see what we "practically mean".

He applied the method to truth. Ideas "become true just in so far as they help us to get into satisfactory relation with other parts of our experience". Most notoriously: "'The true', to put it very briefly, is only the expedient in the way of our thinking, just as 'the right' is only the expedient in the way of our behaving", expedient "in the long run and on the whole". Truth "happens to an idea. It becomes true, is made true by events." Here James parted from Peirce, for whom truth lay at the end of inquiry.

The critics pounced. G. E. Moore (1908) read James as holding that all and only true ideas are verifiable and that all and only true ideas are useful, and attacked both claims. Russell, in essays of 1908–10, argued that "when we say that a belief is true, the thought we wish to convey is not the same thought as when we say that the belief furthers our purposes; thus 'true' does not mean 'furthering our purposes'". And it is "so often harder to determine whether a belief is useful than whether it is true". Later Russell claimed that James was committed to the truth of "Santa Claus exists".

Defenders reply that this reads James too crudely; the SEP calls the Santa Claus charge "unfair": James would call such a belief "good for so much", but wholly true only if it did not "clash with other vital benefits". Susan Haack argues that the pragmatists rejected the sharp line between defining truth and giving a test for it, and Misak proposes getting "leverage on the concept" by exploring its connections with practice rather than defining it. How crude James's theory was remains debated.

James's last philosophy was **radical empiricism**: "the relations between things, conjunctive as well as disjunctive, are just as much matters of direct particular experience as the things themselves." Against his colleague Josiah Royce's idealist Absolute, the one all-embracing mind, *A Pluralistic Universe* (1909) argued for a world of many real things and a finite God.

## Dewey: Experience and Inquiry

John Dewey was born in Burlington, Vermont, in 1859, studied at Johns Hopkins, where he found Peirce's logic too "mathematical", and wrote a doctoral thesis on Kant's psychology. He began as a Hegelian (see *German Idealism: Fichte, Schelling and Hegel*) and taught at Michigan, Chicago (from 1894) and Columbia (1904–30), wrote some forty books, and died in New York City in 1952.

"The Reflex Arc Concept in Psychology" (1896) attacked the model of a stimulus followed by a response, which makes experience "a patchwork of disjointed parts, a mechanical conjunction of unallied processes". "The real beginning is with the act of seeing; it is looking, and not a sensation of light"; stimulus and response are phases of one coordinated activity. The same thought drove his **instrumentalism**, the view that ideas are instruments for resolving problems: an idea is tested by "its functional or instrumental use in effecting the transition from a relatively conflicting experience to a relatively integrated one". Where Peirce, in John E. Smith's phrase, "aimed at 'fixing' belief, Dewey aimed at 'fixing' the situation". In *Experience and Nature* (1925) experience is "what men do and suffer, what they strive for, love, believe and endure". *The Quest for Certainty* (1929) called the search for knowledge free of all error both doomed and destructive, as the SEP summarises it.

His *Logic: The Theory of Inquiry* (1938) defined inquiry as "the controlled or directed transformation of an indeterminate situation" into a unified one: a felt difficulty, a problem, a hypothesis, reasoning and testing. He preferred to call the outcome **warranted assertibility** rather than truth; the 527-page book's index has a single entry for "truth". Yet "there is no belief so settled as not to be exposed to further inquiry".

## Education, Democracy and the World

In 1896 Dewey founded the Laboratory School in Chicago, with Alice Chipman Dewey, his wife, as principal; conflicts over it led him to leave Chicago in 1904. Rejecting both "traditionalist" and "romantic" schooling, he held that school must reproduce "the typical conditions of social life". In *Democracy and Education* (1916), the book in which he said his philosophy was "most fully expounded", philosophy "may even be defined as the general theory of education", and democracy is "primarily a mode of associated living, of conjoint communicated experience".

When Walter Lippmann argued in *Public Opinion* (1922) and *The Phantom Public* (1925) that citizens cannot be "omnicompetent", Dewey answered in *The Public and Its Problems* (1927) that modern publics were "inchoate" and needed a more participatory democracy, "the idea of community life itself". Textbooks call this the "Lippmann–Dewey debate", but the sociologist Michael Schudson argues it was hardly a debate and that Lippmann was not anti-democratic (see *Democracy and Its Critics*).

Dewey arrived in Shanghai on 30 April 1919, days before the May Fourth demonstrations, and stayed until July 1921, giving nearly 200 lectures interpreted by his former Columbia student Hu Shih (Hu Shi). Hu rendered "pragmatism" as "experimentalism" and in 1919 debated "problems and isms" with the Marxist Li Dazhao. Dewey's ideas were later denounced in Maoist China (see the History chapter *Modern China* and *Modern Chinese and Indian Philosophy*). In April 1937, aged 77, Dewey chaired the commission that held hearings in Coyoacán, Mexico, on the Moscow Trials' charges against Leon Trotsky; it found the trials "frame-ups".

## A Wider Circle

Jane Addams (1860–1935) opened Hull House, a settlement in a poor immigrant district of Chicago, in 1889, wrote *Democracy and Social Ethics* (1902), and won the Nobel Peace Prize in 1931. Dewey and his daughter credited her with shaping his views of democracy and education, and the SEP holds that she "invented the profession of social work as an expression of pragmatist ideas". Yet her philosophical work was largely ignored until the 1990s, when Charlene Haddock Seigfried's *Pragmatism and Feminism* (1996) placed her at the centre of pragmatist feminism (see *Feminist Philosophy*).

W. E. B. Du Bois studied philosophy with James (and Santayana) and drew on Royce before becoming Harvard's first Black PhD in 1895: "I fell back upon my Royce and James ... This was the Jamesian pragmatism, applied not simply to ethics, but to all human action." Alain Locke, the first African American Rhodes Scholar, studied at Harvard with Royce and others, though the SEP notes that he "never actually studied with William James"; his "critical pragmatism" sought a standard for values "without resort to dogmatism and absolutism" (see *Philosophy in an Age of Empire* and *Race, Colonialism and Philosophy*). George Herbert Mead, Dewey's colleague, analysed the self as social, and C. I. Lewis, who developed a "conceptual pragmatism", taught Quine at Harvard.

```checkpoint
q: What is the key premise in James's case against Clifford in "The Will to Believe"?
a: That belief can be adopted at will about any question whatever.
x: James agreed we cannot simply will ourselves to believe dead hypotheses; he restricts his thesis to genuine options.
a*: That seeking truth and avoiding error are different duties, and preferring to avoid error at all costs is itself a passional choice.
a: That all scientific questions should be decided by feeling.
x: For questions that are not forced, as in most of science, James says we should wait for evidence.
a: That Clifford's ship-owner was innocent because he sincerely believed his ship was safe.
x: James's quarrel is with Clifford's general rule, not with the verdict on the ship-owner.
hint: Think of "Believe truth! Shun error!"
why: James argues the two laws are "materially different"; Clifford's rule ranks shunning error first, and that ranking is a preference, a "private horror of becoming a dupe".
---
q: What did Dewey's "warranted assertibility" replace in his account of inquiry?
a: The idea that inquiry begins with a problem.
x: Dewey kept the problem as the start of inquiry; the felt difficulty is his first phase.
a: Peirce's doctrine of signs.
x: Warranted assertibility concerns the goal of inquiry, not the theory of signs.
a: The reflex arc.
x: The reflex arc paper (1896) is Dewey's critique of stimulus–response psychology, a different topic.
a*: "Truth" and "knowledge" as names for what successful inquiry achieves.
hint: Look at how many entries the index of his *Logic* gives for "truth".
why: Dewey's *Logic* (1938) speaks of warranted assertibility in place of truth and knowledge, while insisting no belief is so settled as to be beyond further inquiry.
```

## Eclipse and Revival

By the 1940s pragmatism had "lost much of its momentum", and analytic philosophers found James and Dewey "infuriatingly vague". But it never vanished. Frank Ramsey developed Peirce's ideas in 1920s Cambridge, and through him, Misak argues, Wittgenstein's later thought acquired "a pragmatist flavour" (see *Wittgenstein*). Quine's "Two Dogmas of Empiricism" (1951), rejecting the boundary between analytic and synthetic truths, ends: "In repudiating such a boundary I espouse a more thorough pragmatism."

The real revival came with Richard Rorty's *Philosophy and the Mirror of Nature* (1979), which attacked the picture of the mind as a mirror of reality. Rorty's "neopragmatism" provoked: truth, he once said, is "what our peers will, ceteris paribus, let us get away with saying". Hilary Putnam described pragmatism by its fallibilism, its rejection of scepticism and of rigid dichotomies such as fact and value, and the "primacy of practice", while declining the founders' theories of truth. Robert Brandom built a theory of meaning around "the game of giving and asking for reasons" (see *Analytic Philosophy since 1950*), and Jürgen Habermas drew on Mead and Peirce (see *Critical Theory: the Frankfurt School and Habermas*).

The "new pragmatists" pushed back: Haack, as the SEP puts it, found Rorty's recasting of pragmatism literally unworthy of the name, and Misak charged him, in the SEP's summary, with a pragmatism of subjectivity in the tradition of William James rather than Peirce's. Cornel West's *The American Evasion of Philosophy* (1989) traced the tradition from Emerson and called for a "prophetic pragmatism", drawing on Christian and Marxian thought (see *Marx*) and giving Du Bois a prominent place. Feminist, Native American and Latin American pragmatisms followed. The SEP now calls pragmatism a growing third alternative to analytic and "Continental" philosophy.

## Further exploration

- **Cheryl Misak, *The American Pragmatists* (2013).** The tradition from the Metaphysical Club to the present, told from a Peircean standpoint critical of Rorty.
- **Louis Menand, *The Metaphysical Club: A Story of Ideas in America* (2001).** Pulitzer Prize-winning group portrait of Holmes, James, Peirce and Dewey.
- **Joseph Brent, *Charles Sanders Peirce: A Life* (1993).** A frank biography of pragmatism's troubled founder.
- **Robert D. Richardson, *William James: In the Maelstrom of American Modernism* (2006).** A full life of James.
- **Robert B. Westbrook, *John Dewey and American Democracy* (1991).** The standard intellectual biography of Dewey's democratic thought.
- **Charlene Haddock Seigfried, *Pragmatism and Feminism: Reweaving the Social Fabric* (1996).** Recovers Jane Addams and other women pragmatists.
- **Cornel West, *The American Evasion of Philosophy: A Genealogy of Pragmatism* (1989).** From Emerson to Rorty, ending with "prophetic pragmatism".$pragmatism_master$,
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
  select $pragmatism_quiz$[
    {"type": "mcq", "prompt": "What is the evidence that the Cambridge discussion group of the early 1870s was called \"the Metaphysical Club\"?", "options": ["Its published minutes, signed by all members", "Only Peirce's recollection, written more than thirty years later", "A letter from Dewey describing his membership", "James's 1898 Berkeley address, which named all the members"], "answerIndex": 1, "explanation": "The name is known only from a paper Peirce wrote around 1906; no other member's writings record a club of that name. Dewey belonged to the later club Peirce founded at Johns Hopkins, not to the Cambridge group.", "id": "q1"},
    {"type": "mcq", "prompt": "In Peirce's theory of signs, which is an example of an index?", "options": ["Smoke as a sign of fire", "A portrait of a person", "A word in a language", "A map of a city"], "answerIndex": 0, "explanation": "An index is causally or physically connected with its object, as smoke is with fire. A portrait and a map are icons, which share qualities with their objects; words are symbols, connected by convention.", "id": "q2"},
    {"type": "mcq", "prompt": "Why did Peirce introduce the word \"pragmaticism\" in 1905?", "options": ["To mark his conversion to James's view of truth", "Because Dewey had asked him to rename instrumentalism", "To distinguish his doctrine from the popular \"pragmatism\" of James and Schiller, choosing a word \"ugly enough to be safe from kidnappers\"", "Because \"pragmatism\" had never appeared in print"], "answerIndex": 2, "explanation": "Seeing his word taken up by James and Schiller and then \"abused\" in literary journals, Peirce announced the birth of \"pragmaticism\". He thought James and Dewey too nominalistic.", "id": "q3"},
    {"type": "mcq", "prompt": "What does the Lippmann–Dewey \"debate\" refer to, and what has Michael Schudson argued about it?", "options": ["A public debate staged at Columbia in 1916 that Dewey won", "Dewey's reply to Lippmann's attack on Hull House", "A dispute over the Trotsky hearings of 1937", "The textbook contrast between Lippmann's doubts about \"omnicompetent\" citizens and Dewey's participatory democracy in The Public and Its Problems (1927); Schudson argues it was hardly a debate and that Lippmann was not anti-democratic"], "answerIndex": 3, "explanation": "Lippmann's Public Opinion (1922) and The Phantom Public (1925) doubted citizens' competence; Dewey answered in The Public and Its Problems (1927). Schudson (2008) questions whether this was a real debate and whether Lippmann was an anti-democratic elitist.", "id": "q4"},
    {"type": "open", "prompt": "Set out James's argument in \"The Will to Believe\" against Clifford's rule that it is always wrong to believe on insufficient evidence, and assess Kaufmann's objection.", "rubric": "A strong answer defines live, forced and momentous options and a genuine option; states the key premise that \"Believe truth! Shun error!\" are different laws, so Clifford's preference for avoiding error is itself a passional choice; notes that refusing to decide is also a decision, and the self-verifying cases of faith; and gives the conclusion that our passional nature may and must decide genuine options that evidence cannot settle. It then presents Kaufmann's charge that James blurs the difference between demanding 100 per cent proof and refusing beliefs supported only by bare possibility (and may mention Peirce's objection), and weighs James's reply: the thesis is limited to genuine options, he endorses waiting for evidence in science, and he later spoke of the \"right to believe\".", "id": "q5"},
    {"type": "open", "prompt": "Compare Peirce's and James's accounts of truth, and explain how Russell's objection applies to James and how a defender might reply.", "rubric": "A strong answer explains Peirce's view of truth as the opinion fated to be agreed by all who investigate, the end (goal) of inquiry, with the objections about convergence and lost facts and his replies; contrasts James's language of truth as what proves good in the way of belief, the expedient \"in the long run and on the whole\", and truth \"made true by events\"; presents Russell's point that \"true\" does not mean \"furthering our purposes\" and that usefulness is harder to judge than truth (and Moore's verifiability and usefulness theses, or the Santa Claus charge); and gives replies such as the SEP's view that James required a true belief not to \"clash with other vital benefits\", Haack's point about definitions and criteria, or Misak's \"pragmatic elucidation\".", "id": "q6"}
  ]$pragmatism_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/nineteenth-century/pragmatism', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

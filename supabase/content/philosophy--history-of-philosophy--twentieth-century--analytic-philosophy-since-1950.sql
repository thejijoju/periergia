-- Analytic Philosophy since 1950 — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/twentieth-century/analytic-philosophy-since-1950 @ research/advanced/read.
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
    'philosophy/history-of-philosophy/twentieth-century/analytic-philosophy-since-1950',
    'research',
    'advanced',
    'read',
    $analytic1950_master$> **After 1950 analytic philosophy, which had begun by trying to shrink philosophy to the analysis of language, went back to the oldest questions: what justice requires, what must be true, what exists, and what a mind is.** This chapter follows Oxford's ordinary language philosophers and the four women who challenged its moral philosophy; sets out John Rawls's original position step by step, with its critics; adds what the earlier chapter left out of Saul Kripke's work on names and necessity; traces the revival of metaphysics and of debates about consciousness, with Frank Jackson's "Mary" argument; and ends with experimental philosophy and the field's slow opening to other traditions.

## From Language Back to the World

The Internet Encyclopedia of Philosophy (IEP), in Aaron Preston's entry, dates the dominance of *ordinary language* analysis, at Cambridge and Oxford, to 1945–65, followed by a phase of "eclecticism or pluralism" with no shared doctrine. He sums up the change: "Linguistic philosophy gave way to the philosophy of language, the philosophy of language gave way to metaphysics, and this gave way to a variety of philosophical sub-disciplines."

Metaphysics, which the Vienna Circle had declared meaningless (see *Logical Positivism and Its Critics: the Vienna Circle, Popper and Quine*), became one of analytic philosophy's three most important fields, and ethics and political philosophy returned with equal force.

## Ordinary Language at Oxford

Another IEP entry associates "ordinary language philosophy" with the later Wittgenstein, who accepted no label (see *Wittgenstein*), and with Oxford between roughly 1945 and 1970. The Oxford philosophers were more critical of Wittgenstein than his Cambridge pupils, and keener to apply their methods to live problems.

**Gilbert Ryle** (1900–1976) attacked what he called the "Official Doctrine" of Descartes, the "Dogma of the Ghost in the Machine", in *The Concept of Mind* (1949). It is, he wrote, "one big mistake and a mistake of a special kind. It is, namely, a category-mistake." In his first illustration, paraphrased, a visitor shown Oxford's colleges, libraries and playing fields asks: "But where is the University?" The visitor puts the University in the same category as the buildings that make it up; likewise, Ryle argued, the mind is not an extra hidden thing alongside behaviour. He is often called a "logical behaviourist", but Julia Tanney, in the Stanford Encyclopedia of Philosophy (SEP), argues that his target was the *hiddenness* of inner processes, ghostly or physical.

**J. L. Austin** (1911–1960) gave lectures at Harvard in 1955, published after his death as *How to Do Things with Words* (1962). He began with utterances such as "I name this ship the Queen Elizabeth" or "I bet you sixpence it will rain tomorrow". To say these things in the right circumstances is not to describe an action but to perform one:

```quote
None of the utterances cited is either true or false: I assert this as obvious and do not argue it.
J. L. Austin · How to Do Things with Words, 2nd edn, ed. J. O. Urmson and Marina Sbisà, p. 6 · 1962 (2nd edn 1975)
```

Such *performatives* are "happy" or "unhappy": they can *misfire* (the wrong person conducts the ceremony) or be *abuses* (an insincere promise). The SEP's Guy Longworth suggests Austin set up the contrast with statements ("constatives") in order to dismantle it. From its wreckage came a lasting distinction between the *locutionary* act (saying something), the *illocutionary* act (its force: warning, promising, stating) and the *perlocutionary* act (its effect, such as persuading). The SEP judges this probably Austin's central contribution (see *Language, Thought and Speech Acts*).

**P. F. Strawson** (1919–2006) moved Oxford, in the SEP's words, back towards "traditional abstract philosophical issues". *Individuals* (1959) defended a "descriptive metaphysics", which describes the structure of our thought about the world, against the "revisionary" kind that tries to improve it. His claim that "there is a massive central core of human thinking which has no history" is recognisably Kantian (see *Kant*).

**H. P. Grice** (1913–1988) is credited by the IEP with ending the movement. His Harvard lectures of 1967 distinguished what words mean from what speakers communicate. Conversation runs on a Cooperative Principle, with maxims such as "Be relevant". Told "I'm low on gas", someone who replies "There is a station around the corner" implicates that it is open, though that can be cancelled ("but I don't know whether it is open"). Grice called such suggestions *implicatures*. If an utterance sounds odd, it may be true but misleading, so oddness no longer showed what words *meant*. That reopened, the IEP judges, the search for a systematic theory of meaning, which "finally spelled the end" of ordinary language philosophy, dated about 1965 by one IEP entry and about 1970 by another.

## Four Women and the Moral "Ought"

Four women who met at Oxford around the war, Elizabeth Anscombe, Philippa Foot, Iris Murdoch and Mary Midgley, have recently been called "the Quartet". Two books, Benjamin Lipscomb's *The Women Are Up to Something* (2021) and Clare Mac Cumhaill and Rachael Wiseman's *Metaphysical Animals* (2022), tell their story.

**G. E. M. Anscombe** (1919–2001), Wittgenstein's student and translator, in 1956 publicly opposed Oxford's honorary degree for Harry Truman, whom she considered a murderer for the deliberate killing of civilians at Hiroshima and Nagasaki; her pamphlet "Mr. Truman's Degree" (1958) says that "choosing to kill the innocent as a means to your ends is always murder". Her paper "Modern Moral Philosophy" (1958) argued that moral philosophy must wait for an adequate philosophy of psychology, and that the moral "ought" makes sense only within a law-based ethics with a divine legislator, so should be dropped. There she coined the word *consequentialism*, but for a doctrine about responsibility: that we are as responsible for consequences we merely foresee as for those we intend. On her usage Mill was *not* a consequentialist and W. D. Ross was; the word's later, broader meaning is the subject of *Consequentialism: What Makes Right Acts Right?*

**Philippa Foot** (1920–2010) invented the runaway tram case in 1967 (see *What Is Philosophy?*). It is sometimes said that she was a founding member of Oxfam, but her recorded involvement dates from 1948. In *Natural Goodness* (2001) she judged human goodness, like that of any living thing, against the life form of its kind. The novelist **Iris Murdoch** (1919–1999), whose first book was on Sartre (1953), drew on Continental, Christian, Hindu and Buddhist thought. In *The Sovereignty of Good* (1970) a mother-in-law, M, who finds her son's wife D vulgar and juvenile, works without any change in behaviour to see her justly, and comes to see her as "refreshingly simple" and "delightfully youthful". For Murdoch this inner *attention* is real moral activity, which the moral philosophy of her day left no room for:

```quote
We cease to be in order to attend to the existence of something else.
Iris Murdoch · "On 'God' and 'Good'", in The Sovereignty of Good (Routledge & Kegan Paul), p. 59 · 1970
```

**Mary Midgley** (1919–2018) wrote her first book, *Beast and Man* (1978), in her late fifties, arguing that humans must be understood as a kind of animal. She compared philosophy to plumbing: when things go wrong, "we have to take up the floorboards and look at the concepts of even the most ordinary piece of thinking".

Others took them up in public. The first volume of the journal *Philosophy & Public Affairs* (1971–72) carried Judith Jarvis Thomson's "A Defense of Abortion": you wake back to back with an unconscious violinist; a Society of Music Lovers has kidnapped you because only your blood type can save him, and unplugging him, before roughly nine months are up, would kill him. Even granting the fetus a right to life, Thomson argued, it has no right to use another's body. In the same volume (1972) Peter Singer, writing about refugees starving during the Bangladesh Liberation War, argued that if we can prevent something bad without sacrificing anything of comparable moral importance, we ought to. "It makes no moral difference whether the person I can help is a neighbor's child ten yards from me or a Bengali whose name I shall never know, ten thousand miles away." The paper later influenced the effective altruism movement.

## Rawls and the Original Position

{{image: John Rawls | John Rawls in 1971, the year *A Theory of Justice* was published.}}

**John Rawls** (1921–2002), from Baltimore, taught at Harvard for over thirty years. *A Theory of Justice* (1971) called justice "the first virtue of social institutions" and set out to give a "workable and systematic moral conception to oppose" utilitarianism. Its central argument runs:

1. The question is what terms of cooperation free and equal citizens would agree to under fair conditions; the agreement is "frankly and completely hypothetical", in the tradition of Locke, Rousseau and Kant.
2. Nobody deserves to be born rich or poor, gifted or not, male or female, of one race or another; these facts are "morally arbitrary", so they should not shape the terms.
3. So the parties choose behind a *veil of ignorance*: they do not know the race, gender, wealth, talents, religion or generation of those they represent, only general facts. They want more rather than fewer *primary goods*: rights, liberties, opportunities, income and wealth, and the social bases of self-respect.
4. They compare Rawls's principles with average and classical utilitarianism. Since they cannot assign reliable probabilities, and some outcomes could not be accepted and lived with, it is rational to follow *maximin*: choose the option whose worst outcome is best.
5. Under utilitarianism a weak minority's liberties might be sacrificed for the majority's gain; no party would gamble with the deepest commitments of those it represents.
6. So they choose two principles. In the 1971 wording: "Each person is to have an equal right to the most extensive total system of equal basic liberties compatible with a similar system of liberty for all" (later revised to "a fully adequate scheme"); and social and economic inequalities must be attached to positions open to all "under conditions of fair equality of opportunity" and be "to the greatest benefit of the least advantaged members of society". The last clause is the *difference principle*. Liberty takes priority over the rest.

The strongest objection came from John Harsanyi (1953, 1975): a rational chooser who does not know where she will land should treat each position as equally likely, and so choose *average* utility; maximin is a timid, risk-averse rule. The reply, in the SEP's accounts (Samuel Freeman; Leif Wenar), is that the parties are not psychologically cautious: when fundamental interests are at stake and there are no "do-overs", choosing conservatively is rational, as buying insurance is.

Critics came from every side. Nozick's *Anarchy, State, and Utopia* (1974) defended a minimal state and called taxation "on a par with forced labor". His Wilt Chamberlain example starts from any just distribution you like; then a million fans each pay Chamberlain 25 cents to see him play, and he ends up with \$250,000. "If the people were entitled to dispose of the resources to which they were entitled (under D1), didn't this include their being entitled to give it to, or exchange it with Wilt Chamberlain?" Any "patterned" principle, Nozick concluded, requires continual interference in people's lives. Sandel's *Liberalism and the Limits of Justice* (1982) and Taylor charged Rawls with an overly individualistic picture of the self, stripped of the communal attachments that make us who we are; Susan Moller Okin's *Justice, Gender, and the Family* (1989) argued that Rawls and others assumed the family is just, though children learn their values there, while using Rawls's own tools to extend justice to women. Charles W. Mills's *The Racial Contract* (1997) argued that the supposedly race-neutral contracts of Hobbes, Locke, Rousseau and Kant were a "racial contract"; Mills later argued for a non-ideal, race-conscious use of Rawls's framework, while Tommie Shelby defended Rawls's ideal theory (see *Justice and Equality* and *Race, Colonialism and Philosophy*). Rawls's own *Political Liberalism* (1993) answered the problem of deep disagreement with an *overlapping consensus*, in which citizens endorse the same political conception for different reasons.

```checkpoint
q: What was Harsanyi's main objection to the argument from the original position?
a*: That rational choosers ignorant of their position should treat each position as equally likely and choose average utility, so maximin is irrationally risk-averse.
a: That the veil of ignorance hides too little, since the parties know their own talents.
x: Rawls's veil hides the parties' talents; Harsanyi accepted the ignorance and disputed the rule of choice.
a: That any just pattern of holdings will be upset by free exchanges, as in the Wilt Chamberlain case.
x: That is Nozick's objection, aimed at patterned principles in general.
a: That the original position assumes an individual stripped of community ties.
x: That is the communitarian objection of Sandel and Taylor.
hint: Ask which rule of choice under uncertainty Harsanyi thought rational.
why: Harsanyi (1953, 1975) argued that equal probabilities lead to average utilitarianism. Rawlsians reply that maximin is rational, not timid, when fundamental interests are at stake and there are no "do-overs", as with insurance.
---
q: When Anscombe coined "consequentialism" in 1958, what did she mean by it?
a: Any theory on which the rightness of an act depends only on its outcomes.
x: That is the broader later sense; on Anscombe's usage even Mill, the classic utilitarian, was not a consequentialist.
a: The view that we should maximise happiness, as Bentham taught.
x: That is classical utilitarianism, not her original sense.
a*: A doctrine about responsibility: that we are as responsible for foreseen consequences as for intended ones.
a: A doctrine that only the consequences of law-based divine commands matter.
x: She linked the moral "ought" to a divine legislator, but that was a separate thesis.
hint: Her examples placed W. D. Ross inside the group and Mill outside it.
why: In "Modern Moral Philosophy" the term named a view, traced to Sidgwick, that erases the moral difference between intended and merely foreseen consequences. Its sense broadened later.
```

## Kripke: Names, Necessity and Water

**Saul Kripke** (1940–2022), who grew up in Omaha, gave three lectures at Princeton in January 1970, *Naming and Necessity* (published 1972; book 1980). The attack on *descriptivism*, the view that a name means or is fixed by a description ("Socrates" as "the teacher of Plato"), is set out in *Frege, Russell and the Birth of Analytic Philosophy*. Four further parts matter here.

The first is the Gödel case. If the incompleteness proof credited to Gödel was really by an unknown Schmidt, descriptivism implies that "Gödel" refers to Schmidt; intuitively it still refers to Gödel. The second is Kripke's alternative, which he refused to call a theory: a name is fixed by an initial "baptism" and passed along a chain of communication, and later users need not remember from whom they got it. Evans (1973) objected with *Madagascar*: in Evans's (historically doubtful) example, Marco Polo took a native name for part of the African mainland to name the island, and the reference changed, which a pure chain from baptism cannot explain. Michael Devitt replied that a name can be "grounded" in an object many times, so later groundings can shift its reference; Evans proposed instead that the dominant source of information fixes it.

The third and fourth concern necessity. Kripke separated the *analytic* (true by meaning), the *necessary* (true in every possible world) and the *a priori* (knowable without experience). Names are *rigid*: they pick out the same object in every possible world where it exists. So a true identity between two names, "Hesperus is Phosphorus", is necessary, though it was discovered empirically; likewise, Kripke argued, "Water is H₂O". These *necessary a posteriori* truths contradict the assumption, made for instance by Kant, that necessary truths are known a priori (see *Kant*). Conversely, if someone fixes the meaning of "one metre" as the length of a particular stick in Paris at a particular time, they know without investigation that the stick is a metre long then, yet it might have been longer: a *contingent a priori* truth. The IEP notes that Ruth Barcan Marcus developed a direct theory of reference independently, and Quentin Smith's 1995 claim that she anticipated Kripke's key ideas remains controversial (see *Meaning and Reference* and *Possibility and Necessity*).

**Hilary Putnam** (1926–2016) went further. Imagine, in 1750, before chemistry, a Twin Earth exactly like Earth except that its watery stuff is a different substance, XYZ. Oscar and his twin are molecule-for-molecule duplicates in identical inner states, yet Oscar's "water" refers to H₂O and his twin's to XYZ. In Putnam's words in "The Meaning of 'Meaning'" (1975): "Cut the pie any way you like, 'meanings' just ain't in the head." The SEP calls this "initially over-exuberant": the sound conclusion is about how mental states are individuated, not where they are located.

## Metaphysics Returns

The return had begun with W. V. O. Quine's "On What There Is" (1948), which offered a test of what a theory says exists: it is "committed to those and only those entities to which the bound variables of the theory must be capable of referring in order that the affirmations made in the theory be true". The IEP adds the collapse of the theories of meaning that had banned metaphysics, Strawson's descriptive metaphysics, and Kripke's and Marcus's work, which made necessity and essence respectable again.

**David Lewis** (1941–2001), tutored by Iris Murdoch during a year at Oxford, went furthest. Things could have been different in countless ways, he wrote in *Counterfactuals* (1973), and "I prefer to call them 'possible worlds.'" His *modal realism*, defended in *On the Plurality of Worlds* (1986), holds that other worlds are as concrete as ours and cut off from it in space and time; something is possible if it is true in some world, where individuals have *counterparts*. The obvious objection is the "incredulous stare"; Lewis conceded that his view "does disagree, to an extreme extent, with firm common sense opinion about what there is", but argued that no rival explained so much so economically. D. M. Armstrong (1926–2014), by contrast, defended real universals in *Universals and Scientific Realism* (1978) and a naturalist account of possibility (see *What Exists? Ontology and Universals*).

By the 2000s philosophers argued about metaphysics itself. Schaffer, in the volume *Metametaphysics* (2009), and Fine elsewhere made metaphysics the study of what *grounds* what, and Sider later (2011) the study of the world's fundamental structure, while deflationists such as Amie Thomasson, heirs of Carnap, doubted that many disputes about existence are substantive.

## Minds after Behaviourism

In 1956 U. T. Place asked "Is Consciousness a Brain Process?", after discussions in Adelaide with J. J. C. Smart, then a Rylean behaviourist who, unable to refute Place, converted. Their *identity theory* held that sensations are brain processes, as lightning is a motion of electric charges. Putnam (1967) replied that pain is felt by mammals, birds, reptiles and octopuses, which are unlikely to share one brain state; so pain is not identical to any single physical kind. *Functionalism* defines mental states instead by their causal or functional roles; early versions, including Putnam's, modelled the mind on a Turing machine. Block objected that a system could fill all the roles yet have different experiences, or none. Donald Davidson's *anomalous monism* (1970) held that every mental event is a physical event, though no strict laws link mental and physical descriptions.

Then the experiences came back. Thomas Nagel's "What Is It Like to Be a Bat?" (1974) proposed that "an organism has conscious mental states if and only if there is something that it is like to *be* that organism"; knowledge of bat sonar would not tell us what it is like, though Nagel claimed only that we do not understand how physicalism could be true. Frank Jackson's "Epiphenomenal Qualia" (1982) imagined Mary, a brilliant neuroscientist who knows all the physical information about colour vision but has lived in a black-and-white room. When she leaves, "It seems just obvious that she will learn something about the world and our visual experience of it ... Ergo there is more to have than that, and Physicalism is false." In the SEP's reconstruction:

1. Before her release, Mary has complete physical knowledge about human colour vision.
2. So she knows all the physical facts about it.
3. There is some knowledge about colour vision she lacks before her release.
4. So there are facts about colour vision she does not know.
5. So there are non-physical facts about human colour vision.

Daniel Dennett doubted the story itself: a Mary who really knew everything physical could work out what colours are like, and would not be fooled if handed a blue banana. The *ability hypothesis* of Lewis and Nemirow denies step 3: Mary gains abilities to recognise and imagine, not facts. "It isn't knowing-that. It's knowing-how," wrote Lewis, echoing Ryle. The majority physicalist reply, "new knowledge, old fact", grants step 3 but denies step 4: Mary learns an old physical fact under a new concept, as one may learn "I am in Amsterdam" without learning a new fact about the world. Jackson himself changed his mind: by 1995 he held that something must be wrong with the argument, and later answered it with a representational theory of experience (see *Consciousness*).

John Searle (1932–2025) argued in 1980 that a man following rules to answer Chinese symbols could seem to understand Chinese without understanding a word, so running a program is not enough for understanding. To the reply that the whole system understands, Searle answered that he could memorise the rules and still understand nothing (see *Minds and Machines: Could AI Think?*). David Chalmers named the "hard problem" in 1994–95: even after the functions are explained, "Why is the performance of these functions accompanied by experience?" He invoked *zombies*, creatures physically and functionally identical to us but lacking consciousness, much as Kripke's third lecture had argued that pain without C-fibre firing seems possible. At the other pole, *eliminative materialists* such as Paul and Patricia Churchland held that common-sense psychology may be so wrong that some of the states it posits do not exist, and Dennett (1942–2024) argued in "Quining Qualia" (1988) that our concepts of experience are confused (see *The Mind–Body Problem*).

```checkpoint
q: How does the ability hypothesis answer Jackson's knowledge argument?
a: It denies that Mary really knew all the physical facts before her release.
x: That is closer to Dennett's reply, with the blue banana.
a*: It says Mary gains new abilities, to recognise and imagine colours, rather than knowledge of new facts.
a: It says Mary learns an old physical fact under a new concept.
x: That is the "new knowledge, old fact" reply, which accepts that she gains knowledge-that.
a: It says experiences are non-physical but have no effects.
x: That is Jackson's original epiphenomenalism, which the ability hypothesis rejects.
hint: Think of Ryle's distinction between knowing how and knowing that.
why: Lewis and Nemirow held that knowing what red is like is having abilities; as Lewis put it, "It isn't knowing-that. It's knowing-how."
---
q: Why is Evans's Madagascar example a problem for Kripke's causal picture of names?
a: It shows that speakers need uniquely identifying descriptions to refer.
x: Evans was not defending classic descriptivism; Kripke's Feynman case counts against that.
a: It shows that names are not rigid designators.
x: The example concerns how reference is fixed and passed on, not rigidity across possible worlds.
a: It shows that identity statements between names are contingent.
x: That is the view Kripke attacked with Hesperus and Phosphorus.
a*: The name's reference shifted from part of the mainland to the island, which a pure chain back to an initial baptism cannot explain.
hint: Marco Polo applied a name to something it had not originally named.
why: A chain from baptism would keep "Madagascar" on the mainland. Devitt replied that names can be grounded in objects many times; Evans proposed that the dominant source of information fixes reference.
```

## Testing Intuitions, Widening the Map

Gettier's paper of 1963 (see *What Is Knowledge? From Plato to the Gettier Problem*), like Kripke's Gödel case, worked by appeal to intuitions about cases. *Experimental philosophy*, often dated to 2001, began testing such intuitions. Knobe (2003) described a company chairman who knows a profitable programme will affect the environment: only 23% of people said he helped it intentionally when it helped, but 82% said he harmed it intentionally when it harmed. Machery, Mallon, Nichols and Stich (2004) gave the Gödel case to students at Rutgers and the University of Hong Kong: 56.5% of Western but 31.5% of East Asian participants gave Kripke's answer. Replications are mixed, and whether such intuitions are universal remains open.

Other traditions arrived more slowly. In April 1958 Ryle, Austin and others met Merleau-Ponty (see *Phenomenology: Husserl, Heidegger and Merleau-Ponty*) and other French philosophers at a colloquium at Royaumont presided over by Jean Wahl; when Merleau-Ponty reportedly asked "Aren't our programs the same?", Ryle answered "I hope not!" (the received story has since been questioned). There were bridges: Murdoch's Sartre, Derrida's quarrel with Searle over Austin (see *Structuralism and After: Foucault, Derrida and Their Critics*), and Kwasi Wiredu, who studied under Ryle (see *African Philosophy: the Ethnophilosophy Debate and Beyond*). In the SEP's words, only in the 1970s, through B. K. Matilal, did the Indian analytic tradition begin to be recognised in the West (see *Modern Chinese and Indian Philosophy*); his student Jonardon Ganeri carried that work on. Jay Garfield translated Nāgārjuna (1995; see *Mahāyāna Philosophy: Nāgārjuna, Yogācāra and Buddhist Logic*) and in 2016, with Bryan Van Norden, wrote "If Philosophy Won't Diversify, Let's Call It What It Really Is" for the *New York Times*; critics replied that philosophy is by definition the tradition descending from Plato and Aristotle. Robert Brandom's theory of meaning is introduced in *American Pragmatism: Peirce, James and Dewey*.

The profession also turned on itself. Sally Haslanger (2008) published figures on women's place in leading American departments, a reported range of 4 to 36 per cent of faculty, arguing that reason alone would not change the discipline's culture; Sesardic and De Clercq disputed what the figures showed. Her "ameliorative" metaphysics asked what concepts of gender and race we *should* use (see *Feminist Philosophy*). Kwame Anthony Appiah, raised in Kumasi, argued that since biological races do not exist, "race" refers to nothing real, later moving to a "racial nominalism" (2006). Analytic philosophy after 1950 did not settle its big questions; it reopened them, and then asked who had been left out.

## Further exploration

- **Saul A. Kripke, *Naming and Necessity* (1980).** The lectures themselves, unusually readable for a classic of logic and language.
- **Benjamin J. B. Lipscomb, *The Women Are Up to Something: How Elizabeth Anscombe, Philippa Foot, Mary Midgley, and Iris Murdoch Revolutionized Ethics* (2021).** A group biography of the Oxford quartet and their attack on post-war moral philosophy.
- **Clare Mac Cumhaill and Rachael Wiseman, *Metaphysical Animals: How Four Women Brought Philosophy Back to Life* (2022).** The same four women as metaphysicians as well as moralists.
- **Charles W. Mills, *The Racial Contract* (1997).** A short, polemical rereading of the social-contract tradition, reissued for its 25th anniversary in 2022.
- **David J. Chalmers, *The Conscious Mind: In Search of a Fundamental Theory* (1996).** The hard problem of consciousness at book length.
- **Jay L. Garfield, *Engaging Buddhism: Why It Matters to Philosophy* (2015).** An analytic philosopher's case for reading Buddhist philosophy as live philosophy.
- **Jonardon Ganeri, *The Lost Age of Reason: Philosophy in Early Modern India 1450–1700* (2011).** Navya-Nyāya and early modern Indian philosophy, by Matilal's student.$analytic1950_master$,
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
  select $analytic1950_quiz$[
    {"type": "mcq", "prompt": "Which of these did Kripke offer as an example of a necessary truth that is known only a posteriori?", "options": ["\"Hesperus is Phosphorus\"", "\"The standard metre stick is one metre long at the time it was used to fix the metre\"", "\"All bachelors are unmarried\"", "\"Gödel proved the incompleteness of arithmetic\""], "answerIndex": 0, "explanation": "An identity between two rigid names is necessary, yet it was discovered empirically. The standard metre case is Kripke's example of the contingent a priori; the bachelor sentence is a standard analytic truth; and the Gödel–Schmidt case concerns how names refer, not necessity.", "id": "q1"},
    {"type": "mcq", "prompt": "What was the point of Nozick's Wilt Chamberlain example?", "options": ["That the veil of ignorance hides too much from the parties", "That free exchanges from any just starting pattern upset the pattern, so patterned principles require continual interference in people's lives", "That maximin is an irrationally risk-averse rule", "That the social contract tradition was really a racial contract"], "answerIndex": 1, "explanation": "Fans freely paying Chamberlain 25 cents each move society from the favoured distribution to a new one; Nozick asked whether people entitled to their resources were not entitled to give them to him. Harsanyi criticised maximin, and Mills wrote of a racial contract.", "id": "q2"},
    {"type": "mcq", "prompt": "According to the IEP, what finally brought ordinary language philosophy to an end?", "options": ["Austin's death in 1960", "The publication of Strawson's Individuals", "Grice's distinction between what words mean and what speakers communicate, which reopened the search for a systematic theory of meaning", "Kripke's lectures on Naming and Necessity"], "answerIndex": 2, "explanation": "Grice showed that an utterance can sound odd because it is misleading rather than false, so appeals to oddness did not reveal meaning. The IEP says this reopened systematic semantics and 'finally spelled the end' of the movement, dated about 1965 or 1970.", "id": "q3"},
    {"type": "mcq", "prompt": "What did Knobe's 2003 study of the company chairman find?", "options": ["Most people said the chairman acted intentionally whether the side effect helped or harmed the environment", "East Asian participants judged the case differently from Western participants", "Most people said the chairman acted unintentionally in both versions", "People were far more likely to call a harmful side effect intentional (82%) than a helpful one (23%)"], "answerIndex": 3, "explanation": "This asymmetry is the 'side-effect effect' or 'Knobe effect'. The East–West difference comes from Machery and colleagues' 2004 study of Kripke's Gödel case.", "id": "q4"},
    {"type": "open", "prompt": "Set out Rawls's argument from the original position step by step. Then explain Harsanyi's objection and the Rawlsian reply, and describe one later critic (Nozick, Sandel, Okin or Mills).", "rubric": "A strong answer covers the hypothetical agreement of free and equal citizens; the moral arbitrariness of birth, class, talent, sex and race; the veil of ignorance and primary goods; the choice between Rawls's principles and utilitarianism; maximin and its conditions; and the two principles (equal basic liberties; fair equality of opportunity and the difference principle), with liberty's priority. It explains Harsanyi's claim that equal probabilities lead to average utility and the reply that conservative choice is rational with fundamental interests at stake and no 'do-overs', as with insurance. It accurately presents one critic: Nozick's Wilt Chamberlain argument against patterned principles; Sandel's charge of an overly individualistic self; Okin on the unexamined justice of the family; or Mills's racial contract.", "id": "q5"},
    {"type": "open", "prompt": "Set out Jackson's knowledge argument ('Mary') as numbered premises and conclusion, then assess it using at least two replies: Dennett's, the ability hypothesis and 'new knowledge, old fact'. What did Jackson himself later conclude?", "rubric": "A strong answer gives the premises: Mary has complete physical knowledge of colour vision, so knows all the physical facts; she lacks some knowledge before release; so there are facts she does not know, and so non-physical facts. It explains Dennett's doubt that such a Mary would learn anything (the blue banana); the ability hypothesis of Lewis and Nemirow (she gains abilities, knowing-how, not facts, echoing Ryle); and the new-knowledge/old-fact reply (an old fact under a new concept, as with learning 'I am in Amsterdam'), saying which premise each rejects. It notes that Jackson changed his mind, holding by 1995 that the argument must go wrong and later adopting representationalism.", "id": "q6"}
  ]$analytic1950_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/twentieth-century/analytic-philosophy-since-1950', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

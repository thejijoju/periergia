-- Language, Thought and Speech Acts — canonical master article, co-written and human-reviewed.
-- philosophy/science-and-language/language-and-thought @ research/advanced/read.
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
    'philosophy/science-and-language/language-and-thought',
    'research',
    'advanced',
    'read',
    $language_master$> **What do we do with words, and what do words do to us?** This chapter looks at language in use: Austin's discovery that saying can be doing, Searle's system and Grice's account of how we mean more than we say, then their use in arguments about silencing and hate speech. It sets beside them Confucian and Indian views of names, sentences and cognition; asks whether the language we speak shapes how we think; and reconstructs Chomsky's argument that language is innate, with the challenge now posed by large language models.

## Language as Activity

The chapter on *Wittgenstein* describes the later Wittgenstein's picture of language as a set of activities. One example makes the point: the single word "Water!", he observed in *Philosophical Investigations* §27, can be an exclamation, an order, a request or an answer. The Internet Encyclopedia of Philosophy (IEP) credits this turn with "a new concern for the 'pragmatic' dimensions of language usage": what speakers *do* with sentences. Some British philosophers, impatient with followers of Wittgenstein who saw almost no role for theory, turned instead to "speech act theory, led initially by the work of John Austin". Whether Wittgenstein influenced Austin directly is less clear; Guy Longworth, in the Stanford Encyclopedia of Philosophy (SEP), calls it only "plausible".

## Austin: Saying as Doing

John Langshaw Austin (1911–1960) was White's Professor of Moral Philosophy at Oxford. The chapter on *Analytic Philosophy since 1950* tells how his 1955 Harvard lectures became *How to Do Things with Words* (1962), and introduces his **performatives**, utterances such as "I name this ship the *Queen Elizabeth*" that do not describe an act but perform one. This section looks at the machinery underneath.

A performative can go wrong without being false. Austin set out the conditions for a happy, or **felicitous**, performance. If the first group fails, the act **misfires** and is "null and void": there must be an accepted conventional procedure, invoked by the right people in the right circumstances, and carried out correctly and completely. If the second group fails, the act is performed but **abused**, hollow: the participants must have the appropriate thoughts, feelings or intentions, and must afterwards behave accordingly. A wedding misfires if one party is "married already"; an insincere marriage of convenience is an abuse.

Having contrasted performatives with **constatives** (statements, true or false), Austin then argues that the contrast collapses:

1. Constatives can be infelicitous in just the ways performatives can. "France is hexagonal" misfires if there is no France, and asserting what one does not believe is an abuse.
2. Performatives answer to the facts. "I warn you that the bull is about to charge" is mistaken if the bull is not about to charge; a verdict can be fair or unfair, advice good or bad.
3. "I state that…" has every formal mark of a performative, yet it is "surely the making of statements, and surely … essentially true or false".
4. So no simple line divides saying from doing: "to say something is always to do something".

Did Austin mean to arrive here? Some read him as trying to defend the distinction and failing. Longworth calls that "possible, but implausible": the book's structure suggests Austin built the distinction to show there is "no such simple distinction", and an early footnote warns that "Everything said in these sections is provisional".

In place of the distinction Austin offered three acts done in any utterance. The **locutionary** act is saying something with a certain meaning; the **illocutionary** act is what one does *in* saying it (stating, warning, promising), classified by its **force**; the **perlocutionary** act is what one brings about *by* saying it, its effects on the hearer's feelings, thoughts or actions. Warning you that the ice is thin is an illocution; persuading you to stay off it is a perlocution. Austin's last lecture tentatively sorted illocutions into five classes: **verdictives** (acquitting), **exercitives** (appointing, ordering), **commissives** (promising), **behabitives** (apologising, thanking) and **expositives** (stating, describing). Truth itself came out looking like one dimension of assessment among others.

```quote
'true' and 'false', like 'free' and 'unfree', do not stand for anything simple at all; but only for a general dimension of being a right and proper thing to say as opposed to a wrong thing, in these circumstances, to this audience, for these purposes and with these intentions.
J. L. Austin · How to Do Things with Words · 1962
```

## Searle and the Rules of Speech

John Searle (1932–2025), who taught at Berkeley from 1959, turned Austin's sketch into a system. (In 2019 his emeritus status was revoked after he was found to have engaged in sexual harassment and retaliation against a former student.) *Speech Acts* (1969) treats speaking as an activity governed by **constitutive rules**, rules that create an activity as the rules of chess create chess.

In 1975 he criticised Austin's classes as "unduly lexicographic", a catalogue of English verbs, and as lacking clear principles. His replacement has five classes: **assertives**, **directives**, **commissives**, **expressives** and **declarations**, sorted partly by their **direction of fit**. In Anscombe's example, a husband's shopping list and a detective's record of what he buys may be identical, but if they diverge the husband should change the cart (world-to-word fit) and the detective his list (word-to-world). Assertions fit words to world, commands world to words; thanking seems to have no direction at all.

Searle also explained **indirect speech acts**: "Can you pass the salt?" is a question about ability used as a request, and the hearer works out its real force by the kind of reasoning Grice described (below). Is an illocution, then, fixed by **convention**, as Austin and Searle held, or by the speaker's recognisable **intention**? Kent Bach and Robert Harnish argue the link is "never semantic, or conventional, but rather inferential"; Marina Sbisà defends a conventionalism on which illocutions create obligations and entitlements.

Jacques Derrida's "Signature Event Context", delivered in Montreal in 1971 and translated in the first issue of *Glyph* (1977) alongside Searle's reply, challenged Austin's treatment of "non-serious" uses, such as lines spoken on stage, as derivative. The chapter *Structuralism and After: Foucault, Derrida and Their Critics* tells that story; when Derrida's side was collected as *Limited Inc* (1988), Searle refused permission to reprint his reply.

## Grice: Meaning More Than We Say

Paul Grice (1913–1988), who moved from Oxford to Berkeley in 1967, began with his paper "Meaning" (1957). "Those spots mean measles" is **natural meaning**: a symptom, no one's intention. When George says "You make a better door than a window" and means that you should move, that is **non-natural**, or speaker, meaning. A driver who flashes her lights at night intends (1) that you believe your lights are off, (2) that you recognise this intention, and (3) that your recognition be part of your reason for believing it. Herod, showing Salome the head of John the Baptist, did not *mean* that John was dead: her reason to believe it was the head itself.

His 1967 Harvard lectures, published in *Studies in the Way of Words* (1989), added the theory of **implicature**: what a speaker conveys beyond what she literally says. Its core is the **Cooperative Principle**: "Make your conversational contribution such as is required, at the stage at which it occurs, by the accepted purpose or direction of the talk exchange in which you are engaged." "Echoing Kant", Grice divided it into four maxims: **Quantity** (be as informative as required, and no more), **Quality** (try to say what is true, and nothing for which you lack evidence), **Relation** ("Be relevant") and **Manner** ("Be perspicuous": avoid obscurity and ambiguity, be brief and orderly).

Implicatures often arise when a speaker **flouts** a maxim, breaching it openly. Grice's best-known case is a reference for a candidate for a philosophy job: "Dear Sir, Mr. X's command of English is excellent, and his attendance at tutorials has been regular. Yours, etc." The reasoning can be reconstructed:

1. The writer said only that X's English is excellent and his attendance regular.
2. He is presumed to be cooperating: had he wished not to, why write at all?
3. He knows more, since X is his pupil, and knows that more is wanted; so on its face he breaches the first maxim of Quantity.
4. The breach fits cooperation only if he thinks something he will not write down.
5. The only plausible candidate is that X is no good at philosophy.
6. The writer knows the reader can work this out, and does nothing to block it.
7. So he implicates that X is no good at philosophy.

This is implicature, not literal meaning: it is **calculable**, worked out by reasoning, and **cancellable**: adding "and he is the best philosopher I have taught" removes it without contradiction. **Conventional** implicatures, by contrast, are carried by particular words. "The queen is English and therefore brave" suggests that her bravery follows from her Englishness; "The queen is English and brave" does not.

**Objection.** Wayne Davis argues that the letter works by a learned convention, a "mode of speech" (damning with faint praise), recognised by precedent rather than calculated afresh; Calculability is an empirical hypothesis "that may turn out to be false". **Reply.** Griceans answer that the mode itself is explained by, and could be re-derived from, the maxims; many theorists treat Calculability as true by definition of conversational implicature.

A broader rival is **relevance theory**. Dan Sperber and Deirdre Wilson (1986) argued that "all Grice's maxims can be replaced by a single principle of relevance", where relevance rises with an utterance's cognitive effects and falls with the effort of processing it: "You have the flu" is more relevant than "You are ill". Davis objects that maximal relevance fails to predict even simple implicatures. The maxims have been questioned across cultures too: Keenan (1976) argued that Malagasy speakers routinely give less information than required, and Harnish replied that the maxims hold only where cooperation is in force.

```checkpoint
q: According to Austin, what is the difference between a misfire and an abuse?
a*: In a misfire the act is not performed at all; in an abuse it is performed but hollow, as when the speaker lacks the required intentions.
a: A misfire is a false statement; an abuse is a true statement made rudely.
x: Felicity is not truth; Austin's point is that performatives can go wrong without being false.
a: A misfire is a perlocution that fails; an abuse is an illocution that succeeds.
x: The misfire–abuse distinction concerns failures of conventional procedures, not the three acts introduced later.
a: Misfires affect promises only; abuses affect statements only.
x: Austin's examples include weddings and ship-namings, and he later argued that statements can misfire and be abused too.
hint: Compare a wedding conducted by the purser with an insincere marriage of convenience.
why: Breaches of conditions A and B make the act "null and void"; breaches of C, such as insincerity, leave the act done but abused. Austin then showed that constatives suffer the same infelicities, one step in his case against the performative–constative distinction.
---
q: Which feature shows that "Some athletes smoke" only implicates, rather than entails, "Not all athletes smoke"?
a: The implication is carried by the word "some" in every possible context.
x: Being carried by a form of words would make it generalised, but does not by itself show it is an implicature rather than an entailment.
a: The speaker could not have meant "not all" without saying it.
x: Implicatures are precisely things meant without being said.
a*: It can be cancelled ("…in fact, all do") without contradiction.
a: The sentence would be false if all athletes smoked.
x: If all athletes smoke, it is still true that some do; that is why the implication is not an entailment.
hint: Try adding a clause that denies the implication and see whether the result is self-contradictory.
why: Conversational implicatures are cancellable and logical entailments are not. The "some, so not all" inference is a scalar implicature, explained by the maxim of Quantity.
```

## Speech That Silences

Catharine MacKinnon argued that pornography does not merely cause harm but *constitutes* women's subordination and silencing. With Andrea Dworkin she drafted an ordinance for Minneapolis (1983); Indianapolis passed one in 1984, defining pornography as "the graphic sexually explicit subordination of women" and offering civil remedies rather than criminal bans. The federal Seventh Circuit court struck it down on First Amendment grounds in *American Booksellers Association v. Hudnut* (1985), and the US Supreme Court summarily affirmed in 1986.

Rae Langton, who in 2017 became the first woman to hold the Knightbridge Professorship of Philosophy at Cambridge, defended MacKinnon's claims with Austin's tools in "Speech Acts and Unspeakable Acts" (1993), later developed with Jennifer Hornsby. She distinguished three kinds of silencing. **Locutionary** silencing stops someone saying the words at all, by violence or intimidation. **Perlocutionary frustration** lets the act happen but blocks its intended effect. **Illocutionary disablement** is subtler: the setting prevents **uptake**, the hearer's recognition of what is being done, so the act is not performed at all. Langton's central example is a woman whose "No" is not recognised as a refusal: on her account she is prevented from refusing, not merely from being obeyed. If pornography silences in this way, the liberal remedy of answering bad speech with more speech may fail, because the relevant speech acts become "unspeakable" for women.

**Objection.** Ronald Dworkin (1993) answered that a right to free speech cannot include a right to "a sympathetic or even competent understanding of what one says". Creationists, flat-earthers and bigots are ridiculed and misunderstood, yet their right to speak is not violated. A right to be understood would license regulation "on a massive scale", which he called a recipe for "tyranny". The objection has real force: unpopular speakers routinely fail to secure uptake, so the argument seems to prove too much. **Reply.** Hornsby and Langton (1998) and West (2003) answered that freedom of speech, to be valuable, requires the absence of *systematic* barriers to uptake, not a guarantee of sympathy. Many critics remain unpersuaded, and the debate is open.

On hate speech, Maitra and Mary Kate McGowan distinguish **constitutive** harms, done *in* speaking, from **consequential** harms that follow from it. McGowan argues that some hate speech enacts discriminatory norms, as a "Whites Only" sign does, and could be restricted on that ground; Critics such as Kukla doubt the line can be drawn neatly, since illocutions themselves need uptake, and others prefer "supported counterspeech", in which the state helps targets answer back. Sally Haslanger adds that even a true **generic** such as "women are submissive" suggests the trait lies in "the very nature of women" rather than in changeable circumstances.

## Names, Sentences and Cognition beyond Europe

The idea that language is a form of action is not only European. Confucius warned in *Analects* 13.3 that when names are not used properly, affairs fail and punishments miss the mark; "when the exemplary person puts a name to something, it can certainly be spoken, and when spoken it can certainly be acted upon" (tr. Ames and Rosemont). The doctrine, *zhengming*, is traditionally "rectification of names", now often "ordering of names". Xunzi's chapter "Correct Naming" says the wise instituted names first "to clarify noble and base", then to distinguish same and different. On Chad Hansen's reading in *Language and Logic in Ancient China* (1983), early Chinese thinkers cared less about theories of truth than about "the pragmatic, behavior-guiding functions of language"; the comparison with Austin is this chapter's, not Hansen's.

In India, Mīmāṃsā thinkers and later other schools set conditions for a string of words to make a sentence: mutual expectancy (*ākāṅkṣā*), semantic fitness (*yogyatā*), proximity (*sannidhi*) and, for some, the speaker's intention or purport (*tātparya*), which a modern reader may set beside Grice. The grammarian Bhartṛhari (fl. c. fifth–sixth century CE), in his *Vākyapadīya*, held that the indivisible sentence, not the word, is the real unit of meaning, grasped in a flash. He also made a very strong claim about language and thought: there is no cognition in the world that is not permeated by the word. That thesis concerns all cognition, not, as with Whorf below, differences between speakers of different languages. The chapter on *Meaning and Reference* covers Indian theories of word meaning.

## Does Language Shape Thought?

Hamann, Herder and Wilhelm von Humboldt stressed how diverse languages shape thought; Humboldt wrote that it "is not a diversity of signs and sounds but a diversity of views of the world". (He also ranked languages like German and English as "the most perfect", a reminder of how such ideas were tied to hierarchies of peoples.) In America the line ran from Franz Boas to Edward Sapir to Benjamin Lee Whorf (1897–1941), a chemical engineer by training who worked in fire prevention for an insurance company and studied with Sapir at Yale. He noticed workers smoking beside "empty" petrol drums, which, full of vapour, were more dangerous than full ones; the word, he thought, made them treat the drums as inert.

{{image: Benjamin Lee Whorf | Benjamin Lee Whorf (1897–1941), the fire-prevention engineer whose "principle of linguistic relativity" others later recast as the "Sapir–Whorf hypothesis".}}

```quote
We dissect nature along lines laid down by our native languages.
Benjamin Lee Whorf · "Science and Linguistics" · 1940
```

Whorf never stated a "hypothesis"; he spoke of a "principle of linguistic relativity". The label "Sapir–Whorf hypothesis" was coined by Harry Hoijer at a conference in 1954, and Brown and Lenneberg turned it into a testable causal claim. Neo-Whorfians read Whorf modestly, as concerned with the terms in which we *speak*, not the limits of thought.

Two famous examples mix evidence and myth. Whorf claimed that Hopi contains no words or forms referring directly to "time". Ekkehart Malotki's *Hopi Time* (1983) documented Hopi words for days, seasons, yesterday and tomorrow, and a future tense. Universalists such as Steven Pinker treat this as final; relativists such as John Lucy reply that Malotki refuted a claim Whorf did not make, that Hopi *cannot express* time. Then there are the "Eskimo words for snow". Boas in 1911 gave four words, to show how languages divide ideas, as English has lake, river and brook. By 1978 the figure quoted had reached fifty, and a *New York Times* editorial in 1984 gave one hundred; Laura Martin traced the inflation in 1986 and Geoffrey Pullum called it "the Great Eskimo Vocabulary Hoax". Yet the story has a further twist: Igor Krupnik (2010) and other Arctic specialists defend Boas, arguing that these languages do have many roots for sea ice and frozen water.

Experiments have found real but modest effects. Berlin and Kay (1969) found universal patterns in colour terms, but Russian obligatorily distinguishes lighter blue (*goluboy*) from darker blue (*siniy*), and a 2007 study by Winawer, Lera Boroditsky and colleagues found that Russian speakers told blues apart faster across that boundary, an advantage that vanished when they did a verbal task at the same time; the authors read it as language interacting with perception, not permanently changing it. Speakers of Guugu Yimithirr, in Far North Queensland, use geographic directions (north, south) rather than left and right, and Stephen Levinson argued that a language's frame of reference shapes spatial experience; Peggy Li and Lila Gleitman (2002) replied that the differences reflect environment and culture. The Pirahã of Brazil lack exact number words, yet could match large sets exactly, evidence "against the strong Whorfian claim". And a reported finding that grammatical gender affects how Spanish and German speakers describe objects could not be replicated by independent trials. The SEP's summary is that neo-Whorfian claims "are much more modest than Whorf's original thesis".

## Is Language Innate?

Strong relativity's sharpest opponent is the view that the language faculty is shared and largely innate. Noam Chomsky (born 1928) launched generative grammar with *Syntactic Structures* (1957). His sentence "Colorless green ideas sleep furiously" is nonsensical yet grammatical, while the same words reversed are not, though neither had ever been said; so, he argued, grammaticality cannot be a matter of statistical familiarity. (In 2000 Fernando Pereira showed that a simple statistical model rated the grammatical version about 200,000 times more probable.) His 1959 review of B. F. Skinner's *Verbal Behavior* argued that conditioning cannot explain how people understand sentences never heard before. He later called the puzzle of how children learn so much from so little "Plato's problem", after the slave-boy in the *Meno*.

The argument from the **poverty of the stimulus** can be set out, following Gabe Dupre's SEP entry (2026):

1. Children acquire a certain piece of linguistic knowledge, the target.
2. They are exposed to a limited body of speech, the primary linguistic data.
3. They have some general-purpose learning mechanisms.
4. The target cannot be acquired from those data with those mechanisms alone.
5. So something relevant to acquiring it must be innate.
6. That innate factor is specific to language.
7. So children possess language-specific endowments by which they acquire their language.

Chomsky's example is questions. From "The man is tall" we form "Is the man tall?" From "The man who is tall is in the room" we form "Is the man who is tall in the room?", never "Is the man who tall is in the room?" A rule "move the first auxiliary verb" fits the simple data, but children do not try it; the correct rule, "move the main auxiliary", depends on sentence structure, not word order. If children never hear the decisive cases, the preference for **structure dependence** must come from them.

**Objection.** Geoffrey Pullum and Scholz (2002) argued that the stimulus is richer than claimed. In a corpus of speech to children they found questions such as "Where's the other dolly that was in here?", in which the main auxiliary is moved past an embedded one. **Replies.** Legate and Yang (2002) calculated that such sentences are about 0.05 per cent of the corpus: a child might never meet them, and a learner who generalised from so few would also generalise from noise. Lasnik and Lidz (2016) added that hearing that the main auxiliary *can* move does not show that the embedded one *cannot*, though Dupre notes this is in effect a different argument. Others attack premise 3: Bayesian models suggest children can infer from the *absence* of a form that it is impossible.

Large language models have reopened the question. As of November 2026, some argue that these systems, which have no language-specific innate biases yet use language fluently, are a "possibility proof" that grammar can be extracted from data; one 2024 paper by Piantadosi is titled "Modern Language Models Refute Chomsky's Approach to Language". Dupre's SEP supplement records the replies. Children hear roughly 2 to 7 million words a year, while recent models train on "tens of trillions of tokens", so they are "poor examples" against an argument about *poor* input; the BabyLM challenge, with far smaller training sets, has so far given results "still preliminary". Moro, Greco and Cappa (2023) argue that models learn humanly impossible languages as easily as possible ones, while Kallini and colleagues (2024) found that they prefer human-like rules. Dupre notes the tension: to refute nativism the models must lack language-specific biases, yet to model human language they must prefer human languages. Chomsky himself, in a 2023 *New York Times* essay with Ian Roberts and Jeffrey Watumull, called such systems statistical pattern-matchers, unlike a mind that works from little information and seeks explanations. Whether they understand anything is a question for *Minds and Machines: Could AI Think?*

Daniel Everett's disputed claim that Pirahã lacks recursion was met by Chomsky's reply that Universal Grammar is a capacity that need not show up in every language; critics retort that it is then hard to see what could count against it. Meanwhile Jerry Fodor's *The Language of Thought* (1975) argued that thinking itself goes on in an inner language, "Mentalese", explaining why anyone who can think that John loves Mary can think that Mary loves John. If that is right, a spoken language cannot fix what we can think, which is Pinker's argument against Whorf.

```checkpoint
q: Why did Pullum and Scholz's discovery of sentences like "Where's the other dolly that was in here?" matter?
a: It showed that children make many errors with questions.
x: Their point was about what children hear, not what they say.
a*: It challenged the premise that children never hear the data that would decide the auxiliary rule.
a: It proved that grammar is learned by reinforcement, as Skinner held.
x: Pullum and Scholz questioned one premise of the poverty argument; they did not revive Skinner's behaviourism.
a: It showed that the main auxiliary can never move past an embedded one.
x: The example shows the opposite: there the main auxiliary is moved over an embedded clause.
hint: Which premise says the target cannot be learned from the primary linguistic data?
why: The argument needs the input to be too poor. Legate and Yang replied that such sentences are about 0.05 per cent of speech to children, and Lasnik and Lidz that positive evidence cannot show what is impossible.
---
q: What is the current standing of the claim that Inuit languages have a hundred words for snow?
a: It is a well-established finding from Boas's fieldwork.
x: Boas gave four words, and made no claim about a large number.
a: It is a complete hoax with no basis at all in the languages.
x: Arctic specialists such as Krupnik defend Boas and point to many roots for sea ice and frozen water.
a: It was proved by Whorf's study of Hopi.
x: Hopi is a different language; Whorf's Hopi claims concerned time, and are themselves disputed.
a*: The large numbers were an inflation of Boas's four examples, though some specialists defend Boas's underlying point.
hint: Compare Boas in 1911 with the figures quoted by 1978 and 1984.
why: Martin and Pullum showed how the figure grew from four to fifty to a hundred; because these languages are polysynthetic, counting "words" is itself problematic, and Krupnik argues the languages do have many more roots for sea ice and frozen water.
```

## Further exploration

- **J. L. Austin, *How to Do Things with Words* (1962; 2nd edn 1975).** The founding text of speech-act theory: twelve Harvard lectures, edited from Austin's notes.
- **Paul Grice, *Studies in the Way of Words* (1989).** Collects "Meaning" and the "Logic and Conversation" lectures that launched the theory of implicature.
- **Dan Sperber and Deirdre Wilson, *Relevance: Communication and Cognition* (1986; 2nd edn 1995).** The main rival to Gricean pragmatics.
- **Rae Langton, *Sexual Solipsism: Philosophical Essays on Pornography and Objectification* (2009).** Includes "Speech Acts and Unspeakable Acts" and replies to critics.
- **John Leavitt, *Linguistic Relativities: Language Diversity and Modern Thought* (2011).** The history of the relativity idea from Herder and Humboldt to the neo-Whorfians.
- **Steven Pinker, *The Language Instinct: How the Mind Creates Language* (1994).** A popular case for nativism and against strong Whorfianism.
- **Bimal Krishna Matilal, *The Word and the World: India's Contribution to the Study of Language* (1990).** Indian philosophy of language, including Bhartṛhari.$language_master$,
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
  select $language_quiz$[
    {"type": "mcq", "prompt": "Which of these is one of Austin's reasons for concluding that the performative–constative distinction collapses?", "options": ["Performatives such as promises are always insincere", "Only statements can misfire, so performatives are a kind of statement", "\"I state that…\" has every formal mark of a performative, yet it is essentially true or false", "Ordinary language is the last word on every philosophical question"], "answerIndex": 2, "explanation": "Austin showed that constatives can misfire and be abused (\"France is hexagonal\" when there is no France), that performatives answer to facts (a warning about a bull that is not charging is mistaken), and that \"I state that…\" is both a performative in form and a statement. His conclusion: to say something is always to do something. Austin called ordinary language the first word, not the last.", "id": "q1"},
    {"type": "mcq", "prompt": "In Grice's testimonial-letter example, which maxim does the writer openly flout, and what does he implicate?", "options": ["The first maxim of Quantity; that Mr X is no good at philosophy", "The maxim of Quality; that Mr X's English is in fact poor", "The maxim of Manner; that the writer does not know Mr X", "The maxim of Relation; that Mr X should apply for a job teaching English"], "answerIndex": 0, "explanation": "The writer says less than is required, though he knows more (X is his pupil) and knows more is wanted. Since he is presumed to be cooperating (why else write?), the breach makes sense only if he thinks something he is reluctant to write down: that X is no good at philosophy. Wayne Davis argues such cases work by a learned convention, damning with faint praise, rather than by fresh calculation.", "id": "q2"},
    {"type": "mcq", "prompt": "What is Langton's 'illocutionary disablement'?", "options": ["Preventing someone from uttering any words at all, by violence or intimidation", "Performing a speech act that fails to have its intended effect on the hearer", "Insincerely making a promise one does not intend to keep", "A setting that prevents the hearer's uptake, so that the speech act, such as refusing, is not performed at all"], "answerIndex": 3, "explanation": "Langton distinguished locutionary silencing (no words at all), perlocutionary frustration (the act is done but its effect blocked) and illocutionary disablement, where a woman's \"No\" is not recognised as a refusal and so she cannot refuse. Dworkin objected that free speech cannot include a right to be understood; Hornsby, Langton and West replied that it requires the absence of systematic barriers to uptake. Insincere promising is an Austinian abuse.", "id": "q3"},
    {"type": "mcq", "prompt": "Who coined the label 'Sapir–Whorf hypothesis'?", "options": ["Benjamin Lee Whorf, in \"Science and Linguistics\"", "Harry Hoijer, at a conference in 1954", "Edward Sapir, in his course at Yale", "Franz Boas, in the Handbook of American Indian Languages"], "answerIndex": 1, "explanation": "Whorf never stated a 'hypothesis'; he spoke of a 'principle of linguistic relativity'. Hoijer coined the label in 1954, and Brown and Lenneberg turned it into a testable causal claim. Boas's 1911 Handbook is where the four Inuit snow words first appeared.", "id": "q4"},
    {"type": "open", "prompt": "Set out Chomsky's poverty-of-the-stimulus argument step by step, using the example of question formation. Then explain Pullum and Scholz's objection and two replies to it. Do large language models change the picture?", "rubric": "A strong answer gives the schema (children acquire a target; they are exposed to limited data; they have general learning mechanisms; the target cannot be learned from those data with those mechanisms; so something innate and language-specific is needed) and the auxiliary example: 'Is the man who is tall in the room?', never '*Is the man who tall is in the room?', showing structure dependence rather than 'move the first auxiliary'. It explains Pullum and Scholz's finding of decisive questions in child-directed speech, Legate and Yang's reply that they are about 0.05 per cent of the corpus, and Lasnik and Lidz's point that positive evidence cannot show impossibility. On LLMs (as of 2026) it notes the 'possibility proof' claim (Piantadosi), the reply that models train on tens of trillions of tokens against children's few million words a year, the impossible-languages dispute (Moro et al. vs Kallini et al.), and Dupre's tension; credit for a reasoned verdict.", "id": "q5"},
    {"type": "open", "prompt": "Does the language we speak shape how we think? Answer with reference to Whorf, at least two pieces of experimental or field evidence, and at least one non-Western view of language and thought.", "rubric": "A strong answer distinguishes strong relativity (language limits thought) from modest neo-Whorfian versions (effects on speaking or online processing), noting that Whorf spoke of a 'principle', not a hypothesis. It uses evidence such as the Russian blues study (an advantage that vanished under verbal interference), Guugu Yimithirr and Levinson's spatial claims with Li and Gleitman's reply, Pirahã number (exact matching without number words), Berlin and Kay's colour universals, and the failed replication of the grammatical-gender study. It handles the Hopi and snow-word controversies accurately (Malotki vs Lucy; the inflation of Boas's four words, and Krupnik's partial defence of Boas). It brings in Bhartṛhari's claim that all cognition is permeated by the word, distinguishing it from Whorf's comparative thesis, or Fodor's language of thought as a reason to doubt strong relativity. Credit for weighing the evidence rather than listing it.", "id": "q6"}
  ]$language_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/science-and-language/language-and-thought', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

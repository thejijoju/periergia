-- Berkeley and Hume — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/early-modern/berkeley-and-hume @ research/advanced/read.
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
    'philosophy/history-of-philosophy/early-modern/berkeley-and-hume',
    'research',
    'advanced',
    'read',
    $berkhume_master$> **George Berkeley (1685–1753) and David Hume (1711–1776) followed the empiricist principle, that knowledge begins in experience, further than anyone before them.** This chapter sets out Berkeley's case that there are only minds and their ideas, then follows Hume through his theory of ideas, the argument now called the problem of induction, causation as habit, the self as a "bundle" of perceptions, reason as "slave of the passions", the gap between *is* and *ought*, and his critique of miracles and of the argument from design. It also meets his critic Mary Shepherd and both men's entanglements with slavery and race.

## Empiricism at Its Limits

**Empiricism** is the view that our ideas and knowledge come from experience, not from reason alone or from ideas we are born with. Locke, as the chapter on *Locke* shows, still believed in a material world behind our ideas, with primary qualities (shape, size, motion) really in bodies and secondary qualities (colour, taste, heat) only powers to cause sensations in us. His two great successors asked what follows if the principle is taken all the way down.

Berkeley, an Irish clergyman, concluded that there is nothing behind our ideas: the physical world is real, but made of ideas in minds. Hume, a Scottish man of letters, concluded that experience cannot justify some of our most basic beliefs, about the future, about causes and about the self. Kant later credited the memory of Hume with interrupting his "dogmatic slumber" (see *Kant*). A note on texts: Berkeley is cited by section of the *Principles* and by page of the *Three Dialogues* in the Luce–Jessop *Works* (1948–57); Hume's *Treatise* by book, part, section and paragraph (Norton and Norton edition, 2000), his first *Enquiry* by section and paragraph, with Selby-Bigge page numbers ("SBN") where given.

## Berkeley: Dean, Projector, Slaveholder

Berkeley was born in 1685 near Kilkenny and entered Trinity College Dublin at fifteen. There he read Descartes, Locke, Malebranche and Newton, became a fellow in 1707, and was ordained. In his mid-twenties he published *An Essay Towards a New Theory of Vision* (1709), the *Treatise concerning the Principles of Human Knowledge* (1710) and the *Three Dialogues between Hylas and Philonous* (1713), in which Philonous argues Hylas out of materialism.

Appointed Dean of Derry in 1724, he pursued a scheme for a college in Bermuda, one aim of which was to educate and convert Native Americans. Having secured a charter and promises of parliamentary money, he married Anne Forster and sailed in 1728; the family spent three years in Newport, Rhode Island, waiting for funds that never came, and then returned. In Newport, the Stanford Encyclopedia of Philosophy (SEP) records, he "purchased at least three enslaved people to work in his household and on his farm". He "did not see a fundamental moral problem in enslaving Africans and kidnapping Native American children", and "explicitly raises the possibility of kidnapping Native American children for his school", while he also "explicitly disclaims some forms of racism". *The Querist* (from 1735) proposed that "sturdy Beggars" be "seized and made Slaves to the Public, for a certain Term of Years", "temporary Servitude" being "the best Cure for Idleness and Beggary". In April 2023 Trinity's board decided to remove his name from its main library, citing his ownership of enslaved people and promotion of pro-slavery ideas; his work is still taught, and in October 2024 the library was renamed after the poet Eavan Boland.

Bishop of Cloyne from 1734, he attacked Newton's calculus in *The Analyst* (1734) and promoted tar-water as a panacea in *Siris* (1744). He died in Oxford in 1753.

## "Their Esse Is Percipi"

Berkeley's view is **idealism**: "the view that reality consists exclusively of minds and their ideas". By "materialism" he meant not that only matter exists but simply that material things exist independently of minds. It breeds, he thought, scepticism (our senses might misrepresent bodies, which need not exist) and atheism (a material world could run without God). His slogan is usually quoted as *esse est percipi*, "to be is to be perceived", but he wrote an anglicised form, of unthinking things:

```quote
Their esse is percipi, nor is it possible they should have any existence, out of the minds or thinking things which perceive them.
George Berkeley · A Treatise concerning the Principles of Human Knowledge §3 · 1710
```

Minds, or spirits, are perceivers, not perceived. The core argument, *Principles* §4, runs in Kenneth Winkler's reconstruction:

1. We perceive ordinary objects such as houses and mountains.
2. We perceive only ideas.
3. Therefore ordinary objects are ideas.

The argument is valid, and premise 2 came from the "idea-theoretic" tradition of Descartes and Locke.

**The objection** is the representationalist's. Distinguish immediate from mediate perception. We immediately perceive only ideas, but through them we mediately perceive the material things they represent. Then premise 2 holds only of immediate perception, premise 1 only of mediate perception, and the conclusion does not follow.

**Berkeley's reply** has three layers. First, the **likeness principle** (*Principles* §8): representation would have to work by resemblance, but "an idea can be like nothing but an idea; a colour or figure can be like nothing but another colour or figure." As his notebooks put it, "Two things cannot be said to be alike or unlike till they have been compar'd", and we can compare only ideas. Matter becomes, in the SEP's words, "if not an incoherent notion, at best a completely empty one". Second, the Introduction to the *Principles* denies that we can form abstract general ideas by stripping particular qualities away, as Locke apparently held; notions such as bare "being" or "mere extension", used to describe matter, are just such abstractions. Third (*Principles* §§18–19), matter would explain nothing, since materialists admit they cannot comprehend how body could act on mind.

In the *First Dialogue* Philonous also dismantles Locke's primary–secondary distinction: what is hot to one hand is cold to the other, and microscopes change what we see, so choosing the "true" qualities would be arbitrary; the same relativity applies to shape and size, and we cannot conceive a body extended but not coloured.

A further argument, nicknamed the "Master Argument" only later, stakes everything on a challenge (*Principles* §22): "if you can but conceive it possible for one extended moveable substance, or in general, for any one idea or any thing like an idea, to exist otherwise than in a mind perceiving it, I shall readily give up the cause." Imagining trees with no one by, he says, is only framing ideas while omitting the idea of a perceiver. Pitcher (1977) replied that this confuses what we conceive *with*, an idea, which is indeed conceived, and what we conceive *of*, which need not be; as the SEP notes, many commentators judge that the argument fails. A charitable reading (Winkler; Lennon) presupposes representationalism, as the *Principles* arguments also do; since the argument targets representationalists, that need not be a flaw.

## Trees, Stones and God

An apple, then, is a collection of ideas, colour, taste, smell, figure and consistency, "observed to go together". There is no material world, but there is a physical world. Ideas are passive, spirits active. My sensory ideas are not caused by ideas, which are passive, nor by me, since they come unbidden; so they come from another spirit, whose wisdom and goodness the order of nature shows: God. Real things differ from imaginary ones by being involuntary, more vivid and ordered by "the Laws of Nature". Daily speech can stay as it is: "we ought to think with the learned, and speak with the vulgar".

Does my desk vanish when I leave the room? *Principles* §3 says that if I were in my study I might perceive it, or some other spirit does. McCracken objects that this has counterintuitive consequences: as the SEP puts it, the desk would pop in and out of existence. The *Three Dialogues* instead place unperceived things in God's mind, though God has no sensations. A limerick usually attributed to Ronald Knox finds it "exceedingly odd" that the tree "continues to be / when no one's about in the Quad"; an anonymous reply signed "Yours faithfully, God" answers, "I am always about in the Quad".

The most famous response is Samuel Johnson's. Boswell's *Life of Johnson* (1791) records that on 6 August 1763, when Boswell remarked that Berkeley's doctrine, though untrue, was impossible to refute, Johnson struck his foot against a large stone and answered, "I refute it *thus*." Did he miss the point? Berkeley never denied that stones are solid, only that they are mind-independent.

A sharper objection is internal. If we have no idea of matter, how do we know spirits, which are not ideas either? Berkeley answered that we have a "notion" of spirit by reflecting on ourselves. Yet his notebooks had toyed with another view: "Mind is a congeries of Perceptions. Take away Perceptions & you take away the Mind put the Perceptions & you put the mind." Hume would take that road.

Unlike the Buddhist Yogācāra idealism of *Mahāyāna Philosophy: Nāgārjuna, Yogācāra and Buddhist Logic*, Berkeley kept minds as substances. He "influenced both Hume and Kant, and is much read (if little followed) in our own day". Mary Shepherd later faulted him "for holding that sensible objects are only ideas, not for holding that they are ideas".

```checkpoint
q: What is the "likeness principle", and what work does it do in Berkeley's argument against matter?
a*: The principle that an idea can be like nothing but an idea; it blocks the reply that our ideas represent material things by resembling them.
a: The principle that similar causes have similar effects; it shows that God causes our ideas.
x: That is close to a principle Mary Shepherd defended against Hume; Berkeley's argument for God is an argument by elimination.
a: The principle that ideas of sight and touch are alike; it explains how we see distance.
x: Berkeley's theory of vision held the opposite, that ideas of sight and touch are distinct (the "heterogeneity thesis").
a: The principle that primary qualities resemble our ideas of them; it shows that shape and size are really in bodies.
x: That is Locke's view, which Berkeley rejected; he argued that the same relativity arguments apply to primary qualities.
hint: Think about the representationalist objection to the argument of Principles §4.
why: The objector says we mediately perceive material things that our ideas represent. Berkeley replies (Principles §8) that representation would need resemblance, but "an idea can be like nothing but an idea", so a material thing could not be represented by our ideas at all.
---
q: What is the best-known objection to Berkeley's "Master Argument"?
a: It shows that matter exists after all, because we can imagine an unperceived tree.
x: The objection does not prove that matter exists; it only shows that the argument does not prove that it cannot.
a: Samuel Johnson refuted it by kicking a stone.
x: Johnson's gesture was aimed at Berkeley's doctrine in general, and many think it missed the point, since Berkeley never denied that stones are solid.
a*: It confuses the idea with which we conceive a tree, which is indeed conceived, with the tree we conceive of, which need not be.
a: It relies on the claim that God perceives everything, which Berkeley had not yet argued for.
x: The Master Argument appeals only to what we can conceive; it does not invoke God.
hint: Pitcher drew a distinction between two things in an act of conceiving.
why: Pitcher (1977) argued that imagining an unperceived tree involves an idea, which is conceived, but what is imagined is a tree no one perceives. Many commentators agree that the argument fails.
```

## Hume: the Man of Letters

{{image: David Hume | Portrait of David Hume by Allan Ramsay, 1766.}}

David Home was born in Edinburgh on 7 May 1711 (26 April Old Style) and changed the spelling to "Hume" in 1734. He attended the University of Edinburgh as a boy, without graduating, and after a breakdown in 1729 went to France in 1734 and settled at La Flèche (1735–37), where, "at the tender age of 23", he began *A Treatise of Human Nature*, "an Attempt to introduce the experimental Method of Reasoning into Moral Subjects". Books 1 and 2 appeared anonymously in 1739, Book 3 in 1740. "It fell dead-born from the press," he later wrote; in fact it provoked attacks on him as atheist and sceptic.

Opposition cost him chairs at Edinburgh (1745) and Glasgow (1751); he never held an academic post. He recast his ideas in *An Enquiry concerning Human Understanding* (1748, under another title until 1758) and the *Enquiry concerning the Principles of Morals* (1751). In his lifetime he was known chiefly as a historian, his *History of England* (1754–62) making him wealthy. In 1766 he brought Rousseau to England, where they fell out (see *The Enlightenment and Rousseau*, and the History chapter *The Enlightenment*). He died in Edinburgh on 25 August 1776; his *Dialogues concerning Natural Religion* appeared, as he had arranged, in 1779.

## Impressions, Ideas and the Fork

Hume calls every content of the mind a **perception**, divided into **impressions** (sensations and feelings such as passions) and **ideas**, their fainter copies used in thinking; the difference is one of "force or vivacity". His **Copy Principle** says every simple idea copies a simple impression, so to examine an idea, look for the impression it came from. He conceded one counterexample, the "missing shade of blue" that someone who had seen every other shade could imagine, and carried on regardless.

Ideas are associated by resemblance, contiguity in time or place, and cause and effect. All reasoning concerns either "relations of ideas", known a priori (independently of experience), whose denial is a contradiction, as in mathematics; or "matters of fact", known by experience, whose contrary is always conceivable. This is "Hume's fork", a later name. The *Enquiry* ends by applying it to any book of divinity or school metaphysics containing neither: "Commit it then to the flames: For it can contain nothing but sophistry and illusion."

## The Problem of Induction

Only cause and effect, Hume observed, takes us "beyond the evidence of our memory and senses". Every such inference rests on a **Uniformity Principle**: "all our experimental conclusions proceed upon the supposition, that the future will be conformable to the past." What justifies it? Leah Henderson's reconstruction in the SEP runs:

1. There are only two kinds of argument, demonstrative and probable (the fork).
2. Inductive inference, from observed cases to unobserved ones, presupposes the Uniformity Principle.
3. A demonstrative argument establishes a conclusion whose denial is a contradiction.
4. The denial of the Uniformity Principle is no contradiction: "it implies no contradiction that the course of nature may change."
5. So no demonstrative argument supports it.
6. Any probable argument for it would presuppose it.
7. An argument may not presuppose what it is meant to prove; that would be "taking that for granted, which is the very point in question".
8. So no probable argument supports it, and no argument at all: inductive inference is not justified by reason.

Hume did not call this "the problem of induction"; the name is later, and, as Peter Millican notes, Hume never uses "induction" for the topic of this argument, and his rare uses of the word do not match the modern sense. His "sceptical solution" is that **custom** or habit, a propensity to repeat an act without any reasoning, moves us: a natural instinct no argument can produce or prevent. Scholars divide over whether his conclusion is psychological (reason does not *cause* the inference: Garrett, Owen) or sceptical (reason cannot *justify* it: Winkler, Millican).

Popper accepted that the problem is insoluble but denied that science uses induction: it proposes bold conjectures and tries to refute them. Critics reply that his "corroboration" smuggles inductive support back in. Strawson (1952) argued that asking whether induction as a whole is justified is like asking whether the legal system as a whole is legal; BonJour objected that this does not show inductive conclusions likely to be true. Reichenbach (1938) offered a "pragmatic vindication": if any method finds nature's long-run frequencies, simple induction will; Salmon objected that other rules do as well. Goodman's "new riddle", with its predicate "grue", showed that the same evidence supports incompatible predictions (see *Induction, Probability and Inference to the Best Explanation*). India's materialists had raised a related doubt, as *Jains, Ājīvikas and Materialists: India's Other Dissenters* describes.

## Causation as Habit

Our idea of cause contains contiguity, priority in time and, most important, **necessary connection**: the sense that the cause *must* produce the effect. From what impression is it copied? No single case, outer or inner, shows necessity, and repetition adds nothing to the objects. It changes the mind: after many cases we feel a transition, an expectation, and project it onto things, for the mind has a "great propensity … to spread itself on external objects".

The *Enquiry* defines a cause twice: "an object, followed by another, and where all the objects, similar to the first, are followed by objects similar to the second"; and "an object followed by another, and whose appearance always conveys the thought to that other". One concerns regularity in the world, the other habit in the mind. Which matters more is part of the "New Hume" debate. "Old Humeans" such as Winkler and Millican read Hume as denying, or finding inconceivable, necessary connection in things. "New Humeans", building on Norman Kemp Smith and following John P. Wright (1983) and Galen Strawson (1989), read him as a "sceptical realist" who allowed that real powers exist though unknowable: his regularity theory, Strawson says, is "only a theory about" what we can know, "not about" what there is.

*Al-Ghazālī, Averroes and the Quarrel over Reason* shows al-Ghazālī reaching a similar conclusion for different reasons; there is no documented evidence that Hume knew his work (see also *Causation*). Hume was also a **compatibilist**, holding freedom compatible with causal necessity: liberty is "a power of acting or not acting, according to the determinations of the will" (see *Free Will and Determinism*).

His most searching early critic was Lady Mary Shepherd (1777–1847). Her *Essay upon the Relation of Cause and Effect* (1824) argued that causal belief rests on perception and reason, not habit; that whatever begins to exist must have a cause, since something must act to begin it; and that similar causes must have similar effects. Some modern critics find her central argument circular; others defend it. Her work "dropped from view" after her death and has only recently been recovered.

## The Self as a Bundle

Is there an impression of a simple, enduring "I"?

```quote
For my part, when I enter most intimately into what I call myself, I always stumble on some particular perception or other, of heat or cold, light or shade, love or hatred, pain or pleasure. I never can catch myself at any time without a perception, and never can observe any thing but the perception.
David Hume · A Treatise of Human Nature 1.4.6.3 · 1739
```

No impression, so no such idea: the mind is "nothing but a bundle or collection of different perceptions, which succeed each other with an inconceivable rapidity, and are in a perpetual flux and movement". Yet in the Appendix of 1740 Hume confessed: "upon a more strict review of the section concerning personal identity, I find myself involv'd in such a labyrinth, that, I must confess, I neither know how to correct my former opinions, nor how to render them consistent." He named two principles he could not reconcile, that distinct perceptions are distinct existences and that the mind never perceives real connection among them. These are not inconsistent in themselves, and what troubled him remains disputed.

The likeness to the Buddhist doctrine of non-self (see *The Buddha and Early Buddhist Philosophy*) is often noted. Alison Gopnik (2009) pointed out that at La Flèche Hume lived near a Jesuit, Charles François Dolu, who had been to Siam and had met a missionary returned from Tibet, so Hume *could* have heard of Buddhist ideas. It is an argument for possibility only: no document shows Hume discussing Buddhism (see *Self and No-Self: Personal Identity East and West*).

## Reason, Passion and Ought

Reason alone, Hume argued, never moves us. It demonstrates relations of ideas or traces causes, and neither matters "if both the causes and effects be indifferent to us"; desire must come first. Hence: "Reason is, and ought only to be the slave of the passions, and can never pretend to any other office than to serve and obey them." So "'Tis not contrary to reason to prefer the destruction of the whole world to the scratching of my finger"; a passion is unreasonable only when it rests on a false belief about what exists or about means. Whether this makes him an instrumentalist about practical reason or a sceptic about it is debated.

The same reasoning shapes his ethics. Morals move us to act; reason alone cannot; so morals are not derived from reason. In a wilful murder, "the vice entirely escapes you" until you consult your own disapproval. Nagel and Korsgaard reply that his notion of reason is too narrow. Then a famous paragraph: in every system of morality, the author reasons for a while about what *is*, until suddenly "I meet with no proposition that is not connected with an *ought*, or an *ought not*. This change is imperceptible; but is, however, of the last consequence." How can the new relation be deduced from entirely different ones? The dominant twentieth-century reading, R. M. Hare's "Hume's Law", takes this as a logical thesis: no *ought* follows from purely factual premises. Cognitivist readers reply that Hume meant only that moral properties are not found by demonstrative reason, noting that he often reasons from facts to moral conclusions himself (see *Metaethics: Are There Moral Facts?*).

```checkpoint
q: Why, according to Hume, can no probable argument justify the Uniformity Principle?
a: Because the denial of the principle is a contradiction.
x: Hume holds the opposite: "it implies no contradiction that the course of nature may change", which is why no demonstrative argument works.
a*: Because any probable argument would itself rely on the principle, taking for granted the point in question.
a: Because probable arguments concern only relations of ideas.
x: Relations of ideas are the subject of demonstrative reasoning; probable reasoning concerns matters of fact.
a: Because the Copy Principle shows we have no idea of the future.
x: Hume does not argue this way; the circularity step is about how probable reasoning works, not about lacking an idea of the future.
hint: Probable reasoning is reasoning from experience.
why: Every argument from experience assumes that the future will resemble the past, so using one to support that assumption would be circular.
---
q: What did Hume admit in the Appendix to the Treatise (1740)?
a: That he had found an impression of the self after all.
x: He did not withdraw the claim that he could find no such impression.
a: That the self is an immaterial substance, as Berkeley held.
x: Hume never accepted a substantial self; the Appendix expresses doubt about his own account, not a return to Berkeley's.
a: That his argument about induction was mistaken.
x: The Appendix's confession concerns the section on personal identity.
a*: That his account of personal identity left him in a "labyrinth", though what exactly troubled him is still debated.
hint: The Appendix revisits Book 1, Part 4, Section 6.
why: Hume wrote that he could neither correct his former opinions nor render them consistent, naming two principles he could not reconcile; scholars have not reached consensus on the problem.
```

## Miracles and Design

"A wise man", Hume wrote, "proportions his belief to the evidence." Section 10 of the *Enquiry* applies this to miracles, defined as violations of the laws of nature. Laws of nature rest on the strongest proofs experience gives, "in all countries and all ages"; testimony for a miracle must always be weighed against that full proof from experience. Hence: "no testimony is sufficient to establish a miracle, unless the testimony be of such a kind, that its falsehood would be more miraculous, than the fact, which it endeavours to establish." The conclusion concerns evidence: not that miracles are impossible, but that testimony cannot prove one. Critics from George Campbell and Paley onward read Hume as arguing in a circle, since a miracle defined as a violation of an exceptionless law is ruled out from the start; Garrett replies that the believer in a miracle also accepts the law it breaks. Part II adds that we love wonder, that miracle reports "abound among ignorant and barbarous nations", and that rival religions' miracles cancel out. The argument is still contested, from John Earman's *Hume's Abject Failure* (2000) to Robert Fogelin's *A Defense of Hume on Miracles* (2003).

The *Dialogues concerning Natural Religion* stage Cleanthes, who argues from design; Demea, who offers an a priori proof; and the sceptic Philo, generally identified with Hume. For Cleanthes the world is "one great machine", and since the effects resemble each other, so must their causes. Philo replies that the analogy is weak, that we have no experience of world-making, and that at most the argument yields a finite, perhaps imperfect designer. Later parts press the problem of evil (see *The Problem of Evil*). In Part XII Philo seems to concede, which readers take in different ways. Was Hume a "soft sceptic", an "attenuated deist", or, in Paul Russell's term, a philosopher of "irreligion"? The question is open (see *God: Arguments For and Against*).

## Race, Women and Legacy

In 1753–54 Hume added a footnote to his essay "Of National Characters" suspecting "the negroes and in general all other species of men … to be naturally inferior to the whites", and dismissing a learned Black man in Jamaica as admired "like a parrot, who speaks a few words plainly". James Beattie attacked it in 1770, and the posthumous 1777 edition narrowed the claim to Black people. John Immerwahr (1992) argued that Hume revised it in response; Aaron Garrett (2000) disputed that this is established; Emmanuel Chukwudi Eze (2000) argued that it was integral to Hume's thought, not an afterthought. His near-contemporary Anton Wilhelm Amo, a philosopher from the Gold Coast (now Ghana) who took a doctorate at Wittenberg and taught at Halle and Jena, had no known contact with him (see *Race, Colonialism and Philosophy*). On women, Annette Baier read Hume as "remarkably free of discriminatory sexism"; other critics find his remarks close to the prejudices of his time.

Only "carelessness and inattention", Hume admitted, save us from scepticism about the external world; he rejected extreme Pyrrhonian doubt as unliveable and recommended a "mitigated" scepticism (see *Scepticism and the Answers to It*). Berkeley tried to defeat scepticism by closing the gap between ideas and things; Hume showed how much of our picture of the world rests on habit and feeling rather than proof.

## Further exploration

- **Tom Jones, *George Berkeley: A Philosophical Life* (2021).** A full intellectual biography, including the Bermuda project and Berkeley's defence of slavery.
- **Kenneth P. Winkler, *Berkeley: An Interpretation* (1989).** The standard study of Berkeley's arguments.
- **James A. Harris, *Hume: An Intellectual Biography* (2015).** Hume's life and all his works, essays and *History* included.
- **Annette C. Baier, *A Progress of Sentiments: Reflections on Hume's Treatise* (1991).** The *Treatise* read as a whole, passions and morals included.
- **Paul Russell, *The Riddle of Hume's Treatise: Skepticism, Naturalism, and Irreligion* (2008).** Hume's philosophy as an irreligious project.
- **Deborah Boyle (ed.), *Lady Mary Shepherd: Selected Writings* (2018).** Shepherd's critique of Hume on causation and induction.
- **Dennis C. Rasmussen, *The Infidel and the Professor: David Hume, Adam Smith, and the Friendship That Shaped Modern Thought* (2017).** An accessible account of Hume's life, the *Dialogues* and his death.$berkhume_master$,
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
  select $berkhume_quiz$[
    {"type": "mcq", "prompt": "Which statement about Berkeley's slogan 'to be is to be perceived' is accurate?", "options": ["Berkeley wrote 'esse is percipi' in Principles §3; 'esse est percipi' is the later, fully Latin form of the tag", "Berkeley wrote 'esse est percipi' in the Three Dialogues and applied it to minds as well as things", "The slogan was coined by Hume to summarise Berkeley's view", "Berkeley applied the slogan to God but not to physical things"], "answerIndex": 0, "explanation": "In Principles §3 Berkeley wrote of unthinking things that 'Their esse is percipi'. The familiar Latin tag 'esse est percipi (aut percipere)' is later. It applies to ideas, and so to the physical world; minds, or spirits, are perceivers rather than perceived.", "id": "q1"},
    {"type": "mcq", "prompt": "What does Hume's 'Uniformity Principle' say, and what is his verdict on it?", "options": ["That every simple idea copies a simple impression; he concedes one counterexample but keeps it", "That reason should govern the passions; he makes it the basis of morality", "That the future will be conformable to the past; he argues that neither demonstrative nor probable reasoning can establish it", "That similar causes must have similar effects; he proves it from the definition of cause"], "answerIndex": 2, "explanation": "Hume held that 'all our experimental conclusions proceed upon the supposition, that the future will be conformable to the past.' Its denial is no contradiction, so demonstration cannot establish it, and any probable argument would presuppose it. Our inferences rest on custom instead. (The first option describes the Copy Principle; the fourth is a principle Mary Shepherd defended against Hume.)", "id": "q2"},
    {"type": "mcq", "prompt": "What is the 'New Hume' reading of Hume on causation?", "options": ["That Hume held causes and effects to be simultaneous and necessary", "That Hume was a sceptical realist who allowed that real causal powers exist though we cannot know them", "That Hume's second definition of cause should be dropped as a mistake", "That Hume borrowed his account of causation directly from al-Ghazālī"], "answerIndex": 1, "explanation": "New Humeans such as John P. Wright (1983) and Galen Strawson (1989) read Hume's regularity theory as a theory of what we can know, not of what there is. Old Humeans such as Winkler and Millican read him as denying, or finding inconceivable, necessary connection in things. There is no documented evidence that Hume knew al-Ghazālī's work.", "id": "q3"},
    {"type": "mcq", "prompt": "Who wrote a book-length critique of Hume on causation in 1824, arguing that whatever begins to exist must have a cause?", "options": ["Catharine Trotter Cockburn", "Annette Baier", "James Beattie", "Mary Shepherd"], "answerIndex": 3, "explanation": "Lady Mary Shepherd's Essay upon the Relation of Cause and Effect (1824) argued that causal belief rests on perception and reason rather than habit, that anything that begins to exist must have a cause, and that similar causes have similar effects. Cockburn died in 1749 and is not known as a critic of Hume; Beattie attacked Hume's footnote on race; Baier is a modern Hume scholar.", "id": "q4"},
    {"type": "open", "prompt": "Set out Berkeley's core argument that ordinary objects are ideas (Principles §4). Explain the representationalist objection and how Berkeley replies to it.", "rubric": "A strong answer gives the argument: we perceive ordinary objects; we perceive only ideas; so ordinary objects are ideas; notes that it is valid and that premise 2 comes from the idea-theoretic tradition of Descartes and Locke. It states the objection: we immediately perceive only ideas but mediately perceive material things that ideas represent, so the conclusion does not follow. It gives Berkeley's replies: the likeness principle ('an idea can be like nothing but an idea', since only ideas can be compared), which makes matter at best an empty notion; the attack on abstract ideas such as bare 'being' or 'mere extension'; and the point that matter explains nothing because no one can say how body acts on mind. Credit mention of the relativity arguments against primary qualities, the Master Argument and Pitcher's objection to it, or Johnson's stone and whether it misses the point.", "id": "q5"},
    {"type": "open", "prompt": "What does Hume mean by saying that reason is 'the slave of the passions', and how does this lead to his claims about morality and the gap between 'is' and 'ought'? Explain at least two rival readings of the is–ought passage.", "rubric": "A strong answer explains that for Hume reason only demonstrates relations of ideas or traces causes, and neither moves us unless we already care about the outcome; desire or passion must supply the motive; a passion is unreasonable only when based on a false belief about existence or means (the 'scratching of my finger' example). It gives the motivation argument: morals move us to act, reason alone cannot, so morals are not derived from reason; the murder example where the vice is found only in our feeling of disapproval. It quotes or paraphrases the is–ought passage and explains the rival readings: the logical reading ('Hume's Law', Hare) that no ought follows from purely factual premises, sometimes linked to noncognitivism; and cognitivist readings that he meant only that moral properties are not found by demonstrative reason, noting that he himself reasons from facts to moral conclusions. Credit mention of critics such as Nagel and Korsgaard who think his notion of reason too narrow, or the instrumentalist-versus-sceptic debate.", "id": "q6"}
  ]$berkhume_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/early-modern/berkeley-and-hume', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

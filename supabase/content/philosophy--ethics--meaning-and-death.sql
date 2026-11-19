-- The Meaning of Life and the Fear of Death — canonical master article, co-written and human-reviewed.
-- philosophy/ethics/meaning-and-death @ research/advanced/read.
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
    'philosophy/ethics/meaning-and-death',
    'research',
    'advanced',
    'read',
    $meaning_master$> **Is death bad for the one who dies, and can a life that ends have a point?** This chapter works through Epicurus's argument that death is nothing to us and the deprivation objection, Lucretius's mirror of the time before birth, and Bernard Williams's case against living forever. It then turns to Ecclesiastes, the Stoics, Buddhist mindfulness of death, Zhuangzi and Japanese aesthetics, Tolstoy's crisis and Camus's absurd, and ends with today's theories of meaning, African communal views and David Benatar's pessimism.

## Two Questions

The first question is whether death is bad for the person who dies. Steven Luper's entry "Death" in the Stanford Encyclopedia of Philosophy (SEP) calls the claim that it is, at least sometimes, the **harm thesis**: if it is true, the human condition has "a tragic side". Luper separates **dying**, the process of losing life, from **being dead**, the state that follows.

The second question is whether life has meaning. The meaning **of** life is the point of humanity or the universe as a whole; meaning **in** life is what makes one person's life meaningful. Most recent analytic work, Thaddeus Metz's SEP entry reports, is about meaning *in* life, and there is near-consensus that it is a final value (worth having for its own sake), comes in degrees, and differs from happiness and from moral rightness. The phrase is young: Metz says such talk has "arisen only in the past 250 years or so", and the Internet Encyclopedia of Philosophy (IEP) dates the modern inquiry from Schopenhauer (see *Schopenhauer and Kierkegaard*). The two questions meet: if death ends everything, does it drain life of its point?

## Epicurus: Death Is Nothing to Us

Epicurus (341–270 BCE) put his cure for the fear of death in the *Letter to Menoeceus*. In R. D. Hicks's translation: "Death, therefore, the most awful of evils, is nothing to us, seeing that, when we are, death is not come, and, when death is come, we are not." *Hellenistic Philosophy: Stoics, Epicureans and Sceptics* tells his life and gives a short version of the argument. Behind it lies his physics: the soul is made of fine atoms and cannot survive separation from the body, so there is no punishment after death and no one left to regret a lost life.

The SEP reconstructs the argument in a hedonist form, filling in, it says, details Epicurus "did not supply". **Hedonism** is the view that only pleasant and painful experiences are good or bad in themselves (intrinsically) for a person.

1. Only pleasant and painful experiences are intrinsically good or bad for a person.
2. So something is intrinsically good or bad for a person only if it is an experience.
3. A person's death is not an experience.
4. So death is not intrinsically good or bad for her.
5. Something is extrinsically good or bad for a person (good or bad through what it leads to) only if it makes her have things that are intrinsically good or bad for her.
6. Death and existence do not overlap in time, so death does not make her have any experiences.
7. So death is not extrinsically good or bad for her.
8. Something is good or bad for a person only if it is intrinsically or extrinsically so.
9. Therefore a person's death is not good or bad for her.

So, Epicurus concludes, it is foolish to let the fear of death hurt us now.

The SEP lists three objections. First, dying can be painful; true, but the main argument stands. Second, premise 1 is doubtful. On **preferentialism**, which ties well-being to getting what one wants, a desire can be fulfilled or thwarted without any experience: "If I want my child to be happy, and she is, my desire is fulfilled," even if I never learn of it. Third, and most important, premise 5 overlooks **harm by preclusion**: things can be bad for us by keeping goods from us. Being unconscious through a joyous event you would have enjoyed is bad for you, though you never feel the loss.

## The Deprivation Account

That third objection became the leading modern reply, the **deprivation account**: an event is overall bad for us if, and to the extent that, it makes our lifetime welfare lower than it would otherwise have been. Death is bad when it deprives us of good life we would otherwise have had. The SEP names as early proponents Thomas Nagel, in "Death" (1970), Quinn (1984) and Fred Feldman (1991).

A consequence is easy to miss. The SEP imagines Hilda, who dies painlessly at 25. Had she lived, she would have prospered for twenty-five years and suffered in the last five, so her death is overall bad for her. But if she would instead have fared badly, the same death would have been overall *good* for her. On this account death is not bad for everyone who dies; it depends on what it takes away. (Whether ending a life can be a kindness in medicine is taken up in *Bioethics: Life, Death and Medicine*.)

Nagel himself went further, holding that "The additional positive weight is supplied by experience itself, rather than by any of its contents", so that more life is always a gain and "it may be that a bad end is in store for us all." The SEP finds this implausible: we sometimes prefer not to experience at all, as under sedation before surgery.

## When Is Death Bad, and for Whom?

The Epicurean counter-attacks: if death is bad for me, *when* is it bad? The "Epicurean presumption" is that what never makes us worse off at any time is not bad for us. Deprivationists have tried every answer. **Concurrentists** say death harms us while we die (Lamont); **priorists**, before death, by thwarting desires we have now (Pitcher); **subsequentists**, after death, during the time we would have enjoyed goods (Feit; Bradley); **indefinitists**, at no determinate time (Nagel); and **atemporalists** say the badness of death is a timeless truth, true at no time (Feldman).

Subsequentism meets the **problem of the subject**, which leads straight back to "when we are, death is not": to say I am worse off after my death, we must give a welfare level to someone who no longer exists. One reply appeals to **eternalism**, the metaphysical view that past and future things are as real as present ones (Nagel; Silverstein; see *Time*). The SEP doubts that welfare concepts apply to the non-existent at all: "bags of concrete are not capable of having any welfare level".

## Lucretius and the Mirror

The Roman poet Lucretius (mid-90s to mid-50s BCE) gave a long passage of Book 3 of *De rerum natura* to the fear of death; its key line is *Nil igitur mors est ad nos*, "Therefore death is nothing to us" (3.830). He added what James Warren named the **symmetry argument**. In Rolfe Humphries's translation: "Look back at time … before our birth. In this way Nature holds before our eyes the mirror of our future after death. Is this so grim, so gloomy?" As the SEP states it:

1. We do not find it objectionable that we did not exist before we were alive.
2. Our non-existence before birth and after death are alike in all relevant respects.
3. Any objection to the one would apply to the other.
4. So it is irrational to object to death, assuming death ends our existence.

**Objection: the two are not alike.** Our complaint is not that death puts us in a ghastly state but that it precludes more good life. "Birth makes life possible … Death makes further life impossible; it brings a good thing to a close." The SEP grants a "kernel of truth" about being dead, since temporary gaps in existence would not upset us, but "temporary nonexistence is not the same as undergoing permanent nonexistence".

**Nagel's version of the objection.** It is reasonable to want to live longer but not to have been born earlier, because a person could not have begun much earlier than she did (her origin is essential to her), whereas she could have lived longer. **Reply:** Nagel himself admitted, in a footnote to the reprint in *Mortal Questions*, that this rests on questionable assumptions. A zygote frozen for a long time could have been frozen for less, and so begun earlier. **Counter-reply:** Frederik Kaufman (2016) answers that this shows an *organism* could have existed earlier, not a *person*: "Persons (properly understood) cannot exist earlier than they do." That assumes persons have psychological persistence conditions, Derek Parfit's view, which animalists reject (see *Self and No-Self: Personal Identity East and West*).

**Parfit's future bias.** In *Reasons and Persons* (1984) Parfit observed that we prefer goods to lie ahead and pains behind us; picture waking in hospital unsure whether a painful operation is over or still to come. Given this bias it is rational to mind death more than prenatal non-existence. But Parfit thought the bias "unfortunate": if we became neutral about time, we might be comforted at the end by the goods already had. **Kamm's point.** We have forward-looking projects and cannot plan for our past; Frances Kamm stresses that we do not want our lives to be "all over".

```checkpoint
q: On the deprivation account, why was Hilda's painless death at 25 bad for her in the SEP's first version of the case?
a*: Because she would otherwise have prospered for years, so her death lowered her lifetime welfare.
a: Because being dead is an unpleasant experience.
x: The account agrees with Epicurus that being dead is not experienced; the harm is what death takes away.
a: Because every death is bad for the one who dies.
x: The account implies the opposite: if Hilda's future would have been bad, her death would have been good for her.
a: Because she died before she could form any desires.
x: The case turns on the life she would have had, not on desires; desire-based views are a different reply to Epicurus.
hint: Compare her actual life with the life she would otherwise have had.
why: Death harms by deprivation, by making a life worse overall than it would have been. That is why the same account says death can be good for someone whose future would have been bad.
---
q: What is Frederik Kaufman's reply to the frozen-zygote objection to Nagel?
a: That zygotes cannot be frozen.
x: Kaufman grants the case; his point is about what it shows.
a: That we should prefer goods in the future rather than the past.
x: That is Parfit's point about future bias, a different reply.
a*: That the case shows an organism could have existed earlier, but not a person, whose beginning is the emergence of a particular consciousness.
a: That non-existence before birth and after death are exactly alike.
x: That is a premise of Lucretius's argument, which Kaufman is defending Nagel against.
hint: Distinguish the organism from the person.
why: If persons have psychological persistence conditions, a person could not have begun much earlier than she did, so there is no symmetry with the time she could have lived on. The reply depends on that view of persons, which animalists reject.
```

## Would Living Forever Be Better?

If death is bad because it deprives us, would endless life be best? Bernard Williams denied it in "The Makropulos Case: Reflections on the Tedium of Immortality" (1973). The title comes from Karel Čapek's play (1922), whose heroine, Elina Makropulos, took an elixir of youth at the court of Emperor Rudolf II and has lived more than 300 years; she has grown cold and indifferent.

Williams's argument turns on **categorical desires**, desires that do not depend on our staying alive, such as a father's desire that his daughter have a good start in life. They give us reason to go on and help make up our character, so a premature death that thwarts them is bad. But a long enough life would exhaust them, and "oppressive boredom will set in". Endless life would be desirable only if "it should clearly be me who lives forever" and the survivor's life stayed adequately related to the aims I now have in wanting to survive; replacing my categorical desires breaks one of these conditions.

Nagel, Glover and John Martin Fischer replied that endless life need not be dull. Fischer's "Why Immortality Is Not So Bad" (1994) contrasts **self-exhausting pleasures** with **repeatable** ones, such as fine food, music or spiritual experience, which can be enjoyed again when spaced out. The SEP adds that gradual change of desires is a way of surviving, and that Williams claims only that immortality cannot be made *desirable*, not that it would inevitably be bad. Others, such as Nussbaum, fear that endless life would lose its preciousness and urgency; Shelly Kagan's *Death* (2012) also holds that living forever would be bad.

## Ecclesiastes: "All Is Hevel"

Ecclesiastes (Hebrew Qōheleṯ, roughly "one who addresses an assembly") is one of the Writings of the Hebrew Bible and wisdom literature in the Christian Old Testament. Its refrain turns on **hevel**, literally "vapour" or "breath", figuratively insubstantial, futile or meaningless; it occurs some three dozen times. The King James Version renders 1:2 "Vanity of vanities … all is vanity"; the NIV, "Meaningless! Meaningless!" Michael V. Fox reads *hebel* as "absurd", drawing explicitly on Camus.

The book asks what profit comes from all our toil "under the sun", observes that death levels the wise and the foolish, and counsels enjoying food, drink and work as gifts "from the hand of God". It sets "the dead are better off than the living" (4:2) beside "a living dog is better off than a dead lion" (9:4).

Much about it is debated. Rabbinic tradition ascribes it to Solomon; critical scholars cite Persian loanwords and Aramaisms for a date no earlier than about 450 BCE, and Ben Sira's quotation of it for one no later than 180 BCE, with some favouring a Persian and others a Hellenistic setting. Most modern commentators take the epilogue (12:9–14), with "Fear God and keep his commandments", as a later scribal addition, perhaps an orthodox corrective. In Judaism it is read at Sukkot. It has been read as faith-affirming wisdom, as an early philosophy of the absurd and as deeply sceptical. Metz cites it as an early source of the argument that life without cosmic justice is senseless.

## Rehearsing Death: Stoics and Buddhists

Another response is practice rather than proof. Plato's *Phaedo* says philosophy, properly practised, is "about nothing else but dying and being dead", and the Roman Stoics made this a daily exercise. Seneca rejected the idea that death is an evil and wrote, especially in his *Consolations* and *Letters*, to free people from fearing it. Epictetus located the trouble in judgment: "What upsets people is not things themselves but their judgments about the things. For example, death is nothing dreadful (or else it would have appeared dreadful to Socrates)" (*Handbook* 5, tr. Nicholas White). Marcus Aurelius told himself, in George Long's translation: "Do not act as if thou wert going to live ten thousand years. Death hangs over thee. While thou livest, while it is in thy power, be good."

Buddhism, with a different metaphysics (see *The Buddha and Early Buddhist Philosophy*), counts ageing, illness and death among forms of suffering. **Maraṇasati**, "mindfulness of death", is defined in two early discourses. In Bhikkhu Sujato's translation of the first (AN 6.19), monks who develop it "by wishing to live as long as it takes to breathe out after breathing in … live diligently"; the second compares the urgency to having one's head on fire. Other discourses teach contemplation of a corpse through nine stages of decay.

The best-known Buddhist story of grief is Kisā Gotamī's. Her only child dies and she carries the body about seeking medicine. The Buddha asks for mustard seed from a house where no one has died; she finds none, understands that death is universal, and becomes a nun. But the story is **not in the canon**: it is told in later commentaries, and the canonical verses under her name tell a different story. In a canonical discourse she declares: "I've gotten past the killing of [my] sons… I don't grieve, I don't weep" (tr. Thanissaro).

## Zhuangzi and the Pathos of Things

In the Daoist *Zhuangzi* (see *Mozi, the Daoists and the Legalists: the Hundred Schools*), Zhuangzi's friend Huizi finds him after his wife's death "pounding on a tub and singing". He explains:

```quote
When she first died, do you think I didn't grieve like anyone else? But I looked back to her beginning and the time before she was born. … It's just like the progression of the four seasons, spring, summer, fall, winter.
Zhuangzi · Zhuangzi, chapter 18 (tr. Burton Watson) · translation 1964
```

To follow her "bawling and sobbing", he says, would show he understood nothing about fate. Like Lucretius he looks back before birth, but to place death within natural transformation, not to prove it harmless. The story is in chapter 18, an **outer chapter**; traditionally only the inner chapters are ascribed to Zhuangzi himself, so it belongs to the Zhuangzi tradition rather than certainly to him.

Japanese aesthetics found value in transience itself. ***Mono no aware***, "the pathos of things", runs from the eighth-century *Man'yōshū* through Murasaki Shikibu's *Tale of Genji*; its emblem is the cherry blossom, prized because it falls within about a week. Yoshida Kenkō wrote in *Essays in Idleness*:

```quote
If man were never to fade away like the dews of Adashino, never to vanish like the smoke over Toribeyama, how things would lose their power to move us! The most precious thing in life is its uncertainty.
Yoshida Kenkō · Essays in Idleness (tr. Donald Keene) · c. 1332
```

Where Williams argued that immortality would be tedious, Kenkō argued that mortality is a condition of value.

## Tolstoy's Crisis

In the late 1870s, after *War and Peace* and *Anna Karenina*, Leo Tolstoy had wealth, fame and family, and was obsessed with suicide. *A Confession* records the crisis. It was written in 1879–80, suppressed by the censor in 1882, published in Geneva in 1884, and in Russia only in 1906.

{{image: Leo Tolstoy | Leo Tolstoy, whose *A Confession* records the crisis of meaning he went through in the late 1870s.}}

His question, in the IEP's summary: since I will suffer, die, be forgotten and make no difference in the long run, how can my life have any meaning? The sciences and the sages, Ecclesiastes included, gave only negative answers. To express his state he retold an "Eastern" fable. A traveller fleeing a beast hides in a dry well, sees a dragon waiting below, and clings to a branch that two mice, one black and one white (night and day), are gnawing, while he licks honey from the leaves. Tolstoy could no longer taste the honey of family and writing. The parable is an ancient Indian one that reached Russia through the Barlaam and Josaphat legend, a Christianised life of the Buddha.

He weighed ignorance, enjoyment (morally empty while others are poor), suicide and simply clinging on. His way out came from the unlearned peasants: meaning lies in an irrational knowledge called faith, faith in God and a right relation to the infinite.

Analytic philosophers have extracted an argument from his despair: life is meaningful only if something is worth doing; something is worth doing only if it makes a **permanent difference**; a permanent difference requires immortality. The reply in Metz's survey is that helping people is worth doing even though all are mortal, and Wielenberg argues it is worthwhile precisely *because* they are.

## Camus and the Absurd

Albert Camus opened *The Myth of Sisyphus* (1942): "There is but one truly serious philosophical problem, and that is suicide" (tr. Justin O'Brien). The **absurd** is the confrontation of our demand for clarity with "the unreasonable silence of the world". Camus rejects both suicide and hope, urges us to live on in revolt, and ends: "One must imagine Sisyphus happy." *Existentialism: Sartre, Beauvoir and Camus* sets out the argument and its critics. Metz classes Camus, like Tolstoy before faith, as a nihilist who held that only God or a soul could give life meaning, and that neither exists.

Thomas Nagel's "The Absurd" (1971) relocated the problem in "the collision between the seriousness with which we take our lives and the perpetual possibility of regarding everything about which we are serious as arbitrary, or open to doubt." He found Camus's defiance "romantic and slightly self-pitying", and recommended approaching "our absurd lives with irony instead of heroism or despair."

```checkpoint
q: What is distinctive about the source of the Kisā Gotamī mustard-seed story?
a: It is the opening of the first noble truth.
x: The noble truths are a canonical teaching; the story is not part of them.
a*: It is told in later commentaries, not in the canonical verses ascribed to her, which tell a different story.
a: It comes from the Zhuangzi's outer chapters.
x: That is where Zhuangzi drums on a tub after his wife's death.
a: It is Tolstoy's Eastern fable of the man in the well.
x: Tolstoy's fable has Indian roots, but it is a different story about a traveller, a dragon and two mice.
hint: Canon versus commentary.
why: The canonical verses under her name tell a different story; the mustard seed belongs to later commentarial tradition. In a canonical discourse she says she has "gotten past the killing of [my] sons".
---
q: Which argument do analytic philosophers draw from Tolstoy's crisis?
a: That death is nothing to us because we never experience it.
x: That is Epicurus's argument, which Tolstoy does not use.
a: That immortality would be tedious because categorical desires run out.
x: That is Williams's argument, the opposite worry.
a: That life is meaningful only when subjective attraction meets objective attractiveness.
x: That is Susan Wolf's hybrid view.
a*: That something is worth doing only if it makes a permanent difference, which requires immortality.
hint: What did Tolstoy fear his life would fail to leave behind?
why: It is a soul-centred argument. The reply is that helping mortal people is worth doing anyway; Wielenberg argues it is worthwhile because they are mortal.
```

## What Makes a Life Meaningful?

Metz's SEP entry maps the current answers. **Supernaturalism** says meaning depends on God or a soul: in its *extreme* form, for any meaning at all; in its *moderate* form, only for great or ultimate meaning. The oldest version is the **God's-purpose view**: a life is meaningful insofar as it fulfils a purpose God assigned. It faces the Euthyphro problem (is something valuable because God wills it, or willed because it is valuable?) and the charge, harking back to Sartre and put in analytic terms by Kurt Baier (1957), that an assigned purpose would degrade us. Nozick saw a regress: a finite thing gets meaning from something beyond it, and only something unlimited ends the chain; limited transcendence gives only limited meaning, and "We may thirst for more" (1981). Lives like Einstein's or Mandela's seem meaningful even if there is no God, pushing many towards the moderate view.

**Naturalists** locate meaning in a physical world. **Subjectivists** make it depend on a person's attitudes; for Harry Frankfurt it lies in caring and loving. Richard Taylor's classic case begins with Sisyphus as the paradigm of a meaningless life, then imagines the gods implanting in him a desire to roll stones: now his life has meaning *for him*, though nothing outside him has changed. Critics reply with counterexamples such as a life devoted to long-distance spitting. **Objectivists** hold that meaning is partly mind-independent: "morality (the good), enquiry (the true), and creativity (the beautiful)" confer it, "trimming toenails and eating snow" do not. Metz's own theory locates it in exercising rational nature in exceptional ways. Susan Wolf's hybrid joins the two: "Meaning arises when subjective attraction meets objective attractiveness" (1997). Caring about a worthless project gives no meaning; nor does a worthwhile one you do not care about.

Metz notes that deep longings for eternal completion are rarer in "Confucian, Hindu, or traditional African" thought. Aribiah David Attoe's IEP survey identifies seven African theories of meaning, including a vital force theory and a **communal normative theory**, which rests on communalism, in Mbiti's formula "I am because we are and since we are, therefore I am", and on the Ubuntu saying that "a person is a person through other persons". Meaning comes from engaging harmoniously with others and so achieving personhood (see *African Philosophy: the Ethnophilosophy Debate and Beyond*).

## Nihilism and Pessimism

**Nihilism** about meaning holds that what would make a life meaningful cannot obtain for any of us. Metz lists several routes: extreme supernaturalism plus atheism (Camus); an error theory denying objective values (Mackie); and the thought that an infinite universe already holds infinite value, so we can add nothing. The most developed pessimist today is the South African philosopher David Benatar, whose *Better Never to Have Been* (2006) offers an **asymmetry argument** for **anti-natalism**, the view that it is better not to bring new people into existence:

1. The presence of pain is bad.
2. The presence of pleasure is good.
3. The absence of pain is good, even if no one enjoys that good.
4. The absence of pleasure is not bad unless there is someone for whom it is a deprivation.
5. So coming into existence is always a harm compared with never existing.

In *The Human Predicament* (2017) he allows that lives have meaning on earth but denies them **cosmic** meaning. Critics reply that lives could have cosmic significance (Kahane; Wolf), that it does not matter (Landau), or that the idea is incoherent (Maitzen).

## Further exploration

- **Shelly Kagan, *Death* (2012).** A book-length treatment of whether death is bad for us and whether immortality would be desirable; Kagan thinks living forever would be bad.
- **James Warren, *Facing Death: Epicurus and His Critics* (2004).** The Epicurean and Lucretian arguments, deprivation and symmetry, set against their modern critics.
- **Susan Wolf, *Meaning in Life and Why It Matters* (2010).** The "fitting fulfilment" view, with commentaries by other philosophers.
- **Thaddeus Metz, *Meaning in Life: An Analytic Study* (2013).** A systematic survey of the field, with Metz's own theory.
- **Aribiah David Attoe (ed.), *African Perspectives to the Question of Life's Meaning* (2024).** African philosophers on what makes a life meaningful.
- **David Benatar, *The Human Predicament* (2017).** The pessimist's case on meaning, death and suffering.$meaning_master$,
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
  select $meaning_quiz$[
    {"type": "mcq", "prompt": "Which premise of the SEP's reconstruction of Epicurus's argument does the objection from 'harm by preclusion' attack?", "options": ["The claim that something is extrinsically bad for a person only if it makes her have intrinsically bad experiences", "The claim that death is not an experience", "The claim that the soul is made of atoms", "The claim that dying can be painful"], "answerIndex": 0, "explanation": "Harm by preclusion (Nagel's point) says things can be bad for us by depriving us of goods, as being unconscious through a joyous event would be. That denies that extrinsic badness requires causing bad experiences, the premise the SEP calls extrinsic instrumentalism.", "id": "q1"},
    {"type": "mcq", "prompt": "What does Bernard Williams mean by 'categorical desires', and what role do they play in his argument about the Makropulos case?", "options": ["Desires for pleasure, which an endless life would satisfy perfectly", "Desires that do not depend on our staying alive; they give us reason to live, but an endless life would exhaust them and bring boredom", "Desires that God assigns to each person as a purpose", "Desires that can only be satisfied after death"], "answerIndex": 1, "explanation": "Categorical desires, such as a father's desire that his daughter have a good start, give us reason to go on living, so premature death is bad. But a long enough life would exhaust them and 'oppressive boredom will set in'. Fischer replied that repeatable pleasures need not run out.", "id": "q2"},
    {"type": "mcq", "prompt": "Which statement about the dating of Tolstoy's A Confession matches the chapter?", "options": ["It was written and published in Russia in 1882", "It was written in 1906, after his excommunication", "It was written in 1879–80, suppressed by the censor in 1882, published in Geneva in 1884 and in Russia only in 1906", "It was written in the 1860s, before War and Peace"], "answerIndex": 2, "explanation": "The work is often dated 1882, but that was the year a journal's attempt to print it was suppressed by censorship. It appeared in Geneva in 1884 and in Russia only in 1906.", "id": "q3"},
    {"type": "mcq", "prompt": "What is Susan Wolf's hybrid view of meaning in life?", "options": ["Meaning depends entirely on what a person cares about, whatever it is", "Meaning requires fulfilling a purpose assigned by God", "Life is meaningless because nothing has cosmic significance", "Meaning arises when subjective attraction meets objective attractiveness"], "answerIndex": 3, "explanation": "Wolf combines subjectivism and objectivism: caring about a worthless project gives no meaning, and neither does a worthwhile project one does not care about. The first option is pure subjectivism, the second the God's-purpose view, the third Benatar's denial of cosmic meaning.", "id": "q4"},
    {"type": "open", "prompt": "Set out Lucretius's symmetry argument step by step and evaluate it, using at least two of the replies discussed in the chapter (the asymmetry of birth and death, Nagel and the frozen zygote, Kaufman, Parfit's future bias, Kamm).", "rubric": "A strong answer states the argument: we do not object to our non-existence before birth; pre-natal and post-mortem non-existence are alike in all relevant respects; so any objection to one applies to the other; so it is irrational to object to death. It quotes or paraphrases Lucretius's mirror image (Humphries translation). It discusses at least two replies accurately: death precludes more good life whereas birth makes life possible, though the SEP grants a kernel of truth about temporary gaps; Nagel's claim that a person could not have been born much earlier but could have lived longer, his own admission that this rests on questionable assumptions about origins, and the frozen-zygote counterexample; Kaufman's reply that an organism but not a person could have existed earlier, which assumes psychological persistence conditions that animalists reject; Parfit's bias towards the future, rational given our attitudes but in his view unfortunate; Kamm's point that we have forward-looking projects and do not want our lives to be 'all over'. Credit for a reasoned verdict.", "id": "q5"},
    {"type": "open", "prompt": "Compare two responses to mortality from different traditions discussed in the chapter (for example Stoic meditation on death, Buddhist maraṇasati, Zhuangzi on his wife's death, Kenkō and mono no aware, Ecclesiastes, or Tolstoy's turn to faith). What does each take death to show about how to live, and what caveats about the sources should a careful reader keep in mind?", "rubric": "A strong answer describes two responses accurately: e.g. Epictetus's claim that what upsets us is our judgments, not death itself, and Marcus Aurelius's 'Do not act as if thou wert going to live ten thousand years'; maraṇasati as wishing to live only a breath and living diligently, and the Kisā Gotamī story; Zhuangzi looking back to his wife's time before birth and comparing death to the seasons; Kenkō's view that uncertainty is what makes things move us; Ecclesiastes' hevel and counsel to enjoy food, drink and work; Tolstoy's finding meaning in faith after despair. It notes caveats: the mustard-seed story is commentarial, not canonical; the Zhuangzi story is in outer chapter 18, not the inner chapters; Ecclesiastes' date, authorship and epilogue are debated and it is read in several ways; Tolstoy's Confession has a complicated publication history. Credit for linking a response to the analytic debates (e.g. Zhuangzi's parallel with Lucretius, Kenkō as a foil to Williams).", "id": "q6"}
  ]$meaning_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/ethics/meaning-and-death', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

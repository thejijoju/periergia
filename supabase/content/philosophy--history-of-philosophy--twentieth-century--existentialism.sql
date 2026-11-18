-- Existentialism: Sartre, Beauvoir and Camus — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/twentieth-century/existentialism @ research/advanced/read.
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
    'philosophy/history-of-philosophy/twentieth-century/existentialism',
    'research',
    'advanced',
    'read',
    $existentialism_master$> **In Paris after the Second World War, a philosophy of freedom and responsibility became a public sensation.** This chapter explains the label "existentialism" and why most of those it named refused it; sets out Jean-Paul Sartre's account of freedom and bad faith, his argument for radical freedom and its critics; and follows Simone de Beauvoir's ethics of ambiguity and *The Second Sex*, Albert Camus's argument about the absurd, and Frantz Fanon's existential critique of colonial racism, before glancing at existentialism elsewhere.

## A Label Nobody Wanted

The word "existentialism" was coined by the French Catholic philosopher Gabriel Marcel at some point in 1943–45 (sources differ). When Marcel applied it to Sartre in 1945, Sartre rejected it; Beauvoir's memoir (in R. Howard's translation) records him saying, "My philosophy is a philosophy of existence; I don't even know what Existentialism is." Yet, she recalled, "In the end, we took the epithet that everyone used for us and used it for our own purposes."

According to the *Stanford Encyclopedia of Philosophy* (SEP), only Sartre and Beauvoir explicitly called themselves existentialists. Camus "forcefully separated himself" from the movement, Heidegger repudiated the label in 1946, Jaspers preferred a "philosophy of reason", and Marcel first accepted and later repudiated "Christian existentialism". Since there is "no unifying doctrine", the SEP describes overlapping themes: nihilism, existence preceding essence, freedom, authenticity (owning one's choices rather than hiding from them), engagement and ethics.

Its roots were older. Kierkegaard and Nietzsche, who never used the word, came to be seen as precursors, though calling Kierkegaard the "father of existentialism" "obscures at least as much as it reveals" (see *Schopenhauer and Kierkegaard* and *Nietzsche*). Dostoevsky, Miguel de Unamuno (*Tragic Sense of Life*, 1913) and Jaspers, with his "boundary situations", prepared the ground. Above all, Heidegger's *Being and Time* (1927) said, in Macquarrie and Robinson's translation, that "the 'essence' of Dasein lies in its existence", the line Sartre turned into a slogan (see *Phenomenology: Husserl, Heidegger and Merleau-Ponty*).

## Sartre: Being and Nothingness

Jean-Paul Sartre (1905–1980) failed the agrégation, France's competitive teaching examination, at his first attempt and came first in 1929. He studied phenomenology in Berlin around 1933, published the novel *Nausea* in 1938, and was a prisoner of war in 1940–41. *Being and Nothingness* appeared in 1943 (translated by Hazel Barnes in 1956 and Sarah Richmond in 2018).

The book divides reality in two. **Being-in-itself** is the "pure plenitude" of things: an inkwell simply is what it is. **Being-for-itself** is consciousness, which in Barnes's translation is "a being which is what it is not and is not what it is": it always reaches beyond what is given. Sartre's evidence is **nothingness**. If I arrive at a café expecting my friend Pierre and he is not there, his absence "pervades the whole café".

That power of negation is freedom. No fact, "even poverty", forces consciousness to take it as a lack; it is the worker's grasp of revolution as possible that turns suffering into a motive. A hiker who gives in to fatigue has made fatigue his reason; he could have done otherwise, so he chose. Hence his hyperbolic phrase that we are "condemned to be free": we can never simply be what we are, and must keep choosing ourselves. The consciousness of this freedom is **anguish**. Freedom is not power to achieve anything: we always act within **facticity**, the given facts of body, past and place, and the SEP stresses that this is "not a voluntarist or capricious account".

## Bad Faith, Step by Step

**Bad faith** (*mauvaise foi*) is a lie to oneself about this structure: denying, or over-identifying with, either our facticity or our transcendence (our power to go beyond the given). Its commonest form is treating oneself as a thing ("I am what I am"). Sartre's café waiter shows how:

1. His movements are "a little too precise, a little too rapid"; he plays at being a waiter like an automaton.
2. He is trying to be a waiter the way an inkwell is an inkwell: fixed and finished.
3. But only a free consciousness can choose and act out a role, so the project presupposes the freedom it denies.
4. Hence, in Barnes's translation, "I am a waiter in the mode of being what I am not."

The second example runs the other way. A woman on a first date ignores the sexual meaning of her companion's compliments, as if they were addressed to her as pure mind. When he takes her hand, she leaves it there, "neither consenting nor resisting – a thing", postponing the choice: her hand becomes mere facticity while she treats herself as pure transcendence.

Sartre denied that Freud could explain such self-deception: an unconscious censor that must know what it represses merely relocates the paradox of a liar and a lied-to within one mind. Bad faith is "an immediate, permanent threat to every project of the human being".

## The Argument for Radical Freedom

The SEP calls Sartre's case "an inference to the best explanation":

1. We meet negations directly in experience: Pierre's absence, destruction, fragility, questions that admit the answer "no".
2. Being-in-itself is pure positivity: after a storm there is "not less", just something else.
3. So negation must enter the world through a being that can detach itself from what is: consciousness.
4. This power of detachment is freedom: no fact can of itself make consciousness respond in one way; we choose, usually without reflecting, what it means and which ends we pursue.
5. Anguish is the direct, felt evidence of this freedom.
6. Therefore human reality is free in its very mode of being, and responsible for its situation.

**Objection: begging the question.** The split between for-itself and in-itself may assume what it sets out to prove. *Reply:* Sartre argues that neither realism nor idealism can account for negation, and offers anguish as evidence, as an inference to the best explanation should.

**Objection: situation.** The most influential criticism came from Maurice Merleau-Ponty's *Phenomenology of Perception* (1945). As the SEP summarises it, he rejected the view that freedom is "either total or null": freedom arises within our "universal engagement in a world" of meanings we did not choose, and "acquired habits and the sedimented choices of our lives have their own inertia". Situation is "precisely the field in which it can be achieved". *Reply:* Sartre learned. His *Critique of Dialectical Reason* (1960) added the "practico-inert", the weight of matter and institutions left by past action, which had featured only minimally before.

**Objection: ethics.** If values are chosen, what rules out an "authentic Nazi" who owns his choice? *Reply:* Sartre's 1945 lecture claimed that "I am obliged to want others to have freedom at the same time that I want my own freedom" (Bernard Frechtman's translation), though Thomas Flynn judges Sartre's underlying thesis, that freedom is the implicit object of every choice, to be one "he makes but does not adequately defend". His *Notebooks for an Ethics* (written 1947–48, published 1983) attempted more, and Beauvoir built the fullest answer.

**Two further objections.** Heidegger's "Letter on Humanism" (1946, published 1947) replied that merely reversing a metaphysical statement, putting existence before essence, stays inside metaphysics. And Wollheim and Baldwin argued that Sartre misread Freud; the SEP calls it "debated" whether his treatment is reasonable.

## The Look and "Hell Is Other People"

How do I know other minds exist? Through the **look**. Peering through a keyhole, I hear footsteps and suddenly grasp myself as an object for someone else: I feel shame. The Other is encountered, not inferred. But the encounter is a contest:

```quote
It is useless for human reality to seek to escape this dilemma: one must either transcend the Other or allow oneself to be transcended by him. The essence of the relations between consciousness is not the Mitsein (being-with); it is conflict.
Jean-Paul Sartre · Being and Nothingness, p. 429 (tr. Hazel Barnes) · 1943
```

The SEP calls this essentially Hegel's master–slave struggle "without the possibility of its overcoming" (see *German Idealism: Fichte, Schelling and Hegel*). The play *No Exit*, which opened in Paris in May 1944, dramatised it: three dead people find no instruments of torture in hell, and Garcin concludes, "Hell is—other people" (Stuart Gilbert's translation; "L'enfer, c'est les autres"). In the mid-1960s, in a spoken preface to a recording of the play, Sartre said the line had always been misunderstood: relations with others are not always poisoned, but when they are twisted, the judgements of others, through which we know ourselves, become hell.

## The 1945 Lecture

In late October 1945 (on the 29th; some sources say the 28th) Sartre lectured to a packed hall at the Club Maintenant in Paris. Published in 1946 as *Existentialism Is a Humanism*, it popularised *Being and Nothingness* and answered Marxist and Christian critics. Its first principle, in Frechtman's translation, is that "existence precedes essence". An artisan makes a paper-knife from a prior idea of its purpose, so its essence comes first; theists picture God making humans likewise. Without God, the human being first exists and only afterwards defines himself. Existentialism, Sartre said, draws all the consequences of consistent atheism.

The consequences include anguish (in choosing for myself I choose an image of humanity) and abandonment (no God tells us how to live). "There are no excuses behind us nor justifications before us." His example was a pupil whose brother had been killed by the Germans and whose father collaborated, torn between his mother, who lived only for him, and the Free French. No Christian or Kantian doctrine could decide; Sartre told him he was free and must choose, that is, invent. The transcript, Flynn reports, was "the only publication that Sartre openly regretted seeing in print": he regretted its publication, which is not to say he disowned its ideas.

## Sartre's Public Life

The lecture came two weeks after the first issue of *Les Temps modernes* (October 1945), named after Chaplin's *Modern Times* and directed by Sartre with Beauvoir and Merleau-Ponty on its board. *Anti-Semite and Jew* (1946) treated racism as bad faith, a belief in fixed essences. *Search for a Method* (1957) held historical materialism the only valid interpretation of history and existentialism the only concrete approach to reality; the *Critique* described the "seriality" of people in a bus queue, side by side yet isolated. Never a Communist Party member, he supported the party until the Soviet invasion of Hungary in 1956, and later the Maoists (see *Power and Protest in the Long 1960s: the May 1968 Movement*).

In 1964 he was awarded the Nobel Prize in Literature. On 14 October he had written asking to be removed from the list; the letter went unread, the award was announced on 22 October, and he declined, saying that a writer "should not allow himself to be turned into an institution". He died on 15 April 1980; estimates of his funeral crowd range from 50,000 to 100,000.

```checkpoint
q: What does Sartre's café waiter illustrate?
a*: Bad faith: he tries to be a waiter the way a thing is what it is, a project that only a free consciousness could undertake.
a: Sincerity: he honestly coincides with his social role.
x: Sartre held that sincerity, being exactly what one is, is impossible for consciousness; the waiter only plays at coinciding.
a: The look: he feels shame when a customer catches him spying.
x: Shame under the gaze of another is the keyhole example, not the waiter.
a: Seriality: he is one isolated unit in a crowd, like people in a bus queue.
x: Seriality comes from the Critique of Dialectical Reason (1960), not from the waiter passage of Being and Nothingness.
hint: Ask what kind of being the waiter is pretending to have.
why: The waiter acts like an automaton to make himself a waiter in the mode of an inkwell, but choosing a role presupposes the freedom he denies; he is a waiter "in the mode of being what I am not".
---
q: What was Merleau-Ponty's chief objection to Sartre's account of freedom?
a: That freedom is an illusion because physics determines every action.
x: Merleau-Ponty did not defend determinism; he held that situation is the field in which freedom is achieved.
a: That Sartre had copied the idea from Beauvoir's She Came to Stay.
x: That influence debate was raised much later by the Fullbrooks, about Beauvoir's novel, not by Merleau-Ponty.
a*: That freedom is not "either total or null" but arises within a world of meanings we did not choose, against the inertia of habit.
a: That Sartre merely reversed Plato's order of essence and existence.
x: That is Heidegger's objection in the "Letter on Humanism".
hint: Think of habits and "sedimented" choices.
why: In Phenomenology of Perception (1945) Merleau-Ponty argued that our engagement in a world and our sedimented habits do not abolish freedom but give it a field; Sartre's later Critique took on board this social weight in the "practico-inert".
```

## Beauvoir: Freedom Needs Others

Simone de Beauvoir (1908–1986) passed the agrégation in 1929 at twenty-one, the youngest ever to do so and, according to the SEP, only the eighth woman; she came second to Sartre. Their pact of 1929 made theirs an "essential" love, with "contingent loves" disclosed to each other; both have been criticised for their sexual ethics. In the 1930s and 1940s she had relationships with younger women, including former pupils, some also involved with Sartre; one, Bianca Lamblin, later wrote that she had felt deceived. After a complaint by a pupil's mother, Beauvoir lost her teaching licence under Vichy in 1943 (the SEP gives 1941); reinstated in 1945, she never taught again. She refused to call herself a philosopher and was long treated as Sartre's disciple.

Her first philosophical essay, *Pyrrhus and Cinéas* (1944), argued that "a man alone in the world would be paralyzed by … the vanity of all of his goals. But man is not alone in the world." I cannot touch another's freedom; I can only appeal to others to take up my projects, which requires that they be free and materially equal. Where appeal fails, "we are … condemned to violence" (in *Philosophical Writings*, ed. Margaret Simons), an "uneasy" conclusion, the SEP notes.

*The Ethics of Ambiguity* (1947) met the ethical objection directly. We are ambiguous, subjects for ourselves and objects for others, never coinciding with ourselves. Against Dostoevsky's "if God is dead, everything is permitted", she argued that without God to pardon us we are "totally and inexcusably responsible". The argument:

1. We begin as children in a "serious world" of ready-made values, privileged but mystified.
2. Adolescence demands that we take responsibility for our freedom.
3. We can flee it, in bad faith, by staying in the serious world.
4. The **serious man** subordinates his freedom to an external idol, "the Cause", "Fame", "Power": for the *Internet Encyclopedia of Philosophy*, the ultimate example of bad faith.
5. The **adventurer** comes closer to morality but cares only for his own freedom, so can become a tyrant's tool or a tyrant.
6. Recognising our freedom is therefore necessary but not sufficient: ethical freedom must embrace "the ties that bind me to others" and work for the material and political conditions of their freedom.
7. So I cannot will my freedom without willing others'. Evil is the denial of freedom; in Frechtman's translation, "to will oneself moral and to will oneself free are one and the same decision".

The strongest objection is her own: in *The Force of Circumstance* she judged the book too abstract, defining morality apart from social context. The best reply is what she wrote next.

## The Second Sex

*The Second Sex* (1949) began in 1946 with a question: "What has it meant to me to be a woman?" Its claim is that "woman is the Other, man is the essential being". Volume I examines the facts and myths of the "eternal feminine"; Volume II, lived experience. Women are confined to **immanence**, the repetitive, passive round of maintaining life, and denied **transcendence**, the free projection of new ends. Beauvoir argued for equality while recognising sexual difference: "the body is a situation".

{{image: The Second Sex | First editions of Beauvoir's Le Deuxième Sexe (1949).}}

The Other came from Hegel's master–slave dialectic, read through Alexandre Kojève, but women, unlike other oppressed groups, have no shared history and are dispersed among men. Volume II opens: "On ne naît pas femme: on le devient." H. M. Parshley (1953) translated it "One is not born, but rather becomes, a woman"; Constance Borde and Sheila Malovany-Chevallier (2009–10) dropped the article, "One is not born, but rather becomes, woman", since woman here means a construct. Whether the sentence introduces the distinction between sex and gender is debated: Butler on one side, Toril Moi and Nancy Bauer on the other (see *Feminist Philosophy*). Her treatment of race is "vexed": critics such as bell hooks say she generalised from a white bourgeois standpoint.

The book sold about 22,000 copies in its first week and was placed on the Vatican's Index; Camus, she recalled, "was furious … saying I had ridiculed the French male". Parshley, a zoologist, cut about 15 per cent of the text and mistranslated central concepts; the 2009–10 translation, which Beauvoir had asked for in 1985, restored the cuts but was criticised for awkward style and syntax. *The Coming of Age* (1970) treated old age, too, as a situation of Otherness produced by culture and economics.

Did she shape Sartre? Kate and Edward Fullbrook (1994) argued that he drew on the manuscript of her novel *She Came to Stay*, which he read in February 1940; Margaret Simons also pressed her originality. Beauvoir insisted she merely elaborated Sartre's philosophy, but her diaries show that he "often relied on Beauvoir's intellectual acuity", and scholars have turned from priority disputes to her own contribution.

## Camus and the Absurd

Albert Camus (1913–1960) was born in French Algeria to a deaf, illiterate mother of Spanish descent. He reported in 1939 on famine in Kabylie and from 1944 edited the Resistance paper *Combat*. In 1942 came the novel *The Stranger* and *The Myth of Sisyphus*, which opens, in Justin O'Brien's translation: "There is but one truly serious philosophical problem, and that is suicide." Judging whether life is worth living, he goes on, answers the fundamental question of philosophy.

The **absurd** is the "divorce" between our "wild longing for clarity" and "the unreasonable silence of the world". It belongs to the relation between us and the world, not to either alone. The argument:

1. Human beings cannot help seeking unity, meaning and clarity.
2. The world gives no answer: "This world in itself is not reasonable, that is all that can be said."
3. The absurd is the confrontation of the two.
4. To stay true to these premises we must keep both terms alive. Suicide abolishes the questioner; religious or philosophical hope, which Camus finds in Kierkegaard, Jaspers and others who "deify what crushes them", abolishes the world's silence.
5. Therefore the consistent response is lucid revolt, living "without appeal": the absurd demands life, not death.

**Objection:** Francis Jeanson argued in 1947 that a philosophy of the absurd is "a contradiction in terms", an anti-rational posture ending in silence. *Reply:* Sagi reads Camus as using reason to map its own limits; as Camus himself puts it, "the absurd is lucid reason noting its limits". **Objection:** Ronald Aronson finds assertion rather than argument, and "a certain sleight of hand" in the move from meaninglessness to values. *Reply:* Camus sought the consequences of a common experience, not a proof, and the demand for consistency in step 4 carries his conclusion.

```quote
The struggle itself toward the heights is enough to fill a man's heart. One must imagine Sisyphus happy.
Albert Camus · The Myth of Sisyphus, p. 123 (tr. Justin O'Brien) · 1942
```

Sisyphus, condemned by the gods to labour that accomplishes nothing, is the absurd hero, "proletarian of the gods, powerless and rebellious", "stronger than his rock" as he walks back down. Meursault, in *The Stranger*, kills "an Arab" on a beach; Kamel Daoud has retold the story from the victim's family's side.

## Revolt, Algeria and the Break with Sartre

*The Rebel* (1951) moved from suicide to murder. Revolt creates solidarity, "I revolt, therefore we are" (Knopf English edition, 1954), but revolutions that justify killing for the future end in "logical crime"; Camus urged measure. Sartre gave the review in *Les Temps modernes* to Jeanson (May 1952); Camus's reply, addressed to "Monsieur le directeur", appeared with responses from Sartre and Jeanson that August. The friendship was over, and the two became leading voices of the anti-Communist and pro-Communist left.

Camus won the Nobel Prize in Literature in 1957. On 12 December, two days after the ceremony and not in his Nobel lecture, an Algerian student challenged him at a student meeting in Stockholm. *Le Monde* reported his answer as "Je crois à la justice, mais je défendrai ma mère avant la justice" (I believe in justice, but I will defend my mother before justice), though the exact wording is disputed; another version adds that bombs were being thrown into the trams of Algiers, where his mother might be. "Between justice and my mother" is a later truncation. Critics called the answer colonialist. He died in a car crash on 4 January 1960.

## Fanon: Existentialism and the Colonised

Frantz Fanon (1925–1961), born in Martinique and influenced by Aimé Césaire, then a teacher at his lycée, fought with the Free French and trained in psychiatry at Lyon. His rejected dissertation became *Black Skin, White Masks* (1952). From 1953 he headed a service at the Blida-Joinville psychiatric hospital in Algeria; he joined the FLN, the Algerian independence movement, after the war began in 1954, and was expelled in January 1957 (see *Decolonization*).

The book's method, drawing on phenomenology, Négritude, psychoanalysis, Hegel and Marxism, is disputed; Lewis Gordon reads it as existential-phenomenological. Fanon describes a "zone of non-being" where Black people are locked into blackness. In chapter five a white child points: "Look, a Negro!" (C. Markmann's 1967 translation). Fanon reworks Sartre's look, which fixes its object, and Merleau-Ponty's body schema into an "epidermal racial schema". Even the chapter title is contested: Markmann's "The Fact of Blackness" renders *L'expérience vécue du Noir*, which Richard Philcox's 2008 translation gives as "lived experience"; David Macey objected that Fanon's point is that there is no "fact" of blackness. Against Sartre's *Anti-Semite and Jew*, Fanon distinguished anti-Black contempt from anti-Semitic fear. Against Sartre's "Black Orpheus" (1948), which called for an "anti-racist racism" and treated Négritude as a step towards revealing race itself as bad faith, he insisted on his own lived experience. His chapter on Hegel observes that the colonial master wants work, not recognition (see *German Idealism: Fichte, Schelling and Hegel*).

*The Wretched of the Earth* (1961) argued that violence is the precondition of liberation and warned against a national bourgeoisie. Sartre's preface "appears to endorse a counter-violence"; after 1967, because of Sartre's support for Israel in the Six-Day War, Fanon's widow Josie had it removed from new editions, and Homi Bhabha later criticised it for narrowing the book to violence. Fanon died on 6 December 1961 in Bethesda, Maryland, of leukaemia (pneumonia is often cited as the immediate cause). In the SEP's words, *Black Skin, White Masks* "helped give birth to Africana critical theory or 'black existentialism'", a tradition to which Gordon's own *Bad Faith and Antiblack Racism* (1995) belongs (see *Race, Colonialism and Philosophy*).

```checkpoint
q: According to Camus, why are both suicide and hope the wrong responses to the absurd?
a: Because the world is in fact reasonable once properly understood.
x: Camus's second premise is that the world in itself is not reasonable.
a*: Because each abolishes one of the two terms whose confrontation is the absurd: suicide the questioner, hope the world's silence.
a: Because God forbids suicide and rewards hope.
x: Camus rejects appeals to God; religious hope is one of the evasions he criticises.
a: Because Sartre had already proved that human beings are condemned to be free.
x: Camus distinguished his view from Sartre's and argued from the structure of the absurd itself.
hint: The absurd is a relation between two things.
why: The absurd is the divorce between our longing for clarity and the world's silence; consistency requires keeping both alive, so the response is lucid revolt, living "without appeal".
---
q: How did Fanon rework Sartre's idea of the look in Black Skin, White Masks?
a: He rejected it entirely in favour of Kantian ethics.
x: Fanon drew on and revised Sartre's look rather than discarding it for Kant.
a: He argued that the look always yields mutual recognition.
x: Fanon was suspicious of recognition modelled on whiteness; his point is that the racist look fixes and denies.
a: He applied it only to anti-Semitism, following Anti-Semite and Jew.
x: Fanon contrasted anti-Black racism with anti-Semitism rather than collapsing them.
a*: He showed how a racist gaze ("Look, a Negro!") fixes the Black body through an "epidermal racial schema".
hint: Think of the white child pointing.
why: Fanon combined Sartre's look with Merleau-Ponty's body schema to show how racism is lived through the body; the chapter's title, L'expérience vécue du Noir, stresses lived experience rather than a "fact" of blackness.
```

## Existentialism Elsewhere

Existentialism was never only Parisian or atheist. Gabriel Marcel (1889–1973), playwright and Catholic convert, distinguished a problem, "something which I meet", from a mystery, "something in which I am myself involved" (*Being and Having*), and opposed Sartre's atheism. Merleau-Ponty broke with Sartre over politics in 1952–53; Beauvoir's reply to his 1955 attack opened a rift that never fully healed. Richard Wright, living in Paris near Sartre and Beauvoir, wrote the existentialist novel *The Outsider* (1953) and influenced Beauvoir's account of oppression. Scholars have since read Du Bois's double consciousness in existentialist terms (see *Philosophy in an Age of Empire*).

In Japan, Nishitani Keiji, who studied with Heidegger in 1937–39, answered nihilism with the Buddhist idea of emptiness in *Religion and Nothingness* (see *The Kyoto School and Modern Japanese Philosophy*). In Latin America, Heidegger and Sartre were for a generation the dominant philosophical force; Carlos Astrada held that humans have no determinate essence, and Mexico's Hiperión group took up existentialist themes before abandoning them (see *Latin American Philosophy and the Philosophy of Liberation*).

Whether freedom is radical or situated runs on through *Free Will and Determinism*; whether life without given meaning can be lived well, through *The Meaning of Life and the Fear of Death*. Existentialism's lasting claim is that no one can answer these questions for us.

## Further exploration

- **Sarah Bakewell, *At the Existentialist Café: Freedom, Being, and Apricot Cocktails* (2016).** A lively narrative history of Husserl, Heidegger, Sartre, Beauvoir, Camus and Merleau-Ponty for general readers.
- **Ronald Aronson, *Camus and Sartre* (2004).** The standard account of the friendship and the 1952 quarrel.
- **Kate Kirkpatrick, *Becoming Beauvoir: A Life* (2019).** A biography drawing on newly available diaries.
- **Margaret A. Simons, *Beauvoir and The Second Sex: Feminism, Race, and the Origins of Existentialism* (1999).** The case for Beauvoir's philosophical originality.
- **Adam Shatz, *The Rebel's Clinic: The Revolutionary Lives of Frantz Fanon* (2024).** A biography of Fanon as psychiatrist and revolutionary.
- **Lewis R. Gordon, *Existentia Africana: Understanding Africana Existential Thought* (2000).** Black existential philosophy from Du Bois to Fanon.
- **Jonathan Webber, *Rethinking Existentialism* (2018).** Argues for an existentialist ethics in Sartre, Beauvoir and Fanon.$existentialism_master$,
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
  select $existentialism_quiz$[
    {"type": "mcq", "prompt": "Which statement about the word 'existentialism' is accurate?", "options": ["Gabriel Marcel coined it in the mid-1940s; Sartre at first rejected it, then adopted it, while Camus and Heidegger repudiated it", "Kierkegaard coined it in the 1840s to describe his own philosophy", "Sartre coined it in Being and Nothingness and all his circle accepted it", "Heidegger coined it in Being and Time and later handed it to Sartre"], "answerIndex": 0, "explanation": "Marcel coined the term at some point in 1943–45. Sartre first said he did not know what existentialism was, then took it up in his 1945 lecture; according to the SEP only Sartre and Beauvoir explicitly called themselves existentialists. Kierkegaard never used the word, and Heidegger repudiated the label in 1946.", "id": "q1"},
    {"type": "mcq", "prompt": "What did Sartre later say he meant by 'Hell is other people' in No Exit?", "options": ["That relations with others are always poisoned and should be avoided", "That the line was a joke at the expense of his Catholic critics", "That when relations with others are twisted, the judgements of others, through which we know ourselves, become hell", "That he had borrowed the line from Camus's The Stranger"], "answerIndex": 2, "explanation": "In a spoken preface to a recording of the play in the mid-1960s, Sartre said the line had always been misunderstood: he did not mean that relations with others are always poisoned, but that others' judgement, which we use to know ourselves, becomes hell when relations are twisted.", "id": "q2"},
    {"type": "mcq", "prompt": "Why have scholars criticised H. M. Parshley's 1953 English translation of The Second Sex?", "options": ["It added chapters Beauvoir never wrote", "It cut about 15 per cent of the text and mistranslated central philosophical concepts", "It translated the book from a German edition rather than the French", "It omitted the sentence 'On ne naît pas femme: on le devient'"], "answerIndex": 1, "explanation": "Parshley, a zoologist with no background in philosophy, cut around 15 per cent and mistranslated key concepts. Beauvoir asked for a new translation in 1985; Borde and Malovany-Chevallier's unabridged version (2009–10) restored the cuts but was itself criticised for literalism. Parshley did translate the famous sentence, as 'One is not born, but rather becomes, a woman'.", "id": "q3"},
    {"type": "mcq", "prompt": "Where did Camus make his remark about defending his mother before justice?", "options": ["In his Nobel Prize lecture of 10 December 1957", "In The Rebel (1951), in the chapter on revolution", "In his letter to Les Temps modernes in 1952", "At a meeting with students in Stockholm on 12 December 1957, answering an Algerian student"], "answerIndex": 3, "explanation": "The remark came at a student meeting two days after the Nobel ceremony, not in the Nobel lecture. Le Monde reported it as 'Je crois à la justice, mais je défendrai ma mère avant la justice'; the short 'between justice and my mother' is a later truncation.", "id": "q4"},
    {"type": "open", "prompt": "Reconstruct Sartre's argument in Being and Nothingness that human beings are radically free. Then assess the strongest objection to it and the best reply.", "rubric": "A strong answer gives the steps: we encounter negations directly (Pierre's absence pervading the café, destruction, fragility, questions admitting 'no'); being-in-itself is pure positivity (after a storm there is 'not less'); so negation comes into the world through consciousness, the for-itself, 'which is what it is not and is not what it is'; this power of detachment is freedom, since no fact (not even poverty or fatigue) of itself determines how consciousness takes it; anguish is the felt evidence; so we are 'condemned to be free' and responsible, though always within facticity (not a voluntarist account). It notes the SEP's description of the argument as an inference to the best explanation. Objections: begging the question (reply: neither realism nor idealism explains negation; appeal to anguish); Merleau-Ponty's situated freedom, freedom not 'either total or null', habit and sedimentation (reply: Sartre's later practico-inert in the Critique); the 'authentic Nazi' problem of grounding ethics (reply: the lecture's claim that I must will others' freedom, resting on a thesis Flynn says is not adequately defended, and Beauvoir's ethics); Heidegger's charge that reversing a metaphysical statement remains metaphysics; doubts about the critique of Freud. Credit a reasoned judgement about which objection is strongest.", "id": "q5"},
    {"type": "open", "prompt": "How did Beauvoir and Fanon each take up and change Sartre's ideas? Discuss at least one concept from each (for example the Other, bad faith, the look, or the ethics of willing others' freedom).", "rubric": "A strong answer explains Beauvoir's Ethics of Ambiguity: human ambiguity (subject for oneself, object for others); the serious world of childhood; the serious man and the adventurer as failures; ethical freedom must embrace ties to others and work for the material conditions of their freedom, so willing my freedom means willing others'; and The Second Sex's analysis of woman as the Other (from Hegel via Kojève, but women lack a shared history), immanence and transcendence, 'the body is a situation', 'One is not born, but rather becomes, (a) woman' with the translation debate and the sex/gender debate. For Fanon: Black Skin, White Masks reworks Sartre's look and Merleau-Ponty's body schema into the 'epidermal racial schema' ('Look, a Negro!'), the zone of non-being, the contest over 'The Fact of Blackness' versus lived experience, the critique of 'Black Orpheus' for treating Négritude as a step towards the universal, the contrast with Anti-Semite and Jew, and the Hegel chapter (the master wants work, not recognition); The Wretched of the Earth, Sartre's preface and its removal. Credit noting the debate over Beauvoir's influence on Sartre and over Fanon's method.", "id": "q6"}
  ]$existentialism_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/twentieth-century/existentialism', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

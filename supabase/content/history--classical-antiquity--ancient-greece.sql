-- Ancient Greece — canonical master article, co-written and human-reviewed.
-- history/classical-antiquity/ancient-greece @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- The polis and colonisation, Sparta, Athenian democracy, the Persian
-- Wars, empire and the Peloponnesian War, philosophy and theatre, slavery
-- and exclusion, and the uses of ancient Greece.
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
    'history/classical-antiquity/ancient-greece',
    'research',
    'advanced',
    'read',
    $greece_master$> **Ancient Greece** was never a country. It was a scatter of more than a thousand independent city-states around the Mediterranean and Black Sea, which shared a language, gods, and festivals, and spent much of their history fighting one another. In the few centuries between about 800 and 300 BCE, some of these communities produced democracy, philosophy, history-writing, tragedy and comedy, and much of the mathematics and science that later civilizations built on. They also rested on slavery, excluded women from public life, and fought brutal wars. This chapter covers both sides, and ends with a question about why "ancient Greece" has been claimed so insistently as the origin of "the West".

## The Polis

After the collapse of the Mycenaean palaces around 1200 BCE, Greece passed through centuries of poverty and isolation. From around 800 BCE the population grew, trade revived, and the Greeks adopted and adapted the Phoenician alphabet, adding vowels. Homer's *Iliad* and *Odyssey* were written down, probably in the eighth or seventh century BCE, and became the shared foundation of Greek education. The first Olympic Games were traditionally dated to 776 BCE.

The characteristic Greek community was the **polis**, usually translated "city-state": a town with its surrounding farmland and villages, governing itself, with its own laws, gods, army, and coinage. Most were small, with a few thousand citizens. Athens and Sparta were exceptionally large. Mountainous terrain and the sea divided Greece into many small territories, which helps explain why no single state united them until outsiders, first Macedon and then Rome, did so by force.

Between about 750 and 550 BCE, Greek cities founded **colonies** across the Mediterranean and Black Sea, in southern Italy and Sicily (Syracuse, Naples), southern France (Marseille), Libya (Cyrene), the Black Sea coast, and the Bosporus (Byzantium). Colonists sought land, trade, and opportunity, often driven by population pressure or political conflict at home. Plato later compared the Greeks to frogs around a pond, living along the edges of the sea. Greek culture was therefore never confined to Greece itself; much of it developed in Anatolia, Italy, and Sicily, and in close contact with the Persians, Phoenicians, Egyptians, Etruscans, and Scythians.

Greeks took a great deal from these neighbours. The alphabet came from the Phoenicians, coinage from Lydia in Anatolia, and much early mathematics and astronomy from Babylonia and Egypt. Greek writers themselves acknowledged debts to Egypt in particular.

## Sparta

**Sparta**, in the southern Peloponnese, was the most powerful land state in Greece and the most unusual. In the eighth and seventh centuries BCE it conquered its neighbours in Messenia and reduced them to **helots**, state-owned serfs who worked the land and handed over a share of the harvest. The helots greatly outnumbered the Spartan citizens; Herodotus reports seven helots accompanying each Spartan at the battle of Plataea. Fear of a helot revolt shaped everything about Spartan society.

Spartan citizen men were trained from the age of seven in the **agoge**, a harsh state education in endurance, obedience, and fighting, and lived in common messes as adults. Young Spartans in the *krypteia* were sent out to kill helots who seemed dangerous. Freed from manual labour by the helots, Spartan citizens were full-time soldiers, and Spartan hoplite infantry was the most feared in Greece. Spartan women, unusually, received physical training, and they could own land; Aristotle claimed that women controlled about two-fifths of Spartan land. Sparta's system had a fatal weakness: its citizen body shrank over time, because citizenship required wealth and birth, and by the fourth century BCE there were too few Spartans to sustain its power.

Much of what is believed about Sparta comes from outsiders, especially Athenians, who admired or feared it, and from later writers such as Plutarch, who idealised it. Historians call this the **"Spartan mirage"**: an image of Sparta shaped by what others wanted it to be.

```checkpoint
q: Why did fear of the helots shape Spartan society so strongly?
a*: Because the helots, a large subjugated population, greatly outnumbered Spartan citizens, so the Spartans organised their society around military readiness and control.
a: Because the helots were a foreign army invading Sparta.
x: The helots were a subjugated population within Spartan territory, not an invading army.
a: Because the helots were Spartan citizens who refused to fight.
x: The helots were not citizens; they were state-owned serfs.
a: Because the helots controlled Sparta's navy.
x: Sparta's power rested on its infantry, and the helots worked the land.
hint: Compare the numbers of helots and citizens.
why: A citizen minority ruling a large, resentful serf population built a society centred on training, discipline, and repression.
---
q: What do historians mean by the "Spartan mirage"?
a: An optical illusion visible from Spartan mountains.
x: The term is a metaphor about historical sources, not a physical phenomenon.
a: Sparta's claim to have a navy it did not possess.
x: The mirage concerns the image of Spartan society, not its navy.
a*: The idealised or distorted image of Sparta created by outsiders and later writers, which makes the real Sparta hard to see.
a: The legend that Sparta was founded by Persians.
x: There is no such legend; the term refers to how Sparta was represented by others.
hint: Who wrote most of what we know about Sparta?
why: Because most sources were written by non-Spartans with their own agendas, the picture of Sparta must be treated critically.
```

## Athens and the Invention of Democracy

**Athens** took a different path. Around 594 BCE the statesman **Solon** cancelled debts and abolished the practice of enslaving Athenians for debt, and divided citizens into classes by wealth, opening some offices to non-aristocrats. After a period of rule by "tyrants" (a Greek word for rulers who seized power, not necessarily cruel ones), **Cleisthenes** in 508/507 BCE reorganised the citizen body into ten new tribes, mixing people from different regions, based on local units called demes. This broke the power of aristocratic clans and created the framework for **democracy**, *demokratia*, "rule by the people". Further reforms by Ephialtes in 462 BCE and the leadership of **Pericles** in the following decades completed the system.

Athenian democracy was direct, not representative. Its central institution was the **Assembly** (*ekklesia*), open to all adult male citizens, which met about forty times a year on the hill of the Pnyx and decided on war, peace, laws, and policy by majority vote; several thousand citizens typically attended. A **Council of 500**, chosen by lot each year from citizens over thirty, prepared business for the Assembly. Most officials were chosen by **lot** (sortition), on the principle that any citizen was capable of public service and that elections favoured the rich and famous. The main exception was the ten generals, who were elected because military command required expertise. Large juries of hundreds of citizens, also chosen by lot and paid a daily wage so that poorer citizens could serve, decided court cases. Through **ostracism**, citizens could vote to exile a powerful man for ten years without charge.

Democracy was also limited. Only adult male citizens could participate, and from 451 BCE citizenship required both parents to be Athenian. Women, resident foreigners (metics), and slaves were excluded. Perhaps 30,000 to 40,000 adult men were citizens in the fifth century, out of a total population of Attica of perhaps 250,000 to 300,000, including tens of thousands of slaves. Athens's democracy also financed itself partly through empire, as described below. Critics in antiquity, including Plato and Thucydides, saw it as rule by an ignorant and fickle mob. Modern democracies borrowed its name and ideals, while rejecting both its exclusions and its direct, lot-based form.

{{image: Pnyx | The Pnyx, the hill in Athens where the citizen Assembly met to debate and vote on the city's affairs.}}

```checkpoint
q: Why did the Athenians choose most officials by lot rather than by election?
a: Because they had no system for counting votes.
x: Athenians voted by show of hands in the Assembly and elected generals; they chose lot deliberately.
a*: Because they believed any citizen was capable of public service, and that elections favoured the wealthy and well known.
a: Because the gods required it in every case.
x: The choice was political; and generals, for example, were elected, not chosen by lot.
a: Because only aristocrats could stand for election.
x: Lot was used precisely to prevent offices being dominated by aristocrats and the rich.
hint: Who tends to win elections?
why: Sortition embodied the democratic principle of equality among citizens, while elections were reserved for roles needing expertise, such as generals.
---
q: Which group could participate in the Athenian Assembly?
a: All adult residents of Attica.
x: Women, resident foreigners, and slaves were excluded, so most adult residents could not participate.
a: Only wealthy landowners.
x: Athenian democracy included poor citizens, who were paid to serve on juries and in other roles.
a: Citizens and their wives.
x: Women, including citizens' wives, were excluded from political participation.
a*: Adult male citizens only.
hint: Think about who counted as a citizen with political rights.
why: Athenian democracy was radical in its equality among citizens and exclusive in defining who counted as one.
```

## War with Persia, Empire, and the Peloponnesian War

The Persian Wars of 490 and 480–479 BCE, described in the previous chapter from both sides, transformed Athens. The Athenian victory at Marathon became a founding legend of the democracy, and the fleet that won at Salamis had been built with silver from the state mines at **Laurion**, worked by slaves, on the proposal of the politician Themistocles.

After 478 BCE, Athens led the **Delian League**, an alliance of Aegean cities against Persia, whose members contributed ships or money. Over time Athens turned the league into an **empire**: it moved the treasury from the island of Delos to Athens in 454 BCE, forced unwilling members to stay, and used the money for its own purposes, including the great building programme on the Acropolis, the **Parthenon**, built between 447 and 432 BCE. Athenian democracy and Athenian imperialism grew together, since the empire's revenues paid for the fleet, rowed by poorer citizens, and for the wages that made participation possible.

Athens's growing power alarmed Sparta and its allies, and in 431 BCE the **Peloponnesian War** began. Thucydides, an Athenian general who wrote its history, judged that the "truest cause" was Spartan fear of Athenian power. The war lasted, with interruptions, until 404 BCE. Pericles's strategy was to bring the rural population inside the city walls and rely on the fleet, but in 430 BCE a plague struck the crowded city, killing perhaps a quarter of the population, including Pericles himself in 429 BCE. Thucydides, who caught the disease and survived, described its symptoms in detail.

Thucydides recorded the war's brutality and the moral degradation it caused. In the **Melian Dialogue** (416 BCE), Athenian envoys tell the neutral islanders of Melos that "the strong do what they can and the weak suffer what they must"; when Melos refused to submit, Athens killed its men and enslaved its women and children. In 415 BCE Athens launched a huge expedition against Syracuse in Sicily, which ended in disaster in 413 BCE. Sparta, now financed by Persian gold, built a fleet and destroyed the Athenian navy at Aegospotami in 405 BCE. Athens surrendered in 404 BCE, and a Spartan-backed oligarchy, the Thirty Tyrants, briefly took power before democracy was restored in 403 BCE.

```checkpoint
q: How were Athenian democracy and the Athenian empire connected?
a: They were opposed: the democracy tried to dismantle the empire.
x: The democracy expanded and depended on the empire, rather than opposing it.
a: The empire was ruled by Sparta, not Athens.
x: Athens led and controlled the Delian League; Sparta led the rival Peloponnesian League.
a*: The empire's tribute paid for the fleet, rowed by poorer citizens, and for the wages that let ordinary citizens participate, so democracy and empire grew together.
a: The empire existed only after democracy was abolished.
x: The empire flourished at the height of Athenian democracy, under Pericles.
hint: Where did the money for the fleet and public wages come from?
why: Athenian democracy was financed partly by imperial tribute, a reminder that ancient democracy and domination of others went together.
---
q: What does the Melian Dialogue illustrate?
a*: The logic of raw power in wartime, as Athens told the Melians that "the strong do what they can and the weak suffer what they must" and then destroyed the city.
a: The peaceful resolution of disputes through democratic debate.
x: The dialogue ends with Athens destroying Melos; it illustrates the opposite of peaceful resolution.
a: Sparta's harsh treatment of the helots.
x: The dialogue concerns Athens and the island of Melos, not Sparta and the helots.
a: The Persian conquest of the Greek islands.
x: The dialogue is between Athenians and Melians during the Peloponnesian War.
hint: It is often cited in modern discussions of international relations.
why: Thucydides used the dialogue to show how war corrupted Athenian values, and it remains a classic text on power politics.
```

## Philosophy, Theatre, and Inquiry

The Greeks did not invent thinking, but they developed distinctive forms of rational argument and open debate about nature, ethics, and politics.

From the sixth century BCE, thinkers in Ionia, such as **Thales**, Anaximander, and Heraclitus, sought natural explanations of the world, asking what everything was made of without reference to the gods. Pythagoras and his followers studied numbers and harmony. In fifth-century Athens, teachers called **sophists** taught rhetoric for fees and argued that many moral rules were human conventions.

**Socrates** (about 470–399 BCE) wrote nothing, but questioned his fellow Athenians relentlessly about justice, courage, and virtue, exposing their contradictions. In 399 BCE a jury of 501 citizens convicted him of impiety and corrupting the young, and he was executed by drinking hemlock. Coming soon after the defeat by Sparta and the rule of the Thirty, in which some of his former students had taken part, his trial was partly political. His student **Plato** (about 427–347 BCE) wrote dialogues starring Socrates and founded the **Academy** around 387 BCE; his *Republic* imagines an ideal state ruled by philosopher-kings, a sharp rejection of democracy. Plato's student **Aristotle** (384–322 BCE), who tutored the young Alexander and founded his own school, the Lyceum, in 335 BCE, wrote on logic, biology, physics, ethics, politics, poetry, and much else, and collected the constitutions of 158 Greek states. His influence on later Islamic and European thought was immense.

**Theatre** was a civic and religious institution, performed at festivals for Dionysus such as the City Dionysia in Athens, before audiences of thousands. Tragedians **Aeschylus**, **Sophocles**, and **Euripides** explored fate, justice, and suffering, often through myths, and Aristophanes's comedies mocked politicians, philosophers (including Socrates), and the war. **History-writing** also developed, as *What is History?* described, with Herodotus's inquiries and Thucydides's analysis.

Greek religion had no single scripture or church. Gods such as Zeus, Athena, Apollo, and Dionysus were worshipped through sacrifice, festivals, and the consultation of oracles, of which the most famous was Apollo's at **Delphi**. Religion was woven into civic life; impiety was a crime, as Socrates found.

```checkpoint
q: Why was the trial of Socrates partly political?
a: Because Socrates had led a revolt against Athenian democracy.
x: Socrates did not lead a revolt; the political context lay in his associations and timing.
a: Because Socrates had been elected general and lost a battle.
x: Socrates served as a soldier but was not condemned for military failure.
a: Because Socrates had written books attacking democracy.
x: Socrates wrote nothing; his ideas come to us through Plato and others.
a*: Because it took place soon after Athens's defeat and the rule of the Thirty, in which some of his former students had taken part.
hint: Consider what had happened in Athens between 404 and 399 BCE.
why: The charges of impiety and corruption were brought in a city recovering from defeat and oligarchic rule, linked to some of his followers.
---
q: How did Plato's view of politics differ from Athenian democratic practice?
a: Plato argued for choosing all officials by lot.
x: Lot was the democratic practice; Plato rejected rule by ordinary citizens.
a*: Plato's Republic imagined rule by trained philosopher-kings rather than by the assembly of ordinary citizens.
a: Plato argued that women and slaves should run the Assembly.
x: This misrepresents Plato's argument in the Republic.
a: Plato agreed entirely with Athenian democracy.
x: Plato was a sharp critic of democracy, partly because of the execution of Socrates.
hint: Who rules in the Republic?
why: Plato argued that government should be in the hands of those with knowledge, rejecting the democratic principle that all citizens are equally fit to rule.
```

## Slavery and Exclusion

Greek freedom rested on unfreedom. Slaves worked in households, workshops, farms, and the silver mines at Laurion, where conditions were brutal. In Athens, slaves may have made up a quarter or more of the population. Most were non-Greeks, captured in war or bought from traders, but Greeks enslaved other Greeks too, as at Melos. Aristotle argued that some people were slaves "by nature", suited to be ruled, an argument that would be cited by later defenders of slavery, including in the Americas.

Women's lives varied by city and class. In Athens, citizen women were excluded from politics, married young, and were expected in principle to stay mostly within the household, though poorer women worked outside it and women played major roles in religious festivals. Sparta's women had more freedom of movement and property rights. Evidence for women's own voices is scarce: one of the few is the poet **Sappho** of Lesbos, writing in the late seventh and early sixth centuries BCE, whose poems of love and longing survive mostly in fragments.

## The Uses of "Ancient Greece"

From the Renaissance onwards, and especially in the eighteenth and nineteenth centuries, Europeans increasingly presented ancient Greece as the origin of "Western civilization", and of democracy, reason, and freedom in particular. Greek independence from the Ottoman empire in the 1820s was supported by European "philhellenes" partly on these grounds. Classical education became a mark of elite status, and Greek art and architecture were copied in public buildings across Europe and the Americas.

This story has been criticised in several ways. It detaches Greece from its connections with Egypt, the Levant, Persia, and Anatolia, which the Greeks themselves acknowledged. It treats a selective version of Greek culture as the property of later Western Europeans, while ignoring that much Greek learning was preserved and developed in Arabic in the Islamic world before it returned to Latin Europe. Martin Bernal's *Black Athena* (1987) argued that nineteenth-century scholarship had deliberately downplayed Egyptian and Semitic influences on Greece for racist reasons; many of his specific claims were rejected, but his critique of the history of the discipline was influential. And the image of Greece has been used politically, from nineteenth-century nationalism to modern films such as *300*, which present Thermopylae as a clash between Western freedom and Eastern despotism.

None of this diminishes the achievements of the Greek city-states. It means that ancient Greece belongs to the history of the whole Mediterranean and Near Eastern world, and that the question of who inherits it has always been a political one.

## Further exploration

- **Paul Cartledge, *Ancient Greece: A Very Short Introduction* (2011).** A brief, authoritative introduction through eleven cities.
- **Thucydides, *History of the Peloponnesian War*, trans. Rex Warner or Martin Hammond.** The war and its moral consequences, by a participant.
- **Josiah Ober, *The Rise and Fall of Classical Greece* (2015).** Why Greek city-states were so prosperous and innovative.
- **Edith Hall, *Introducing the Ancient Greeks* (2014).** The Greeks through ten characteristic qualities.
- **Mary Beard, *Women and Power* (2017).** On the exclusion of women's voices from the Greek and Roman tradition and its legacy.$greece_master$,
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
  select $greece_quiz$[
    {"type": "mcq", "prompt": "What was a polis?", "options": ["A Greek temple", "A self-governing community of a town and its surrounding territory, with its own laws, gods, and army", "The Greek word for an empire", "A Persian province in Greece"], "answerIndex": 1, "explanation": "Greece consisted of hundreds of independent city-states; no single state united them until Macedon and Rome did so by force.", "id": "q1"},
    {"type": "mcq", "prompt": "Which reform is most associated with Cleisthenes in 508/507 BCE?", "options": ["Cancelling all debts", "Reorganising citizens into ten new tribes based on demes, breaking aristocratic power and laying the framework for democracy", "Building the Parthenon", "Introducing the helot system"], "answerIndex": 1, "explanation": "Cleisthenes's reorganisation mixed citizens from different regions, undermining aristocratic clans and creating the structure of Athenian democracy.", "id": "q2"},
    {"type": "mcq", "prompt": "What did Thucydides identify as the 'truest cause' of the Peloponnesian War?", "options": ["A dispute over the Olympic Games", "Spartan fear of growing Athenian power", "Persian invasion", "The trial of Socrates"], "answerIndex": 1, "explanation": "Thucydides distinguished immediate pretexts from the deeper cause: Sparta's fear of Athens's rising power.", "id": "q3"},
    {"type": "mcq", "prompt": "Why was Athens's fleet so important to its democracy?", "options": ["Because only aristocrats served in it", "Because it was commanded by Sparta", "Because it was crewed entirely by slaves", "Because it was rowed by poorer citizens and funded by imperial tribute, linking democracy, empire, and the political power of ordinary citizens"], "answerIndex": 3, "explanation": "Poorer citizens rowed the triremes that gave Athens its power, and the empire's tribute paid for the fleet and for democratic participation.", "id": "q4"},
    {"type": "open", "prompt": "Was Athenian democracy a democracy? Evaluate it using evidence from the chapter.", "rubric": "A strong answer describes the Assembly open to all adult male citizens, the Council of 500 chosen by lot, sortition for most offices, paid juries, ostracism, and elected generals, showing a radical form of direct citizen rule. It weighs this against exclusions (women, metics, slaves, the 451 BCE citizenship law), dependence on slavery and imperial tribute, and ancient critics such as Plato and Thucydides. It reaches a reasoned judgement and may compare it with modern representative democracy.", "id": "q5"},
    {"type": "open", "prompt": "Why has ancient Greece been claimed as the origin of 'Western civilization', and what are the main criticisms of that claim?", "rubric": "A strong answer explains the Renaissance and especially eighteenth- and nineteenth-century elevation of Greece as the source of democracy, reason, and freedom, philhellenism and the Greek War of Independence, and classical education. It sets out criticisms: Greece's deep connections with Egypt, the Levant, Persia, and Anatolia (alphabet, coinage, mathematics); the preservation and development of Greek learning in the Islamic world; Bernal's Black Athena critique of nineteenth-century scholarship; and political uses such as the film 300. It concludes that Greece belongs to a wider Mediterranean and Near Eastern history.", "id": "q6"}
  ]$greece_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/classical-antiquity/ancient-greece', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

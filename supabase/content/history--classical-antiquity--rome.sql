-- Rome and the Ancient Roman World — canonical master article, co-written and human-reviewed.
-- history/classical-antiquity/rome-and-the-ancient-roman-world @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- Republic and its institutions, conquest of Italy and the Punic Wars,
-- the fall of the republic, Augustus and the principate, how the empire
-- held together (roads, cities, citizenship, law), slavery, spectacle and
-- family, and the rise of Christianity.
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
    'history/classical-antiquity/rome-and-the-ancient-roman-world',
    'research',
    'advanced',
    'read',
    $rome_master$> **Rome** began as a small settlement on the Tiber in central Italy and became, over about seven centuries, the ruler of the entire Mediterranean world and much of western Europe and the Near East. At its height in the second century CE, the Roman empire held perhaps 50 to 70 million people, from Britain to Syria and from the Rhine to the Sahara. This chapter follows Rome from city-state to republic to empire: its institutions, its wars, the collapse of the republic, the long peace of the empire, and the society that sustained it, including law, slavery, spectacle, family, and the rise of Christianity. Its decline in the west is the subject of the next chapter.

## From Kings to Republic

Roman tradition dated the founding of the city to 753 BCE, by Romulus, and told of seven kings who followed. Archaeology shows villages on the hills of Rome from at least the tenth century BCE, merging into a city during the seventh and sixth centuries, strongly influenced by the Etruscans to the north and the Greek colonies to the south. In tradition, the last king, Tarquin the Proud, was expelled in 509 BCE, and the Romans established a **republic**, from *res publica*, "the public thing".

The republic's institutions were designed to prevent any one man from holding royal power:

- **Two consuls**, elected each year, held supreme military and civil authority, and each could veto the other.
- **The Senate**, made up of former magistrates, advised the magistrates and in practice directed foreign policy and finance. The abbreviation **SPQR**, *Senatus Populusque Romanus*, "the Senate and People of Rome", expressed the idea of a partnership between the aristocracy and the people.
- **Assemblies** of citizens elected magistrates and passed laws, but voting was organised in groups weighted towards the wealthy.
- **Tribunes of the plebs**, created after the plebeians (non-aristocratic citizens) refused to serve in the army in protest, could veto actions harmful to the plebeians and were personally sacrosanct.
- In emergencies, a **dictator** could be appointed with supreme power for a maximum of six months.

The early republic was shaped by the **Conflict of the Orders** between the patrician aristocracy and the plebeians. Plebeians won the publication of the laws in the **Twelve Tables** around 450 BCE, so that patrician judges could not interpret unwritten custom as they pleased, and in 367 BCE the right to hold the consulship. A new elite of wealthy patrician and plebeian families emerged, the *nobiles*, who dominated the senate and high offices.

```checkpoint
q: Why did the Roman republic have two consuls who each held office for one year?
a*: To prevent any one man from gaining royal power, since each consul could veto the other and power changed hands every year.
a: Because the city was too large for one man to govern.
x: The motive was political, not administrative: to prevent the return of kingship.
a: Because one consul ruled the patricians and the other the plebeians.
x: Both consuls held authority over all Romans; they were not divided by class.
a: Because Roman law required two rulers for religious reasons.
x: The arrangement was a constitutional safeguard, not primarily a religious rule.
hint: Remember why the Romans expelled their last king.
why: Collegiality and annual terms were designed to stop any individual from becoming a king, the central fear of the republic.
---
q: Why was the publication of the Twelve Tables important to the plebeians?
a: Because it abolished the Senate.
x: The Senate continued to exist for centuries; the Twelve Tables concerned the law.
a: Because it made all Romans equal in wealth.
x: The Tables did not redistribute wealth.
a*: Because written, public law prevented patrician judges from interpreting unwritten custom to suit themselves.
a: Because it gave plebeians the right to be consuls immediately.
x: Plebeians gained the right to the consulship later, in 367 BCE.
hint: Why does it matter whether laws are written down?
why: Publishing the law made it knowable by all citizens, limiting the arbitrary power of the aristocratic elite.
```

## Conquering Italy and the Mediterranean

Between the fifth and third centuries BCE, Rome conquered the peoples of Italy, including the Latins, Etruscans, Samnites, and Greek cities of the south. Rather than ruling them directly, Rome usually made them **allies**, who kept their own local government but had to supply soldiers to Roman armies. Some communities received Roman citizenship. This system gave Rome a huge reserve of manpower. Roman colonies and roads, beginning with the **Via Appia** in 312 BCE, bound Italy together.

Expansion overseas brought Rome into conflict with **Carthage**, the Phoenician colony in North Africa that dominated the western Mediterranean. The three **Punic Wars** (from *Punicus*, "Phoenician") changed Rome's history:

- **The First Punic War** (264–241 BCE) was fought mainly over Sicily. Rome built its first large fleet and won, taking Sicily as its first overseas province.
- **The Second Punic War** (218–201 BCE) was the most dangerous war in Roman history. The Carthaginian general **Hannibal** marched from Spain across the Alps into Italy with an army that included war elephants, and destroyed Roman armies at the Trebia, Lake Trasimene, and, in 216 BCE, at **Cannae**, where ancient sources report around 50,000 Romans killed in a single day. Rome refused to surrender, avoided pitched battles, and eventually sent **Scipio** to attack Carthage directly. He defeated Hannibal at **Zama** in 202 BCE.
- **The Third Punic War** (149–146 BCE) ended with the destruction of Carthage itself. In the same year Rome destroyed Corinth in Greece.

By the mid-second century BCE, Rome dominated the whole Mediterranean. The wealth of conquest, in plunder, tribute, and enslaved captives, flowed into Italy and transformed Roman society.

## The Fall of the Republic

Conquest created problems the republic's institutions could not solve. Wealthy Romans bought up land and worked large estates with enslaved labour, while many small farmers, away on long military campaigns, lost their farms. The army, recruited from property-owners, began to shrink.

In 133 BCE the tribune **Tiberius Gracchus** proposed redistributing public land to poor citizens. Opponents in the Senate had him and hundreds of his supporters killed, the first major political violence in Rome for centuries. His brother **Gaius Gracchus** pursued wider reforms and was killed in 121 BCE. Violence had entered Roman politics and never left.

The general **Marius** recruited poor citizens into the army from around 107 BCE, and soldiers began to look to their commanders, rather than the state, for pay and land on discharge. In 91–88 BCE Rome's Italian allies, denied citizenship, rose in the **Social War**, and Rome conceded citizenship to most of Italy. In 88 BCE the general **Sulla** marched his army on Rome itself, and he later made himself dictator and published lists of enemies who could be killed and their property seized. Between 73 and 71 BCE an enslaved gladiator, **Spartacus**, led a rebellion of tens of thousands of slaves that defeated several Roman armies before it was crushed; six thousand captives were crucified along the Via Appia.

The final decades of the republic were dominated by ambitious generals and politicians: **Pompey**, **Crassus**, the orator **Cicero**, and **Julius Caesar**. Caesar conquered Gaul between 58 and 50 BCE, in campaigns that he described in his own commentaries and that ancient writers claimed killed around a million people. In January 49 BCE, ordered by the Senate to give up his army, he crossed the **Rubicon**, the river marking the boundary of his province, into Italy, starting a civil war. Victorious, he was made dictator for life, and on the Ides of March, 15 March 44 BCE, he was assassinated by senators led by Brutus and Cassius, who claimed to be restoring the republic.

Instead, more civil war followed. Caesar's adopted heir **Octavian** defeated the assassins and then his former ally Mark Antony and Cleopatra at **Actium** in 31 BCE. In 27 BCE the Senate gave him the name **Augustus**.

```checkpoint
q: How did the Marian army reforms contribute to the fall of the republic?
a: By abolishing the army altogether.
x: The army grew more professional; it was not abolished.
a*: By recruiting poor citizens who depended on their commanders for pay and land, so soldiers became loyal to generals, who could then use them in politics.
a: By giving the Senate direct control over soldiers.
x: The effect was the opposite: soldiers became loyal to their generals rather than to the Senate.
a: By making all soldiers foreign mercenaries.
x: Roman soldiers remained largely citizens; the problem was where their loyalty lay.
hint: To whom did soldiers look for land after their service?
why: Armies loyal to individual generals made it possible for men like Sulla and Caesar to march on Rome.
---
q: Why was Caesar's crossing of the Rubicon so significant?
a: Because it was the first time a Roman army had crossed a river.
x: Roman armies crossed rivers routinely; the significance was legal and political.
a: Because it marked the start of the Punic Wars.
x: The Punic Wars ended a century earlier.
a: Because it was where Caesar was assassinated.
x: Caesar was assassinated in Rome in 44 BCE, five years later.
a*: Because leading an army out of his province into Italy, against the Senate's orders, was an act of civil war.
hint: The river was a legal boundary.
why: By bringing his army into Italy, Caesar defied the republic's law and began the civil war that ended the republic.
```

## Augustus and the Principate

**Augustus** (ruled 27 BCE–14 CE) built a new system while claiming to restore the old one. He called himself *princeps*, "first citizen", kept the Senate and magistracies, and avoided the titles of king or dictator. In reality he controlled the army, the most important provinces, and the treasury, and could decide who held office. Historians call this system the **principate**. Augustus boasted, according to the biographer Suetonius, that he had found Rome a city of brick and left it a city of marble, and his own account of his achievements, the *Res Gestae*, was inscribed on monuments across the empire.

His successors, the Julio-Claudians, Tiberius, Caligula, Claudius, and Nero, were a mixed group, portrayed by ancient historians such as Tacitus and Suetonius, writing from a senatorial perspective, with lurid hostility. After Nero's suicide in 68 CE and a year of civil war with four emperors in 69 CE, the Flavian dynasty built the **Colosseum**, completed in 80 CE. The second century saw the so-called "five good emperors", Nerva, Trajan, Hadrian, Antoninus Pius, and Marcus Aurelius, each chosen by his predecessor. Under **Trajan** the empire reached its greatest extent in 117 CE. **Hadrian** consolidated the frontiers, building the wall across northern Britain that bears his name.

The roughly two centuries from Augustus to Marcus Aurelius are known as the **Pax Romana**, the Roman peace. It was peace only inside the empire, and only relatively: it rested on large armies on the frontiers, on the brutal suppression of revolts, such as the Jewish revolts that led to the destruction of the Jerusalem Temple in 70 CE, and on conquest.

{{image: Pantheon, Rome | The Pantheon in Rome, rebuilt under Hadrian around 126 CE. Its concrete dome remains the largest unreinforced concrete dome in the world.}}

## Holding an Empire Together

The empire was held together by a combination of force, infrastructure, and the cooperation of local elites.

- **Roads.** The Romans built some 80,000 kilometres of paved roads, used by armies, officials, merchants, and the imperial post.
- **Cities.** Rome governed largely through cities, each with its own council of local notables responsible for collecting taxes and keeping order. Across the western provinces, the Romans founded or reshaped cities with forums, baths, theatres, and temples on a Roman model. The city of Rome itself may have held a million people.
- **Engineering.** Aqueducts brought water to cities from distant sources; eleven aqueducts served Rome. Roman **concrete**, made with volcanic ash called pozzolana, allowed builders to create arches, vaults, and domes, such as the Pantheon's.
- **Citizenship.** Roman citizenship, once limited to Rome, was gradually extended to provincial elites and soldiers, and in 212 CE the emperor Caracalla granted it to almost all free inhabitants of the empire.
- **Language and culture.** Latin became the language of the western provinces, the ancestor of the Romance languages, while Greek remained dominant in the east. Local elites adopted Roman dress, baths, education, and names, a process historians call Romanisation, though they also kept local traditions.

**Roman law** was among Rome's most lasting achievements. From the Twelve Tables, it developed through the decisions of magistrates called praetors and the writings of professional jurists such as Gaius, Ulpian, and Papinian, who analysed property, contracts, inheritance, and procedure with great sophistication. Under the eastern emperor **Justinian**, in 529–534 CE, the law was compiled into the *Corpus Iuris Civilis*, which, rediscovered in Italy in the eleventh century, became the foundation of the civil law systems of continental Europe and, through them, of much of the world.

```checkpoint
q: Why did Rome govern largely through cities and local elites?
a: Because Roman law banned direct rule of provinces.
x: There was no such ban; using local elites was a practical choice.
a: Because provincial cities had no local leaders.
x: Provincial cities had their own councils and notables, which is precisely why Rome could rely on them.
a*: Because a small imperial administration could rule a vast empire by relying on local councils of notables to collect taxes and keep order.
a: Because emperors never visited the provinces.
x: Many emperors travelled widely, such as Hadrian; the system did not depend on their absence.
hint: How many Roman officials were there compared with the population?
why: With few central officials, Rome depended on local elites, who in return gained status, citizenship, and protection.
---
q: Why is the Corpus Iuris Civilis so significant?
a*: Because Justinian's compilation of Roman law, rediscovered in medieval Italy, became the foundation of the civil law systems of continental Europe and beyond.
a: Because it was the first written law in the world.
x: Written law is much older, going back to Ur-Nammu and Hammurabi.
a: Because it abolished slavery throughout the empire.
x: Roman law, including Justinian's compilation, recognised and regulated slavery.
a: Because it was written in Greek for the first time.
x: The core of the Corpus was in Latin; its significance lies in its later influence.
hint: Think about where the civil law tradition comes from.
why: Through medieval rediscovery, Roman law shaped legal systems used by much of the world today.
```

## Slaves, Spectacle, and Family

Rome was a **slave society**. In Italy at the time of Augustus, perhaps a fifth or more of the population was enslaved, mostly captives of war and their descendants. Slaves worked on estates, in mines, in households, and as skilled craftsmen, teachers, doctors, and administrators. Conditions ranged from the deadly labour of the mines to positions of trust in wealthy households. Roman slaves were often freed, especially in cities, and freed slaves of Roman citizens became citizens themselves, though with some restrictions. Many inscriptions record the lives and careers of freedmen and freedwomen.

Public **spectacle** was central to Roman city life. The Colosseum held perhaps 50,000 spectators for gladiatorial combats, animal hunts, and executions. Gladiators were mostly slaves, prisoners, or condemned criminals, though some free men volunteered. They were expensive to train, and most fights probably did not end in death, though many gladiators died young. Chariot racing at the Circus Maximus, with perhaps 150,000 spectators, was even more popular, with fans passionately supporting rival teams.

The Roman **family** was legally headed by the *paterfamilias*, the oldest male, who in principle held power over his descendants, including adult children. Women could not vote or hold office and were legally under a guardian, though by the empire's time many elite women controlled property, ran businesses, and exercised influence, such as Augustus's wife **Livia**. Ordinary women's lives are glimpsed through epitaphs, legal texts, and graffiti at **Pompeii**, buried by Vesuvius in 79 CE. Among the wooden writing tablets found at the fort of **Vindolanda** near Hadrian's Wall is an invitation from Claudia Severa to her friend Sulpicia Lepidina to a birthday party, around 100 CE, which includes what may be the earliest surviving writing in Latin by a woman.

## The Rise of Christianity

Christianity began as a movement within Judaism. **Jesus** of Nazareth was executed by crucifixion under the Roman governor Pontius Pilate around 30–33 CE, an event mentioned by the Roman historian Tacitus as well as in Christian sources. His followers, especially the apostle **Paul**, spread the movement to non-Jews across the eastern Mediterranean, writing letters that became part of the New Testament.

Romans tolerated many religions, but Christians refused to sacrifice to the gods and to the emperor, which made them seem disloyal and atheistic. Persecution was sporadic and local for two centuries. Nero blamed Christians for the great fire of Rome in 64 CE. Around 112 CE, the governor Pliny the Younger wrote to the emperor Trajan asking how to deal with Christians, and Trajan replied that they should not be hunted out but punished if accused and they refused to recant. Empire-wide persecutions came later, under Decius in 250 and Diocletian in the "Great Persecution" from 303.

Despite this, Christianity grew steadily, especially in cities. In 312 CE **Constantine** defeated a rival emperor at the Milvian Bridge outside Rome, having, according to Christian accounts, seen a sign of the cross in the sky. In 313 the **Edict of Milan** granted toleration to Christians. Constantine supported the church, built churches, and in 325 called the **Council of Nicaea** to settle disputes about the nature of Christ. In 380 the emperor Theodosius I made Nicene Christianity the official religion of the empire, and pagan sacrifices were banned in the following years.

```checkpoint
q: Why did Romans, who tolerated many religions, persecute Christians?
a: Because Christianity was a foreign religion from Persia.
x: Christianity arose in Roman Judea, not Persia, and Rome tolerated many foreign religions.
a: Because all Christians were slaves.
x: Christians came from many social backgrounds; slavery was not the cause of persecution.
a: Because Christianity was officially banned from the start.
x: Persecution was sporadic for two centuries, and Trajan told Pliny not to hunt Christians out.
a*: Because Christians refused to sacrifice to the gods and the emperor, which made them seem disloyal and threatening to the gods' favour.
hint: What did Roman religion require of citizens?
why: Refusal to take part in public sacrifice looked like disloyalty and impiety, which explains why Roman authorities treated Christians differently from other religious groups.
---
q: What was the significance of Constantine for Christianity?
a: He made Christianity the only legal religion in 313.
x: The Edict of Milan granted toleration; Nicene Christianity became the official religion under Theodosius in 380.
a*: He ended persecution, granted toleration, supported the church, and called the Council of Nicaea, beginning the alliance between Christianity and imperial power.
a: He wrote the New Testament.
x: The New Testament was written in the first and early second centuries, long before Constantine.
a: He moved the papacy to Constantinople.
x: The bishops of Rome remained in Rome; Constantine founded Constantinople as a new imperial capital.
hint: Think about 312, 313, and 325.
why: Constantine's support transformed Christianity from a persecuted minority into a religion backed by the state.
```

## Further exploration

- **Mary Beard, *SPQR: A History of Ancient Rome* (2015).** A lively history from the founding to 212 CE.
- **Tom Holland, *Rubicon: The Last Years of the Roman Republic* (2003).** A narrative of the republic's fall.
- **Greg Woolf, *Rome: An Empire's Story* (2012).** How the empire was built and sustained.
- **Keith Bradley, *Slavery and Society at Rome* (1994).** A standard account of Roman slavery.
- **Peter Brown, *Through the Eye of a Needle* (2012).** Wealth and the rise of Christianity in the late Roman world.$rome_master$,
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
  select $rome_quiz$[
    {"type": "mcq", "prompt": "What did SPQR stand for?", "options": ["Senatus Populusque Romanus, the Senate and People of Rome", "Society for the Protection of Roman Quarters", "The four kings of early Rome", "Sacred Pontiffs of the Roman Quirinal"], "answerIndex": 0, "explanation": "The abbreviation expressed the idea of the republic as a partnership between the Senate and the people.", "id": "q1"},
    {"type": "mcq", "prompt": "Where did Hannibal inflict Rome's worst defeat, with around 50,000 Romans reported killed in a day?", "options": ["Zama", "Actium", "Cannae", "Pydna"], "answerIndex": 2, "explanation": "Cannae in 216 BCE was Rome's worst defeat; Rome refused to surrender and eventually won the Second Punic War.", "id": "q2"},
    {"type": "mcq", "prompt": "What did the emperor Caracalla do in 212 CE?", "options": ["Built the Colosseum", "Granted Roman citizenship to almost all free inhabitants of the empire", "Divided the empire into east and west", "Made Christianity the official religion"], "answerIndex": 1, "explanation": "The Constitutio Antoniniana extended citizenship across the empire, completing a long process of expansion.", "id": "q3"},
    {"type": "mcq", "prompt": "Why did Romans persecute Christians despite tolerating many religions?", "options": ["Because Christians were all foreigners", "Because Christians refused to sacrifice to the gods and the emperor, which seemed disloyal", "Because Christianity was invented by the Persians", "Because Christians refused to pay taxes"], "answerIndex": 1, "explanation": "Refusal to take part in public sacrifice looked like impiety and disloyalty; persecution was sporadic until the empire-wide campaigns of Decius and Diocletian.", "id": "q4"},
    {"type": "open", "prompt": "Explain why the Roman republic collapsed. Which factor do you think was most important?", "rubric": "A strong answer covers the social effects of conquest (slave estates, loss of small farms), the Gracchi and the introduction of political violence, Marius's recruitment of poor citizens and soldiers' loyalty to generals, the Social War, Sulla's march on Rome and proscriptions, Spartacus, the rivalry of Pompey, Crassus, and Caesar, the Rubicon, the assassination of Caesar, and Octavian's victory at Actium. It weighs the factors and argues for one, such as armies loyal to generals.", "id": "q5"},
    {"type": "open", "prompt": "How did the Roman empire hold together such a large and diverse territory for so long?", "rubric": "A strong answer discusses roads, cities and local elites, engineering (aqueducts, concrete), the army and frontiers, the extension of citizenship culminating in 212 CE, Latin in the west and Greek in the east, Romanisation and its limits, and Roman law (jurists, the Corpus Iuris Civilis). Better answers note the role of force and slavery, and that the Pax Romana was a peace for some rather than all.", "id": "q6"}
  ]$rome_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/classical-antiquity/rome-and-the-ancient-roman-world', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

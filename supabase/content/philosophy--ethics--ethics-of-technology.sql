-- Ethics of Technology and AI — canonical master article, co-written and human-reviewed.
-- philosophy/ethics/ethics-of-technology @ research/advanced/read.
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
    'philosophy/ethics/ethics-of-technology',
    'research',
    'advanced',
    'read',
    $tech_master$> **Who is to blame when a machine decides, and what do we owe each other in a world remade by technology?** This chapter asks whether technology is ever neutral, then turns to privacy and surveillance, algorithmic fairness, automation and work, and responsibility for autonomous systems, from killer robots to driverless cars. It ends with the debate over the long-term risks of artificial intelligence and with its regulation, as of November 2026.

## Is Technology Neutral?

A common view holds that technology is a tool: a knife can slice bread or wound, and the moral question is only how people use it. The Stanford Encyclopedia of Philosophy (SEP) calls this the **neutrality thesis**. It came under sustained attack in the twentieth century, and the SEP reports that the opposite view, that technology is **value-laden**, now "seems the majority position". The founding philosophers of technology, among them Lewis Mumford, Jacques Ellul, Hans Jonas and Langdon Winner, were "almost all openly critical of technology"; later writers such as Don Ihde and Peter-Paul Verbeek studied more neutrally how technologies mediate what we perceive and do.

The most famous critic was Martin Heidegger, whose "The Question Concerning Technology" (lecture 1953, published 1954) is discussed in *Phenomenology: Husserl, Heidegger and Merleau-Ponty*. Heidegger granted that the "instrumental and anthropological definition of technology" is "correct", but denied that it reaches technology's essence. Modern technology is a way of revealing, which he calls *Gestell*, "enframing", in which everything shows up as *Bestand*, "standing-reserve", stock on call to be used and replaced, as when the Rhine becomes a supplier of hydroelectric power. In the "Memorial Address" published in English in *Discourse on Thinking*, he wrote that "nature becomes one gigantic petrol station". He called this way of revealing "the supreme danger", not chiefly because machines can kill but because it crowds out every other way of seeing. Andrew Feenberg objected that this is "unrealistically essentialist" and fatalistic; defenders reply that changing our practices changes what is possible.

Langdon Winner's "Do Artifacts Have Politics?" (1980) made the point concrete. An artifact's design can become "a way of settling an issue in a particular community", and some technologies, such as nuclear power, are "inherently political", requiring or strongly suiting particular social arrangements. His chief example, from Robert Caro's biography of Robert Moses, was that Moses built low overpasses on the Long Island parkways so that buses, and with them poorer and Black New Yorkers without cars, could not reach Jones Beach. **The example is contested.** In 1999 Bernward Joerges questioned it and Steve Woolgar and Geoff Cooper called it an "urban legend"; the historian Kenneth T. Jackson denied nefarious intent; and low bridges were already standard on earlier parkways for aesthetic reasons, though Moses appears to have used them more. The dispute concerns the history, not Winner's general thesis, which remains influential.

Hans Jonas (1903–1993), a former student of Heidegger who broke with him over Nazism, argued in *The Imperative of Responsibility* (German 1979, English 1984) that ethics must change, because technology now lets humanity destroy itself and re-engineer nature, and is driven by forces no individual controls. In one English rendering his new imperative reads: "Act so that the effects of your action are compatible with the permanence of genuine human life". Commentators credit him with preparing the ground for the precautionary principle, though he did not use the term.

A practical heir is **value-sensitive design**, developed by Batya Friedman and Peter Kahn from the late 1980s, which builds values into technology through repeated conceptual, empirical and technical investigations, including of people affected who are not users. Critics say its definition of values as what people "consider important in life" conflates preferences with moral values, and the SEP adds that "ethics cannot be guaranteed through design".

## Privacy: from the Right to Be Let Alone to Contextual Integrity

The modern debate began with a new gadget. In "The Right to Privacy" (*Harvard Law Review*, 15 December 1890), Samuel Warren and Louis Brandeis responded to "instantaneous photographs" and the newspaper trade in society gossip.

```quote
Gossip is no longer the resource of the idle and of the vicious, but has become a trade, which is pursued with industry as well as effrontery.
Samuel D. Warren and Louis D. Brandeis · "The Right to Privacy", Harvard Law Review · 1890
```

They grounded privacy in "inviolate personality" and the dignity of the individual, and spoke of "the right to be let alone", a phrase they took, with credit, from Judge Thomas Cooley's treatise on the law of torts. The SEP calls it "the first definition of informational privacy".

Is privacy a distinct right? Judith Jarvis Thomson (1975) argued that it is a cluster of other rights, such as property and bodily security; Thomas Scanlon replied to her directly. MacKinnon saw "privacy" as a shield for domestic abuse; Anita Allen (1988) defended a reconstructed privacy as valuable to women.

The most influential recent theory is Helen Nissenbaum's **contextual integrity** (an article of 2004 and the book *Privacy in Context*, 2010; some sources give 2009). Instead of privacy as secrecy or as control, it concerns appropriate flows of information. Each social context has norms for how information moves, fixed by five parameters: the data subject, the sender, the recipient, the type of information and the **transmission principle** (the terms on which it passes, such as confidentiality). Medical details passing from patient to doctor in confidence are appropriate; the same details passing to an employer or advertiser are not, though nothing secret was stolen. Likewise, gathering up "public" information, such as traces of where someone goes, changes the recipient and the terms, and can violate privacy with no secret revealed. Norms themselves are judged, most distinctively, by how well they serve the context's own ends.

Other traditions are part of this debate, though the literature in English is thin. The SEP lists work on Confucian and Taoist thought, on India, where the concept "seems to extend beyond the often-dominating public-private dichotomy", on Japanese conceptions, on a Buddhist theory of privacy (Soraj Hongladarom) and on an **ubuntu** perspective, from African philosophy. The Internet Encyclopedia of Philosophy (IEP) reports that AI-ethics guidelines are criticised for neglecting African and Asian perspectives.

## Watching and Being Watched

In 1786, visiting his brother Samuel in Krichev, then in the Russian Empire, Jeremy Bentham developed Samuel's ideas for watching workers into the **Panopticon** ("all-seeing"), published in 1791: a building in which inmates could be seen but never knew when they were watched, producing "a sort of invisible omnipresence". He thought it suited factories, schools and hospitals as well as prisons.

Michel Foucault's *Discipline and Punish* (1975) made the Panopticon "the diagram of a mechanism of power reduced to its ideal form". But the IEP warns that although Foucault "is often presented as a theorist of 'panopticism,' this is not the central claim of the book"; its central theme is discipline as a historical form of power, spreading from soldiering through prisons, factories and schools, bound up with knowledge (see *Structuralism and After: Foucault, Derrida and Their Critics*). Gilles Deleuze (1990; English 1992) described "societies of control", with power spread through the digital technologies of private corporations.

Shoshana Zuboff's *The Age of Surveillance Capitalism* (2019; German edition 2018) argued that **surveillance capitalism** "unilaterally claims human experience as free raw material for translation into behavioural data", made into "prediction products" traded in "behavioural futures markets". Critics such as Evgeny Morozov have questioned her analysis.

Law has responded unevenly. The European Union's General Data Protection Regulation (GDPR) was adopted in April 2016 and has applied since 25 May 2018. It requires data protection "by design and by default", gives a right to erasure, and allows fines of up to €20 million or 4 per cent of worldwide annual turnover. Facial recognition is the sharpest test: in May 2019 San Francisco became the first major American city to ban its use by police, while China deployed it in Xinjiang.

```checkpoint
q: Why, on Nissenbaum's theory of contextual integrity, can collecting "public" information still violate privacy?
a*: Because moving information into a new context can break the norms, such as recipient and transmission principle, under which it was shared.
a: Because all personal information is secret by nature.
x: Contextual integrity rejects the secrecy view; the point is that no secret need be revealed.
a: Because privacy is a cluster of property rights, as Thomson argued.
x: Thomson's reductionism is a different theory; Nissenbaum's turns on contextual norms.
a: Because individuals have a right to control every use of their data.
x: Nissenbaum offers contextual integrity as an alternative to privacy as control.
hint: Think of medical details sent to an employer rather than a doctor.
why: Privacy, for Nissenbaum, concerns appropriate flows. Each context has norms specified by subject, sender, recipient, information type and transmission principle; aggregating or re-routing information can breach them even when nothing secret is taken.
---
q: According to the Internet Encyclopedia of Philosophy, what is the central claim of *Discipline and Punish*?
a: That every modern society is literally organised as a Panopticon.
x: The IEP says panopticism, though often presented as Foucault's theory, is not the book's central claim.
a: That Bentham invented the idea of surveillance.
x: Bentham's Panopticon is Foucault's model, not his thesis; and the idea came partly from Bentham's brother Samuel.
a*: That discipline is a historical form of power, tied to knowledge, that spread from the army to prisons, factories and schools.
a: That privacy is a right to be let alone.
x: That phrase belongs to Warren and Brandeis (borrowing from Cooley), not to Foucault.
hint: The Panopticon is a diagram of something larger.
why: The IEP stresses discipline and "power-knowledge" as the book's central theme; the Panopticon is the ideal model of that power, not the main argument.
```

## Can an Algorithm Be Fair?

COMPAS, a risk-assessment tool made by Northpointe (now equivant), has been used in several American states to inform bail, sentencing and parole; it does not take race as an input. On 23 May 2016 *ProPublica* analysed its scores for more than 7,000 people arrested in Broward County, Florida: "The formula was particularly likely to falsely flag black defendants as future criminals, wrongly labeling them this way at almost twice the rate as white defendants." Northpointe replied that its scores were equally predictive for both groups. Counterintuitively, both claims are true. A Black and a white defendant given the same score were equally likely to reoffend; yet among defendants who did *not* reoffend, Black defendants were significantly more likely to have been labelled high-risk. The dispute was over which measure of fairness counts.

Two measures are at stake. **Calibration** (or predictive parity), Northpointe's measure, requires that among people given the same score, the same proportion actually reoffend in each group. **Error-rate balance**, ProPublica's measure, requires equal **false positive rates** (the share of people who did not reoffend who were nonetheless labelled high-risk) and equal **false negative rates** (the share of those who did reoffend who were labelled low-risk). In 2016–17 Chouldechova proved that predictive parity and equal false positive and false negative rates cannot all hold when base rates differ, unless prediction is perfect; Kleinberg, Mullainathan and Raghavan proved a parallel result for calibration within groups and related balance conditions. As an argument:

1. A risk score is fair to two groups only if it is calibrated within each group.
2. It is fair only if its error rates are balanced: people who will not reoffend are equally likely to be flagged in each group, and those who will are equally likely to be missed.
3. When base rates (the proportion who reoffend) differ between groups and prediction is imperfect, no score can satisfy both conditions. This is the **Kleinberg–Chouldechova impossibility result**.
4. In the COMPAS data, recorded reoffending rates differ between the groups, and prediction is imperfect.
5. So no such score can be fair by both standards: we must choose, or give up the idea that fairness is a single statistical test.

**Objection.** Brian Hedden (2021) rejects premise 2. Of the many statistical measures on offer, he argues, only calibration within groups is necessary, since otherwise "the same risk score would have different evidential import for the two groups". Unequal error rates follow from different base rates, not from unfair treatment.

**Reply.** Green and Hu (2018) had already argued that "[l]abeling a particular incompatibility of statistics as an impossibility of fairness generally is mistaking the map for the territory": fairness is a moral notion, not a statistic. And base rates may themselves record injustice. If more policing in a neighbourhood produces more recorded arrests, a perfectly calibrated score passes that history on; the IEP lists such feedback loops, after Cathy O'Neil's *Weapons of Math Destruction* (2016), among the sources of machine bias.

Bias also enters through data. In "Gender Shades" (2018), Joy Buolamwini and Timnit Gebru audited commercial gender classifiers from IBM, Microsoft and Face++ and found error rates up to 34.7 per cent for darker-skinned women against at most 0.8 per cent for lighter-skinned men; the existing test benchmarks were overwhelmingly of lighter-skinned faces. Safiya Umoja Noble's *Algorithms of Oppression* (2018) argued from a Black feminist standpoint that search engines are not neutral.

## Machines and Work

Fear of machines taking work is old, and often misdescribed. The Luddites, English textile workers who broke machines between 1811 and 1816, were protesting about pay, conditions, child labour and the quality of goods; many were skilled machine operators, and the historian Malcolm Thomis wrote that their attacks "did not imply any necessary hostility to machinery as such". Eric Hobsbawm called it "collective bargaining by riot". *The Industrial Revolution* tells their story.

John Maynard Keynes popularised the term "technological unemployment", which he called "only a temporary phase of maladjustment". In "Economic Possibilities for our Grandchildren" (1930) he predicted that within about a century the economic problem might be solved and an age of leisure begin. The SEP's verdict, from Vincent Müller: "we have already reached the level he anticipated for 2030, but we are still working."

The most quoted modern figure comes from Carl Benedikt Frey and Michael Osborne (working paper 2013, published 2017), who placed about 47 per cent of total US employment in a high-risk category for computerisation. The figure is often misread. It measures **technical susceptibility**, what could in principle be automated over a period the authors left open (perhaps a decade or two), not a forecast of jobs lost. A 2016 OECD study, looking at tasks rather than whole occupations, found about 9 per cent of jobs automatable across 21 countries. As of the SEP's March 2026 revision, AI's effect on the labour market "is now clearly visible", but overall it appeared to be "generating more employment", with "indications that this will change".

If work does shrink, two questions follow. One is income. A **basic income** is an unconditional payment to everyone; versions of it have been piloted with selected groups in Finland, Kenya and California. Critics press the **reciprocity objection**: those who benefit from social cooperation ought to contribute by working (Stuart White). Defenders reply that the conditions for fair reciprocity do not hold for everyone, or that requiring work breaches the state's neutrality between ways of life (Philippe van Parijs's "Why Surfers Should Be Fed"). The other is meaning. Estlund calls the workplace "the single most important site of cooperative interaction and sociability among adult citizens outside the family", and Rawls thought a lack of meaningful work undermines self-respect; Bertrand Russell's "In Praise of Idleness" and, recently, John Danaher welcome a world with less work.

## Who Is Responsible When the Machine Decides?

Andreas Matthias (2004) argued that learning systems create something new, a **responsibility gap**. We blame the operator when a machine works as specified and the maker when it is badly built; but control is a condition of responsibility, and with a learning machine neither can in principle predict what it will do. In the SEP's summary, "the less human beings can directly control or intervene in the behavior of these technologies, the less we can reasonably hold human beings responsible".

Robert Sparrow's "Killer Robots" (2007) applied this to war. If an autonomous weapon commits what would otherwise be a war crime, who answers for it? Step by step:

1. It is permissible to use a weapon in war only if someone can justly be held responsible for the deaths it causes.
2. If an autonomous weapon kills wrongly, the candidates are the programmer or designer, the commanding officer who deployed it, and the machine itself.
3. The programmer is not responsible: the system's choices are learned, not specified, so they could not be predicted or controlled.
4. The commander is not responsible, for the same reason: deploying a system that chooses its own targets does not give control over those choices.
5. The machine is not responsible: to be responsible is to be an apt target of praise and punishment, and a machine that cannot suffer cannot be punished.
6. So no one can justly be held responsible for the deaths: there is a responsibility gap.
7. So deploying fully autonomous weapons is impermissible.

Whether machines could ever be genuine moral agents bears on step 5; whether they could think or feel at all is the subject of *Minds and Machines: Could AI Think?*

**Objection.** Steps 3 and 4 may be false by design. Santoni de Sio and van den Hoven (2018) argue that systems and institutions can be built so that humans keep **meaningful human control**, a phrase that gained currency in the debate over such weapons; others propose that a senior officer formally accept responsibility in advance. Daniel Tigard's "There Is No Techno-Responsibility Gap" (2021) denies that anything new has happened, and Simpson and Müller (2016) argue that not every harm needs a culpable party: the real question, as with other risky technologies, is how to distribute risk fairly.

**Reply.** If humans keep enough control to be responsible, the weapon is not fully autonomous, so the argument still rules out *full* autonomy, which was its target; and meaningful control may be illusory at machine speed. Accepting responsibility in advance makes someone *liable*, not *blameworthy* for choices they could not foresee, which is exactly the gap. The SEP leaves the matter open: it "remains an open question" whether AI truly challenges our allocations of responsibility "or rather just generates temporary confusion".

The question is not academic. Campaigners have sought a ban since 2013, while Ronald Arkin (2009) argued that an "ethical governor" might reduce war crimes. States party to the Convention on Certain Conventional Weapons (CCW) have discussed such weapons since 2014, and in a formal Group of Governmental Experts since 2017; its 2026 report agreed by consensus that human control and judgment are needed to comply with international humanitarian law, a report Human Rights Watch said was "significantly watered down". As of November 2026, the CCW's Seventh Review Conference was meeting in Geneva to decide whether to open treaty negotiations; its outcome was not known at the time of writing.

## Driverless Cars and the Moral Machine

In March 2018 an experimental self-driving car killed a pedestrian, whom its system had classified in turn as "unknown", "vehicle" and "bicycle". Popular debate seized on dilemmas modelled on the trolley problem, in which a runaway trolley can be diverted to kill one person instead of five; *Consequentialism: What Makes Right Acts Right?* sets out the cases. The SEP doubts "that an actual driver or autonomous car will ever have to solve trolley problems", and Himmelreich and Goodall argue that the real ethics lies in managing everyday risk.

The **Moral Machine**, an online experiment from the MIT Media Lab, nevertheless collected about 40 million decisions on such dilemmas from 233 countries and territories (published in *Nature*, October 2018). Respondents preferred to spare humans over animals, more lives over fewer and the young over the old, with variation between cultural clusters. The sample was not representative, and Iyad Rahwan, whose group ran it, urged that the results be used with extreme caution. In 2017 a German ethics commission, chaired by the former constitutional judge Udo Di Fabio, issued twenty guidelines for automated driving; in its official English version, one provides that in unavoidable accident situations "any distinction based on personal features (age, gender, physical or mental constitution)". The contrast is instructive: an experiment records preferences, not what is right, and the German rule rejects some popular preferences in the name of equal dignity.

```checkpoint
q: In the Kleinberg–Chouldechova result, what makes calibration and equal error rates impossible to satisfy together?
a: The use of race as an input to the score.
x: COMPAS does not use race as an input; the result holds whatever the inputs.
a*: Different base rates between the groups, combined with imperfect prediction.
a: Deliberate bias by the designers of the tool.
x: The result is mathematical: it holds even with no bias in the designers' intentions.
a: A small sample of defendants.
x: The incompatibility is a theorem, not a sampling problem.
hint: Ask what the special cases are in which both can hold.
why: When the proportion who reoffend differs between groups and the tool is not perfectly accurate, a calibrated score must produce unequal false positive and false negative rates. ProPublica and Northpointe were each measuring a different one of these conditions.
---
q: What is the strongest reply to the objection that "meaningful human control" closes Sparrow's responsibility gap?
a: That humans can never control any machine.
x: The reply grants that humans can control machines; it asks what follows for full autonomy.
a: That robots can be punished after all.
x: The reply does not challenge Sparrow's claim that a machine that cannot suffer cannot be punished.
a: That war is never just.
x: Sparrow's argument assumes that just war requires someone answerable for deaths; it does not reject just war.
a*: That a weapon under enough human control to make someone responsible is not fully autonomous, and that pre-accepting blame creates liability, not deserved blame.
hint: What exactly was the argument's target?
why: Meaningful control saves responsibility only by giving up full autonomy, which the argument was about; and someone who formally accepts responsibility for choices they could not foresee is liable, not blameworthy. The SEP leaves open whether the gap is real or "temporary confusion".
```

## Could AI Be an Existential Risk?

{{image: Norbert Wiener | Norbert Wiener (1894–1964), the founder of cybernetics, who warned in 1960 that we had better be sure the purpose put into a machine is the one we really desire.}}

The worry is older than modern AI. In 1960 Norbert Wiener, founder of cybernetics, warned that "if we use, to achieve our purposes, a mechanical agency with whose operation we cannot efficiently interfere once we have started it […] we had better be quite sure that the purpose put into the machine is the purpose which we really desire." In 1965 Turing's Bletchley Park colleague I. J. Good imagined an "intelligence explosion", with a condition that is often cut:

```quote
Let an ultraintelligent machine be defined as a machine that can far surpass all the intellectual activities of any man however clever. Since the design of machines is one of these intellectual activities, an ultraintelligent machine could design even better machines; there would then unquestionably be an 'intelligence explosion', and the intelligence of man would be left far behind […]. Thus the first ultraintelligent machine is the last invention that man need ever make, provided that the machine is docile enough to tell us how to keep it under control.
I. J. Good · "Speculations Concerning the First Ultraintelligent Machine" · 1965
```

Nick Bostrom's *Superintelligence* (2014) supplied two premises for the modern argument. The **orthogonality thesis** holds that "more or less any level of intelligence could in principle be combined with more or less any final goal", denying that greater intelligence must bring better values. **Instrumental convergence** holds that almost any final goal is served by the same sub-goals, such as self-preservation, keeping one's goals intact and acquiring resources. Together they suggest that a highly capable system with the wrong final goal would have reasons of its own to preserve itself and that goal; hence Bostrom's "control problem", and his advice to align values at the design stage. Stuart Russell's *Human Compatible* (2019) argued that the "standard model" of AI, optimising a fixed objective, is the root problem, and proposed machines that are uncertain about human preferences and learn them from human behaviour. This is the **alignment problem**: steering AI systems towards the goals and values we actually intend.

On 30 May 2023 the Center for AI Safety published a one-sentence statement: "Mitigating the risk of extinction from AI should be a global priority alongside other societal-scale risks such as pandemics and nuclear war." Signatories included Geoffrey Hinton, Yoshua Bengio, leaders of major AI companies, and the philosophers Peter Singer, David Chalmers, Daniel Dennett and Peter Railton.

Some critics reject the argument: Müller and Cannon (2022) argue that orthogonality and instrumental convergence rely on two incompatible notions of intelligence; Andrew Ng likened the worry to "overpopulation on Mars"; Yann LeCun holds that AI will have no desire to take control. Others say the framing distracts. In a March 2023 reply to an open letter calling for a pause in AI development, Gebru, Emily Bender, Margaret Mitchell and Angelina McMillan-Major (authors of "On the Dangers of Stochastic Parrots", discussed in *Minds and Machines: Could AI Think?*) argued that a focus on hypothetical risks draws attention from present harms such as bias, exploitation of workers and concentrated power. The SEP notes that this literature is often tied to **longtermism** (see *Consequentialism: What Makes Right Acts Right?*) and to "fanaticism", letting a vast value at a tiny probability outweigh a certain, moderate one. Others refuse the choice: the Center's Dan Hendrycks said "it's not 'either/or' but 'yes/and'". The SEP (revised March 2026) observes that even philosophers who reject the arguments for existential risk "should acknowledge that they might be wrong".

## Governing AI, as of November 2026

After a phase of voluntary ethics principles, in which Metzinger warned of "ethics washing", law arrived. The EU's **Artificial Intelligence Act** entered into force on 1 August 2024. It sorts systems by risk: practices such as social scoring are banned, "high-risk" systems face strict obligations, and general-purpose models have their own rules. As enacted, the bans applied from 2 February 2025, the rules for general-purpose AI from 2 August 2025, most other rules from 2 August 2026, and obligations for high-risk AI built into regulated products from 2 August 2027. According to secondary and law-firm sources (the official text could not be consulted here), a "Digital Omnibus" amendment, agreed in 2026 and reported to have entered into force in July 2026, postponed the obligations for stand-alone high-risk systems to 2 December 2027 and for AI in regulated products to 2 August 2028. Amnesty International judged the Act too weak on human rights; industry critics feared it would stifle innovation.

In the United States, President Biden's 2023 executive order on AI was rescinded on 20 January 2025, and as of late 2026 there was no comprehensive federal AI statute, while states kept passing their own laws and efforts at federal preemption had not succeeded. The details will change; the questions behind them (who decides, who is answerable, whose values count) are the ones this chapter has traced.

## Further exploration

- **Helen Nissenbaum, *Privacy in Context: Technology, Policy, and the Integrity of Social Life* (2010).** The full statement of the theory of contextual integrity.
- **Carissa Véliz, *Privacy Is Power* (2020).** A philosopher's case for privacy as protection against the data economy.
- **Safiya Umoja Noble, *Algorithms of Oppression: How Search Engines Reinforce Racism* (2018).** How search engines encode racial and gender bias, from a Black feminist standpoint.
- **Batya Friedman and David G. Hendry, *Value Sensitive Design: Shaping Technology with Moral Imagination* (2019).** The method of building values into design, by its originator.
- **Shannon Vallor, *Technology and the Virtues: A Philosophical Guide to a Future Worth Wanting* (2016).** Virtue ethics applied to life with new technologies.
- **Mark Coeckelbergh, *AI Ethics* (2020).** A short introduction to the main questions.
- **Brian Christian, *The Alignment Problem: Machine Learning and Human Values* (2020).** An accessible account of the effort to make AI systems do what we intend.$tech_master$,
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
  select $tech_quiz$[
    {"type": "mcq", "prompt": "In the COMPAS dispute, what does a 'false positive rate' measure?", "options": ["The share of people who did not reoffend who were nonetheless labelled high-risk", "The share of people labelled high-risk who went on to reoffend", "The share of all defendants who were labelled high-risk", "The share of people who reoffended who were labelled low-risk"], "answerIndex": 0, "explanation": "The false positive rate is taken over everyone who did not reoffend: how many of them were wrongly flagged as high-risk. The share of those who reoffended but were labelled low-risk is the false negative rate. ProPublica found Black defendants falsely flagged at almost twice the rate of white defendants, while Northpointe showed its scores were calibrated; both claims are true.", "id": "q1"},
    {"type": "mcq", "prompt": "What did Frey and Osborne's often-quoted figure of about 47 per cent of US employment actually measure?", "options": ["The proportion of jobs that would be lost within a decade", "Technical susceptibility to computerisation over an open-ended period, not a forecast of job losses", "The proportion of workers who feared losing their jobs to machines", "The share of jobs already automated by 2013"], "answerIndex": 1, "explanation": "Frey and Osborne estimated which occupations were technically susceptible to computerisation and framed this as susceptibility over an open-ended period (perhaps a decade or two), not a forecast of jobs lost. A 2016 OECD study, looking at tasks rather than whole occupations, found about 9 per cent of jobs automatable.", "id": "q2"},
    {"type": "mcq", "prompt": "What is disputed about Langdon Winner's example of Robert Moses's low parkway bridges?", "options": ["Whether Winner ever wrote 'Do Artifacts Have Politics?'", "Whether artifacts can have any political effects at all", "Whether Moses really built the bridges to keep buses, and with them poorer and Black New Yorkers, away from Jones Beach", "Whether Moses was responsible for any parkways on Long Island"], "answerIndex": 2, "explanation": "Joerges, and Woolgar and Cooper (who called it an 'urban legend'), questioned the story, the historian Kenneth T. Jackson denied nefarious intent, and low bridges were already standard on earlier parkways for aesthetic reasons. The dispute is over the historical example and intent, not over Winner's general thesis.", "id": "q3"},
    {"type": "mcq", "prompt": "What condition did I. J. Good attach to his claim that the first ultraintelligent machine would be 'the last invention that man need ever make'?", "options": ["That it be built by a government rather than a company", "That it be unable to design other machines", "That it share human emotions", "That the machine be 'docile enough to tell us how to keep it under control'"], "answerIndex": 3, "explanation": "Good's 1965 sentence ends 'provided that the machine is docile enough to tell us how to keep it under control', a clause often cut when the passage is quoted. His argument was that a machine able to design better machines would set off an 'intelligence explosion'.", "id": "q4"},
    {"type": "open", "prompt": "Set out Sparrow's responsibility-gap argument against autonomous weapons step by step. What is the strongest objection, and how might Sparrow reply?", "rubric": "A strong answer reconstructs the argument: using a weapon is permissible only if someone can justly be held responsible for the deaths it causes; the candidates are the programmer, the commander and the machine; the programmer and commander lack control over a learning system's unpredictable choices (Matthias's control condition, 2004); the machine cannot be punished because it cannot suffer; so there is a responsibility gap, and fully autonomous weapons are impermissible. It presents objections: meaningful human control (Santoni de Sio and van den Hoven 2018), formally accepting responsibility in advance, Tigard's denial that there is any new gap (2021), and Simpson and Müller's recasting as fair distribution of risk. It gives the reply: enough control to ground responsibility means the weapon is not fully autonomous, control may be illusory at machine speed, and pre-accepted responsibility creates liability, not deserved blame. Credit for noting that the SEP leaves open whether the gap is real or 'temporary confusion', and for dating the CCW talks (2026 report on 'control and human judgment'; Review Conference meeting in November 2026, outcome unknown at the time of writing).", "id": "q5"},
    {"type": "open", "prompt": "Is the long-term risk of extinction from AI a serious ethical concern, or a distraction from present harms? Discuss using the main arguments on both sides.", "rubric": "A strong answer explains the case for concern: Wiener's 1960 warning about purposes put into machines; Good's 1965 'intelligence explosion', quoted with its 'docile enough' proviso; Bostrom's orthogonality thesis and instrumental convergence (2014); Russell's critique of the 'standard model' and the alignment problem (2019); and the Center for AI Safety statement of 30 May 2023 and its signatories. It weighs critics: Müller and Cannon on two notions of intelligence, Ng's 'overpopulation on Mars', LeCun's view that AI will have no desire to take control, and Gebru, Bender, Mitchell and McMillan-Major's argument (in a 2023 reply to the 'pause' letter) that a focus on hypothetical risks distracts from present harms such as bias, worker exploitation and concentrated power. It notes the link to longtermism and 'fanaticism' (cross-referring to consequentialism rather than redefining it), Hendrycks's 'yes/and' position, and the SEP's remark that even sceptics 'should acknowledge that they might be wrong'. Credit for dating claims and for distinguishing the argument's premises from questions about who makes it.", "id": "q6"}
  ]$tech_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/ethics/ethics-of-technology', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

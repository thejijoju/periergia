-- Race, Colonialism and Philosophy — canonical master article, co-written and human-reviewed.
-- philosophy/political-philosophy/race-and-colonialism @ research/advanced/read.
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
    'philosophy/political-philosophy/race-and-colonialism',
    'research',
    'advanced',
    'read',
    $race_master$> **Is race real, was the social contract a racial one, and is anything owed for slavery and empire?** This chapter traces how the modern idea of race took shape and how scholars judge Kant and Hume, then weighs the rival answers to whether races exist. It reads Aimé Césaire's *Discourse on Colonialism* and the debate over Frantz Fanon on violence, sets out Charles Mills's Racial Contract step by step with its objections, and introduces the postcolonial and decolonial thought of Said, Spivak, Bhabha, Quijano and Mignolo. It ends with the case for reparations and the non-identity objection.

## Why Race and Empire Are Philosophical Questions

W. E. B. Du Bois opened *The Souls of Black Folk* (1903) with the claim that "the problem of the twentieth century is the problem of the color-line". *Philosophy in an Age of Empire* tells his story; this chapter takes up the questions his line raised for philosophy.

Some are **metaphysical**: is a race a natural division of humankind, a social creation, or nothing at all? Some are **political**: did the theories that grounded modern states on the agreement of equals quietly exclude most of the world? Some are **moral**: what do present societies owe for slavery and colonial rule? And one turns back on philosophy: Linda Alcoff, in the Stanford Encyclopedia of Philosophy (SEP), says the field now called **critical philosophy of race** asks how to assess the canon of modern philosophy itself.

Margaret Kohn and Kavita Reddy, in the SEP, distinguish **postcolonial theory**, a humanities field shaped by poststructuralism, from theories of **decolonisation**, concerned with "revolution, economic inequality, violence, and political identity".

## Inventing Race: the Enlightenment Debate

"The dominant position", according to the SEP entry on race by Michael James and Adam Burgos, "is that race is a modern concept." Dissenters include Benjamin Isaac and Denise McCoskey, who find "proto-racist" views among the Greeks and Romans, and Adam Hochman, who calls the concept "late medieval", pointing to the Spanish statutes of blood purity (*limpieza de sangre*), first issued in 1449 and applied to *conversos*, converts from Judaism.

The first important statement of the modern concept is usually credited to François Bernier, whose "A New Division of the Earth" (1684) divided humanity into "four or five species or races of men". Eighteenth-century naturalists then argued over **monogenesis**, the view that all humans share one origin, and **polygenesis**, the view that races arose separately. Kant's "Of the Different Human Races" (1775, revised 1777) defended monogenesis: four races from one stock, differentiated by climate. Blumenbach, also a monogenist, coined the term "Caucasian" in 1795, citing the supposed beauty of Georgians.

Why did the concept arise then? One interpretation, which the SEP reports from Robert Bernasconi and others, is that the conflict between the Enlightenment's ideals of universal freedom and equality and the fact of European enslavement of Africans and Indigenous Americans "fostered the development of the idea of race".

*Kant*, *Berkeley and Hume* and *The Enlightenment and Rousseau* give the texts; here is the shape of the debate. Critics such as Emmanuel Chukwudi Eze (1995), Charles Mills (2005) and Bernasconi (2001) hold that Kant's racism belongs to his philosophy; defenders of his wider philosophy include Louden, Hill and Boxill, Pauline Kleingeld and Allais. Kleingeld frames three options. Either the racism makes Kant's moral theory less than universal; or the theory is universal and Kant contradicted himself; or, her own thesis (2007), Kant changed his mind before *Toward Perpetual Peace* (1795), becoming more egalitarian about race and rejecting colonialism and the slave trade. Lu-Adler (2022, 2023) replies that the late Kant objected to slavery and colonialism mainly as obstacles to progress and peace, and held a "consistent inegalitarian position". Hume's case is similar. In "Of National Characters", an essay arguing that national differences have cultural causes, he placed a footnote, added in the early 1750s and revised in the edition published after his death, suspecting non-whites to be "naturally inferior". Whether it assumes polygenesis is disputed: Popkin and Naomi Zack say yes, Andrew Valls no.

Universalism did not always restrain empire. The SEP grants that Kant, Smith and Diderot criticised the barbarity of colonialism and the idea that Europeans must "civilize" the world, but judges that "universalism proved to be a relatively weak basis for criticizing colonialism". Joined to a **stadial** history, in which peoples advance from hunting through herding and farming to commerce, it supported **liberal imperialism**, rule over peoples judged not ready to govern themselves. John Stuart Mill, a lifelong East India Company employee, defended despotism as a means to "improvement" (see *Bentham, Mill and Utilitarianism*).

## Does Race Exist?

The old biological view, which the SEP calls **racial naturalism**, held that races have "biobehavioral essences": heritable traits, shared by all and only their members, that explain behaviour and culture. Philosophers and scientists, the SEP reports, "have reached the consensus against racial naturalism". Following Mallon, the SEP maps three answers about what exists and two about what to do.

**Racial scepticism** says races do not exist. Anthony Appiah's 1985 critique of Du Bois (reconstructed in *Philosophy in an Age of Empire*) began it, and Zack put the argument briefly:

```quote
Essences, geography, phenotypes, genotypes, and genealogy are the only known candidates for physical scientific bases of race. Each fails. Therefore, there is no physical scientific basis for the social racial taxonomy.
Naomi Zack · Philosophy of Science and Race, p. 88 · 2002
```

A related "mismatch" argument says the concept could fit only small, genetically isolated groups (Appiah's example is the Amish), not the large groups we call races. Appiah later allowed that "folk races" exist as social identities, though the folk theory behind them wrongly assumes a biological basis.

**Constructionism** (the SEP says "constructivism") holds that races are real but made by human culture and decisions. Paul C. Taylor argued that races, though biologically unreal, are real social objects. Sally Haslanger defines races as **racialised groups**: people observed or imagined to have bodily features taken as evidence of ancestry from certain regions, where those features mark them as subordinate or privileged, and where this plays a role in their systematic subordination or privilege. Since race so defined is made by hierarchy, Haslanger hopes it will disappear, while granting that racial identities can be valuable responses to that hierarchy. Chike Jeffers's cultural constructionism allows race to outlast racism: "There is also joy in blackness, a joy shaped by culturally distinctive situations."

**Population naturalism** says non-essentialist biological races may exist. Philip Kitcher notes that sharp genetic boundaries would be too much to ask: "there is no…genetic feature…that separates one species of mosquito or mushroom from another". Quayshawn Spencer argues that the race categories of the US Office of Management and Budget pick out five "human continental populations" identified by population genetics, while allowing that race talk has several meanings.

What does genetics show? Richard Lewontin's paper "The Apportionment of Human Diversity" (1972) used 17 markers, such as blood-group proteins, across seven conventionally defined races. He found 85.4 per cent of human genetic variation within populations, 8.3 per cent between populations within a race, and 6.3 per cent between races, and concluded that racial classification is "of virtually no genetic or taxonomic significance". A. W. F. Edwards replied in 2003 that by combining many genetic markers, individuals can be assigned to groups with almost no error. Later work found the claims compatible: Winther calls the two methods "two sides of the same mathematics coin". Clustering studies find groupings roughly matching large continental regions, but Kitcher notes that the number of clusters depends on how many the scientist asks the computer to find. In 2023 a report of the US National Academies advised that researchers "should not use race as a proxy for describing human genetic variation". Whether continental clusters count as "races" is not settled by the data; it depends on what the word must refer to, which is the philosophical dispute itself.

The normative question remains. **Eliminativists** would drop racial categories; **conservationists** would keep them for some purpose. Tommie Shelby's *We Who Are Dark* (2005) defends a "pragmatic" Black nationalism grounded in the shared fight against anti-Black racism rather than in an organic identity.

```checkpoint
q: What does Sally Haslanger's account say a race is?
a*: A group whose members are seen as having bodily features linked to certain ancestry, where those features mark them for subordination or privilege within a social hierarchy.
a: A group with a heritable biobehavioural essence that explains its culture.
x: That is racial naturalism, the view Haslanger and almost all philosophers and scientists reject.
a: One of five continental populations picked out by population genetics.
x: That is Quayshawn Spencer's biological racial realism, not Haslanger's social account.
a: Nothing at all, since the word "race" refers to nothing real.
x: That is racial scepticism (Appiah's early view and Zack's); Haslanger holds races are real, though socially made.
hint: Her definition has three conditions, and the second and third are about hierarchy.
why: Haslanger is a political constructionist: races are racialised groups, made real by being marked as subordinate or privileged. That is why she hopes race in this sense will eventually disappear.
---
q: What did Lewontin's 1972 study find?
a: That about 85 per cent of human genetic variation lies between conventionally defined races.
x: He found the reverse: 85.4 per cent lay within populations and only 6.3 per cent between races.
a: That with enough genetic markers, individuals can be assigned to groups almost without error.
x: That is Edwards's 2003 reply, and later work found the two claims compatible.
a*: That most human genetic variation lies within populations and only a small share between races.
a: That human genetic diversity is lowest within Africa.
x: Diversity is greatest within and among African populations and declines with distance from Africa.
hint: Consider the three percentages: 85.4, 8.3 and 6.3.
why: Using 17 markers across seven conventional races, Lewontin found 85.4 per cent of variation within populations, 8.3 per cent between populations within a race and 6.3 per cent between races, and judged racial classification of "virtually no genetic or taxonomic significance".
```

## Césaire: "No One Colonizes Innocently"

Aimé Césaire (1913–2008), the Martinican poet who coined the word *négritude* (see *African Philosophy: the Ethnophilosophy Debate and Beyond*), was also for decades mayor of Fort-de-France. His *Discourse on Colonialism* was first published in Paris in 1950 and revised and republished in 1955; Joan Pinkham's English translation appeared in 1972.

Its thesis is blunt: "between colonization and civilization there is an infinite distance." The "civilizing mission" is a lie, and colonialism "decivilizes" the coloniser as well. In place of the false equations "Christianity=civilization, paganism=savagery", he offers his own, in Joan Pinkham's translation: "My turn to state an equation: colonization = 'thingification.'"

His most famous argument concerns Nazism. Europeans, he says, did not see Nazism for what it was until it was turned on them: "before they were its victims, they were its accomplices; … they tolerated that Nazism before it was inflicted on them … because, until then, it had been applied only to non-European peoples." Césaire's French speaks of "un formidable choc en retour", a formidable shock in return; "boomerang effect" is Pinkham's English, and the argument is now often called the boomerang thesis. "No one colonizes innocently", and a civilisation that justifies colonisation, and therefore force, is already "a sick civilization". Yet Césaire did not want to go back: "It is not a dead society that we want to revive … It is a new society that we must create."

## Fanon and the Violence Debate

Frantz Fanon (1925–1961), whose life and *Black Skin, White Masks* are covered in *Existentialism: Sartre, Beauvoir and Camus*, wrote *The Wretched of the Earth* (1961). The SEP calls it "the most influential philosophical account of the anti-colonial struggle and the challenges of post-colonial governance". Its first chapter opens, in Constance Farrington's 1963 translation: "decolonization is always a violent phenomenon."

On Kohn and Reddy's reading, violence "is the foundation of the colonial regime, and therefore inevitably plays a role in its overthrow"; revolutionary violence becomes "a praxis that generates political agency, group cohesion and national identity". John Drabinski, also in the SEP, calls violence a "precondition to liberation", "simultaneously a saying of no to colonialism and a saying of yes to the possibilities of post-colonial life".

Others read Fanon as diagnosing violence rather than recommending it. Tracey Nicholls, in the Internet Encyclopedia of Philosophy, writes that critics who find an endorsement of violent insurgency are "often reading Fanon's words too simplistically": "His argument is not that decolonizing natives are justified in using violent means to effect their ends." Violence was introduced by the colonisers; the colonised can absorb it, displace it onto one another, or throw it back.

The endorsement reading owes much to Sartre's preface, which appears to endorse counter-violence. Hannah Arendt's *On Violence* (1970) took the preface as her main target, charging it with glorifying violence irresponsibly, and treated Fanon more gently, noting that he was more doubtful about violence than his admirers. Her objection rests on distinguishing power, people acting in concert, from violence. Frazer and Hutchings (2008) judge Fanon's understanding of embodied violence the more insightful. The debate is open.

Fanon also foresaw a danger after independence. Exploitation can continue through a **national bourgeoisie**, an indigenous elite allied with foreign interests that uses national or ethnic identity to mask class differences. He quotes Gabon's president Léon M'ba: "Gabon is independent, but between Gabon and France nothing has changed." The book ends with a call to "make a new start … develop a new way of thinking, and endeavor to create a new man" (Philcox's 2004 translation), a humanism Drabinski links to Césaire's *Discourse*.

## The Racial Contract

Charles W. Mills (1951–2021), born in London and raised in Jamaica, trained in physics before turning to philosophy. His short book *The Racial Contract* (1997) begins:

```quote
White supremacy is the unnamed political system that has made the modern world what it is today.
Charles W. Mills · The Racial Contract, p. 1 · 1997
```

{{image: Charles W. Mills | Charles W. Mills, whose *The Racial Contract* (1997) argued that the social contract of modern political philosophy was, in practice, a contract among whites.}}

Mills took his model from Carole Pateman's *The Sexual Contract* (1988), discussed in *Feminist Philosophy*: non-whites stand to the social contract as women do in Pateman's account. *Authority and the State: the Social Contract and Its Critics* sets out the contracts of Hobbes, Locke and Rousseau; Mills's argument runs:

1. Classical contract theory presents political society as founded on agreement among free and equal persons, and is usually treated as race-neutral.
2. But the actual "agreements" that built the modern world (papal bulls, voyages of discovery, Locke's claim that Native Americans who did not farm land did not own it, colonisation and slavery) first fixed who counted as a person: white Europeans as full persons, non-whites as sub-persons.
3. This prior "racial contract" has moral terms (the dominant group values its lives more highly), political terms (the subordinate group is kept from power) and epistemological terms (the dominant see themselves as intellectually superior).
4. So white supremacy is not an accidental deviation from a just liberal order but "itself a political system"; in Mills's words, "what has usually been taken…as the racist 'exception' has really been the rule".
5. Idealised contract theory, which abstracts from this history, therefore works as ideology, sustained by an **epistemology of ignorance**: "habits of knowing" that let the dominant keep their moral self-regard.
6. So political philosophy must begin from the actual, non-ideal contract: from where we really are.

Mills's contract, the Internet Encyclopedia stresses, is "not hypothetical" but "an actual contract, or series of contracts, made by real men of history". Later, in *Contract and Domination* (with Pateman, 2007), he imagined a non-ideal contract whose parties know their society's history of racial exploitation but not their own race, and argued they would agree to racial reparations.

The objections come from several sides. **Liberal:** Tommie Shelby (2013) argues that rectifying injustice presupposes an ideal theory saying what justice is, since reparations alone could leave a society racially unjust in other ways; ideal theory "remains indispensable". **Contractarians** answer that a contract excluding people who could cooperate and reciprocate is irrational by contractarianism's own standard, so the theory, properly understood, condemns the racial contract. **On consent**, Bat-Ami BarOn asked how anyone consents to such an agreement. **From the left**, Lucius Outlaw objected that racial worldviews preceded any agreement, and Pateman that contract theory inherently permits domination.

**Reply.** Mills's contract is a "naturalized" explanation, a story about who we actually are, told so that liberal societies might someday live up to their own norms. Its consent, Ann Cudd notes in the SEP, is "sometimes explicit, though often only implicit", so responsibility follows benefit and acquiescence. Against Pateman, Mills held that contract theory can be saved by a realistic non-ideal starting point; Cudd notes that his positive theory is then contractualist, beginning "with the premise of moral equality". In *Black Rights/White Wrongs* (2017) he defended a reformed, "black radical" liberalism. Kathryn Sophia Belle (as Kathryn T. Gines) objected that the racial and sexual contracts had been treated as "parallel non-intersecting universes".

## Postcolonial and Decolonial Thought

Edward Said's *Orientalism* (1978) applied Foucault's analysis of discourse (see *Structuralism and After: Foucault, Derrida and Their Critics*) to Western knowledge of the Middle East: knowing "the Orient" was part of dominating it. Said gave Orientalism three senses: an academic field; "a style of thought based upon an ontological and epistemological distinction" between "the Orient" and "the Occident"; and a political instrument of domination. Hence his definition of Orientalism as "a Western style for dominating, restructuring, and having authority over the Orient". Among his critics, Sadiq Jalal al-Azm argued that Said's account itself essentialised "the West".

In "Can the Subaltern Speak?" (1988), Gayatri Chakravorty Spivak, borrowing "subaltern" from Gramsci, argued that scholars who want the subaltern to "speak for themselves" assume that speech is transparent, but experience is itself shaped by representation, so interpretation cannot be avoided. Her example is the British abolition of *sati* (widow-burning), justified as "White men are saving brown women from brown men", against the Hindu claim that the women wanted to die; the woman herself is silenced in both. Homi K. Bhabha's *The Location of Culture* (1994) stressed **hybridity** and **mimicry**: the coloniser wants a reformed Other "almost the same, but not quite", and this double vision unsettles colonial authority.

Marxist critics answered. Aijaz Ahmad found in Spivak "contempt for materialism, rationalism, and progress", and Vivek Chibber (2013) defended universal categories such as capitalism, class and rationality against Dipesh Chakrabarty's *Provincializing Europe*. McClintock (1992) warned from within that "post-colonial" smuggles in a story of progress.

**Decolonial** thought came from Latin America. The Peruvian sociologist Aníbal Quijano argued that the colonial racial hierarchy outlived formal colonialism. In this **coloniality of power**, race is the "naturalization of colonial relations between Europeans and non-Europeans", and Europe controls "subjectivity, culture, and especially knowledge". María Lugones extended it to the coloniality of gender. Walter Mignolo, in *Local Histories/Global Designs* (2000), called for "border thinking" and presented decoloniality as moving beyond postcolonialism, which he cast as a project within the academy, a description some postcolonial scholars dispute. *Latin American Philosophy and the Philosophy of Liberation* covers Dussel and the Valladolid debate. Frederick Cooper warned against stretching the idea: "If colonialism is everywhere, it is nowhere. But it is somewhere."

Wiredu's conceptual decolonisation (see *African Philosophy*) is another version of the project; so is the critique of philosophy's canon. Peter K. J. Park (2013) traces how historians around 1780–1830 came to exclude Africa and Asia from the history of philosophy. In 2016 Jay Garfield and Bryan Van Norden proposed relabelling departments that teach only European and American philosophy; critics replied that "philosophy" means the tradition from Plato and Aristotle. This curriculum's chapters on other traditions are its own answer.

## Reparations

Bernard Boxill and J. Angelo Corlett, who wrote the SEP entry on Black reparations, distinguish **reparation**, owed only for wrongful harm, from **compensation**, which on Robert Nozick's definition makes someone "no worse off than he would otherwise have been", and from **restitution**, the return of a thing. American demands run from Thaddeus Stevens's proposal to give the freedpeople land confiscated from rebels to James Forman's "Black Manifesto" (1969). Boxill's "The Morality of Reparation" (1972) is the classic philosophical defence. The **harm argument** runs:

1. Slavery and the injustices after emancipation wrongfully harmed the enslaved and their descendants.
2. Those who cause wrongful harm, or the institutions responsible, owe reparation for it.
3. An unbroken chain of harms runs from slavery to present-day Black Americans.
4. So present-day Black Americans are owed reparations.

There are objections. George Sher (1981) doubted that present disadvantages are the "automatic effects of slavery" rather than of later economic changes. Others note that the wrongdoers and the enslaved are gone; as Kevin D. Williamson put it, "The people to whom reparations are owed are long dead." The strongest is the **non-identity objection** (Morris 1984; Levin 1980). Compensation makes someone no worse off than they would otherwise have been; but without slavery, present-day Black Americans would not exist, since different people would have met and had different children. So slavery cannot have made them worse off, and the argument, in this form, is incoherent.

**Replies.** The first shifts the wrong. Fullinwider and Bittker locate it in the failure of governments after 1865 to protect the freedpeople's rights; Boxill and Corlett add a second wrong, the failure to pay the reparations then owed. Their example: freed slaves Tom and Beulah are wronged by the government both before and after their daughter Eulah is conceived. The wrongs after her conception, which leave her poor and unschooled, harm Eulah herself. Her claim concerns wrongs done after she existed, so non-identity does not apply.

The second is the **inheritance argument** (Boxill 1972; Kershnar 1999; Corlett 2010): the freedpeople had unpaid rights to reparation; rights pass to heirs; so their descendants inherit them, whether or not they would otherwise have existed. Critics answer that it seems to make innocent people pay. Boxill and Corlett reply, after Locke, that claims attach to the estates of those who assisted, concurred or consented, which on their argument included the tacit consent of nearly all white citizens. That premise is itself contestable, since abolitionists dissented.

A further objection is Jeremy Waldron's (1992): changed circumstances can **supersede** historic injustice. Boxill and Corlett reply that this at most defeats restitution, the return of what was taken, not reparation for the injury. Libertarians have their own route: Nozick's principle of rectification, discussed in *Justice and Equality*, may require payments to groups made worse off by past injustice. Opponents remain: Nigel Biggar's *Reparations: Slavery and the Tyranny of Imaginary Guilt* (2025) argues that reparations for slavery are inappropriate.

The debate is no longer only academic. As of late 2026, the main dated developments are these. On 11 March 2014 the Caribbean Community (CARICOM) approved a Ten Point Plan for Reparatory Justice whose demands include a full formal apology, an Indigenous peoples' development programme, psychological rehabilitation, technology transfer and debt cancellation. In December 2022 the Dutch prime minister Mark Rutte apologised for the state's role in slavery. The African Union made reparations its theme for 2025. In the United States, Evanston, Illinois, voted in March 2021 for housing grants funded by a cannabis tax, believed to be the first programme of its kind, and California's Reparations Task Force delivered its final report, about 1,075 pages, on 29 June 2023. *Slavery: a Global History* and *Decolonization* give the history behind these claims.

```checkpoint
q: What is the non-identity objection to the harm argument for reparations?
a: That slaveholders are dead and so cannot pay.
x: That is a separate objection about who pays; the non-identity objection is about whether descendants were harmed at all.
a*: That without slavery present-day descendants would not exist, so slavery cannot have made them worse off than they would otherwise have been.
a: That present disadvantages come from later economic changes, not slavery.
x: That is Sher's causal objection, which questions the chain of harm, not the identity of those harmed.
a: That changed circumstances can supersede historic injustice.
x: That is Waldron's supersession objection, which Boxill and Corlett answer by separating restitution from reparation.
hint: Ask what would have happened to the people now claiming, had history gone differently.
why: Compensation makes someone no worse off than they would otherwise have been. Morris and Levin argued that without slavery different people would exist, so today's descendants cannot have been made worse off by it.
---
q: How does the case of Tom, Beulah and Eulah answer the non-identity objection?
a: It shows that rights to reparation always pass to heirs.
x: That is the separate inheritance argument; the Eulah case rests on harms to Eulah herself.
a: It shows that slavery made Eulah worse off than she would otherwise have been.
x: The case grants that Eulah might not exist without slavery; it locates the wrong elsewhere.
a: It shows that restitution of land is owed even after circumstances change.
x: Boxill and Corlett concede that supersession may defeat restitution; the Eulah case concerns non-identity.
a*: It locates the wrong in government acts after Eulah was conceived, which harmed her, so her claim does not depend on how she came to exist.
hint: When did the wrongs that harmed Eulah take place?
why: The government kept wronging Tom and Beulah after Eulah's conception, denying rights and withholding compensation, and those wrongs left Eulah poor and unschooled. She claims for harms to herself from wrongs done after she existed, which the non-identity objection cannot touch.
```

## Further exploration

- **Charles W. Mills, *The Racial Contract* (1997).** The short, provocative classic; a 25th-anniversary edition appeared in 2022.
- **Aimé Césaire, *Discourse on Colonialism* (1950; revised 1955).** The anticolonial essay behind the boomerang thesis, in Joan Pinkham's translation (1972).
- **Joshua Glasgow, Sally Haslanger, Chike Jeffers and Quayshawn Spencer, *What Is Race? Four Philosophical Views* (2019).** Four rival metaphysics of race debated in one volume.
- **Paul C. Taylor, *Race: A Philosophical Introduction* (2004; 2nd edn 2013).** An accessible introduction by a leading social constructionist.
- **Emmanuel Chukwudi Eze (ed.), *Race and the Enlightenment: A Reader* (1997).** The primary texts of Hume, Kant, Blumenbach and others.
- **Janna Thompson, *Taking Responsibility for the Past: Reparation and Historical Injustice* (2002).** A careful philosophical case for reparation across generations.
- **Peter K. J. Park, *Africa, Asia, and the History of Philosophy* (2013).** How the philosophical canon came to be European between 1780 and 1830.$race_master$,
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
  select $race_quiz$[
    {"type": "mcq", "prompt": "In Aimé Césaire's *Discourse on Colonialism* (1950; revised 1955), what is the argument often called the boomerang thesis?", "options": ["That Europeans tolerated and legitimised Nazi methods while they were applied only to non-European peoples, until those methods were turned on Europe itself", "That colonised peoples should return to the societies that existed before colonisation", "That colonial violence always rebounds on the colonised rather than the coloniser", "That the civilising mission succeeded in Europe but failed in the colonies"], "answerIndex": 0, "explanation": "Césaire argued that before Europeans were Nazism's victims they were its accomplices, because until then it had been applied only to non-European peoples. His French phrase is 'un formidable choc en retour'; 'boomerang effect' is Joan Pinkham's English. He explicitly rejected a return to the past: 'It is a new society that we must create.'", "id": "q1"},
    {"type": "mcq", "prompt": "How does Tracey Nicholls, in the Internet Encyclopedia of Philosophy, read Fanon's chapter on violence in *The Wretched of the Earth*?", "options": ["As an endorsement of violent insurgency, as Sartre's preface suggested", "As a rejection of all anti-colonial struggle", "As a diagnosis: violence was introduced by the colonisers, and the colonised choose between absorbing it, displacing it, or throwing it back, not a claim that they are justified in using violent means", "As an argument that power and violence are the same thing"], "answerIndex": 2, "explanation": "Nicholls says critics who see an endorsement are 'often reading Fanon's words too simplistically': 'His argument is not that decolonizing natives are justified in using violent means to effect their ends.' Drabinski and Kohn and Reddy read violence as a precondition of liberation and a generator of political agency, and Arendt distinguished power from violence; the question remains debated.", "id": "q2"},
    {"type": "mcq", "prompt": "Which of these is an objection to Charles Mills's Racial Contract, rather than part of his argument?", "options": ["That the actual agreements of the modern world fixed who counted as a full person", "That the racial contract has moral, political and epistemological terms", "That idealised contract theory is sustained by an 'epistemology of ignorance'", "That rectifying injustice presupposes an ideal theory of justice, so ideal theory remains indispensable"], "answerIndex": 3, "explanation": "Tommie Shelby (2013) argued that reparations and other rectification presuppose an ideal theory that says when injustice has occurred, and that reparations alone could leave a society racially unjust in other ways. The other three options are steps in Mills's own argument.", "id": "q3"},
    {"type": "mcq", "prompt": "What did Aníbal Quijano mean by the 'coloniality of power'?", "options": ["That colonial empires were mainly about trade rather than rule", "That the racial hierarchy created under colonialism outlived formal colonial rule and still shapes social, economic and intellectual life", "That colonised peoples speak in a hybrid language that unsettles colonial authority", "That 'post-colonial' wrongly implies a story of progress"], "answerIndex": 1, "explanation": "Quijano treated race as the 'naturalization of colonial relations between Europeans and non-Europeans' and argued that this hierarchy, with Europe's control of 'subjectivity, culture, and especially knowledge', outlived formal colonialism. Hybridity and mimicry are Bhabha's ideas; the worry about progress is McClintock's.", "id": "q4"},
    {"type": "open", "prompt": "Set out the harm argument for reparations for slavery step by step. Explain the non-identity objection, and assess how well Boxill and Corlett's replies (the post-emancipation wrong illustrated by Tom, Beulah and Eulah, and the inheritance argument) answer it.", "rubric": "A strong answer distinguishes reparation (owed for wrongful harm) from compensation (making someone no worse off than they would otherwise have been, on Nozick's definition) and restitution (return of a thing). It gives the steps: slavery and post-emancipation injustice wrongfully harmed the enslaved and their descendants; those responsible owe reparation for wrongful harm; an unbroken chain of harms runs to present-day Black Americans; so they are owed reparations. It states the non-identity objection (Morris, Levin): without slavery present-day descendants would not exist, so slavery cannot have made them worse off. It explains the first reply, shifting the wrong to post-1865 governments' failure to protect rights and to pay reparations owed (Fullinwider, Bittker; Boxill and Corlett), with the Eulah case: wrongs after her conception harmed her. It explains the inheritance argument (rights to reparation pass to heirs), the objection that it makes innocents pay, the Lockean reply that claims attach to the estates of those who consented, and the contestability of tacit consent. Credit for Sher's causal objection, Waldron's supersession objection with the reply that it defeats restitution, not reparation, and a reasoned verdict.", "id": "q5"},
    {"type": "open", "prompt": "Does race exist? Compare racial scepticism, social constructionism and population naturalism, and explain what Lewontin's 1972 figures and the later clustering studies can and cannot settle.", "rubric": "A strong answer notes the consensus against racial naturalism (biobehavioural essences). It presents scepticism (Appiah, Zack: every candidate physical basis fails; the mismatch argument; Appiah's later view that folk races exist as social identities), constructionism (Taylor's real social objects; Haslanger's racialised groups defined by hierarchy, and her hope that race in that sense disappears; Jeffers's cultural view that race can outlast racism), and population naturalism (Kitcher on the impossibility of sharp boundaries even for species; Spencer's continental populations). It reports Lewontin's figures accurately (85.4 per cent within populations, 8.3 per cent between populations within a race, 6.3 per cent between races; 17 markers, seven races) and Edwards's 2003 reply that many markers together allow accurate assignment, with the point that the two are compatible. It recognises that clustering depends on modelling choices (Kitcher) and that whether clusters count as races is a philosophical question about what 'race' must refer to. Credit for the eliminativism/conservationism distinction and Shelby's pragmatic solidarity.", "id": "q6"}
  ]$race_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/political-philosophy/race-and-colonialism', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

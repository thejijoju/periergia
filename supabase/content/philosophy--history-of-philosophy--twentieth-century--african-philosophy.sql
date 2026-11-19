-- African Philosophy: the Ethnophilosophy Debate and Beyond — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/twentieth-century/african-philosophy @ research/advanced/read.
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
    'philosophy/history-of-philosophy/twentieth-century/african-philosophy',
    'research',
    'advanced',
    'read',
    $african_master$> **For decades African philosophers argued about whether African philosophy existed, and the argument became philosophy of a high order.** This chapter covers Négritude and its precursors; Tempels' *Bantu Philosophy* and "ethnophilosophy"; Hountondji's critique, set out step by step; Oruka's sage philosophy; the African socialism of Nkrumah and Nyerere; Wiredu's "conceptual decolonisation"; the Menkiti–Gyekye debate on personhood; ubuntu; and the newer voices beyond the founding quarrel.

## A Question Asked under Empire

Why would anyone ask whether a whole continent has philosophy? The *Stanford Encyclopedia of Philosophy* (SEP) points to the context. Colonial rule was justified by a ranking of races, and canonical philosophers helped build it: Hume, in a footnote he added in 1753 to "Of National Characters" (1748), asserted the "natural inferiority" of Black people, and Kant followed in 1764. Hegel's lectures shut Africa out of history altogether, as the chapter *German Idealism: Fichte, Schelling and Hegel* describes. For most Europeans, the SEP observes, the very idea of African philosophy was "utterly preposterous".

So the question that started the modern debates, whether there was philosophy proper in traditional sub-Saharan Africa, was never only academic. Answering yes risked accepting Europe's terms for what counted as philosophy; answering no risked agreeing with Hume. The debates ran from the mid-1940s through the 1980s.

How to divide the field is disputed. Jonathan O. Chimakonam, in the *Internet Encyclopedia of Philosophy* (IEP), calls the 1960s–1980s the "Great Debate" between "Traditionalists", who defended the early reconstructions of African thought, and "Universalists", who criticised them; readers should know that Chimakonam founded the "Conversational School", which his scheme presents as the field's culmination. Today, the SEP judges, the old question of whether Africans can do philosophy has been "resolved—or [is] no longer taken seriously".

## Precursors and Négritude

The debate had a prehistory. Anton Wilhelm Amo, born around 1703 in present-day Ghana and taken to the Netherlands as a small child, became a philosopher in Germany; sources give his death as 1758 or around 1759. His work is discussed in *The Enlightenment and Rousseau*. The SEP also names the seventeenth-century Ethiopians Zera Yacob and Walda Heyat, though the authorship of the *Hatata* is disputed, as *Beyond Europe: Mullā Ṣadrā, Wang Yangming, Tokugawa Confucianism and the Hatata* explains. In the nineteenth century Edward Wilmot Blyden's idea of an "African Personality" carried the argument into the age of empire (see *Philosophy in an Age of Empire*).

The most important precursor movement was **Négritude**. It grew from the meeting in Paris, in the late 1920s and early 1930s, of three Black students: Aimé Césaire (1913–2008) from Martinique, Léon-Gontran Damas (1912–1978) from French Guiana and Léopold Sédar Senghor (1906–2001) from Senegal. At the salon of the Martinican sisters Jane, Paulette and Andrée Nardal they met writers of the Harlem Renaissance, and Jane Nardal's article "Internationalisme noir" (1928) came more than ten years before Senghor's first theoretical essay. T. Denean Sharpley-Whiting (2000) criticises the "masculinist genealogy" that erased the Nardals. The conventional founding moment is the student journal *L'Étudiant noir* (1934–35), where Césaire coined "négritude", reclaiming the slur *nègre*.

Césaire and Damas stressed poetic revolt. Senghor, later president of Senegal from 1960 to 1980, turned Négritude into a full philosophy: "the sum total of the values of civilization of the Black World", an ontology (a theory of what exists), an aesthetics and a theory of knowledge. Its most notorious line comes from his 1939 essay "Ce que l'homme noir apporte" ("What the Black Man Contributes"):

```quote
Emotion is Negro, as reason is Hellenic.
Léopold Sédar Senghor · "What the Black Man Contributes" (tr. Souleymane Bachir Diagne) · 1939
```

Critics read this as accepting Lévy-Bruhl's notion of a "primitive mentality". Souleymane Bachir Diagne reads it differently, as Bergsonian, part of what Donna Jones calls an "Afro-Bergsonian epistemology": the sentence draws an analogy between Greek statuary and African art, and in French it is an alexandrine, a line of classical verse. Diagne can point to Senghor's own words of 1945: "is reason not identical among men? I do not believe in 'prelogical mentality.' The mind cannot be prelogical, and it can even less be alogical."

Others charged Négritude with essentialism (positing a fixed, shared African nature), and Marxists called it an ideology for neocolonialism. Sartre's preface "Black Orpheus" (1948), which called it an "anti-racist racism", and Frantz Fanon's reply are treated in *Existentialism: Sartre, Beauvoir and Camus*. Césaire himself insisted that "Négritude, in my eyes, is not a philosophy … It is a way of living history within history" (Diagne's translation).

## Tempels, Kagame and "Bantu Philosophy"

The SEP singles out one book as the trigger of the great debate: *Bantu Philosophy*. Its author, Placide Tempels (1906–1977), was a Belgian Franciscan missionary in the Belgian Congo from 1933. He wrote in Dutch; Antoine Rubbens' French translation was published by Lovania in Elisabethville in 1945. Tempels revised the French for the Présence Africaine edition of 1949, and Colin King's English translation followed in 1959.

To preach more effectively, Tempels sought the principles beneath Bantu beliefs, law and customs, claiming to go beyond ethnographic description to a Bantu philosophy of being. Its core thesis was that, for the Bantu, force does not belong to being; force *is* being. In King's translation, "the notion 'force' takes for them the place of the notion 'being' in our philosophy". Reality is a hierarchy of vital forces, which can be strengthened or weakened.

The book was, the SEP says, one of the first times an African people had been associated with philosophy, and a serious challenge to the racial ranking behind colonial rule. But Tempels "tempered" the challenge: the Bantu, he said, did not have conscious knowledge of their own philosophy, so it took a European trained in philosophy to extract it. Senghor welcomed the book, which matched his own idea of vital force. Césaire did not. In *Discourse on Colonialism* (1950; republished 1955) he mocked its politics, in Joan Pinkham's translation: "Decent wages! Comfortable housing! Food! These Bantu are pure spirits, I tell you". The upshot, Césaire wrote, was that "the Bantu god will take responsibility for the Belgian colonialist order".

Tempels had followers. Alexis Kagame (1912–1981), a Rwandan Catholic priest, published *La Philosophie bantu-rwandaise de l'être* (1956), an ontology read off the categories of Kinyarwanda grammar; critics such as Masolo charge that he imposed Aristotle's categories on it. The Kenyan theologian John S. Mbiti's *African Religions and Philosophy* (1969) gave the field its best-known saying, "I am because we are, and since we are, therefore I am". In 1965 Franz Crahay, in an essay on "le décollage conceptuel" (conceptual take-off), argued that Bantu thought had only an impetus towards philosophy and had not yet "taken off".

## Hountondji's Critique of Ethnophilosophy

The name that stuck to this whole approach was **ethnophilosophy**: the attempt to reconstruct the collective philosophy of a people from its language, customs and beliefs. Who invented the word is unsettled. The SEP notes that it "had been used previously by other writers" before the Beninese philosopher Paulin Hountondji made it notorious in 1970, and several scholars say the young Kwame Nkrumah used it as a student in the United States. What is clear is that Hountondji made it famous, as a term of criticism.

Hountondji (1942–2024) was born in Abidjan and trained at the École Normale Supérieure in Paris, where his teachers included Louis Althusser and Jacques Derrida; his doctorate was on Edmund Husserl. He served briefly as a minister in Benin in the early 1990s, and died in Cotonou on 2 February 2024. His *Sur la « philosophie africaine »* (1976), translated by Henri Evans with Jonathan Rée as *African Philosophy: Myth and Reality* (1983), set out the case. Reconstructed step by step from the SEP and IEP accounts, it runs like this:

1. Philosophy is a body of explicit discourse produced by individual thinkers who argue, criticise and can themselves be criticised; a Socrates or a Zeno is its model.
2. Ethnophilosophy attributes to a whole people an unwritten, unconscious, shared world-view, which an outside scholar reconstructs. Tempels admits that the Bantu do not know their own philosophy.
3. A collective, implicit and supposedly unanimous world-view is not open to argument and criticism. Describing it is ethnology, not philosophy.
4. The picture of a unanimous Africa is false, since Africans disagree like anyone else, and politically dangerous, since it lends support to one-party rule and to treating dissent as "un-African".
5. Ethnophilosophy is "extraverted": written by or for Europeans and answering questions set abroad.
6. Therefore "African philosophy" should mean the philosophical texts that Africans actually produce: a literature to be built, not a hidden system to be dug up.

Barry Hallen's summary captures the target: ethnophilosophy "presents itself as a philosophy of peoples rather than of individuals", draws on "parables, proverbs, poetry, songs, myths", and places "minimal emphasis upon the rigorous argumentation and criticism". Hountondji's word for the false picture of agreement was **unanimism**.

**First objection: elitism.** Critics replied that this definition makes philosophy a written, academic, Western-style activity, and so repeats the colonial denial of African thought in a new form. Chimakonam reports that this criterion of "philosophy done by Africans" has been criticised as "inadequate, incorrect and exclusivist". H. Odera Oruka was especially wary of professional philosophers whose dismissal of traditional thought was, he thought, analogous to the European bias that denied reason to Africans.

**Second objection: proverbs can argue.** Gyekye, Claude Sumner and Workineh Kelbessa argued that proverbs carry argument and reflection, not just shared belief. Paget Henry and Kwame Anthony Appiah called for a "critical ethnophilosophy" that takes cultural concepts seriously without freezing them, in the SEP's phrase, "in the precolonial amber".

**Third objection: communal need not mean uncritical.** Wiredu showed that consensus among the Akan of Ghana came from what the SEP calls "frequently protracted disputations among elders": consensus, in its summary, "was not imposed, but relentlessly pursued". This supports Hountondji against unanimism, but shows that communal thought can be argumentative.

**Replies.** Hountondji never denied that Africans reason; he was the first philosopher to reject Crahay's "take-off" thesis, arguing that local knowledge had already separated from myth. And he revised his own view. In *The Struggle for Meaning* (2002) he conceded that his "earlier rejection of collective thought was excessive": collective culture must be taken seriously, though roots should not become a "prison house". He turned to what he called "endogenous knowledge". Chimakonam reports the Eclectic school's view that the so-called ethnophilosophy "can comply with the analytic and argumentative standards that people like Bodunrin, Hountondji, and Wiredu insist upon".

```checkpoint
q: What did Hountondji mean by "unanimism"?
a*: The false picture of traditional Africa as a place of philosophical agreement, which could be used to justify one-party rule.
a: The view that all philosophers should reach agreement before publishing.
x: Unanimism was his name for a picture of traditional societies, not a rule for philosophers.
a: Senghor's claim that emotion, not reason, is the African way of knowing.
x: Hountondji's target was the claim of collective agreement, not Senghor's epistemology as such.
a: Wiredu's account of how Akan elders reached consensus by argument.
x: Wiredu's account of debated consensus actually counts against unanimism.
hint: Think about the political use of a supposedly single African world-view.
why: Hountondji argued that ethnophilosophy portrayed whole peoples as sharing one unconscious philosophy, a picture that was false and served rulers who treated dissent as un-African.
---
q: How did Hountondji later revise his position?
a: He accepted Tempels' claim that the Bantu did not know their own philosophy.
x: He never accepted that claim; he was among the first to reject Crahay's view that African thought had not taken off.
a: He abandoned philosophy for politics after serving as a minister.
x: He continued to write, including The Struggle for Meaning (2002).
a*: He conceded that his earlier rejection of collective thought had been excessive.
a: He decided that only written texts in European languages could count as philosophy.
x: He moved the other way, towards including oral production and endogenous knowledge.
hint: Look at The Struggle for Meaning (2002).
why: He said collective culture must be taken seriously, provided roots do not become a "prison house", and he went on to study endogenous knowledge.
```

## Oruka and Sage Philosophy

Henry Odera Oruka (1944–1995) offered a middle way. A Kenyan, he returned home in 1970 as one of the first two African philosophy teachers at the University of Nairobi. At a symposium in 1978 he distinguished "Four Trends in Current African Philosophy": ethnophilosophy (Tempels, Mbiti, Kagame); philosophic sagacity; nationalist-ideological philosophy (Nkrumah, Nyerere); and professional philosophy (Wiredu, Hountondji, Peter Bodunrin and Oruka himself).

From the mid-1970s Oruka's Sage Philosophy Project sent researchers with tape recorders to interview recognised wise persons in villages, in their own languages. The project aimed to refute three claims: that African sages, unlike Greek ones, do not think philosophically; that philosophy requires literacy; and that African traditions enforce unanimity. Its key distinction was between a **folk sage**, who knows and transmits the community's wisdom, and a **philosophic sage**, defined in *Sage Philosophy* (1990) as a person "of traditional African culture, capable of the critical, second-order type of thinking", who subjects inherited beliefs "to independent rational reexamination" and accepts or rejects them "on the authority of reason rather than on the basis of a communal or religious consensus". Ogotemmêli, the informant of Marcel Griaule's *Conversations with Ogotemmêli*, counted as a folk sage. The trained philosopher, Oruka wrote, "plays the role of philosophical provocation", like Socrates as midwife.

Critics pressed hard. Bodunrin replied that the result was a joint product of interviewer and sage; Masolo found many sayings to be common sense rather than sustained argument. Gail Presbey notes an awkward moment: as an expert witness in a 1986 Kenyan burial case, Oruka said that "in a traditional communal society there were very few rebels".

## Philosopher-Kings: Nkrumah, Nyerere and African Socialism

Wiredu called Nkrumah, Senghor, Julius Nyerere and Sékou Touré "the philosopher-kings of early post-independence Africa". Kwame Nkrumah (1909–1972), Ghana's leader until 1966, had taught philosophy at Lincoln University and studied it at the University of Pennsylvania in the United States. His *Consciencism* (1964) argued that the passage from Africa's "ancestral lines of communalism" to socialism "lies in reform, because the underlying principles are the same"; socialism was "a restatement in contemporary idiom" of communalism. The same year a constitutional amendment made his party the only legal one; he was overthrown in February 1966. One critic, Henry Bretton, called Nkrumaism "a verbalization of the requirements of the personal political machine".

Julius Nyerere (1922–1999), president of Tanzania until 1985, made a similar case for *ujamaa*, a Swahili word glossed as "familyhood" or "fraternity". In 1962 he wrote: "We, in Africa, have no more need of being 'converted' to socialism than we have of being 'taught' democracy. Both are rooted in our past". The Arusha Declaration of 5 February 1967 followed. The outcomes were mixed, as *Modern African History since 1860* describes: adult literacy rose from 17 per cent in 1960 to 63 per cent in 1975, but forced villagisation from 1973 moved millions of people, under one-party rule with detention without trial, and Nyerere's successor reversed many policies. Fanon, whom Sanya Osha calls the most astute theoretician of decolonisation, is discussed in the *Existentialism* chapter and in the History chapter *Decolonization*.

## Wiredu and Conceptual Decolonisation

{{image: Kwasi Wiredu | Kwasi Wiredu in 1985.}}

Kwasi Wiredu (1931–2022) is often called the greatest African philosopher of his generation. He studied at Oxford under Gilbert Ryle, taught in Ghana and then the United States, and died on 6 January 2022. In *Philosophy and an African Culture* (1980) and *Cultural Universals and Particulars* (1996) he proposed **conceptual decolonisation**, a term he brought to prominence in a 1980 lecture. He defined it as "the purging of African philosophical thinking of all uncritical assimilation of Western ways of thinking", adding that this was "only part of the battle"; the rest was the careful study of traditional philosophies and their synthesis with the resources of the modern world. The argument can be set out like this:

1. African philosophers were trained in colonial languages and Western traditions, so they absorbed Western concepts such as mind, truth and fact without examining them.
2. Some philosophical problems arise from features of particular languages rather than from the nature of things. One test is to try to state the problem in an African language such as Akan.
3. Wiredu argued that "there is no one word in Akan for truth", and none for "fact"; truth is expressed as "being so". And the Akan "most certainly do not regard mind as one of the entities that go to constitute a person", so their scheme would not, in the normal course of things, generate the Cartesian mind–body problem.
4. Therefore African philosophers should reverse the "unexamined assimilation" of foreign frameworks, and exploit "as much as is judicious" the resources of their own conceptual schemes, even on "the most technical problems of contemporary philosophy".

**Objection.** Sanya Osha raises several. Comparing component parts of English and Akan is "irrevocably restrictive", and does not always draw out the "real universal significance" Wiredu himself claims to seek. Recovering a precolonial heritage struggles with "the hybridity of the postcolonial condition". And Wiredu's sharp attacks on tradition (he wrote that traditional medicine was "terribly weak in diagnosis") sit uneasily with a project that requires recovering vital elements of traditional culture.

**Reply.** Wiredu's method is critical, not nostalgic; he warned that "recourse to the African vernacular" would not bring "instantaneous philosophic revelation". The point is not that Akan is right and English wrong, but that a concept which feels inevitable in one language may be optional, and the aim is a reflective integration of traditional and modern.

Wiredu applied the same approach to politics. Against majoritarian party politics, he described the old Ashanti system as "a consensual democracy": democratic "because government was by the consent, and subject to the control, of the people", and consensual because that consent "was negotiated on the principle of consensus". Majoritarian systems, by contrast, rest on "consent without consensus". He pleaded for a "non-party polity" (see also *Democracy and Its Critics*).

## Person and Community: Menkiti and Gyekye

In 1984 the Nigerian philosopher and poet Ifeanyi Menkiti (1940–2019) published "Person and Community in African Traditional Thought". His argument can be reconstructed in four steps:

1. In African languages "person" has a normative use: one can be human yet "not a person". In Akan, as Gyekye and Wiredu report, a cruel or selfish man is *onnye onipa*, "not a person"; a good one is *oye onipa paa*, "truly a person".
2. Young children are not yet treated as persons.
3. What turns a human being into a person is moral maturity, gained through communal life.
4. So personhood is attained over time, comes in degrees and can be failed, and the community is prior to the person.

```quote
Personhood is the sort of thing which has to be attained, and is attained in direct proportion as one participates in communal life through the discharge of the various obligations defined by one's stations.
Ifeanyi Menkiti · "Person and Community in African Traditional Thought", p. 176 · 1984
```

**Objection.** Kwame Gyekye (1939–2019), a Ghanaian philosopher trained at Harvard, objected in 1992 that acquisition presupposes an acquirer: "One is a person because of what he is, not because of what he acquires." What one acquires are status, habits and character. Appealing to Kant's kingdom of ends, he grounded equal moral worth in the capacity for reason shared by all humans, and read *onnye onipa* as a judgement of character, not of personhood. Since individuals can evaluate and even reject their community's values, he called Menkiti's view "radical" communitarianism, a threat to rights and autonomy, and proposed a **moderate communitarianism** that keeps the social nature of persons but grants them rights, developed mainly in *Tradition and Modernity* (1997). There is a tension in his own work, however: in his SEP article "African Ethics" (2010) Gyekye himself describes "moral personhood" as "earned in the ethical arena", with children persons only potentially. Perhaps he means a normative sense of personhood alongside a metaphysical one, which is close to the next reply.

**First reply: Wiredu's two tiers.** Wiredu reports Kaunda praising Margaret Thatcher as "truly a person", since "personhood is not an automatic quality of the human individual; it is something to be achieved". But being human, possessing the *okra*, already gives every human being, infants included, a baseline of respect; personhood in the full normative sense is achieved on top of it. So all persons are human beings, but not all human beings are persons, and a reformer who rejects communal values for good reasons is a full person.

**Second reply: no real difference.** Bernard Matolino (2009) argued that Gyekye's moderate view does not differ in philosophical substance from the radical one, because it still gives the community priority over the individual, so the objections to the radicals apply to him as well.

**Third reply: a misreading.** Polycarp Ikuenobe (2018) argued that Gyekye misreads Menkiti, whose claim is about moral personhood, not that the community metaphysically creates persons or overrides their rights. The chapter *Self and No-Self: Personal Identity East and West* takes the wider question further.

```checkpoint
q: What was Gyekye's main objection to Menkiti's view that personhood is attained?
a: That children are already full moral agents with every obligation of adults.
x: Gyekye did not deny that children develop morally; his point concerned what personhood is.
a*: That acquisition presupposes an acquirer, so one is a person because of what one is, not what one acquires.
a: That African languages have no normative use of the word "person".
x: Gyekye accepted the usage of onnye onipa but read it as a judgement of character.
a: That the community should decide which humans have rights.
x: This is the opposite of his view; he grounded equal moral worth in the capacity for reason.
hint: Ask who does the acquiring.
why: Gyekye argued that status, habits and character are acquired by someone who must already be a person, and proposed a moderate communitarianism that keeps rights and the capacity to evaluate the community.
---
q: How does Wiredu's two-tier view try to reconcile the two sides?
a: By denying that personhood can ever be achieved.
x: Wiredu held that personhood in the full normative sense is achieved.
a: By treating personhood as defined entirely by the state.
x: Neither tier is defined by the state; the first is being human.
a: By arguing that only ancestors count as persons.
x: Ancestors are the culmination of personhood, but living adults can be full persons too.
a*: By holding that being human gives everyone, infants included, basic respect, while full personhood is achieved by degrees.
hint: Distinguish being human from being a person.
why: For Wiredu, possession of the okra gives a baseline of respect and rights, so the normative, achieved sense of personhood does not threaten anyone's basic moral standing.
```

## Ubuntu

In southern Africa the same themes gathered around **ubuntu**, from the root *-ntu*, "person", with an abstract prefix, so that it parallels the English "humanity". Its maxim in the Nguni languages is *umuntu ngumuntu ngabantu*, "a person is a person through other persons". It was popularised as a philosophy from the 1950s; the first book to treat it as one was Stanlake and Tommie Marie Samkange's *Hunhuism or Ubuntuism* (1980).

The epilogue of South Africa's Interim Constitution of 1993 spoke of "a need for understanding but not for vengeance, a need for reparation but not for retaliation, a need for *ubuntu* but not for victimisation". Desmond Tutu, who chaired the Truth and Reconciliation Commission described in *Apartheid and Its End*, framed its work in ubuntu's terms; in *No Future without Forgiveness* (1999) he called ubuntu the main ingredient of the commission's achievements, though that line reaches us through secondary quotation. Michael Onyebuchi Eze replied that the commission "used Ubuntu as an ideology to achieve political ends".

Philosophers have tried to make ubuntu precise. Mogobe Ramose, in *African Philosophy through Ubuntu* (1999), defined it as "humaneness". Thaddeus Metz, in "Toward an African Moral Theory" (2007), proposed that an action is right insofar as it respects or promotes harmonious relationships in which people identify with one another and show solidarity. Critics, with Ramose as a leading voice, are suspicious of ubuntu's sudden "mainstreaming" by a largely white professoriate in a majority-Black country, often by scholars who have not learned the languages. In "The end of ubuntu" (2013) Matolino and Kwindingwi argued that it belongs to a bygone way of life and serves elites; Metz answered with "Just the beginning for ubuntu" (2014). Others criticise the romance of a "unanimous past" or point to elements that marginalise women.

## Beyond the Debate

From the 1980s the field widened. V. Y. Mudimbe's *The Invention of Africa* (1988), often compared in influence to Edward Said's *Orientalism*, examined how anthropology and missionary writing had "invented" Africa as an object of Western knowledge. Kwame Anthony Appiah's *In My Father's House* (1992), discussed in *Philosophy in an Age of Empire*, joined the call for a critical ethnophilosophy.

Women philosophers changed the questions. Sophie Oluwole (1935–2018), the first person to earn a doctorate in philosophy at a Nigerian university, called herself a "critical traditionalist"; in *Socrates and Ọ̀rúnmìlà* (2014) she compared Socrates with the Ifá sage Ọ̀rúnmìlà, treated as a historical thinker, and argued that philosophy does not require literacy. Oyèrónkẹ́ Oyěwùmí's *The Invention of Women* (1997) argued that gender was not an indigenous organising principle among the Yoruba, whose social order rested on seniority; it is both famous and contested. Nkiru Nzegwu's *Family Matters* (2006) described an Igbo "dual-sex system" and the colonial dismantling of women's autonomy. These debates continue in *Feminist Philosophy*.

Finally, Achille Mbembe's *On the Postcolony* (2001 in English) and his "Afropolitanism" sought to free "being African" from race and open it to global networks. The question of race and empire running through the whole story is taken up in *Race, Colonialism and Philosophy*.

## Further exploration

- **Paulin J. Hountondji, *African Philosophy: Myth and Reality* (1983).** The classic critique of ethnophilosophy, translated by Henri Evans with Jonathan Rée; the second edition (1996) adds a new preface by Hountondji and an introduction by Abiola Irele.
- **Kwasi Wiredu, *Cultural Universals and Particulars: An African Perspective* (1996).** Conceptual decolonisation, the Akan concepts of mind and truth, and consensual democracy.
- **Kwasi Wiredu (ed.), *A Companion to African Philosophy* (2004).** The standard reference volume.
- **H. Odera Oruka (ed.), *Sage Philosophy: Indigenous Thinkers and Modern Debate on African Philosophy* (1990).** Sage interviews with essays by critics and supporters.
- **Kwame Gyekye, *Tradition and Modernity: Philosophical Reflections on the African Experience* (1997).** Moderate communitarianism and the critique of Menkiti.
- **D. A. Masolo, *African Philosophy in Search of Identity* (1994).** A critical history of the debates.
- **Oyèrónkẹ́ Oyěwùmí, *The Invention of Women: Making an African Sense of Western Gender Discourses* (1997).** A Yoruba challenge to Western gender categories.$african_master$,
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
  select $african_quiz$[
    {"type": "mcq", "prompt": "What was the central thesis of Placide Tempels' Bantu Philosophy (French edition 1945)?", "options": ["For the Bantu, force does not merely belong to being; force is being, arranged in a hierarchy of vital forces.", "The Bantu had no philosophy at all, only myth.", "Bantu thought was identical to Aristotle's logic of categories.", "Emotion is Negro, as reason is Hellenic."], "answerIndex": 0, "explanation": "Tempels claimed that 'the notion \"force\" takes for them the place of the notion \"being\" in our philosophy' (Colin King's translation), though he added that the Bantu had no conscious knowledge of this philosophy. The last option is Senghor's line from 1939.", "id": "q1"},
    {"type": "mcq", "prompt": "Which statement about the word 'ethnophilosophy' is best supported?", "options": ["Marcien Towa coined it in 1971.", "Hountondji invented it in his 1976 book.", "Hountondji made it famous from 1970, but others, possibly including the young Nkrumah, had used it before.", "Tempels used it as the title of his 1945 book."], "answerIndex": 2, "explanation": "The SEP notes the term had been used previously by other writers before Hountondji gave it notoriety in 1970; several scholars say Nkrumah used it as a student. No source says Towa coined it.", "id": "q2"},
    {"type": "mcq", "prompt": "In Oruka's sage philosophy, what distinguishes a philosophic sage from a folk sage?", "options": ["The philosophic sage can read and write.", "The philosophic sage has studied at a university.", "The philosophic sage knows more proverbs than anyone else in the community.", "The philosophic sage subjects inherited beliefs to independent rational re-examination and accepts or rejects them on the authority of reason."], "answerIndex": 3, "explanation": "Oruka defined the philosophic sage by critical, second-order thinking; his project aimed precisely to show that philosophy does not require literacy.", "id": "q3"},
    {"type": "mcq", "prompt": "What did Wiredu mean by 'consensual democracy' in his account of the Ashanti system?", "options": ["Government by a single party that represents the whole nation.", "Government by the consent and control of the people, where that consent was negotiated on the principle of consensus rather than majority vote.", "Government by elders whose decisions could not be questioned.", "Direct democracy in which every citizen votes on every law."], "answerIndex": 1, "explanation": "Wiredu contrasted consensual democracy with majoritarian systems based on 'consent without consensus', and pleaded for a non-party polity; consensus, he stressed, came from protracted disputation, not imposition.", "id": "q4"},
    {"type": "open", "prompt": "Set out Hountondji's argument against ethnophilosophy and assess it in the light of the objections raised by Oruka, Gyekye, Wiredu and others. How far did Hountondji himself later change his mind?", "rubric": "A strong answer reconstructs the argument: philosophy as explicit, individual, criticisable discourse; ethnophilosophy (Tempels, Kagame, Mbiti) as a collective, unconscious world-view reconstructed by outsiders (Tempels' admission that the Bantu lacked conscious knowledge of their philosophy); unanimism as false and as support for one-party rule; extraversion; the conclusion that African philosophy is the body of texts Africans produce. It weighs the objections: elitism and the 'philosophy done by Africans' criterion; Oruka's philosophic sages; proverbs as argument (Gyekye, Sumner, Kelbessa); critical ethnophilosophy (Henry, Appiah); Wiredu's argued consensus. It notes Hountondji's rejection of Crahay's 'take-off' thesis and his 2002 concession that his rejection of collective thought was 'excessive', and his turn to endogenous knowledge. Credit noting that the word predates Hountondji.", "id": "q5"},
    {"type": "open", "prompt": "Is personhood something a human being has or something a human being achieves? Discuss with reference to Menkiti, Gyekye and Wiredu, and at least one later reply.", "rubric": "A strong answer explains Menkiti's normative view (1984, p. 176): personhood is attained through communal life and the discharge of obligations, with supporting linguistic usage (Akan onnye onipa, as Gyekye and Wiredu report it) and the it-status of children. It presents Gyekye's objection that acquisition presupposes an acquirer ('One is a person because of what he is, not because of what he acquires'), his Kantian grounding of equal worth in reason, and his moderate communitarianism; notes the tension with his own SEP description of moral personhood as earned. It explains Wiredu's two tiers (being human, with the okra, gives baseline respect; full personhood is achieved) and at least one of Matolino's (2009) claim that moderate and radical views do not differ in substance, or Ikuenobe's (2018) claim that Gyekye misreads Menkiti's normative claim. Credit a reasoned verdict.", "id": "q6"}
  ]$african_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/twentieth-century/african-philosophy', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

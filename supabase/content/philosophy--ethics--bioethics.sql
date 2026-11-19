-- Bioethics: Life, Death and Medicine — canonical master article, co-written and human-reviewed.
-- philosophy/ethics/bioethics @ research/advanced/read.
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
    'philosophy/ethics/bioethics',
    'research',
    'advanced',
    'read',
    $bio_master$> **Who decides what happens to a body, and when may a life be ended, created or rationed?** This chapter on bioethics, the ethics of medicine and the life sciences, covers its four principles, informed consent and the research scandals behind modern rules. It sets out the strongest arguments on both sides of abortion and euthanasia, without taking sides, and religious views in their own terms, then turns to genetic enhancement and the allocation of scarce care.

## A Young Field with an Older Name

The usual story is that the word **bioethics** was coined by Van Rensselaer Potter in "Bioethics, the Science of Survival" (1970), with the Kennedy Institute founded at Georgetown in 1971. The Internet Encyclopedia of Philosophy (IEP) calls this "oft-repeated story" incorrect. The German theologian Fritz Jahr had written of "Bio-Ethik" in articles of 1927, 1928 and 1934, and proposed a "bioethical imperative": "Respect every living being, in principle, as an end in itself and treat it accordingly wherever it is possible." Duties to animals and nature, which Jahr's imperative included, are the subject of *Animals and the Environment*. Hard cases then made bioethics a discipline: Henry Beecher's "Ethics and Clinical Research" (1966), the Harvard definition of brain death (1968) and *Roe v. Wade* (1973) among them.

## Four Principles and Their Critics

The most influential method is that of Tom L. Beauchamp and James F. Childress, whose *Principles of Biomedical Ethics* first appeared in 1979 and has run to nine editions. Beauchamp was a rule-utilitarian and Childress a Christian deontologist; they wanted a framework for a pluralist, secular society that presupposed no single moral theory. They proposed four principles: **respect for autonomy** (letting competent people make their own decisions), **beneficence** (doing good), **nonmaleficence** (not doing harm) and **justice** (fair distribution). Each is *prima facie*, binding unless outweighed, with no fixed ranking; they are made concrete by **specification** (adding content for a type of case) and by **balancing** when they conflict. They rest on a "common morality", "a universal morality to which all morally serious persons are committed". Raanan Gillon defended it as a "transcultural, transnational, transreligious, and transphilosophical" framework, with autonomy "first among equals".

The name **principlism** was coined by its critics, K. Danner Clouser and Bernard Gert, in "A Critique of Principlism" (1990). The principles, they charged, come from conflicting theories and, unranked, give no real guidance; Gert offered a rule-based common morality instead. Others call the framework "American" in its individualism, and note that in practice newcomers simply let autonomy trump the rest.

Albert R. Jonsen and Stephen Toulmin's *The Abuse of Casuistry* (late 1980s; sources date it 1988 or 1989) revived **casuistry**, reasoning by analogy from clear paradigm cases rather than down from principles. Toulmin noted that members of the US National Commission (1974–78) agreed about hard cases while disagreeing about theory. Critics reply that what counts as "the case" is not neutral (Onora O'Neill) and that casuistry conserves received norms rather than criticising them.

## Consent: from Prussian Rules to the Reasonable Patient

**Informed consent**, a patient's or research subject's agreement given knowing what is involved, is usually traced to Nuremberg. As the IEP records, it began as a German bureaucratic rule. After the Albert Neisser case (1896), Prussian regulations of 1900/01 required consent to experimentation, and after 75 children died in a tuberculosis-vaccine episode a Reich Interior Ministry circular of 28 February 1931 set out further guidelines requiring it. Robert Baker concludes that informed consent "was originally a regulatory innovation created by Prussian bureaucrats". Hitler's regime ignored those guidelines.

In American law the root is a case in which Mary Schloendorff agreed to an examination under ether but refused surgery, and surgeons removed a fibroid tumour anyway.

```quote
Every human being of adult years and sound mind has a right to determine what shall be done with his own body; and a surgeon who performs an operation without his patient's consent commits an assault for which he is liable in damages.
Benjamin Cardozo · Schloendorff v. Society of New York Hospital · 1914
```

How much must a doctor disclose? The old **professional standard** asked what doctors customarily tell patients. In *Canterbury v. Spence* (1972), Jerry Canterbury was left partly paralysed after spinal surgery and a fall from his hospital bed; his surgeon had mentioned only "weakness". Judge Spottswood W. Robinson III replaced the professional standard with a **reasonable person standard**: what a reasonable patient would want to know. The UK Supreme Court followed in *Montgomery v Lanarkshire Health Board* (11 March 2015), about an undisclosed risk in childbirth, holding that a risk is material if "a reasonable person in the patient's position would be likely to attach significance to the risk", or if the doctor should know that this particular patient would.

Why does consent matter? The dominant answer since the 1970s is **autonomy**, acting "freely in accordance with a self-chosen plan" in Beauchamp and Childress's words. The Stanford Encyclopedia of Philosophy (SEP) gives the example of a capable Jehovah's Witness who refuses a transfusion: doctors do not transfuse, even to save a life, and only autonomy explains why. O'Neill, who stresses trust instead, has criticised a "fixation" with informed consent and the many senses of autonomy it trades on.

## Research Ethics and Its Scandals

{{image: Doctors' Trial | The courtroom at Nuremberg during the Doctors' Trial (1946–47), whose verdict set out the ten points of the Nuremberg Code.}}

In the "Doctors' Trial" (1946–47), an American military tribunal tried 23 defendants, 20 of them physicians; seven were sentenced to death and seven acquitted. Its verdict set out ten points now called the **Nuremberg Code**.

```quote
The voluntary consent of the human subject is absolutely essential.
Nuremberg Code · first principle, in the verdict of United States v. Karl Brandt et al. · 1947
```

No nation adopted the Code as law, and Jay Katz reported that it was at first dismissed as "a code for barbarians". *The Holocaust* sets the Nazi regime's crimes in context.

In the **Tuskegee** study (1932–72), the US Public Health Service followed 600 poor Black sharecroppers in Alabama, 399 with latent syphilis. They were told they had "bad blood" and were not treated with penicillin even after it became standard. The study was no secret, being published in medical journals; it ended in 1972 after Peter Buxtun took it to the press. On 16 May 1997 President Clinton apologised: "what the United States government did was shameful, and I am sorry." Between 1946 and 1948, US researchers in **Guatemala** also infected people without consent, which is one reason Latin American bioethicists reject "double standards" in international trials.

In Asia, the Imperial Japanese Army's **Unit 731**, based at Pingfang near Harbin and led by Shirō Ishii, infected, vivisected and froze prisoners, mostly Chinese, until 1945. Estimates of those killed in the facility range from over 3,000 to about 14,000. Ishii and others received US immunity in exchange for their data; *Japan's Empire in Asia, 1895–1945* gives the wider history.

Rules followed. The World Medical Association's **Declaration of Helsinki** (1964) added in 1975 that "concern for the interests of the subject must always prevail over the interests of science and society" and introduced independent committee review. In the US, Tuskegee led to the National Research Act (1974) and the **Belmont Report** (released 1978, published 1979), which Beauchamp helped write; its principles apply as informed consent, risk-benefit assessment and fair selection of subjects.

Consent can fail without cruelty. In 1951 cells were taken from the tumour of **Henrietta Lacks** at Johns Hopkins without her consent, then normal practice; as HeLa, the first mass-produced immortal human cell line, they served Jonas Salk's polio work, while her family learned of it only in 1975.

```checkpoint
q: What did the US court decide in Canterbury v. Spence (1972)?
a*: That disclosure must meet what a reasonable patient would want to know.
a: That doctors must disclose whatever other doctors customarily disclose.
x: That is the professional standard, which Canterbury moved away from.
a: That surgery without consent is an assault.
x: That principle comes from Cardozo's judgment in Schloendorff (1914).
a: That the phrase "informed consent" should enter US law.
x: The phrase was first recorded in US law in Salgo (1957).
hint: Canterbury's surgeon mentioned only "weakness".
why: Judge Robinson held that the test is what a reasonable patient would want to know, not what doctors usually say. The UK Supreme Court took a similar line in Montgomery (2015).
---
q: Where, according to the IEP, did the requirement of consent to medical experimentation first appear?
a: In the Nuremberg Code of 1947.
x: The Code is the most famous statement, but Prussian rules came almost half a century earlier.
a: In the Declaration of Helsinki of 1964.
x: Helsinki came later still and built on Nuremberg.
a*: In Prussian regulations of 1900/01, after the Albert Neisser case.
a: In the Belmont Report of 1978.
x: Belmont was a response to Tuskegee, long after the first consent rules.
hint: Robert Baker credits bureaucrats.
why: Prussian regulations of 1900/01 and a German circular of 1931 required consent. Robert Baker calls informed consent "a regulatory innovation created by Prussian bureaucrats".
```

## Abortion: the Shape of the Argument

Elizabeth Harman's SEP entry starts from the basic **argument from a right to life**:

1. The fetus is a person.
2. All persons have a right to life.
3. So the fetus has a right to life.
4. It is wrong to kill something that has a right to life.
5. Abortion kills the fetus.
6. So abortion is wrong.

Critics charge **equivocation**: if "person" means human being, premise 1 is obvious but premise 2 is controversial; if it means a being with full moral status, premise 2 is obvious but premise 1 is controversial. Defenders of premise 1 appeal to the fetus's potential, a move critics have resisted since Tooley (1972).

**Thomson's violinist.** Judith Jarvis Thomson's "A Defense of Abortion" (1971), perhaps "the most widely reprinted essay in all of contemporary philosophy", grants that the fetus is a person from conception and argues that abortion can still be permissible. She asks you to imagine waking "back to back in bed with an unconscious violinist", whose failing kidneys the Society of Music Lovers has plugged into yours; he needs nine months. In the SEP's reconstruction:

1. If abortion is wrong, it is wrong to unplug yourself from the violinist.
2. It is not wrong to unplug yourself.
3. So abortion is not (always) wrong.

The violinist has a right to life, yet you may unplug him, so premise 4 of the right-to-life argument fails. For Thomson the right to life is not a right to whatever one needs to live (if only a film star's touch on your forehead would save your life, you have no right to it), but a right not to be killed *unjustly*: "if you do allow him to go on using your kidneys, this is a kindness on your part, and not something he can claim from you as his due." Yet a late abortion "just to avoid the nuisance of postponing a trip abroad" would be "positively indecent", and she defended a right to stop being pregnant, not a right to secure the fetus's death.

**Objections.** First, *responsibility*: the case fits only pregnancy from rape, since a woman who had consensual sex is responsible for the fetus's need (Beckwith). Second, the fetus is not a stranger but her child. Third, abortion *kills*, while unplugging *lets die*. Fourth, gestation is ordinary parental provision, like breastfeeding, not a dialysis machine.

**Replies.** To the responsibility objection, defenders vary the case: you know the Society plans to kidnap you, you hire bodyguards and go about your life, and are kidnapped anyway; surely you may still unplug, although your choices played a causal part. A woman using contraception, they say, is no more responsible. Boonin and Kamm defend Thomson along these lines.

**Marquis's future like ours.** Don Marquis, an atheist philosopher at the University of Kansas, set out in "Why Abortion Is Immoral" (1989) to avoid the personhood question entirely by asking what makes killing *us* wrong. His answer is the loss of one's future: "when I die, I am deprived of all of the value of my future", its "experiences, activities, projects, and enjoyments". In the SEP's form:

1. Killing an adult human is wrong (unless justified) because it deprives them of a valuable future.
2. Abortion deprives the fetus of a valuable future.
3. If what makes killing an adult wrong is present in another act, that act is also wrong (unless justified).
4. So abortion is wrong unless justified.

The account explains why killing infants is wrong without appealing to personhood, and has limits: a fetus so damaged it could never have conscious experience falls outside it, and Marquis set aside hard cases such as rape. His conclusion was that "the overwhelming majority of deliberate abortions are seriously immoral".

**Objections.** First, *moral status*: perhaps what makes killing wrong is loss of a future *plus* moral status, so personhood slips back in. Second, *identity*: if we are minds rather than organisms, the early fetus is not the same subject as the later person. Third, *time-relative interests* (McMahan, DeGrazia): the early fetus has little or no psychological connection to that future, so its loss matters little to it now. Fourth, Norcross's *contraception* reductio: if depriving anything of a future like ours is wrong, so is contraception.

**Replies.** Before conception, defenders answer, there is no single identifiable subject to be deprived: the sperm, the ovum, or both? And we were never identical with an ovum. Against the interests objection, they cite a suicidal teenager who takes no interest in his future yet is plainly wronged by being killed.

The two arguments are less opposed than they look: Marquis concludes that abortion is wrong *unless justified*, and Thomson grants a strong reason against abortion while arguing it can be outweighed.

**Warren's criteria and the middle ground.** Mary Anne Warren's "On the Moral and Legal Status of Abortion" (1973) offered five traits central to personhood: consciousness, especially the capacity to feel pain; reasoning; self-motivated activity; the capacity to communicate messages of indefinitely many types; and self-concepts and self-awareness. A being need not have all, but one with none is not a person; the fetus has none, so abortion is permissible. Critics replied that the criteria seem to exclude newborns (Warren answered in a "Postscript on Infanticide", 1982) and some cognitively disabled humans; Marquis called them "plagued by difficulties concerning cases". Jane English replied that personhood has blurred edges: abortion may be justified even if the fetus is a person, and wrong even if it is not.

Dworkin argued that both sides share a belief in the intrinsic value of human life; critics reply that many opponents hold abortion to be murder. A **moral-risk** argument says that even someone who rejects the anti-abortion arguments should weigh the chance of being wrong; the reply is that burdens on women may outweigh that chance.

The disability rights scholar Adrienne Asch, blind from infancy, supported legal abortion yet opposed selective abortion for disability: her "moral opposition to prenatal testing and selective abortion flows from the conviction that life with disability is worthwhile". Such abortions, on this **expressivist** argument, express a judgement that disabled people should not exist; critics reply that parents may legitimately hope for a non-disabled child and that no harm is shown.

## Religious Traditions on Abortion

**Catholic.** The *Catechism* (1992) teaches that "human life must be respected and protected absolutely from the moment of conception." Christian writers condemned abortion from the first centuries, though medieval canon law, following Aristotle, distinguished a formed from an unformed fetus until Pius IX removed the distinction for excommunication in 1869. Removing a cancerous pregnant uterus or a tube containing an ectopic pregnancy is treated as "indirect abortion" and permitted under the doctrine of double effect.

**Islamic.** The Qur'an does not address abortion explicitly. A hadith in Sahih al-Bukhari places ensoulment after 120 days, the line for many medieval jurists; others read the same hadith as describing stages within the first 40 days,. Hanafis mostly hold to 120 days, some permitting abortion before then and others calling it disapproved (*makruh*). Most Malikis forbid abortion at any stage. Shi'a jurists forbid it after implantation, although Iranian Shia scholars approved therapeutic abortion before 16 weeks in limited circumstances in 2003. All schools put the mother's life first.

**Jewish.** The Mishnah rules that if a woman is in hard labour the fetus may be cut up "because her life comes before the life of her foetus", but once the greater part has emerged one may not "set aside one person for the sake of saving another". Rashi held that the fetus is not a *nefesh* (person) until birth; Maimonides grounded the ruling instead in the law of the *rodef* (pursuer). Most movements discourage abortion except to save the woman's life, with authorities differing on other cases.

**Buddhist.** There is no single view. Intentional killing is negative and many traditions date life from conception, while intention and compassion are stressed. Peter Harvey notes that Thai discussion speaks of "benefit and harm" rather than rights. In Japan, which legalised abortion in 1948, many families hold **mizuko kuyō** ("water child" memorial services) for aborted or miscarried fetuses. Helen Hardacre criticised the practice as commercial exploitation of guilt; others defend it. William LaFleur describes abortion there as sending a life back to the other world.

## Euthanasia and Assisted Dying

**Euthanasia** means bringing about someone's death for that person's benefit. It is **voluntary** when the person makes a competent, enduring request, **non-voluntary** when no such request is possible, and **involuntary** when against their wishes, which the SEP says ought to be unlawful. In **physician-assisted suicide** the patient takes the drug themselves.

**The case for.** Robert Young, the SEP's author and a defender of legalisation, rests the case on respect for autonomy together with the patient's well-being, "each necessary, neither sufficient". The most famous supporting argument is James Rachels's "Active and Passive Euthanasia" (1975). Smith drowns a young cousin in the bath for gain. Jones plans the same, finds the boy has already slipped under, and watches him drown. The cases differ only as killing versus letting die; Smith is no worse than Jones; so killing as such is not worse than letting die. If passive euthanasia is allowed, active euthanasia, often the more humane, should be too.

**Objections to Rachels.** Kagan (1988) argued that this method of contrasting matched cases rests on an "additive assumption" about how moral factors combine, which need not hold. Kamm (2007) noted that one could kill Smith, but not Jones, to bring the child back, revealing a real difference. The general question of doing and allowing belongs to *Deontology: Duty and Respect*, and the trolley cases to *Consequentialism: What Makes Right Acts Right?*

**The case against.** Finnis and Keown locate the difference in **intention**: withdrawing futile or burdensome treatment lets the disease kill, whereas euthanasia aims at death. Even the Catholic Church accepts switching off a respirator at a competent patient's request. Young replies that terminal sedation combined with withholding nutrition is often best explained as intending death. Keown also defends the **inviolability** of human life, and Velleman offered a Kantian argument that one may not violate rational nature for the sake of well-being.

The **doctrine of double effect**, discussed fully in *Deontology: Duty and Respect*, is usually illustrated by morphine given to relieve pain while foreseeing that it hastens death. Palliative-care specialists, however, hold that properly titrated opioids rarely hasten death, so the stock example rests on a myth that can lead to undertreated pain.

**Slippery slopes.** Opponents warn that legalisation leads step by step to abuse. Keown reads the Dutch experience, including cases of "termination of life without explicit request", as showing the slope is real. Young reads Dutch studies since the Remmelink Report (1991) as consistently showing no slippery slope, and Emanuel and colleagues (2016) found little evidence of abuse of the vulnerable.

Disability advocates add a related worry. In 2021 the UN Special Rapporteur on the rights of persons with disabilities, with two other UN experts, warned that Canada's expansion of assisted dying risked violating disabled people's right to life and to non-discrimination,, and critics cite requests apparently driven by poverty or lack of housing. Supporters reply that excluding people with mental illness is itself discriminatory, and that most such people retain decision-making capacity.

**The law, as of late 2026.** The Netherlands' law took effect on 1 April 2002; Belgium's came the same year. Oregon's Death with Dignity Act was approved by voters in 1994 and implemented in 1997. Canada legalised medical assistance in dying (MAID) in 2016, extending it in 2021 to people whose death is not reasonably foreseeable; in 2024 MAID accounted for 5.1 per cent of deaths. As of late 2026, including mental illness as the sole condition had been postponed to 2027. In the UK, assisting suicide remains illegal under the Suicide Act 1961. A Terminally Ill Adults (End of Life) Bill passed the Commons in 2025 but fell when the session ended; a reintroduced bill was defeated at second reading on 11 September 2026, by 286 votes to 270. Scotland's parliament rejected an assisted dying bill on 17 March 2026.

```checkpoint
q: What is the basic structure of Don Marquis's argument against abortion?
a: The fetus is a person, all persons have a right to life, so abortion is wrong.
x: Marquis deliberately avoided the personhood premise of the right-to-life argument.
a*: Killing is wrong because it deprives the victim of a valuable future; abortion does the same; so it is wrong unless justified.
a: Abortion is wrong because God ensouls the fetus at conception.
x: Marquis was an atheist and his argument is secular.
a: Abortion is wrong because the fetus has the five traits Warren lists.
x: Warren argued the fetus has none of her traits, and Marquis did not use them.
hint: Ask what makes killing you or me wrong.
why: Marquis's "future like ours" argument sidesteps personhood. Its critics press moral status, identity, time-relative interests and a contraception reductio; defenders reply that no single subject exists before conception.
---
q: How did James Rachels's Smith and Jones cases bear on euthanasia?
a: They showed that the doctrine of double effect explains end-of-life medicine.
x: Rachels did not appeal to double effect; he attacked the killing–letting die distinction.
a: They showed that slippery slopes are inevitable once euthanasia is legal.
x: Slippery-slope arguments are a separate debate, mainly about the Dutch and Canadian evidence.
a: They proved that intention makes no difference to wrongness.
x: Finnis and Keown locate the difference precisely in intention, and the debate is open.
a*: They were meant to show that killing is not in itself worse than letting die, so active euthanasia is no worse than passive.
hint: Smith drowns the child; Jones watches him drown.
why: If Smith is no worse than Jones, the difference between killing and letting die carries no moral weight in itself. Kagan questioned the contrast method and Kamm argued the cases reveal a real difference.
```

## Designing Children: Genetic Enhancement

In November 2018 the Chinese researcher **He Jiankui** announced the birth of twins, "Lulu" and "Nana", whose embryos he had edited with CRISPR-Cas9 to disable the gene *CCR5*; in each couple the father was HIV-positive. The consent forms were "incomplete and inadequate". In December 2019 he was sentenced to three years in prison for illegal medical practice. The episode sharpened a wider question: if we could safely improve our children, should we? (Technology in general belongs to *Ethics of Technology and AI*.)

Against **enhancement** (whose line with treatment is itself contested), Michael Sandel argued in "The Case Against Perfection" (2004) that enhancement expresses a drive to mastery that fails to acknowledge "the giftedness of life", treating children as "objects of our design or products of our will or instruments of our ambition", at the cost of humility, responsibility and solidarity. Habermas, in *The Future of Human Nature* (German 2001, English 2003), opposed "positive" eugenics: a designed person cannot be presumed to consent, and her sense of being the sole author of her life, and the equality of free persons, are put at risk (see *Critical Theory: the Frankfurt School and Habermas*).

For enhancement, Julian Savulescu's principle of **procreative beneficence** (2001) holds that couples choosing among possible children, for example by embryo screening, have a moral *obligation* to select the child expected to have the best life. Critics such as Rebecca Bennett answer that no one is harmed by not being selected. Disability scholars add that ranking genotypes reduces persons to their genes and undermines moral equality, and that we are no better placed than earlier eugenicists to decide which traits to promote.

## Who Gets Care? Allocating Scarce Resources

Health economists use the **quality-adjusted life year (QALY)**: full health counts as 1, death as 0, so thirty years in a state valued at 0.4 equals 12 QALYs. Maximising QALYs looks impartial, but it adds up small benefits to many against large benefits to a few (Oregon's Medicaid plan of the early 1990s ranked tooth capping above appendectomy), and critics argue that it discriminates against the old and the disabled.

John Harris pressed that charge in "QALYfying the Value of Life" (1986 or 1987). He had earlier set out a **fair innings** argument in *The Value of Life* (1985), giving priority to those who have not yet had a fair span of life, though he later rejected it for strict indifference to age.

**Triage**, from the French *trier*, to sort, in its modern form began with Napoleon's military surgeons. In March 2020, during COVID-19, Italy's SIAARTI recommendations used age, comorbidity and functional status, drawing criticism as age-based rationing, while Emanuel, Persad and colleagues argued in the *New England Journal of Medicine* for maximising benefits. Disability groups complained that Alabama's ventilator criteria excluded people with "moderate to severe dementia", and in April 2020 the US government announced a resolution after Alabama withdrew them.

## Further exploration

- **Tom L. Beauchamp and James F. Childress, *Principles of Biomedical Ethics* (1979).** The founding text of the four-principle approach, now in its ninth edition.
- **David Boonin, *A Defense of Abortion* (2003).** A book-length development and defence of Thomson-style arguments.
- **Christopher Kaczor, *The Ethics of Abortion: Women's Rights, Human Life, and the Question of Justice* (3rd ed. 2023).** A leading philosophical case against abortion.
- **Emily Jackson and John Keown, *Debating Euthanasia* (2012).** The case for and against legalisation, argued in one volume.
- **William R. LaFleur, *Liquid Life: Abortion and Buddhism in Japan* (1992).** Abortion, Buddhism and mizuko kuyō in Japan.
- **Michael J. Sandel, *The Case against Perfection: Ethics in the Age of Genetic Engineering* (2007).** The argument from giftedness against genetic enhancement.
- **Rebecca Skloot, *The Immortal Life of Henrietta Lacks* (2010).** The story of HeLa cells and the family who did not know.$bio_master$,
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
  select $bio_quiz$[
    {"type": "mcq", "prompt": "Who, according to the Internet Encyclopedia of Philosophy, used the word \"Bio-Ethik\" before Van Rensselaer Potter's 1970 article?", "options": ["Henry Beecher, in his 1966 article on clinical research", "The German theologian Fritz Jahr, in articles from 1927", "Tom Beauchamp and James Childress, in 1979", "The authors of the Nuremberg Code, in 1947"], "answerIndex": 1, "explanation": "Fritz Jahr wrote of \"Bio-Ethik\" in 1927, 1928 and 1934, with a \"bioethical imperative\" to respect every living being as an end in itself. The IEP calls the story that Potter coined the word incorrect. Beecher, Beauchamp and Childress, and Nuremberg all came later or did not coin the term.", "id": "q1"},
    {"type": "mcq", "prompt": "What was K. Danner Clouser and Bernard Gert's main criticism of the four-principle approach (which they named \"principlism\")?", "options": ["That it ranked autonomy above all the other principles", "That it relied on religious premises unsuitable for a secular society", "That it reasoned only from paradigm cases and had no principles", "That its principles came from conflicting theories and, without a ranking, gave no real guidance"], "answerIndex": 3, "explanation": "Clouser and Gert (1990) charged that the principles lack theoretical unity and give no guidance when they conflict: a pick-and-mix. Beauchamp and Childress deliberately gave no fixed ranking and aimed at a secular framework; reasoning from paradigm cases is casuistry, a different rival.", "id": "q2"},
    {"type": "mcq", "prompt": "Which objection to Thomson's violinist argument holds that the case fits only pregnancy resulting from rape?", "options": ["The responsibility objection: a woman who had consensual sex is responsible for the fetus's need", "The contraception reductio", "The time-relative interests objection", "The equivocation objection"], "answerIndex": 0, "explanation": "The responsibility objection says the kidnapped person bears no responsibility for the violinist's need, whereas a woman who had consensual sex does. Defenders of Thomson reply with a variant in which you take precautions against kidnapping and are kidnapped anyway. The other options are objections to Marquis or to the basic right-to-life argument.", "id": "q3"},
    {"type": "mcq", "prompt": "What does the chapter say about the stock example of morphine that relieves pain while foreseeably hastening death?", "options": ["It proves that the doctrine of double effect is correct", "It shows that active and passive euthanasia are morally identical", "Palliative-care specialists hold that properly titrated opioids rarely hasten death, so the example rests on a myth", "It was the basis of the Dutch euthanasia law of 2002"], "answerIndex": 2, "explanation": "The SEP entry on double effect reports that properly titrated opioids rarely depress respiration or hasten death, and that the myth can lead to undertreated pain. The doctrine itself is discussed in the chapter on deontology.", "id": "q4"},
    {"type": "open", "prompt": "Set out Judith Jarvis Thomson's violinist argument and Don Marquis's \"future like ours\" argument, each with its strongest objection and the best reply. Then explain how the two arguments relate to each other.", "rubric": "A strong answer presents both arguments fairly and at comparable length, without declaring either side right. Thomson: grants fetal personhood for argument's sake; you may unplug from the violinist although he has a right to life, so the right to life is a right not to be killed unjustly, not a right to use another's body; she sets limits (the late abortion to avoid postponing a trip abroad would be \"positively indecent\"). Objection: responsibility (consensual sex), or killing vs letting die, or the fetus as offspring; reply: the variant kidnapping case with bodyguards. Marquis: killing is wrong because it deprives the victim of a valuable future; abortion does the same; so it is wrong unless justified, avoiding the personhood question. Objection: moral status, identity, time-relative interests, or the contraception reductio; reply: no identifiable subject before conception, or the suicidal teenager. Credit the observation that Marquis concludes 'wrong unless justified' while Thomson grants a strong reason against abortion that can be outweighed. Deduct for caricaturing either side or taking a side as if settled.", "id": "q5"},
    {"type": "open", "prompt": "Present the strongest case for and the strongest case against legalising voluntary euthanasia or assisted dying, using Rachels's Smith and Jones cases and the arguments of opponents such as Finnis and Keown. Include the debate over what the evidence from the Netherlands or Canada shows.", "rubric": "A strong answer is evenhanded and does not endorse a verdict. For: autonomy together with well-being, each necessary and neither sufficient (Young); Rachels's Smith and Jones cases aim to show that killing is not in itself worse than letting die, so active euthanasia is no worse than passive and may be more humane. Objections to Rachels: Kagan on the contrast method's additive assumption; Kamm's point that one could kill Smith but not Jones to save the child. Against: Finnis and Keown locate the difference in intention; inviolability of life (Keown) and Velleman's Kantian argument; slippery-slope arguments; disability critiques, including the 2021 UN experts' warning about Canada. Evidence: Keown reads Dutch data as showing a slope; Young and Emanuel et al. read them as showing none. Credit noting that the law is changing (for example the UK bill defeated on 11 September 2026) and dating such claims. Deduct for one-sided treatment or presenting the evidence debate as settled.", "id": "q6"}
  ]$bio_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/ethics/bioethics', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

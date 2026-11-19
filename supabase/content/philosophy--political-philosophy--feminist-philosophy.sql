-- Feminist Philosophy — canonical master article, co-written and human-reviewed.
-- philosophy/political-philosophy/feminist-philosophy @ research/advanced/read.
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
    'philosophy/political-philosophy/feminist-philosophy',
    'research',
    'advanced',
    'read',
    $feminist_master$> **What is a woman, who knows best about oppression, and what did the great philosophers get wrong about half of humanity?** This chapter follows the debate over sex and gender from Simone de Beauvoir through Judith Butler to Sally Haslanger's proposal to define women by their subordination, set out step by step with its objections. It presents gender-critical and trans-inclusive philosophers in their own terms, then turns to standpoint epistemology, intersectionality, justice in the family, the pornography debate, feminist readings of the canon, and feminisms in China, India, the Muslim world, Africa and Latin America.

## What Feminist Philosophy Is

The Stanford Encyclopedia of Philosophy (SEP) defines feminism, broadly understood, as "both an intellectual commitment and a political movement that seeks an end to gender-based oppression". Feminist philosophy asks what that oppression is, how it is known, what justice would require, and how philosophy's own concepts were shaped by leaving women out.

The word is newer than the ideas. In the mid-1800s "feminism" still meant "the qualities of females"; only after the First International Women's Conference in Paris in 1892 did English regularly use it, following the French *féministe*, for advocacy of equal rights.

The forerunners have their own chapters. Mary Wollstonecraft's *A Vindication of the Rights of Woman* (1792) said of women "taught from their infancy that beauty is woman's sceptre" that "the mind shapes itself to the body, and, roaming round its gilt cage, only seeks to adorn its prison"; *Women Philosophers of the Early Modern Era* sets out her argument. John Stuart Mill's *The Subjection of Women* (published 1869) likened the law of marriage to slavery and argued that no one could know women's nature while upbringing shaped it so heavily; Harriet Taylor Mill's "The Enfranchisement of Women" (1851) had covered much of the same ground, and *Bentham, Mill and Utilitarianism* discusses their partnership.

## Becoming a Woman

Simone de Beauvoir's *Le Deuxième Sexe* (1949) argued that man is treated as the standard human being: "He is the Subject, he is the Absolute—she is the Other" (in H. M. Parshley's translation). Its second volume opens with a sentence translated two ways. Parshley (1953) wrote "One is not born, but rather becomes, a woman"; Constance Borde and Sheila Malovany-Chevallier (2009–10) wrote "One is not born, but rather becomes, woman", dropping the article because, they said, Beauvoir is "talking about woman as a construct". *Existentialism: Sartre, Beauvoir and Camus* covers the book; this chapter follows the argument it started.

{{image: Simone de Beauvoir | Simone de Beauvoir, whose *The Second Sex* (1949) asked what it means to "become" a woman.}}

Did Beauvoir distinguish **sex** (biological traits) from **gender** (the social meaning laid over them)? Judith Butler, in an essay of 1986, read the sentence that way. Toril Moi and Nancy Bauer dispute the reading. The SEP's Beauvoir entry leaves it open: whether she meant to inaugurate the distinction, and whether its radical conclusions are justified, "are matters of feminist debate".

The vocabulary came later. Until the 1960s "gender" was mostly grammatical. The psychologist Robert Stoller (1968) used "sex" for biology and "gender" for degrees of femininity and masculinity, and feminists adopted the distinction against **biological determinism**, the view that social roles follow from biology. Gayle Rubin's "The Traffic in Women" (1975) described a "sex/gender system", "a set of arrangements by which the biological raw material of human sex and procreation is shaped by human, social intervention", and hoped for a "genderless (though not sexless) society". Catharine MacKinnon went further: genders are "created through the eroticization of dominance and submission", so dominance comes before difference.

## Butler: Is Sex Constructed Too?

Butler's *Gender Trouble* (1990; second edition 1999) made three moves (see also *Structuralism and After: Foucault, Derrida and Their Critics*). First, "[i]dentity categories … are never merely descriptive, but always normative, and as such, exclusionary", so "woman" should not be the foundation of feminist politics but "a term in process". Second, gender is **performative**: not a stable identity from which acts follow but something "instituted … through a stylized repetition of [habitual] acts". Third, perhaps sex "was always already gender, with the consequence that the distinction between sex and gender turns out to be no distinction at all". The SEP stresses that this does not deny that bodies exist; the point is that even the announcement "It's a girl" is a norm-laden act.

Alison Stone (2007) objected that even if sex and gender are both socially constructed, they are not identical: claims about sex *imply* gender norms. Martha Nussbaum (1999) charged Butler with offering no "normative theory of social justice and human dignity". Ásta (*Categories We Live By*, 2018) proposed a middle path, **conferralism**: sex is a status conferred by legal authorities drawing on doctors, which *aims to track* physical features. Sex and gender are both conferred, but differently, so the distinction survives.

## What Is a Woman? Haslanger's Proposal

If gender is social, what do women have in common? Spelman's *Inessential Woman* (1988) warned against assuming a "golden nugget of womanness", which in practice meant treating white middle-class women's condition as all women's. Iris Marion Young replied that without some category of women, oppression cannot be understood "as a systematic, structured, institutional process".

Sally Haslanger's "Gender and Race: (What) Are They? (What) Do We Want Them To Be?" (*Noûs*, 2000) changed the question. A **descriptive** analysis asks what we ordinarily mean by "woman"; an **ameliorative** analysis asks which concept would "best help feminists achieve their legitimate purposes". Her definition: S is a woman if and only if "S is systematically subordinated along some dimension (economic, political, legal, social, etc.), and S is 'marked' as a target for this treatment by observed or imagined bodily features presumed to be evidence of a female's biological role in reproduction". Men are defined in parallel by privilege. The argument runs:

1. Feminism's goal is to end sex-based injustice.
2. To do so it needs concepts that pick out the groups that injustice creates.
3. People perceived as having female reproductive bodies are systematically subordinated; people perceived as male are privileged.
4. So the concept of *woman* feminists should use is: subordinated on grounds of presumed female reproductive features.
5. So gender is a social hierarchy, and justice would abolish it: without sexist oppression there would still be males and females, but no women or men.

The view is **eliminativist** about gender. It drew four main objections.

**Wrong extension.** Females not subordinated on sex-marked grounds would not count as women; the SEP suggests that "at least arguably" the Queen of England would not. One reply is that the definition is meant to be revisionary. Haslanger added a bolder one: oppressive ideology can "mislead us about the content of our own thoughts", so we may already apply "woman" on the basis of sex-marked subordination. Saul (2006) answered that this is very hard to show, since ordinary use is "various and idiosyncratic", and Mari Mikkola (2009) called revisionary analyses "politically unhelpful and philosophically unnecessary".

**Resistance.** Stone objected that on this definition "any woman who challenges her subordinate status must by definition be challenging her status as a woman".

**Inclusion.** Katharine Jenkins ("Amelioration and Inclusion", 2016) argued that a feminist analysis must not wrongly exclude people who should count as women, yet Haslanger's excludes trans women presumed male. Her revision keeps Haslanger's concept as **gender as class** and adds an equally important **gender as identity**: an internal "map" for navigating the realities that women as a class face. Talia Mae Bettcher (2017) worried that some trans women may lack such an identity before living as women; Jenkins (2018) responded.

**Not objective enough.** Bach (2012) argued that women are a natural kind defined by a history, "participation in a lineage of women" through socialisation; Mikkola replied that trans women not socialised as girls would then count as men.

Rival accounts remain. Charlotte Witt (2011) treats gender as a lifelong "mega social role" organised around the function of bearing or begetting children; Linda Alcoff (2006) as **positionality**, a "relationship of possibility to biological reproduction"; Mikkola holds that feminists need no definition at all; and Robin Dembroff (2020) describes genderqueer as "a category whose members collectively destabilize the binary axis".

```checkpoint
q: Why does Haslanger call her definition of "woman" ameliorative?
a*: Because it asks which concept best serves feminism's legitimate purposes, such as identifying and ending sex-based inequality.
a: Because it reports how ordinary speakers actually use the word.
x: That would be a descriptive analysis; Haslanger asks which concept feminists should use, not which one they already use.
a: Because it defines women by a shared inner identity.
x: Gender identity is Jenkins's added concept; Haslanger's definition is about subordination.
a: Because it shows that women are a natural kind with a historical essence.
x: That is Bach's alternative, which he offered against Haslanger.
hint: Ameliorate means to make better.
why: Haslanger's question is not what "woman" means but what it should mean for feminist purposes; the answer, subordination marked by presumed female reproductive features, implies that ending sexism would end gender.
---
q: What is Jenkins's "inclusion problem" for Haslanger's analysis?
a: It counts too many men as privileged.
x: The worry concerns who is excluded from the category of women, not the size of the category of men.
a: It wrongly leaves out the Queen of England.
x: The Queen case is a separate objection about privileged females, raised in the SEP.
a*: It excludes trans women presumed to be male, though a feminist analysis should not wrongly exclude people who should count as women.
a: It is too hard to show that ordinary speakers already use the concept.
x: That is Saul's reply to Haslanger's claim that the concept may not be so revisionary.
hint: Whom does a definition based on presumed reproductive features leave out?
why: Jenkins kept Haslanger's concept as "gender as class" and added "gender as identity", so that trans women count as women; Bettcher later asked whether even this includes everyone.
```

## Sex, Gender and Trans Inclusion

"What is a woman?" is now one of the most publicly contested questions in the field. Readers should know that the SEP's entry on trans issues is written by Bettcher, a leading participant on one side, and that its entry on sex and gender declines to cover gender-critical work in detail because much of that debate has happened outside academic philosophy. Each view below is attributed to its authors.

**The gender-critical case.** Alex Byrne's "Are Women Adult Human Females?" (2020) answers yes: "women are adult human females–nothing more, and nothing less". Among his six considerations are the dictionary definition and the fact that we can know someone is a woman knowing only that she is an adult human female. Kathleen Stock's *Material Girls* (2021) holds that "woman" in ordinary use means "adult, female human" and should not be revised, since sex is real and sex differences matter, in medicine and pregnancy for instance. She argues that changing rooms and similar spaces should be separated by biological sex, given males' greater average size and strength and patterns of male sexual aggression. Holly Lawford-Smith's *Gender-Critical Feminism* (2022) treats women as a "sex caste": sex is not socially constructed, gender is the set of norms imposed to subordinate females, and the oppression trans women face is "a collateral effect" of those norms. On this view, feminism needs sex-based categories because the oppression it fights is sex-based.

**The trans-inclusive case.** Bettcher (2013) argues that "woman" has more than one correct meaning, a dominant one and a resistant one used in trans communities, and that trans women's self-identifications "should be taken at face value right from the start". Jenkins's identity concept gives trans women a place within an ameliorative theory. Dembroff (2021) replied to Byrne that he assumes "woman" has one invariant meaning and picks the dominant one while ignoring its use in law and the media; Byrne answered in "Gender Muddle" (2021). Others (Heartsilver 2021, Arvan 2023) argue that trans women can count as "adult human females" in a social sense. Against Stock's argument about spaces, Finlayson, Jenkins and Worsdale (2018) argued that male violence is not explained by biology alone, and the SEP cites a 2019 study (Hasenbush and colleagues) finding that trans-inclusive facility policies were not associated with increased risk to other women. On this view, excluding trans women misdescribes them and wrongs them, as Kapusta's (2016) analysis of misgendering argues.

Saul (2012) explored a third position: in many contexts trans women fall under "woman", while in contexts such as restrooms the question is settled by moral and political considerations rather than by meaning; she did not finally endorse it. Neither side has persuaded the other, and the empirical claims on both sides are disputed.

## Standpoint Epistemology

Does where you stand affect what you can know? **Standpoint theory**, as the Internet Encyclopedia of Philosophy (IEP) summarises it, holds that knowledge is socially situated, that marginalised groups are placed so that they can more easily notice some things and ask some questions, and that research, especially on power, should begin from their lives. Its ancestry runs from Hegel's master and slave through Marx and Lukács. Nancy Hartsock's "The Feminist Standpoint" (1983) located women's advantage in their central role in reproduction and the care of bodies. Reconstructed from the IEP and the SEP, the argument runs:

1. What a knower can know is shaped by her social location.
2. Those in dominant positions have the interest and the means to see current arrangements as natural, and their partial view becomes common sense.
3. Members of subordinated groups must understand both their own world and the dominant one, and they meet facts the dominant can ignore.
4. When that experience is reflected on collectively and critically, it becomes a **standpoint**: an achievement, not a birthright.
5. So inquiry that starts from marginalised lives gives less partial accounts of everyone.

```quote
Starting off research from women's lives will generate less partial and distorted accounts not only of women's lives but also of men's lives and of the whole social order.
Sandra Harding · "Rethinking Standpoint Epistemology: What is 'Strong Objectivity'?" · 1993
```

Step 4 meets the objection of **automatic privilege**: oppression does not by itself make anyone right. A standpoint, wrote Sandra Harding (1935–2025), "is not something that anyone can have simply by claiming it. It is an achievement."

The strongest objection is **relativism**, sharpened as the **bias paradox** (Longino, Hekman): if all knowledge is situated, by what neutral standard can some situations be better? Longino argued there is no noncircular way to decide which standpoints are privileged. Harding replied with **strong objectivity**: science that reflects critically on its knowers' social locations is *more* objective than science that claims to be value-neutral. Alison Wylie ("Why Standpoint Matters", 2003) gave a more modest reply. On her account, standpoint theorists had come to reject both essentialism and automatic privilege, claiming instead a **contingent** advantage on particular questions, testable by ordinary standards such as empirical adequacy; in archaeology, attention to gender widened the evidence, from netting and basketry to skeletons.

A further objection was that a single "women's standpoint" might be that of relatively privileged white women (Lugones and Spelman). Patricia Hill Collins's *Black Feminist Thought* (1990) grounded a Black feminist epistemology in Black women's experience of racism and sexism. Black women academics, she argued, are "outsiders within": insiders as academics, outsiders as Black women. She analysed "controlling images" such as the Mammy and the Jezebel, and warned against assuming that being Black or female "automatically" determines consciousness. **Epistemic injustice**, wrongs done to people as knowers, is covered in *Testimony, Trust and Social Epistemology*.

## Intersectionality

In 1989 the legal scholar Kimberlé Crenshaw coined "intersectionality" for a gap in American law. In *DeGraffenreid v. General Motors* (1976), five Black women challenged layoffs; the court considered race and sex separately, and since GM had hired Black men for its factories and white women for its offices, neither claim succeeded. Discrimination against Black women as such slipped through. "If an accident happens at an intersection," Crenshaw wrote, "it can be caused by cars traveling from any number of directions and, sometimes, from all of them"; "the intersectional experience is greater than the sum of racism and sexism". "Mapping the Margins" (1991) extended the analysis to violence against women of colour.

The idea had antecedents. The Combahee River Collective, a Boston group of Black lesbian socialist feminists, issued its Statement in 1977:

```quote
the major systems of oppression are interlocking. The synthesis of these oppressions creates the conditions of our lives.
Combahee River Collective · Combahee River Collective Statement · 1977
```

Frances Beal had written of "double jeopardy", and Pauli Murray of "Jane Crow" (1947); Anna Julia Cooper appears in *Philosophy in an Age of Empire*. Sojourner Truth's speech at Akron, Ohio, on 29 May 1851 is often listed too, but with a caution: the refrain "Ain't I a Woman?" is not in the transcript Marius Robinson published in the *Anti-Slavery Bugle* in June 1851. It comes from Frances Gage's very different version of 1863. In Robinson's text Truth asks, "if a woman have a pint, and a man a quart – why can't she have her little pint full?" (see *Abolitionist Women*).

How much does intersectionality claim? Jenkins distinguishes theses of increasing strength: oppressions are non-additive; they cannot be separated; race and gender are mutually constitutive; and intersectional categories have greater explanatory power, a claim Crenshaw rejects in its strongest form. Crenshaw later called intersectionality "a heuristic term". Critics include Sirma Bilge, who says it has been "commodified and colonized" by neoliberal institutions; Tommy J. Curry, who argues it imports stereotypes of Black men; and Lawford-Smith. Brittney Cooper's verdict is that it "does not deserve our religious devotion" but remains "one of the most useful and expansive paradigms we have". *Race, Colonialism and Philosophy* takes up race itself.

## Care, Justice and the Family

The **ethics of care**, from Gilligan's *In a Different Voice* (1982) and Noddings's *Caring* (1984) to Held and Kittay, is set out in *Virtue Ethics, Greek and Confucian*. The SEP counts it as one of four main themes of feminist ethics. Its political question, who does the caring, leads to the family. Traditional political thought separated the public state from the private household, shielding domination at home from scrutiny; Carole Pateman's *The Sexual Contract* (1988) asked who could be a party to the social contract at all (see *Authority and the State: the Social Contract and Its Critics*). Susan Moller Okin's *Justice, Gender, and the Family* (1989), mentioned in *Justice and Equality*, argued from within John Rawls's theory:

1. Rawls's principles govern society's basic structure, and the family is part of it.
2. Parties who did not know their sex would not accept a system assigning roles by sex, which bypasses "free choice of occupation".
3. So in a just society "gender could no longer form a legitimate part of the social structure, whether inside or outside the family".
4. Moreover, children learn their sense of justice in families, and families built on "dependence and domination" cannot teach it.
5. So the state should encourage equal sharing of paid and unpaid work: subsidised daycare, parental leave, flexible hours, and a homemaking spouse's legal entitlement to half the earner's pay (though not enforced fifty-fifty housework).

Critics such as Alstott accept the policies but reject a state-promoted ideal: "The egalitarian family is, even in principle, a troubling ideal." Others (Shachar, Khader) object that it elevates one comprehensive conception of the good.

## The Pornography Debate

The sharpest quarrel between radical and liberal feminists concerned pornography. For MacKinnon "sexuality is the linchpin of gender inequality". In 1983 she and Andrea Dworkin drafted an ordinance for Minneapolis; Indianapolis passed a version in 1984. It defined pornography by what it does, as "the graphic sexually explicit subordination of women through pictures and words", with eight further clauses, distinguished it from erotica premised on equality, and offered civil remedies rather than criminal penalties. MacKinnon argued that pornography also silences women; Rae Langton (1993) developed the claim that it can disable speech acts, so that a woman's "no" fails to register as refusal.

Opponents included feminists. The Feminist Anti-Censorship Taskforce filed a brief against the ordinance, fearing alliance with the evangelical right, discrimination against sexual minorities, threats to women's freedom to produce and perform, and the message that sex is bad for women. The wider quarrel is called the "feminist sex wars". Ronald Dworkin objected that "no reputable study has concluded that pornography is a significant cause of sexual crime", and critics such as Jacobson disputed the silencing argument. In *American Booksellers Association v. Hudnut* the federal Seventh Circuit court of appeals struck the Indianapolis ordinance down in 1985, and the Supreme Court affirmed without opinion in 1986. The questions of harm, speech and consent remain open.

```checkpoint
q: What did Harding mean by "strong objectivity"?
a: That only members of oppressed groups can be objective.
x: Harding denied that a standpoint comes automatically with social position; it is an achievement.
a*: That inquiry which critically examines its knowers' social locations is more objective than inquiry claiming to be value-neutral.
a: That all knowledge is relative, so no account is better than another.
x: Strong objectivity was Harding's answer to the charge of relativism, not a version of it.
a: That science should ignore the social position of researchers.
x: That is the "value-neutral" ideal Harding thought less objective.
hint: It was her reply to the bias paradox.
why: If all knowledge is situated, standpoint theory needs a way to call some accounts better. Harding's answer was that systematic reflection on one's own location adds objectivity; Wylie later defended a more modest, contingent advantage.
---
q: What happened to the Indianapolis anti-pornography ordinance in court?
a: The Supreme Court struck it down after full argument in 1984.
x: The ordinance was passed in 1984; the appeals court struck it down in 1985, and the Supreme Court affirmed without opinion in 1986.
a: It was upheld and became a model for criminal obscenity laws.
x: The ordinance created civil remedies, not criminal penalties, and was not upheld.
a: Feminist groups withdrew it before any court ruled.
x: It was litigated in American Booksellers Association v. Hudnut.
a*: The Seventh Circuit court of appeals struck it down in 1985, and the Supreme Court affirmed without issuing an opinion in 1986.
hint: Two courts were involved, a federal appeals court and the highest court.
why: In Hudnut the Seventh Circuit held the ordinance invalid; the Supreme Court's summary affirmance in 1986 left that ruling in place without reasons of its own.
```

## Critiques of the Canon

Charlotte Witt and Lisa Shapiro distinguish two problems: women were excluded from philosophy's history, and the canon described women negatively. Criticism works at three levels. The first is **explicit misogyny**: Cynthia Freeland catalogued Aristotle's claims that a man's courage lies in commanding and a woman's in obeying, and that a female is "as it were, a deformity". The second is **gendered concepts**: Aristotle linked form with the male and matter with the female, and Okin's *Women in Western Political Thought* (1979) argued that his functionalism legitimated Athenian slavery and women's inequality, though Sophia Connell (2016) counters that his theory of reproduction is not intrinsically sexist. The third is **synoptic**: Genevieve Lloyd's *The Man of Reason* (1984) argued that reason itself had been coded male (see *Women Philosophers of the Early Modern Era*).

Must feminists then reject reason? Witt argued not. If reason's maleness is extrinsic, its history gives no ground for rejecting the concept. If it is intrinsic, rejection follows only if reason ought to be otherwise; but to argue that reason would be better gender-neutral is to reconceive reason, not reject it.

Other feminists recover forgotten women; as Mary Ellen Waithe put it, "These women are not women on the fringes of philosophy, but philosophers on the fringes of history." Still others appropriate canonical figures, as Annette Baier did Hume.

## Feminisms beyond the Euro-American Mainstream

Chandra Talpade Mohanty's "Under Western Eyes" (1984) charged Western scholarship with inventing "the average Third World woman", "ignorant, poor, uneducated, tradition-bound". Uma Narayan (1997) showed that Western critics treated *sati*, widow-burning, as a timeless local practice, though it gained its symbolic power under British rule. Nussbaum, by contrast, offers her capabilities approach as the basis of a "global feminism"; critics such as Ackerly and Attanasi (2009) reply that such "international feminists" attend too little to how injustice is mediated locally. The debate between universalism and cultural critique continues.

In China, He-Yin Zhen (c. 1884 – c. 1920), writing in Tokyo for the anarchist journal *Tianyi bao* in 1907–08, treated gender and class as inseparable, analysed women's unwaged reproductive labour, and made women's liberation an end in itself, not a means to national revival; some scholars stress that this anarcho-feminism belonged to a brief period.

In India, Tarabai Shinde's Marathi *Stri Purush Tulana* ("A Comparison Between Women and Men", 1882) attacked caste, patriarchy and the scriptures used to justify them; it is often called the first modern Indian feminist text. Pandita Ramabai appears in *Philosophy in an Age of Empire*. Within Islam, Fatema Mernissi questioned misogynist *hadith* through the history of their transmission; Amina Wadud's *Qur'an and Woman* (1992) reread scripture from a woman's perspective; and Leila Ahmed's *Women and Gender in Islam* (1992) traced oppressive practices to patriarchal interpretation rather than to Islam itself.

Was gender a colonial import? Oyèrónkẹ́ Oyěwùmí's *The Invention of Women* (1997) argued that Oyo-Yoruba society was organised by seniority, not gender. Bibi Bakare-Yusuf (2003) objected that the absence of gendered pronouns does not prove the absence of gender, and Sefinatu Aliyu Dogo questioned generalising from one ethnic group (see *African Philosophy: the Ethnophilosophy Debate and Beyond*). María Lugones (1944–2020) argued that sexual dimorphism, heterosexualism and female inferiority belong to a "colonial/modern gender system" that treated the colonised as ungendered and so not fully human; Brooklyn Leo (2020) objected that she erased Two-Spirit people and denied resistance within the system (see *Latin American Philosophy and the Philosophy of Liberation*).

## Further exploration

- **Sally Haslanger, *Resisting Reality: Social Construction and Social Critique* (2012).** Collects "Gender and Race: (What) Are They?" and her ameliorative project.
- **Patricia Hill Collins, *Black Feminist Thought: Knowledge, Consciousness and the Politics of Empowerment* (1990; rev. 2000).** The classic of Black feminist standpoint epistemology.
- **Kathleen Stock, *Material Girls: Why Reality Matters for Feminism* (2021).** The gender-critical case that sex matters and "woman" means adult human female.
- **Talia Mae Bettcher, *Beyond Personhood: An Essay in Trans Philosophy* (2025).** A trans-feminist philosophy by a leading participant in the debate; read with Stock.
- **Susan Moller Okin, *Justice, Gender, and the Family* (1989).** The liberal-egalitarian case that justice must reach into the family.
- **Serene J. Khader, *Decolonizing Universalism: A Transnational Feminist Ethic* (2018).** Feminism without Western cultural imperialism.
- **Lydia H. Liu, Rebecca E. Karl and Dorothy Ko (eds.), *The Birth of Chinese Feminism: Essential Texts in Transnational Theory* (2013).** He-Yin Zhen's essays in translation.$feminist_master$,
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
  select $feminist_quiz$[
    {"type": "mcq", "prompt": "How did the two English translations of The Second Sex render Beauvoir's \"On ne naît pas femme: on le devient\"?", "options": ["Parshley (1953): \"One is not born, but rather becomes, a woman\"; Borde and Malovany-Chevallier (2009-10): \"One is not born, but rather becomes, woman\"", "Both translations used \"One is not born a woman, one becomes one\"", "Parshley dropped the article; Borde and Malovany-Chevallier restored it", "Borde and Malovany-Chevallier translated it \"Woman is made, not born\""], "answerIndex": 0, "explanation": "Parshley's 1953 translation reads \"One is not born, but rather becomes, a woman\". Borde and Malovany-Chevallier dropped the article, \"One is not born, but rather becomes, woman\", because Beauvoir is \"talking about woman as a construct\". Whether the sentence introduces the sex/gender distinction is debated: Butler (1986) read it so; Moi and Bauer dispute it.", "id": "q1"},
    {"type": "mcq", "prompt": "Which of these is Katharine Jenkins's revision of Haslanger's ameliorative analysis of \"woman\" (2016)?", "options": ["Replace the definition with \"adult human female\"", "Treat gender as a lifelong mega social role organised around reproduction", "Keep Haslanger's concept as \"gender as class\" and add an equally important concept of \"gender as identity\"", "Abandon any definition and let ordinary intuitions fix who counts"], "answerIndex": 2, "explanation": "Jenkins argued that Haslanger's definition wrongly excludes trans women presumed male (the inclusion problem). She kept gender as an imposed social class and added gender as a lived identity, an internal 'map' for navigating the realities of women as a class. The other options describe Byrne and Stock, Witt, and Mikkola.", "id": "q2"},
    {"type": "mcq", "prompt": "What is the \"bias paradox\" for standpoint epistemology?", "options": ["That oppressed people are automatically better knowers", "That if all knowledge is socially situated, there seems to be no neutral standard for calling some situations epistemically better than others", "That standpoint theory ignores the experience of Black women", "That scientists cannot be biased if they follow the scientific method"], "answerIndex": 1, "explanation": "Longino and Hekman pressed the worry that situated knowledge leaves no noncircular basis for privileging any standpoint. Harding replied with 'strong objectivity' (critical reflection on knowers' locations makes inquiry more objective); Wylie defended a more modest, contingent advantage on particular questions. The automatic-privilege objection and the intersectional critique are separate objections.", "id": "q3"},
    {"type": "mcq", "prompt": "Why must the refrain \"Ain't I a Woman?\" be handled with care when citing Sojourner Truth's 1851 Akron speech?", "options": ["Because Truth never spoke at Akron", "Because it was added by Kimberlé Crenshaw in 1989", "Because it appears only in the Combahee River Collective Statement", "Because it does not appear in Marius Robinson's 1851 transcript and comes from Frances Gage's very different 1863 version"], "answerIndex": 3, "explanation": "Truth spoke at the Woman's Rights Convention in Akron on 29 May 1851. Robinson's transcript in the Anti-Slavery Bugle (June 1851) does not contain the refrain; it comes from Gage's version published twelve years later, in a dialect Truth did not speak. Robinson's text is regarded as the most accurate.", "id": "q4"},
    {"type": "open", "prompt": "Set out Haslanger's ameliorative argument for defining 'woman' in terms of subordination, step by step. Then explain two objections to it and the best replies, and say what the debate shows about the aims of a definition.", "rubric": "A strong answer distinguishes descriptive from ameliorative analysis and gives Haslanger's definition (systematically subordinated along some dimension, and marked for this by observed or imagined bodily features presumed to be evidence of a female's reproductive role); reconstructs the steps (feminism aims to end sex-based injustice; it needs concepts for the groups that injustice creates; people presumed female are subordinated; so 'woman' should name that position; so gender is a hierarchy that justice would abolish, an eliminativist view). It presents at least two objections fairly: the extension objection (the Queen of England; unprivileged males), with the revisionary reply, Haslanger's claim that ideology can mislead us about our own concepts, and Saul's counter; Stone's objection that women resisting subordination would be resisting being women; Jenkins's inclusion problem and her gender-as-class/gender-as-identity revision, with Bettcher's worry and Jenkins's response; or Bach's historical-essence view and Mikkola's reply. Credit for noting that the debate turns on whether a definition should capture usage or serve political purposes, and for presenting each position without caricature or taking a side as settled.", "id": "q5"},
    {"type": "open", "prompt": "Present the disagreement between gender-critical and trans-inclusive feminist philosophers over what a woman is. Give the strongest argument of each side, attributed to named philosophers, and explain why a reader should be cautious about relying on any single reference source.", "rubric": "A strong answer gives the gender-critical case in its own terms: Byrne's thesis that women are adult human females and his supporting considerations; Stock's view that 'woman' ordinarily means adult female human, that sex differences matter (medicine, pregnancy), and that some spaces should be separated by sex given average differences in size and strength and patterns of male sexual aggression; Lawford-Smith's account of women as a sex caste and gender as norms that subordinate females. It gives the trans-inclusive case in its own terms: Bettcher's view that 'woman' has dominant and resistant meanings and that self-identifications should be taken at face value; Jenkins's gender as identity; Dembroff's reply to Byrne; Finlayson, Jenkins and Worsdale on male violence and the evidence on inclusive facility policies cited by the SEP; Kapusta on misgendering. It may mention Saul's contextualism. It notes that the SEP's trans entry is written by Bettcher, a participant in the debate, and that the SEP's sex and gender entry declines to cover gender-critical work in detail. Reward balanced length and tone, accurate attribution, avoidance of either side's pejorative vocabulary, and no claim that the question has been settled; penalise caricature of either side.", "id": "q6"}
  ]$feminist_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/political-philosophy/feminist-philosophy', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

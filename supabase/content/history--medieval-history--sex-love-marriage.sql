-- Sex, Love, and Marriage in the Middle Ages — canonical master article, co-written and human-reviewed.
-- history/medieval-history/europe-and-byzantium/sex-love-and-marriage-in-the-middle-ages @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- How the Church made marriage, courtly love, the voices of Heloise,
-- Margery Kempe, and Christine de Pizan, peasant and noble marriage and
-- annulment, prostitution, medicine, same-sex desire and the Boswell
-- debate, and echoes today.
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
    'history/medieval-history/europe-and-byzantium/sex-love-and-marriage-in-the-middle-ages',
    'research',
    'advanced',
    'read',
    $sexlove_master$> **Sex, love, and marriage in the Middle Ages** were governed, in principle, by the Church, which between the eleventh and thirteenth centuries made marriage a sacrament, defined what made it valid, demanded celibacy of its clergy, and policed sexuality through confession and church courts. In practice, people negotiated, evaded, and reinterpreted those rules, and a new literature of love, the poetry of the troubadours and the romances of chivalry, imagined passion in ways the Church distrusted. This chapter explores how the Church made marriage, how love was written about, what women such as Heloise, Margery Kempe, and Christine de Pizan said in their own voices, how marriage differed between peasants and nobles, how prostitution and same-sex desire were treated, what medicine taught about sex, and how much of all this still shapes marriage today.

## How the Church Made Marriage

In the early Middle Ages, marriage among Christians in Europe was largely a family and property arrangement, governed by custom and secular law, and divorce and remarriage were possible in many places. Between the eleventh and thirteenth centuries, the reforming Church brought marriage under its own law and theology.

Three principles became central:

- **Consent.** Twelfth-century theologians and canon lawyers, including Peter Lombard and Pope Alexander III, established that what made a marriage was the free consent of the two parties, expressed in words of the present tense ("I take you as my wife/husband"), or a promise in the future tense followed by sexual intercourse. Neither parental approval nor a priest nor a ceremony was strictly necessary for a marriage to be valid. This had a radical implication: in principle, a couple could marry without their families' permission. It also created endless legal disputes over secret, or **clandestine**, marriages, which the Church disapproved of but recognised as valid.
- **Indissolubility.** A valid, consummated marriage could not be dissolved. There was no divorce in the modern sense, only legal separation "from bed and board" without the right to remarry.
- **Sacrament.** Marriage was defined as one of the seven sacraments, a channel of divine grace.

The **Fourth Lateran Council** of 1215, often considered the most important Church council of the Middle Ages, tightened the rules. It required the publication of **banns**, public announcements of a forthcoming marriage in church, so that anyone who knew of an impediment could object, and it reduced the forbidden degrees of kinship from seven to four; the seven-degree rule had made it almost impossible for nobles in small communities to marry legally.

The Church also enforced **clerical celibacy**. In the early Middle Ages many priests were married. Eleventh-century reformers condemned clerical marriage, partly from ideals of purity and partly to prevent church property passing to priests' children. The First Lateran Council (1123) forbade clergy in major orders to marry and ordered existing marriages dissolved, and the Second (1139) declared such marriages invalid. Enforcement was slow, and many priests kept partners for centuries.

```checkpoint
q: What made a marriage valid according to twelfth-century Church law?
a*: The free consent of the two parties, expressed in words of the present tense, even without a priest or ceremony.
a: The consent of both sets of parents.
x: Parental consent was desirable but not legally necessary for a valid marriage.
a: A ceremony performed by a bishop.
x: Neither a priest nor a ceremony was strictly required for validity.
a: The payment of a dowry.
x: Dowries were common but did not determine a marriage's validity.
hint: The theologians focused on the will of the couple.
why: The consent doctrine made the couple's free agreement the essence of marriage, with the radical implication that families could not strictly prevent a marriage.
---
q: What did the Fourth Lateran Council of 1215 change about marriage?
a: It allowed divorce and remarriage.
x: The Church maintained indissolubility; Lateran IV did not allow divorce.
a: It made priests' marriages valid.
x: Clerical marriage had already been declared invalid by earlier councils.
a*: It required the public announcement of banns and reduced the forbidden degrees of kinship from seven to four.
a: It abolished the consent doctrine.
x: Consent remained the basis of marriage; Lateran IV added procedures around it.
hint: Think about announcements and relatives.
why: Banns aimed to prevent secret and invalid marriages, and the reduced degrees of kinship made marriage within small noble circles feasible.
```

## Courtly Love

In the late eleventh and twelfth centuries, poets in southern France, the **troubadours**, writing in the Occitan language, created a new poetry of love. The earliest troubadour whose songs survive was **William IX**, Duke of Aquitaine. Their songs typically praised a noble lady, often married to someone else, whom the poet served devotedly, humbly, and frequently in vain, a love that refined and ennobled the lover. The style spread to northern France, where poets called trouvères wrote in French, to Germany (the Minnesänger), and to Italy, where it influenced Dante and Petrarch.

Romance literature developed the theme. **Chrétien de Troyes**, writing in the late twelfth century at the court of Marie of Champagne, told the story of Lancelot's love for Queen Guinevere, wife of King Arthur. A treatise by **Andreas Capellanus**, *On Love* (*De Amore*), set out rules of love, such as that marriage is no excuse for not loving and that love cannot exist between husband and wife.

The modern scholarly term "**courtly love**" (*amour courtois*) was introduced in 1883 by the French scholar Gaston Paris (the phrase occurs only once in medieval sources), and historians debate what it really was. Was it a real code of behaviour among nobles, a literary game, a disguised religious devotion, a fantasy that served the interests of knights seeking status, or, as some have argued, a form of ironic entertainment that should not be taken literally? Most historians see it primarily as a literary and courtly culture, which nonetheless shaped ideals of romantic love in the West for centuries.

## Women's Voices

Most medieval writing about love and marriage was by men, many of them celibate clergy. A few women's voices survive, and they are precious.

**Heloise** was a brilliant young woman in Paris who, around 1115–16, became the student and lover of the famous philosopher **Peter Abelard**. They had a son and married secretly. Her uncle, enraged, had Abelard castrated, and both entered religious life, Heloise eventually as abbess of the Paraclete. Years later they exchanged letters, in which Heloise wrote with startling frankness about her continuing love and desire, declared that she would rather be called Abelard's whore than the empress of Augustus himself, and questioned the Church's ideals of marriage. Some scholars once doubted the letters' authenticity, but most now accept that Heloise wrote her letters.

**Margery Kempe** (born around 1373), a merchant's daughter from King's Lynn in England, dictated *The Book of Margery Kempe*, often called the first autobiography in English. After bearing fourteen children, she sought to live a chaste religious life within her marriage. In a remarkable episode around 1413, she negotiated with her husband: he agreed to live chastely with her, and she agreed to pay his debts. Her book describes her pilgrimages, visions, and frequent clashes with clergy who suspected her of heresy.

**Christine de Pizan** (1364–about 1430), widowed young in Paris, became one of the first women in Europe to support herself as a professional writer. In *The Book of the City of Ladies* (1405) she challenged the misogyny of male authors by building an allegorical city of virtuous women from history and legend, arguing that women's apparent inferiority came from lack of education, not nature.

```checkpoint
q: What is distinctive about Heloise's letters?
a: They are the only surviving medieval love poems.
x: Much medieval love poetry survives; the letters' value lies in their voice and content.
a*: They give a woman's frank account of love and desire, questioning the Church's ideals of marriage, in her own voice.
a: They were written by Abelard pretending to be Heloise.
x: Some scholars once suggested this, but most now accept that Heloise wrote her letters.
a: They describe the troubadours of southern France.
x: The letters concern Heloise and Abelard's relationship, not troubadour culture.
hint: Consider who is writing and what she says about marriage.
why: Heloise's letters are a rare woman's voice on love and marriage, challenging the dominant clerical perspective.
---
q: Why is the bargain between Margery Kempe and her husband historically revealing?
a: Because it shows that medieval women could divorce their husbands at will.
x: Divorce in the modern sense was not available; Margery negotiated within her marriage.
a: Because it shows that all medieval marriages were chaste.
x: Margery had fourteen children before seeking chastity; the bargain was unusual.
a: Because it was ordered by the pope.
x: The arrangement was a private agreement between Margery and her husband.
a*: Because it shows a wife negotiating the terms of her marriage, in this case chastity in exchange for paying her husband's debts.
hint: What did each party give?
why: The bargain shows how marriage was a relationship of obligations that could be negotiated, even within Church rules.
```

## Peasants, Nobles, and Annulment

Marriage meant different things at different levels of society. Among the **nobility**, marriages were usually arranged by families to secure alliances, land, and inheritance, often when the bride was young. **Dowries**, property brought by the bride, and dower, property promised by the husband to support her if widowed, were central to negotiations. For the nobility, the consent doctrine was often more a theory than a reality, though some couples used it to defy their families.

Among **peasants and townspeople**, especially in northwestern Europe and especially after the Black Death, people often married later, in their late teens or twenties, and had more say in choosing partners, though property and family interests still mattered. Lords sometimes required fees for the marriages of serfs, as the chapter on lords and peasants described.

Since divorce was impossible, the main way out of a marriage was **annulment**: a declaration that the marriage had never been valid, because of an impediment such as a prior marriage contract, lack of consent, impotence, or a close family relationship. The rules on kinship gave nobles an escape route. In 1152 the marriage of King Louis VII of France and **Eleanor of Aquitaine** was annulled on the grounds that they were related within the forbidden degrees, after fifteen years and two daughters; within two months Eleanor married Henry of Anjou, the future Henry II of England, transferring her vast lands to him.

## Prostitution, Medicine, and Same-Sex Desire

The medieval Church regarded sex outside marriage as sinful, yet many authorities tolerated **prostitution** as a lesser evil that protected respectable women and marriages from men's lust, an argument derived from a remark of Augustine. Many towns regulated prostitution, licensing brothels in designated areas. In London, the brothels of Southwark, the "stews", operated under ordinances, attributed to Henry II in 1161, that were enforced by the bishop of Winchester, who held the land and licensed the brothels.

**Medical** ideas about sex drew on ancient Greek and Arabic authorities, especially Galen and Ibn Sina. Many physicians held that both men and women produced "seed" necessary for conception and that female pleasure was needed to release it, a theory with a cruel consequence: some legal writers argued that a woman who conceived could not have been raped. Medical texts associated with Salerno in Italy, known as the *Trotula*, partly attributed to a woman physician named Trota, dealt with women's health, fertility, and childbirth.

**Same-sex desire** was condemned by the Church as the sin of sodomy, a category that covered various non-procreative sexual acts. The reforming monk **Peter Damian** wrote a fierce attack on sodomy among clergy around 1049–51, the *Book of Gomorrah*, and the Third Lateran Council of 1179 decreed penalties for it. Persecution intensified from the late Middle Ages, with some secular laws prescribing death. In *Christianity, Social Tolerance, and Homosexuality* (1980), the historian **John Boswell** argued that the early medieval Church had been relatively tolerant of same-sex relationships and that hostility hardened only from the twelfth and thirteenth centuries; in a later book (1994) he argued that Byzantine and other liturgies of "brother-making" had blessed same-sex unions. Many historians challenged his interpretations, especially the second, arguing that these ceremonies created ritual kinship rather than romantic unions. The **Boswell debate** opened the history of sexuality as a serious field of study and remains a reference point.

```checkpoint
q: Why did many medieval authorities tolerate prostitution despite condemning sex outside marriage?
a: Because the Church had no view on prostitution.
x: The Church condemned sex outside marriage, but tolerated prostitution for practical reasons.
a: Because prostitution was the main source of Church income.
x: Some church landlords profited, as in Southwark, but this was not the main justification.
a*: Because they regarded it as a lesser evil that protected marriages and respectable women from men's desires, an argument traced to Augustine.
a: Because medieval law made prostitution compulsory.
x: Nothing made prostitution compulsory; authorities regulated it.
hint: Think of the idea of a "lesser evil".
why: Tolerance and regulation reflected a pragmatic theology of sin, in which some wrongs were accepted to prevent worse ones.
---
q: What was the main criticism of John Boswell's argument about medieval "brother-making" ceremonies?
a*: That the ceremonies created ritual kinship or alliance rather than romantic unions equivalent to marriage.
a: That no such ceremonies existed.
x: The ceremonies existed; the debate concerns what they meant.
a: That Boswell ignored the Byzantine evidence.
x: Boswell relied heavily on Byzantine liturgies.
a: That the ceremonies were invented in the twentieth century.
x: The liturgies survive in medieval manuscripts.
hint: What does "brother-making" suggest?
why: Critics accepted that the rituals existed but disputed Boswell's interpretation, a debate that helped establish the history of sexuality.
```

## Echoes Today

Many features of modern marriage in the West have medieval roots: the idea that free consent between two people is what makes a marriage, the public announcement of marriages, the role of the Church in weddings, rules about how closely related spouses can be, and the long struggle over divorce, which many Protestant states allowed from the sixteenth century (England only by Act of Parliament until 1857), and which some Catholic countries legalised only in the late twentieth or even the twenty-first century (Italy 1970, Ireland 1996, Malta 2011). The ideal of romantic love, celebrated by troubadours as something outside and even against marriage, gradually merged with marriage itself in later centuries. Other medieval patterns, such as the double standard of sexual morality for men and women, have proved equally durable.

## Further exploration

- **James A. Brundage, *Law, Sex, and Christian Society in Medieval Europe* (1987).** The standard study of sexuality and canon law.
- **Ruth Mazo Karras and Katherine E. Pierpont, *Sexuality in Medieval Europe: Doing unto Others* (4th ed., 2023).** A thematic survey of medieval sexuality.
- **Betty Radice and M. T. Clanchy (trans.), *The Letters of Abelard and Heloise* (Penguin, revised ed., 2003).** The letters themselves.
- **Christine de Pizan, *The Book of the City of Ladies*, trans. Rosalind Brown-Grant (1999).** Christine's defence of women.
- **John Boswell, *Christianity, Social Tolerance, and Homosexuality* (1980).** The pioneering, contested study.$sexlove_master$,
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
  select $sexlove_quiz$[
    {"type": "mcq", "prompt": "According to twelfth-century canon law, what made a marriage valid?", "options": ["The free consent of the two parties in words of the present tense", "A ceremony performed by a priest", "The consent of the bride's father", "The payment of a dowry"], "answerIndex": 0, "explanation": "The consent doctrine meant even secret marriages were valid, though the Church disapproved of them.", "id": "q1"},
    {"type": "mcq", "prompt": "Who gave the term 'courtly love' its modern scholarly meaning?", "options": ["Andreas Capellanus", "William IX of Aquitaine", "Gaston Paris, in 1883", "Chrétien de Troyes"], "answerIndex": 2, "explanation": "The term is modern; historians debate whether the phenomenon was a real code or primarily a literary culture.", "id": "q2"},
    {"type": "mcq", "prompt": "Why was the marriage of Eleanor of Aquitaine and Louis VII annulled in 1152?", "options": ["Because Eleanor had a prior marriage contract", "Because Louis became a monk", "Because the pope dissolved all royal marriages", "On the grounds that they were related within the forbidden degrees of kinship"], "answerIndex": 3, "explanation": "Kinship rules offered nobles a route to annulment; Eleanor married the future Henry II of England within two months.", "id": "q3"},
    {"type": "mcq", "prompt": "What did Christine de Pizan argue in The Book of the City of Ladies?", "options": ["That women's apparent inferiority came from lack of education, not nature", "That women were naturally inferior to men", "That women should not learn to read", "That courtly love should be banned"], "answerIndex": 0, "explanation": "Christine, one of Europe's first professional women writers, countered male misogyny with examples of virtuous women.", "id": "q4"},
    {"type": "open", "prompt": "How did the medieval Church transform marriage between the eleventh and thirteenth centuries, and how much of this survives today?", "rubric": "A strong answer explains the consent doctrine (Peter Lombard, Alexander III) and its radical implication and clandestine marriages; indissolubility and separation without remarriage; marriage as sacrament; Lateran IV's banns and reduced degrees of kinship; clerical celibacy (Lateran I and II); annulment as the main exit. It then identifies modern echoes: consent as the basis of marriage, public announcement, Church weddings, rules on kinship, the long struggle over divorce, and the merging of romantic love with marriage.", "id": "q5"},
    {"type": "open", "prompt": "What do the voices of Heloise, Margery Kempe, and Christine de Pizan add to our understanding of medieval love and marriage?", "rubric": "A strong answer explains why women's voices are rare (most writing by celibate male clergy) and describes each: Heloise's frank letters on love and her questioning of marriage; Margery Kempe's negotiated chastity within marriage and her clashes with clergy; Christine de Pizan's defence of women against misogyny. It draws conclusions about women's agency, the gap between Church ideals and lived experience, and the limits of the evidence.", "id": "q6"}
  ]$sexlove_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/medieval-history/europe-and-byzantium/sex-love-and-marriage-in-the-middle-ages', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

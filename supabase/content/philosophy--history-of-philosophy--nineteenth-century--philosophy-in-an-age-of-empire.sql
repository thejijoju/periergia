-- Philosophy in an Age of Empire — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/nineteenth-century/philosophy-in-an-age-of-empire @ research/advanced/read.
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
    'philosophy/history-of-philosophy/nineteenth-century/philosophy-in-an-age-of-empire',
    'research',
    'advanced',
    'read',
    $empire_master$> **Between about 1820 and 1930, thinkers in colonised and modernising societies argued about scripture, reason, race, civilisation and freedom, often in the languages of their rulers and always on their own terms.** This chapter follows reformers and revivalists in India, from Rammohun Roy to Vivekananda, Ambedkar and Gandhi; Muslim modernists from Sayyid Ahmad Khan to Iqbal; Meiji Japan's invention of a word for "philosophy"; Latin America's love affair with positivism and the revolt against it; and the Black Atlantic from Douglass and Blyden to Du Bois's double consciousness. Three arguments are set out step by step, with objections and replies.

## More than a Reaction

It is tempting to tell this story as "the West arrives, the rest react". The sources resist that framing. When Western philosophy reached Japan "in full force in the mid-nineteenth century", as Thomas Kasulis and Raquel Bouso put it in the Stanford Encyclopedia of Philosophy (SEP), Japanese scholars coined a new word, *tetsugaku*, for it rather than reuse an old word for sages. They were, on this reading, distinguishing two kinds of understanding: the detached knowledge of the scholar and the engaged, transformative knowing of the wise, as a geologist and a master potter both understand clay. Western philosophy became one source among several, alongside Shintō, Confucianism, Buddhism and *bushidō*.

In India, the historian Andrew Nicholson argues that thinkers between the twelfth and sixteenth centuries had already treated the Upaniṣads, the epics and the "six systems" as "a single whole", so the unifying moves of nineteenth-century Hindu reformers had roots older than British rule. Nalini Bhushan and Jay Garfield, in *Minds Without Fear* (2017), reject the premise, as one reviewer put it, that English was "perforce an alien medium for doing Indian philosophy". And Paul Gilroy's phrase "the Black Atlantic" names a culture that crossed Africa, the Americas, Britain and the Caribbean, with the slave ship as its image of lives lived between two or more lands and cultures.

Empire was still the backdrop. Liberal imperialism, Margaret Kohn and Kavita Reddy write in the SEP (drawing on Uday Mehta and others), joined universal principles to a "developmental history" in which peoples became fit for self-government only at a certain "stage of civilization". John Stuart Mill, "a life-long employee of the British East India Company", is the classic case (see *Bentham, Mill and Utilitarianism*); Marx's 1853 articles on British India are another (see *Marx*). The thinkers in this chapter answered such theories, borrowed from them, and turned them round.

## Rammohun Roy and the Argument from Scripture

Rammohun Roy (c. 1772–1833; the name is also spelled Ram Mohan and Rammohan) wrote in Persian, Bengali and English. His *Tuhfat-ul-Muwahhidin* ("A Gift to Monotheists", 1804) defended the unity of God; his translations of the Upaniṣads presented a "pure" monotheistic Vedānta (see *The Upanishads and the Beginnings of Indian Philosophy*). His *Precepts of Jesus* (1820) and its sequels argued against the Trinity, and he co-founded the Calcutta Unitarian Society. On 20 August 1828 the first assembly of his Brahmo Sabha met in north Calcutta, "open to all people irrespective of religion, caste, creed". He sailed to England in 1830 as envoy of the Mughal emperor Akbar II, who gave him the title Raja, and died at Stapleton, near Bristol, in 1833.

He is remembered above all for opposing *sati*, the burning of widows on their husbands' pyres. He did not abolish it. Regulation XVII of 1829 was passed by the Governor-General, Lord William Bentinck, in Council on 4 December 1829, after campaigns led by British evangelicals such as William Carey and by Hindu reformers such as Roy, who petitioned against sati that year. Opponents led by Radhakanta Deb and the Dharma Sabha appealed to the Privy Council, which upheld the ban by four councillors to three; Roy's journey to Britain was partly to make sure the Regulation was not overturned.

The argument that carried the day, written into the Regulation's own preamble, ran like this:

1. A Hindu practice is binding only if authoritative scripture enjoins it as a duty.
2. The authoritative texts do not enjoin widow-burning as an "imperative duty"; they prefer "a life of purity and retirement" for the widow.
3. So sati is not a religious duty.
4. A practice that is not a duty and that destroys life may be prohibited without violating the Hindu religion.

This answered the Dharma Sabha's complaint that a ban broke the British promise not to interfere in religion. The strongest objection comes from the historian Lata Mani's *Contentious Traditions* (1998). Both sides, she argues, argued about scripture and about what "Hindu tradition" really was, while the women who burned were "marginal to the debate". Eyewitness accounts spoke of the material hardships of widowhood, which the scriptural framing ignored, and colonial law relied on pandits' readings of contradictory texts. One possible reply on Roy's behalf is tactical: the scriptural argument was the one that could move both a colonial state pledged to non-interference and orthodox opinion. Roy also wrote directly on women's position, in a tract on "Ancient Female Rights" (1822). Whether that answers Mani, or confirms that women's own voices were missing, is the question her book leaves open.

The Brahmo movement split as it grew. Debendranath Tagore (1817–1905) took charge only in 1842–43, compiled *Brahmo Dharma* (1848) and, on Elizabeth De Michelis's account, came to reject the authority of the Vedas. Keshab Chandra Sen (1838–1884) broke away in 1865–66 and in 1881 proclaimed a "New Dispensation": "Our position is not that truths are to be found in all religions; but that all the established religions of the world are true."

## Back to the Vedas, Forward to Experience

Dayananda Saraswati (1824–1883) went the other way. His Arya Samaj, founded in Bombay in 1875, held "the infallible authority of the Vedas", and his *Satyarth Prakash* ("The Light of Truth", 1875) accepted other texts only where they agreed with the four Vedas and rejected the Purāṇas. "Back to the Vedas" did not mean conservatism: he opposed idol worship, birth-based caste and untouchability, and supported women's education. Anantanand Rambachan sums up the contrast: the Brahmos sought monotheism while no longer treating the Vedas as sole authority, while the Arya Samaj sought "a revival of Vedic authority".

{{image: Swami Vivekananda at the Parliament of the World's Religions | Vivekananda in Chicago in 1893, the year he addressed the World's Parliament of Religions.}}

Swami Vivekananda (1863–1902), born Narendranath Datta in Calcutta, passed through Keshab's circle before meeting the mystic Ramakrishna, probably in November 1881. At the World's Parliament of Religions in Chicago, which opened on 11 September 1893, he began "Sisters and Brothers of America" and, in the *Complete Works* text, declared himself "proud to belong to a religion which has taught the world both tolerance and universal acceptance". (A two-minute ovation from about seven thousand people is reported only in a popular biography.) He founded the Ramakrishna Mission in 1897. He took Śaṅkara's Advaita, the non-dualist Vedānta in which the self and Brahman are one, as the essence of Hinduism, but read it as grounding service to human beings as manifestations of the divine, and held all religions to be paths to one goal. The anthropologist Agehananda Bharati judged that "modern Hindus derive their knowledge of Hinduism from Vivekananda, directly or indirectly".

The sharpest philosophical criticism, the one promised in *Vedānta: Śaṅkara, Rāmānuja and Madhva*, is Rambachan's (*The Limits of Scripture*, 1994):

1. In Śaṅkara's Advaita, *śruti*, the revealed Upaniṣads, is the *pramāṇa*, the valid means of knowing Brahman; understanding the texts removes ignorance and liberates.
2. Vivekananda made personal experience, above all *samādhi* (meditative absorption), the primary means and final authority, with the Vedas secondary.
3. So his Advaita is not Śaṅkara's but a reinterpretation.
4. It is also a weaker one, because claims to experience, unlike texts, cannot be publicly checked.

James Madaio replies that a reduced role for scripture and an emphasis on direct experience are already present in medieval Advaitic literature such as the *Vivekacūḍāmaṇi*, and that the yogic Advaita of texts like the *Yoga Vāsiṣṭha* also shaped Vivekananda; calling him a rupture overstates his novelty. Ayon Maharaj (Swami Medhananda) attacks the very label "Neo-Vedānta": it is vague, "misleadingly implies novelty", and is "indelibly colored by" the polemical use of Paul Hacker, who borrowed "Neo-Hinduism" from the Jesuit Robert Antoine. Wilhelm Halbfass, more sympathetically, defined Neo-Hinduism as "the adoption of Western concepts and standards" and the reinterpretation of tradition in their light, but noted the term's "obvious" polemical undertone. At stake is whether a modern reinterpretation betrays a tradition or shows it alive.

## Critics of Caste and of Civilisation

Not every critic came from the upper castes who led the "Bengal Renaissance", a phrase historians have viewed more critically since the 1970s. Jotirao Phule (1827–1890), of the Mali caste, opened a girls' school in Pune with Savitribai Phule in 1848 and published *Gulamgiri* ("Slavery", 1873), recasting the Aryan-invasion theory so that the Aryans became conquerors who had instituted caste. Pandita Ramabai (1858–1922), the first woman to be given the titles *Paṇḍitā* and *Sarasvatī*, wrote *The High Caste Hindu Woman* (1887) and opened a home for child widows in Pune.

B. R. Ambedkar (1891–1956), a Dalit who studied at Columbia under the influence of John Dewey, wrote *Annihilation of Caste* (1936) as an address for a Lahore reform society, which withdrew its invitation over the text; he published it himself. His argument: defenders call caste a useful division of labour, but such a division is efficient only when work follows choice and aptitude, whereas caste assigns work by birth and forbids change. It is "not merely a division of labour but a division of labourers", graded in hierarchy. "Caste has killed public spirit. Caste has destroyed the sense of public charity. Caste has made public opinion impossible." Because it rests on religious teaching, "the enemy, you must grapple with, is not the people who observe Caste, but the *Shastras*". Gandhi answered in *Harijan* in July 1936 ("A Vindication of Caste"), defending Ambedkar's right to speak; Ambedkar's second edition (1937) printed his reply to Gandhi.

Gandhi's *Hind Swaraj* (1909), a dialogue between "Reader" and "Editor" written aboard ship in Gujarati (that version was banned in India in 1910) and translated into English by Gandhi himself, argued that self-rule is not a change of rulers. Some, he wrote, want English rule without the Englishman; the result, he wrote, would be "not Hindustan but Englishtan. This is not the Swaraj I want." India "is being ground down, not under the English heel, but under that of modern civilization"; true *swaraj* needs self-rule and a rejection of that civilisation. Rabindranath Tagore (1861–1941) disputed non-cooperation with him in 1921, the "cult of the charkha" in 1925 and, in 1934, Gandhi's reading of the Bihar earthquake as divine punishment for untouchability. K. C. Bhattacharyya (1875–1949), author of *Subject as Freedom* (1930), named a subtler bondage in "Svaraj in Ideas", a lecture of the late 1920s or 1931 (the date is disputed) published after his death: "cultural subjection is ordinarily of an unconscious character and it implies slavery from the very start". Gandhi and Ambedkar in full belong to *Modern Chinese and Indian Philosophy*.

## Muslim Modernism

After the revolt of 1857 Sayyid Ahmad Khan (1817–1898) wrote on its causes, founded at Aligarh (1875) the school that became the Muhammadan Anglo-Oriental College and read Darwin as a theistic evolutionist. His guiding principle, in one secondary account, was that since nature is God's work and revelation God's word, the two cannot contradict each other, so agreement with nature tests a true religion. Jamāl al-Dīn al-Afghānī (1838/39–1897), a pan-Islamist, wrote a *Refutation of the Materialists* (1881) and, with his former student Muḥammad ʿAbduh (1849–1905), published *al-ʿUrwa al-wuthqā* in Paris in 1884. When Ernest Renan lectured at the Sorbonne in 1883 on "Islam and Science", al-Afghānī replied in the *Journal des Débats*, conceding that Islam, like all religions, had stifled science, but defending the Arabs' contribution to it. ʿAbduh, later Grand Mufti of Egypt, was a central figure of the Arab *Nahda* (renaissance).

Muhammad Iqbal (1877–1938) studied at Cambridge, at Heidelberg and for a doctorate at Munich (1907/08). His lectures *The Reconstruction of Religious Thought in Islam* (1930; enlarged 1934) treated *ijtihād*, independent reasoning in law, as "the principle of movement" in Islam. When R. A. Nicholson, translating his Persian poem *Asrar-i Khudi* in 1920, said it owed much to Nietzsche and Bergson, Iqbal denied the debt, as the chapter on *Nietzsche* records.

```checkpoint
q: What is the most accurate account of Rammohun Roy's role in ending sati?
a*: He was a leading Indian campaigner; the ban was a British regulation of 1829 that followed campaigns by missionaries and reformers, and was upheld by the Privy Council.
a: He abolished sati by decree as envoy of the Mughal emperor.
x: Roy had no power to legislate; Regulation XVII was passed by Governor-General Bentinck in Council.
a: He opposed the ban because it interfered with religion.
x: That was the position of Radhakanta Deb and the Dharma Sabha, who appealed against the ban.
a: He persuaded Debendranath Tagore to found the Brahmo Sabha to campaign for abolition.
x: Debendranath joined the Brahmo movement only in 1842–43, after Roy's death.
hint: Who passed Regulation XVII, and who appealed against it?
why: Sources credit evangelicals such as Carey and reformers such as Roy; Bentinck's Regulation was upheld four votes to three.
---
q: What is Rambachan's central objection to Vivekananda's Advaita?
a: That Vivekananda rejected Advaita in favour of dualism.
x: Vivekananda took Śaṅkara's Advaita as the essence of Hinduism.
a: That Vivekananda invented the idea of experience, which no medieval text mentions.
x: That is closer to what Madaio denies on Vivekananda's behalf; Rambachan's point concerns which means of knowledge is primary.
a*: That he made personal experience, not scripture, the primary means of knowing Brahman, which departs from Śaṅkara and cannot be publicly checked.
a: That he relied too heavily on the Vedas and ignored experience.
x: Rambachan argues the reverse: the Vedas became secondary.
hint: What is the pramāṇa in Śaṅkara's Advaita?
why: For Śaṅkara the Upaniṣads are the valid means of knowing Brahman; Rambachan holds that Vivekananda's shift to samādhi changed the system.
```

## Meiji Japan: Naming Philosophy

After the Meiji Restoration of 1868, Japan's "Meiji Enlightenment" was drawn to Comte's positivism, Mill's utilitarianism and Rousseau; later, through Tokyo Imperial University's ties with Germany, Kant dominated (see *The Meiji Restoration*). Nishi Amane (1829–1897), who studied at Leiden in the 1860s, coined *tetsugaku* for Dutch *filosofie* by 1867, although it first appeared in print in 1874; it became the word for philosophy in Chinese, Korean and Vietnamese (see *What Is Philosophy?*). Nishi used it to separate Western philosophy from Eastern thought. In 1873–74 he and others, including Fukuzawa Yukichi, formed the Meirokusha (Meiji 6 Society), whose journal stopped after the press laws of 1875.

Fukuzawa (1835–1901) founded Keiō and wrote best-sellers on the West. *An Encouragement of Learning* (1872–76) opens with a saying, not a personal claim; a common rendering is "It is said that heaven does not create one man above or below another man." The notorious editorial "Datsu-A ron" ("Leaving Asia", 1885), which urged Japan to "leave the ranks of Asian nations and cast our lot with civilized nations of the West", was unsigned; it is probably his, but a 1996 linguistic study named a possible other author, and it went almost unnoticed until the 1950s.

Others pulled different ways. Nakae Chōmin (1847–1901) translated and popularised Rousseau, and his *Discourse by Three Drunkards on Government* (1887) set a Western-minded gentleman against a samurai expansionist and the drinker Master Nankai. Inoue Tetsujirō (1855–1944), Japan's first native-born professor of philosophy, lent philosophy to the nationalist *kokutai* doctrine. Inoue Enryō (1858–1919), a Buddhist priest, in 1885 honoured Buddha, Confucius, Socrates and Kant as "Four Sages". Okakura Kakuzō (1863–1913), writing in English, opened *The Ideals of the East* (1903) with "Asia is one", and in *The Awakening of Japan* (1904) wrote that "the glory of the West is the humiliation of Asia". In China, Yan Fu translated Huxley and Mill and named the translator's three difficulties: "faithfulness, expressiveness, and elegance".

The bridge to what followed is Nishida Kitarō's *An Inquiry into the Good* (1911). Its "pure experience" comes before any split into subject and object: "the moment of seeing a color or hearing a sound", before judgment (tr. Masao Abe and Christopher Ives). It shows the influence of William James (see *American Pragmatism: Peirce, James and Dewey*), yet stresses experience that belongs to no individual. Nishida's later work is told in *The Kyoto School and Modern Japanese Philosophy*.

## Latin America: Order, Progress and the Revolt of the Spirit

In Latin America's nation-building, the SEP says, "the ideology of choice was a version of positivism", a mixture of Comte, Spencer and Haeckel. Auguste Comte (1798–1857) held that thought passes through theological, metaphysical and positive (scientific) stages, and from 1847 his motto was "Love as principle, order as basis, progress as end". When Brazil's republic was proclaimed in 1889, its new flag, designed by the positivist Raimundo Teixeira Mendes, carried "order and progress"; Brazilian followers later raised a statue of Humanity at his grave in Paris.

In Mexico, Gabino Barreda (1818–1881), who had encountered Comte's ideas in Paris, read his country's history through the three stages in his "Civic Oration" (1867). The civil wars were the clash of the theological and metaphysical stages; the Liberal victory under Juárez opened the positive stage; so education must be scientific, and his Escuela Nacional Preparatoria dropped theology. True freedom, he held, is constrained by law, like a falling body; he recast Comte's motto as "Liberty as the means; order as the base; progress as the end". Positivism later served Porfirio Díaz's dictatorship, advised by technocrats called *científicos*. Leopoldo Zea's study of Mexican positivism (1943–44; in English *Positivism in Mexico*) read the movement as history rather than as timeless doctrine (see *Latin America after Independence*).

Earlier liberals had set the terms. Domingo Faustino Sarmiento's *Facundo* (1845) opposed "civilisation" (Europe, cities) to "barbarism" (gauchos, caudillos), and Juan Bautista Alberdi's *Bases* (1852) argued that "to govern is to populate" through European immigration. José Martí (1853–1895), in "Nuestra América" (1891), was among the earliest critics of positivism: where positivists blamed "backwardness" on race, he blamed international policies, gave Indigenous, mestizo and Black Americans a place beside creoles, and warned against imitating Europe or the United States. The battle, he wrote, was not between civilisation and barbarism but between false learning and nature. José Enrique Rodó's *Ariel* (1900) set Ariel's spirit against Caliban's utilitarian materialism, associated with the United States. In Mexico City the Ateneo de la Juventud (1909), born of Antonio Caso's lectures on positivism, held humans "free, creative, and spiritual". José Vasconcelos's *La raza cósmica* (1925) imagined a mixed "cosmic race"; it was meant against social Darwinism, but critics find a "eugenics of aesthetics" and racist passages in it. The story continues in *Latin American Philosophy and the Philosophy of Liberation*.

## The Black Atlantic

Frederick Douglass (c. 1817/18–1895) asked a Rochester audience on 5 July 1852, "What, to the American slave, is your 4th of July?" A recurring argument of his, set out in his narratives, turned the slaveholders' laws against them. Apologists said the enslaved were beasts, so slavery wronged no one; yet slave states punished slaves for rebellion, forbade teaching them to read and encouraged their Christianisation. Such laws make sense only for responsible, rational moral agents, so slaveholders' own practice shows their "guilty knowledge" of the slave's humanity.

Martin Delany (1812–1885), dismissed from Harvard Medical School after white students protested, argued for emigration in 1852. Alexander Crummell (1819–1898), educated at Cambridge, taught moral philosophy in Liberia and co-founded the American Negro Academy in 1897. Edward Wilmot Blyden (1832–1912), refused by American seminaries because of his race, emigrated to Liberia, articulated an "African Personality" and argued in *Christianity, Islam and the Negro Race* (1887) that Islam unified Africans better than Christianity. The Haitian Anténor Firmin (1850–1911), silenced by racist comments at the Paris Anthropological Society, replied with *The Equality of the Human Races* (1885), a positivist rebuttal of Gobineau: any ranking of races needs a reliable measure of intelligence, brain size and skull indices are not one, so the ranking collapses, and Egypt and Haiti stand as counter-evidence.

Women argued from inside both race and sex. Anna Julia Cooper (1858–1964), born enslaved, wrote *A Voice from the South* (1892), called the first book-length Black feminist text: "Only the BLACK WOMAN can say 'when and where I enter … then and there the whole Negro race enters with me.'" Ida B. Wells (1862–1931) documented lynching in *Southern Horrors* (1892). Booker T. Washington's Atlanta speech of 1895 accepted segregation for economic gain: "In all things purely social we can be as separate as the fingers, yet one as the hand" (some texts read "In all things that are purely social").

## Du Bois: Race, Double Consciousness and the Color-Line

W. E. B. Du Bois (1868–1963) studied philosophy at Harvard with William James and Santayana, studied in Berlin, and in 1895 became the first Black person to receive a Harvard PhD. In "The Conservation of Races" (1897) he argued:

1. Natural science finds at most two or three physically distinct "families" of humans.
2. Yet history shows spiritually distinct groups, each with its own "message" for humanity.
3. These differences are caused by history, law, religion and habits of thought, not biology.
4. So race should be defined socio-historically: "a vast family of human beings, generally of common blood and language, always of common history, traditions and impulses, who are both voluntarily and involuntarily striving together for the accomplishment of certain more or less vividly conceived ideals of life".
5. Such races should be conserved so that each can make its contribution.

Kwame Anthony Appiah objected (1985; *In My Father's House*, 1992) that the criteria do not pick out Du Bois's eight races, that "common history" silently relies on biological descent, making the definition circular, and that the logic leads to rejecting race altogether: "The truth is that there are no races." Lucius Outlaw replies that Du Bois offered a cluster concept, not necessary and sufficient conditions; Paul Taylor and Ronald Sundstrom that Appiah misreads "common history" and that race is a social kind; Robert Bernasconi that the debate "imposes an alien question", since the essay aimed to give hope when scientists doubted Black people's future.

```quote
It is a peculiar sensation, this double-consciousness, this sense of always looking at one's self through the eyes of others, of measuring one's soul by the tape of a world that looks on in amused contempt and pity. One ever feels his two-ness,—an American, a Negro; two souls, two thoughts, two unreconciled strivings; two warring ideals in one dark body, whose dogged strength alone keeps it from being torn asunder.
W. E. B. Du Bois · The Souls of Black Folk, ch. 1 (1997 Bedford ed.) · 1903
```

Double consciousness, a term already in use that Du Bois first gave his own sense in the *Atlantic Monthly* in 1897 (some quotations print "oneself"), is the experience of seeing oneself through a contemptuous world's eyes; Du Bois hoped "to merge his double self into a better and truer self" in which neither is lost. *The Souls of Black Folk* also declared that "the problem of the twentieth century is the problem of the color-line", in Asia, Africa, the Americas "and the islands of the sea", a global claim Gilroy extended beyond America. Du Bois helped organise the Pan-African Congress of 1919, following Henry Sylvester Williams's London Conference of 1900; further congresses met in 1921, 1923, 1927 and 1945 (see *Modern African History since 1860*, *Race, Colonialism and Philosophy* and *African Philosophy: the Ethnophilosophy Debate and Beyond*).

```checkpoint
q: Which is the strongest statement of Appiah's objection to Du Bois's "Conservation of Races"?
a: Du Bois defined race purely biologically, which science disproves.
x: Du Bois explicitly said the differences were caused by history, law and religion, not biology.
a*: Du Bois's "common history" quietly depends on biological descent, so the socio-historical definition is circular and points towards rejecting race.
a: Du Bois wanted all races to merge into one.
x: He argued that races should be conserved so each could make its contribution.
a: Du Bois ignored history and focused only on language.
x: "Always of common history" is the centre of his definition.
hint: Ask what holds a group's history together over time.
why: Outlaw, Taylor, Sundstrom and Bernasconi reply in different ways, but Appiah's charge is circularity.
---
q: Which statement about Fukuzawa Yukichi is best supported?
a: He signed "Datsu-A ron" and it caused a sensation in 1885.
x: It was unsigned, drew no comment at the time and was largely forgotten until the 1950s.
a: He coined the word tetsugaku.
x: Nishi Amane coined it, by 1867.
a: He rejected all Western learning.
x: He wrote best-selling books on Western conditions and learning.
a*: The famous opening of An Encouragement of Learning presents equality as a saying ("it is said"), not simply his own assertion.
hint: Look at the grammar of the Japanese opening line.
why: The line ends to iu eri, "it is said", which careful readers keep in translation.
```

## Further exploration

- **Nalini Bhushan and Jay L. Garfield, *Minds Without Fear: Philosophy in the Indian Renaissance* (2017).** Indian philosophers writing in English under the Raj, Hindu and Muslim, including chapters on svaraj.
- **Wilhelm Halbfass, *India and Europe: An Essay in Understanding* (1988).** The classic study of India's intellectual encounter with Europe.
- **Anantanand Rambachan, *The Limits of Scripture: Vivekananda's Reinterpretation of the Vedas* (1994).** The critique of Vivekananda's appeal to experience.
- **Thomas P. Kasulis, *Engaging Japanese Philosophy: A Short History* (2017).** A comprehensive history by the SEP author.
- **Leopoldo Zea, *Positivism in Mexico* (Spanish 1943–44; tr. Josephine H. Schulte, 1974).** The founding study of Mexican positivism.
- **Paul Gilroy, *The Black Atlantic: Modernity and Double Consciousness* (1993).** The transatlantic frame and its reading of Du Bois.
- **Robert Gooding-Williams, *In the Shadow of Du Bois: Afro-Modern Political Thought in America* (2009).** Du Bois and Douglass as political philosophers.$empire_master$,
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
  select $empire_quiz$[
    {"type": "mcq", "prompt": "Who coined the Japanese word tetsugaku for 'philosophy', and when did it first appear in print?", "options": ["Nishi Amane; it was coined by 1867 and first printed in 1874", "Fukuzawa Yukichi, in the Meirokusha's journal in 1885", "Inoue Tetsujirō, in his Dictionary of Philosophy of 1881", "Nishida Kitarō, in An Inquiry into the Good (1911)"], "answerIndex": 0, "explanation": "Nishi Amane coined tetsugaku for Dutch filosofie 'sometime in 1867 or earlier', though it first appeared in print in 1874. It became the standard word in Chinese, Korean and Vietnamese, and Nishi used it to separate Western philosophy from Eastern thought.", "id": "q1"},
    {"type": "mcq", "prompt": "What did Gabino Barreda's 'Civic Oration' (1867) claim about Mexican history?", "options": ["That Mexico had always been in the positive stage", "That Mexico should return to Catholic theology to restore order", "That the civil wars were the clash of the theological and metaphysical stages, and the Liberal victory opened the positive stage, so education must be scientific", "That Comte's law of three stages did not apply to Latin America"], "answerIndex": 2, "explanation": "Barreda applied Comte's law of three stages to Mexico. The Liberal victory under Juárez opened the positive stage; his Escuela Nacional Preparatoria removed theology, and he recast Comte's motto as 'Liberty as the means; order as the base; progress as the end'.", "id": "q2"},
    {"type": "mcq", "prompt": "What was Ambedkar's main reason for denying that caste is a sensible division of labour?", "options": ["Caste gives everyone too much freedom to change occupation", "Caste assigns work by birth and forbids changing it, so it is 'a division of labourers', graded in hierarchy, rather than a division of labour by choice and aptitude", "Caste was invented by the British for census purposes", "Division of labour is always inefficient"], "answerIndex": 1, "explanation": "A division of labour is efficient only when work follows choice and aptitude. Caste fixes occupation by birth, which produces forced work and inefficiency; because it rests on the śāstras, Ambedkar held, its religious basis must itself be attacked.", "id": "q3"},
    {"type": "mcq", "prompt": "What was Anténor Firmin's The Equality of the Human Races (1885) mainly arguing against?", "options": ["Comte's positivism", "The Haitian Revolution", "Islam's place in African life", "Gobineau's ranking of races and the craniometry of the Paris anthropologists"], "answerIndex": 3, "explanation": "Firmin, silenced by racist comments at the Société d'Anthropologie de Paris, rebutted Gobineau and Broca: brain size and the cephalic index are not reliable measures of intelligence, so racial rankings built on them fail. The book was itself a positivist work, and it cited Egypt and Haiti as counter-evidence.", "id": "q4"},
    {"type": "open", "prompt": "Set out Rammohun Roy's scriptural argument against sati step by step. Then explain Lata Mani's objection and assess how far a defender of Roy can answer it.", "rubric": "A strong answer gives the premises: a practice binds Hindus only if authoritative scripture enjoins it as a duty; the texts do not enjoin widow-burning as an 'imperative duty' and prefer 'a life of purity and retirement'; so sati is not a duty and may be prohibited without violating religion. It notes that this argument appears in the preamble of Regulation XVII (4 December 1829, passed by Bentinck in Council), that it answered the Dharma Sabha's non-interference objection, and that the Privy Council upheld the ban 4–3; it avoids saying Roy abolished sati, crediting missionaries such as Carey and reformers such as Roy. It explains Mani's objection (Contentious Traditions, 1998): both sides argued over scripture and 'Hindu tradition' while the women were 'marginal to the debate', eyewitness testimony about widows' hardships was ignored, and colonial law relied on pandits' readings. Better answers weigh the tactical reply (the scriptural argument could move a colonial state pledged to non-interference and orthodox opinion; Roy's 'Ancient Female Rights', 1822) against Mani's deeper point.", "id": "q5"},
    {"type": "open", "prompt": "Was Du Bois right to define race socio-historically in 'The Conservation of Races' (1897)? Reconstruct his argument and weigh Appiah's objection against the replies.", "rubric": "A strong answer reconstructs the argument: science finds at most two or three physical 'families'; history shows spiritually distinct groups; their differences come from history, law, religion and habits of thought; so race is 'a vast family of human beings, generally of common blood and language, always of common history, traditions and impulses ...'; such races should be conserved. It states Appiah's objection (1985; In My Father's House, 1992): the criteria do not individuate the eight races, 'common history' covertly relies on biological descent, so the definition is circular, and the logic leads to 'there are no races'. It weighs the replies: Outlaw (a cluster concept), Taylor and Sundstrom (Appiah misreads 'common history'; race as a social kind), Bernasconi (an 'alien question'; the essay aimed to give hope). Credit links to double consciousness, the color-line and Gilroy's Black Atlantic.", "id": "q6"}
  ]$empire_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/nineteenth-century/philosophy-in-an-age-of-empire', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;

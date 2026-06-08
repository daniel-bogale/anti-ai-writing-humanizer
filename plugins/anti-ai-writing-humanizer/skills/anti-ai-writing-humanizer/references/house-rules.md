# House rules — your editable taste

These are the banned words, structures, and style defaults the skill enforces on every pass. This
file is the **single source of truth** and **wins on conflict** with the deep engine. It's also the
**one file you customize** — add your own banned words, loosen a rule you disagree with, tighten one
you care about. Nothing else needs editing; the skill reads this file every time.

The defaults below are a strong starting point distilled from the Wikipedia "Signs of AI writing"
catalog and real-world editing. Make them yours.

## When to apply

- Drafting any message a human will deliver as their own (emails, Slack, DMs, replies, proposals, social posts).
- Editing a draft a human will sign or send.
- Generating outreach copy, replies, or follow-ups.

Skip these rules for: code, code comments, internal logs, and technical docs where precision
overrides voice.

## Hard bans (do not use)

These words and phrases make text immediately read as AI:

- **Verbs**: `delve`, `showcase`, `underscore`, `foster`, `garner`, `enhance`, `leverage`, `align with`, `resonate with`
- **Nouns/adjectives**: `tapestry`, `landscape` (abstract), `realm`, `journey`, `testament`, `pivotal`, `vibrant`, `intricate`, `crucial`, `vital`, `enduring`, `valuable insights`, `key` (as adjective)
- **Sentence openers**: `Additionally,`, `Moreover,`, `Furthermore,`, `It is worth noting that`, `In today's [X] world`
- **Inflation phrases**: `serves as a testament to`, `stands as`, `marks a shift`, `represents a turning point`, `setting the stage for`, `evolving landscape`
- **AI-collaboration voice**: `Let's explore`, `I've outlined`, `Here is your [X]`, `As we can see`
- **Knowledge-cutoff disclaimers**: `As of my last training update`, `up to my knowledge cutoff`, `I cannot verify current developments`, `this may have changed since`. You're writing content, not answering a query — delete them. If a fact may be dated, give the date it's from.
- **Placeholders verbalised**: `This section would discuss…`, `[insert detail here]`

## Structural bans

- **No "Despite its X, Y faces challenges… continues to thrive" formula.** State the issue, stop.
- **No "Not just X, but also Y" / "Not X, but Y" parallelism.** Pick one or rephrase directly.
- **No rule of three for padding** (`keynotes, panels, and networking`). Be specific or say one thing well.
- **No synonym chains** for the same noun across sentences. Repeat the noun.
- **No "from X to Y"** unless X and Y form a real measurable scale.
- **No vague attribution** (`industry reports`, `experts argue`, `observers note`). Name the source or cut.

## Style bans

- **No title case in headings** in casual writing. Use sentence case.
- **No bolding nouns mid-sentence.** Bold only for genuine emphasis.
- **No `• **Header:** Description` bullet lists** unless the content is actually a list. Default to prose.
- **No emoji in headings or bullets** unless the user explicitly uses emoji in this thread.
- **No em dash overuse.** Default to commas, parentheses, or colons. One em dash per message max.
- **Default to `is/are/has/was`.** Don't replace with `serves as`, `features`, `boasts`, `represents`.

## Positive rules

- Lead with the specific fact or ask. Cut throat-clearing.
- If it can be said in 1 sentence, don't write 3.
- Use contractions (`it's`, `don't`, `we're`) — formal phrasing reads as AI in chat.
- Match the recipient's register. If they write short and lowercase, match it.
- One concrete detail beats three abstract ones. (Instead of "great team and exciting roadmap," write "shipped the auth migration last sprint.")
- When you don't know something specific, leave it blank for the human to fill — don't pad with generic positivity.

## Self-check before sending

1. Any banned word from the list above? Replace.
2. Count em dashes — more than one? Cut to commas.
3. Any sentence ending in an `-ing` synthesis clause (`…creating a vibrant community`)? End at the fact.
4. Headings in title case? Convert to sentence case.
5. Any "challenges and future" optimism kicker? Delete.
6. Could a human read this and immediately know it was AI? If yes, redraft.

---

*The full pattern catalog these rules distill is Wikipedia's [Signs of AI writing](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing).*

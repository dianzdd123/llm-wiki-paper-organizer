---

name: paper-organizer

description: Organize many research papers in an Obsidian wiki. Use this skill when the user asks to group papers, rename papers, build a literature review, summarize key contributions, summarize limitations, organize PDFs, create a paper inventory, or rename papers using year-keyword-publisher format.

---



\# Paper Organizer Skill



Use this skill to organize research papers stored in an Obsidian wiki `\_raw` folder.



Default user setup:



\- Repository: <YOUR_OBSIDIAN_VAULT_PATH>

\- Vault: `C:\\Users\\Robot\\Downloads\\LLM-Wiki`

\- Raw papers: `C:\\Users\\Robot\\Downloads\\LLM-Wiki\\\_raw`

\- Inventory file: `C:\\Users\\Robot\\Downloads\\LLM-Wiki\\references\\paper-inventory.md`



\## Main goals



The workflow should:



1\. Scan papers in `\_raw`.

2\. Build a paper inventory.

3\. Detect title, year, journal name or venue, and keywords.

4\. Suggest new filenames in this format:



&#x20;  `YEAR-keyword-journalname.pdf`



5\. Group papers by topic.

6\. Rename and move papers.

7\. Summarize key contributions and limitations.

8\. Create reference notes and synthesis notes.

9\. Update `index.md`, `log.md`, and `.manifest.json`.



\## Safety rules



Always follow these rules:



\- Never delete papers.

\- Never overwrite files.

\- Never rename or move papers before creating an inventory.

\- Never process all papers blindly if there are many files.

\- If metadata is uncertain, write `uncertain`.

\- If year is unknown, use `unknown-year`.

\- If publisher or venue is unknown, use `unknown`.

\- Keep source attribution.

\- Use Obsidian wikilinks.

\- Prefer small batches if there are more than 10 papers.



\## Filename rules



Suggested filenames must be:



\- lowercase

\- hyphen-separated

\- no spaces

\- no special characters

\- maximum 80 characters

\- format: `YEAR-keyword-publisher.pdf`



Examples:



\- `2023-rag-survey-arxiv.pdf`

\- `2024-agent-memory-neurips.pdf`

\- `2022-chain-of-thought-google.pdf`

\- `unknown-year-transformer-survey-unknown.pdf`



If a target filename already exists, append a number:



\- `2024-rag-evaluation-arxiv-2.pdf`

\- `2024-rag-evaluation-arxiv-3.pdf`



\## Default topic groups



Use this taxonomy unless a paper clearly belongs elsewhere:



\- rag

\- agents

\- llm-training

\- fine-tuning

\- alignment-rlhf

\- inference-serving

\- evaluation-benchmarks

\- multimodal-vlm

\- long-context

\- reasoning

\- tool-use

\- security-safety

\- datasets

\- survey

\- uncategorized



\## Phase 1: Inventory only



First create or update:



`C:\\Users\\Robot\\Downloads\\LLM-Wiki\\references\\paper-inventory.md`



For each paper, include a table with:



\- current filename

\- detected title

\- detected year

\- detected venue or publisher

\- 3-5 keywords

\- suggested new filename

\- suggested group/topic

\- confidence: high / medium / low

\- notes / uncertainty



Do not rename or move files in Phase 1.



At the end of Phase 1, report:



1\. number of papers found

2\. number of high-confidence renames

3\. number of medium-confidence renames

4\. number of low-confidence items needing review

5\. proposed topic groups



## Autonomous mode

If the user explicitly says "autonomous", "run automatically", "no approval", or "process everything", run all phases without asking for approval.

In autonomous mode:

1. Create the inventory.
2. Rename and group only high-confidence papers.
3. Keep medium-confidence and low-confidence papers in `uncategorized`.
4. Never delete files.
5. Never overwrite files.
6. If a filename conflict exists, append `-2`, `-3`, etc.
7. If metadata is uncertain, mark it clearly and do not rename that paper.
8. Process papers in batches of 10.
9. After each batch, update `paper-inventory.md`, `log.md`, and `.manifest.json`.
10. Continue until all papers are processed.





\## Phase 2: Rename and group



Run Phase 2 automatically only when the user has requested autonomous mode. Otherwise, wait for approval.



Use the inventory file.



Create topic folders under:



`C:\\Users\\Robot\\Downloads\\LLM-Wiki\\\_raw`



Move and rename only high-confidence and medium-confidence papers.



Low-confidence papers should go to:



`C:\\Users\\Robot\\Downloads\\LLM-Wiki\\\_raw\\uncategorized`



After moving/renaming, update `paper-inventory.md` with:



\- final path

\- rename status

\- group status



Also update:



\- `log.md`

\- `.manifest.json`



\## Phase 3: Summaries and synthesis



For each paper, create one reference note under:



`C:\\Users\\Robot\\Downloads\\LLM-Wiki\\references`



Each reference note should include:



\- title

\- year

\- publisher or venue

\- source file path

\- problem addressed

\- method

\- key contributions

\- limitations

\- datasets or benchmarks

\- related concepts

\- wikilinks



For each topic group, create one synthesis note under:



`C:\\Users\\Robot\\Downloads\\LLM-Wiki\\synthesis`



Filename format:



`topic-literature-review.md`



Each synthesis note should include:



1\. overview of the topic

2\. table of papers

3\. key contribution of each paper

4\. main limitation of each paper

5\. common patterns

6\. contradictions or disagreements

7\. open research questions

8\. recommended reading order

9\. links to individual reference notes



\## Recommended user-facing workflow



When the user says something like:



“Organize my papers”



or:



“Use paper-organizer”



start with Phase 1 only.



Do not rename or move anything until the user approves the inventory.


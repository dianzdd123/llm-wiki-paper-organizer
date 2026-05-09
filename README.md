\# LLM-Wiki Paper Organizer



A reusable workflow and Codex skill for building an Obsidian-based research paper knowledge system.



This project helps you organize a folder of research papers into a structured Obsidian wiki. It can create a paper inventory, rename high-confidence papers, group papers by topic, create reference notes, summarize key contributions and limitations, and generate topic-level literature reviews.



The workflow is designed to work with:



\- \[Obsidian](https://obsidian.md/)

\- \[OpenAI Codex CLI](https://developers.openai.com/codex/)

\- \[Ar9av/obsidian-wiki](https://github.com/Ar9av/obsidian-wiki)

\- A custom reusable Codex skill: `paper-organizer`



\---



\## What This Project Does



This project provides a reusable paper organization workflow for an Obsidian vault.



It can help you:



\- Scan research papers in an Obsidian `\_raw` folder

\- Build a structured paper inventory

\- Detect paper title, year, venue or publisher, and keywords

\- Suggest clean filenames in the format:



```text

YEAR-keyword-publisher.pdf

```



Example:



```text

2023-rag-survey-arxiv.pdf

2024-agent-memory-neurips.pdf

2022-chain-of-thought-google.pdf

```



\- Group papers by topic

\- Create Obsidian reference notes

\- Summarize each paper’s key contributions

\- Summarize each paper’s limitations

\- Create topic-level literature review notes

\- Add Obsidian `\[\[wikilinks]]`

\- Update wiki files such as:



```text

index.md

log.md

hot.md

.manifest.json

references/paper-inventory.md

```



\---



\## Why This Exists



Research paper folders can quickly become messy:



```text

download.pdf

attention\_is\_all\_you\_need.pdf

2305.12345.pdf

paper-final-v2.pdf

rag-survey-copy.pdf

```



This project turns that mess into a structured research wiki:



```text

LLM-Wiki

├── \_raw

│   ├── rag

│   │   └── 2023-rag-survey-arxiv.pdf

│   ├── agents

│   │   └── 2024-agent-memory-neurips.pdf

│   └── uncategorized

├── references

│   ├── paper-inventory.md

│   ├── retrieval-augmented-generation-survey.md

│   └── agent-memory-systems.md

├── synthesis

│   ├── rag-literature-review.md

│   └── agents-literature-review.md

├── concepts

├── projects

├── index.md

├── log.md

└── .manifest.json

```



The goal is not just file organization. The goal is to build a reusable research memory system.



\---



\## Repository Structure



```text

llm-wiki-paper-organizer/

├── README.md

├── LICENSE

├── .gitignore

├── docs/

│   └── llm-wiki-paper-organizer-tutorial.md

├── .skills/

│   └── paper-organizer/

│       └── SKILL.md

├── examples/

│   ├── sample-paper-inventory.md

│   ├── sample-reference-note.md

│   └── sample-synthesis-note.md

└── scripts/

&#x20;   └── install-paper-organizer.ps1

```



\### Important Files



| File | Purpose |

|---|---|

| `README.md` | Main project documentation |

| `.skills/paper-organizer/SKILL.md` | Reusable Codex skill |

| `docs/llm-wiki-paper-organizer-tutorial.md` | Full setup tutorial |

| `examples/sample-paper-inventory.md` | Example inventory output |

| `examples/sample-reference-note.md` | Example paper reference note |

| `examples/sample-synthesis-note.md` | Example literature review note |

| `scripts/install-paper-organizer.ps1` | Windows install script for the Codex skill |



\---



\## Requirements



\### Required



\- Windows, macOS, or Linux

\- Git

\- Obsidian

\- Codex CLI

\- An Obsidian vault

\- The `obsidian-wiki` repository



\### Recommended



\- VS Code

\- PowerShell on Windows

\- ChatGPT account login for Codex

\- A separate Obsidian vault for research papers



\---



\## Example Windows Setup



This project was originally designed around the following Windows setup:



```text

Repository:

C:\\Users\\Robot\\Downloads\\obsidian-wiki



Obsidian vault:

C:\\Users\\Robot\\Downloads\\LLM-Wiki



Raw papers:

C:\\Users\\Robot\\Downloads\\LLM-Wiki\\\_raw



Codex skill:

C:\\Users\\Robot\\.codex\\skills\\paper-organizer\\SKILL.md

```



You should replace these paths with your own paths.



\---



\## Install



\### 1. Clone This Repository



```powershell

cd C:\\Users\\YourName\\Downloads

git clone https://github.com/YOUR\_USERNAME/llm-wiki-paper-organizer.git

cd llm-wiki-paper-organizer

```



Replace `YOUR\_USERNAME` with your GitHub username.



\---



\### 2. Install the Paper Organizer Skill



Run:



```powershell

.\\scripts\\install-paper-organizer.ps1

```



This copies:



```text

.skills/paper-organizer/SKILL.md

```



to:



```text

$HOME\\.codex\\skills\\paper-organizer\\SKILL.md

```



On Windows, that usually means:



```text

C:\\Users\\YourName\\.codex\\skills\\paper-organizer\\SKILL.md

```



Restart Codex after installing the skill.



\---



\## Manual Skill Installation



If you do not want to use the script, copy the skill manually:



```powershell

New-Item -ItemType Directory -Force $HOME\\.codex\\skills\\paper-organizer



Copy-Item .\\.skills\\paper-organizer\\SKILL.md `

&#x20; $HOME\\.codex\\skills\\paper-organizer\\SKILL.md `

&#x20; -Force

```



Then restart Codex.



\---



\## Skill File Format



A valid Codex skill must start with YAML frontmatter:



```markdown

\---

name: paper-organizer

description: Organize research papers in an Obsidian wiki by inventorying PDFs, renaming high-confidence papers to year-keyword-publisher, grouping papers by topic, and summarizing each paper's key contributions and limitations.

\---

```



If Codex shows this error:



```text

missing YAML frontmatter delimited by ---

```



then your `SKILL.md` is malformed. Make sure the file starts exactly with:



```markdown

\---

name: paper-organizer

description: ...

\---

```



\---



\## Obsidian Vault Setup



Create or choose an Obsidian vault.



Recommended structure:



```text

LLM-Wiki

├── \_raw

├── concepts

├── entities

├── skills

├── references

├── synthesis

├── journal

├── projects

├── \_archives

├── index.md

├── log.md

├── hot.md

└── .manifest.json

```



The most important folder is:



```text

\_raw

```



Put your research papers there.



Example:



```text

LLM-Wiki

└── \_raw

&#x20;   ├── paper1.pdf

&#x20;   ├── paper2.pdf

&#x20;   └── paper3.pdf

```



\---



\## Recommended Workflow



The workflow has four phases.



\---



\### Phase 1: Paper Inventory



The skill scans PDFs in `\_raw` and creates:



```text

references/paper-inventory.md

```



The inventory contains:



| Column | Meaning |

|---|---|

| Current filename | Original PDF filename |

| Detected title | Paper title detected from the document |

| Detected year | Publication year |

| Venue / publisher | arXiv, NeurIPS, ACL, ICML, etc. |

| Keywords | 3–5 topic keywords |

| Suggested filename | Clean filename in `YEAR-keyword-publisher.pdf` format |

| Group | Suggested topic folder |

| Confidence | high / medium / low |

| Notes | Uncertainty or missing metadata |



Example:



```markdown

| Current Filename | Detected Title | Year | Venue | Keywords | Suggested Filename | Group | Confidence | Notes |

|---|---:|---|---|---|---|---|---|---|

| 2305.12345.pdf | Retrieval-Augmented Generation Survey | 2023 | arxiv | rag, retrieval, llm | 2023-rag-survey-arxiv.pdf | rag | high | Metadata found in title page |

```



\---



\### Phase 2: Rename and Group



The skill can rename high-confidence papers using this format:



```text

YEAR-keyword-publisher.pdf

```



Rules:



\- lowercase

\- hyphen-separated

\- no spaces

\- no special characters

\- maximum 80 characters

\- do not overwrite files

\- do not rename uncertain papers



Example:



```text

Before:

2305.12345.pdf



After:

2023-rag-survey-arxiv.pdf

```



The skill also groups papers into topic folders:



```text

\_raw

├── rag

├── agents

├── llm-training

├── fine-tuning

├── alignment-rlhf

├── inference-serving

├── evaluation-benchmarks

├── multimodal-vlm

├── long-context

├── reasoning

├── tool-use

├── security-safety

├── datasets

├── survey

└── uncategorized

```



Uncertain papers go to:



```text

\_raw/uncategorized

```



\---



\### Phase 3: Reference Notes



For each paper, the skill creates a reference note under:



```text

references/

```



Example:



```text

references/retrieval-augmented-generation-survey.md

```



Each reference note should include:



```markdown

\# Paper Title



\## Summary



\## Key Contributions



\## Limitations



\## Methods



\## Datasets or Benchmarks



\## Related Concepts



\## Source

```



Example:



```markdown

\# Retrieval-Augmented Generation Survey



\## Summary



This paper surveys retrieval-augmented generation methods for improving the factuality and adaptability of large language models.



\## Key Contributions



\- Provides a taxonomy of RAG architectures.

\- Compares retrieval, reranking, and generation strategies.

\- Discusses evaluation challenges for retrieval-augmented systems.



\## Limitations



\- Survey coverage may become outdated quickly.

\- Some benchmarks are not directly comparable.

\- The paper does not provide a unified experimental framework.



\## Related Concepts



\- \[\[retrieval-augmented-generation]]

\- \[\[llm-evaluation]]

\- \[\[vector-databases]]



\## Source



`\_raw/rag/2023-rag-survey-arxiv.pdf`

```



\---



\### Phase 4: Topic Literature Reviews



For each topic group, the skill creates a synthesis note under:



```text

synthesis/

```



Example:



```text

synthesis/rag-literature-review.md

```



Each synthesis note should include:



```markdown

\# RAG Literature Review



\## Overview



\## Table of Papers



\## Key Contributions by Paper



\## Main Limitations by Paper



\## Common Patterns



\## Contradictions or Disagreements



\## Open Research Questions



\## Recommended Reading Order



\## Related Reference Notes

```



Example table:



```markdown

| Paper | Year | Key Contribution | Main Limitation |

|---|---:|---|---|

| \[\[retrieval-augmented-generation-survey]] | 2023 | Taxonomy of RAG methods | Survey may become outdated |

| \[\[rag-evaluation-benchmark]] | 2024 | Introduces RAG evaluation benchmark | Limited domain coverage |

```



\---



\## Usage



\### Start Codex



From your workspace folder:



```powershell

cd C:\\Users\\YourName\\Downloads

codex

```



\---



\### Run the Paper Organizer Skill



Inside Codex:



```text

Use the paper-organizer skill in autonomous mode.



Vault:

C:\\path\\to\\your\\LLM-Wiki



Raw papers:

C:\\path\\to\\your\\LLM-Wiki\\\_raw



Run the full paper organization workflow:



1\. Create or update paper inventory.

2\. Rename only high-confidence papers to YEAR-keyword-publisher.pdf.

3\. Group papers by topic.

4\. Keep uncertain papers in uncategorized.

5\. Create reference notes.

6\. Create topic literature-review notes.

7\. Summarize key contributions and limitations.

8\. Update index.md, log.md, hot.md, .manifest.json, and paper-inventory.md.



Rules:

\- Do not delete anything.

\- Do not overwrite anything.

\- Do not rename uncertain papers.

\- Do not invent metadata.

\- Use source attribution.

\- Use Obsidian \[\[wikilinks]].

\- Process in batches of 10.

\- At the end, report all files created or changed.

```



\---



\## Safer Non-Autonomous Usage



If you want to review before renaming files, use this:



```text

Use the paper-organizer skill.



Start with Phase 1 only.



Create the paper inventory.

Do not rename files.

Do not move files.

Do not delete anything.



After creating the inventory, stop and list uncertain papers.

```



Then review:



```text

references/paper-inventory.md

```



After checking the inventory, ask Codex:



```text

Use the paper-organizer skill.



I approve Phase 2 for high-confidence papers only.



Rename and group high-confidence papers according to paper-inventory.md.

Keep medium-confidence and low-confidence papers in uncategorized.

Do not delete anything.

Do not overwrite anything.

```



\---



\## Safety Rules



This workflow is designed to be conservative.



Default safety rules:



\- Never delete papers

\- Never overwrite files

\- Never rename uncertain papers

\- Never invent metadata

\- Always mark uncertainty

\- Always preserve source attribution

\- Use `uncategorized` for unclear papers

\- Use Obsidian `\[\[wikilinks]]`

\- Process in batches of 10

\- Report all files created or changed



\---



\## What Not to Upload to GitHub



Do not upload your private or copyrighted research content.



Do not upload:



```text

\_raw/

\*.pdf

LLM-Wiki/

references/

synthesis/

concepts/

entities/

journal/

projects/

\_archives/

.env

.manifest.json

log.md

hot.md

```



Unless you are absolutely sure the content is public and safe to share.



\---



\## Recommended `.gitignore`



```gitignore

\# Secrets

.env

\*.env

.env.\*



\# Raw papers / copyrighted files

\_raw/

\*.pdf



\# Private wiki output

LLM-Wiki/

references/

synthesis/

concepts/

entities/

journal/

projects/

\_archives/

.manifest.json

log.md

hot.md



\# Obsidian workspace state

.obsidian/workspace.json

.obsidian/workspace-mobile.json



\# Python / virtual environments

\_\_pycache\_\_/

\*.pyc

.venv/

.wiki/

.ipynb\_checkpoints/



\# Node

node\_modules/



\# OS files

.DS\_Store

Thumbs.db

```



\---



\## Example Prompt: Tidy Existing References



If you already have reference notes and want to clean them:



```text

Use the wiki-update skill.



Task:

Tidy up the references section of my Obsidian wiki.



Vault:

C:\\path\\to\\your\\LLM-Wiki



References folder:

C:\\path\\to\\your\\LLM-Wiki\\references



Please:

\- scan all Markdown files under references/

\- merge obvious duplicate reference notes

\- standardize frontmatter

\- standardize headings

\- add missing source paths when available

\- add useful \[\[wikilinks]]

\- create or update references/reference-index.md

\- update index.md, log.md, hot.md, and .manifest.json

\- do not delete anything

\- do not overwrite unrelated content

\- list every file created or changed

```



\---



\## Example Prompt: Use With Ar9av/obsidian-wiki



If you are using this with `Ar9av/obsidian-wiki`, start Codex in a folder that can access both the repo and your vault.



Example:



```powershell

cd C:\\Users\\YourName\\Downloads

codex

```



Then:



```text

Use the paper-organizer skill.



Repository:

C:\\Users\\YourName\\Downloads\\obsidian-wiki



Vault:

C:\\Users\\YourName\\Downloads\\LLM-Wiki



Raw papers:

C:\\Users\\YourName\\Downloads\\LLM-Wiki\\\_raw



Run the paper organization workflow.

Do not delete anything.

Do not overwrite anything.

Use Obsidian \[\[wikilinks]].

```



\---



\## Troubleshooting



\### Codex says the skill is invalid



Error:



```text

missing YAML frontmatter delimited by ---

```



Fix:



Make sure your `SKILL.md` starts with:



```markdown

\---

name: paper-organizer

description: Organize research papers in an Obsidian wiki by inventorying PDFs, renaming high-confidence papers to year-keyword-publisher, grouping papers by topic, and summarizing each paper's key contributions and limitations.

\---

```



\---



\### Codex does not use the skill



Try explicitly saying:



```text

Use the paper-organizer skill.

```



Also restart Codex after installing or editing the skill.



\---



\### Codex tries to rename too many files



Use the non-autonomous prompt:



```text

Start with Phase 1 only.

Create the inventory.

Do not rename or move files.

```



\---



\### Codex invents metadata



Add this rule to your prompt:



```text

Do not invent metadata. If title, year, venue, publisher, or dataset is unclear, write "uncertain" or "not found".

```



\---



\### Codex cannot find the vault



Use absolute paths:



```text

Vault:

C:\\Users\\YourName\\Downloads\\LLM-Wiki



Raw papers:

C:\\Users\\YourName\\Downloads\\LLM-Wiki\\\_raw

```



\---



\## Roadmap



Possible future improvements:



\- Add a Python script to extract PDF metadata

\- Add duplicate detection by DOI or title

\- Add BibTeX export

\- Add Zotero integration

\- Add DOI lookup

\- Add citation graph generation

\- Add paper ranking by importance

\- Add reading queue generation

\- Add topic clustering

\- Add Obsidian Dataview templates



\---



\## License



MIT License.



See `LICENSE` for details.



\---



\## Disclaimer



This project does not include research papers or copyrighted PDFs.



Users are responsible for ensuring they have the right to store, process, and share any papers they place in their Obsidian vault.



The skill may generate summaries and metadata automatically. Always verify important academic details manually before citation or publication.


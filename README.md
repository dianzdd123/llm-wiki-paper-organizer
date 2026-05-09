# LLM-Wiki Paper Organizer

A reusable Codex skill for organizing research papers into an Obsidian-based LLM research wiki.

This project focuses on one main function:

> **Paper organization**: scan papers, build an inventory, rename high-confidence PDFs, group papers by topic, create reference notes, summarize key contributions and limitations, and generate topic-level literature reviews.

This repository is designed to be reusable. It uses placeholder paths such as `C:\Users\YourName\Documents\LLM-Wiki` instead of personal paths like `C:\Users\Robot\Downloads\LLM-Wiki`.

---

## 1. What This Project Does

The `paper-organizer` skill helps turn a messy research paper folder into a structured Obsidian knowledge base.

It can:

- Scan research papers in an Obsidian `_raw` folder
- Create or update a paper inventory
- Detect paper title, year, venue or publisher, and keywords
- Suggest clean filenames in the format `YEAR-keyword-publisher.pdf`
- Rename only high-confidence papers
- Group papers by topic
- Keep uncertain papers in `uncategorized`
- Create one reference note per paper
- Summarize each paper's key contributions
- Summarize each paper's limitations
- Extract methods, datasets, benchmarks, and related concepts
- Create topic-level literature review notes
- Add Obsidian `[[wikilinks]]`
- Update `index.md`, `log.md`, `hot.md`, `.manifest.json`, and `references/paper-inventory.md`

---

## 2. Example: Before and After

### Before

```text
_raw/
├── 2305.12345.pdf
├── download.pdf
├── paper-final-v2.pdf
├── attention_is_all_you_need.pdf
└── rag-survey-copy.pdf
```

### After

```text
LLM-Wiki/
├── _raw/
│   ├── rag/
│   │   └── 2023-rag-survey-arxiv.pdf
│   ├── agents/
│   │   └── 2024-agent-memory-neurips.pdf
│   ├── reasoning/
│   │   └── 2022-chain-of-thought-google.pdf
│   └── uncategorized/
├── references/
│   ├── paper-inventory.md
│   ├── rag-survey.md
│   ├── agent-memory-systems.md
│   └── chain-of-thought-prompting.md
├── synthesis/
│   ├── rag-literature-review.md
│   ├── agents-literature-review.md
│   └── reasoning-literature-review.md
├── concepts/
├── index.md
├── log.md
├── hot.md
└── .manifest.json
```

---

## 3. Recommended Architecture

```text
Codex CLI
↓
paper-organizer skill
↓
Obsidian vault
↓
Markdown paper notes + literature reviews + Graph View
```

Example professional Windows layout:

```text
C:\Users\YourName\Documents
├── LLM-Wiki/                      # Your Obsidian vault
│   ├── _raw/                      # Put PDFs and raw files here
│   ├── references/                # Paper notes and inventory
│   ├── synthesis/                 # Topic literature reviews
│   ├── concepts/                  # Concept notes
│   ├── index.md
│   ├── log.md
│   ├── hot.md
│   └── .manifest.json
└── llm-wiki-paper-organizer/      # This GitHub repository
    ├── README.md
    ├── .skills/
    │   └── paper-organizer/
    │       └── SKILL.md
    ├── examples/
    └── scripts/
```

> Replace `YourName` with your actual Windows username.  
> Do not copy `C:\Users\YourName` literally.

For example, if your Windows username is `Alice`, your vault might be:

```text
C:\Users\Alice\Documents\LLM-Wiki
```

If your Windows username is `Bob`, your vault might be:

```text
C:\Users\Bob\Documents\LLM-Wiki
```

---

## 4. Repository Structure

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
    └── install-paper-organizer.ps1
```

Important files:

| File | Purpose |
|---|---|
| `README.md` | Main GitHub documentation |
| `.skills/paper-organizer/SKILL.md` | Reusable Codex skill |
| `docs/llm-wiki-paper-organizer-tutorial.md` | Optional full tutorial |
| `examples/sample-paper-inventory.md` | Example inventory output |
| `examples/sample-reference-note.md` | Example paper reference note |
| `examples/sample-synthesis-note.md` | Example literature review note |
| `scripts/install-paper-organizer.ps1` | Windows install script |

---

## 5. Key Concepts

### 5.1 Obsidian Vault

An Obsidian vault is simply a folder of Markdown files.

Example:

```text
C:\Users\YourName\Documents\LLM-Wiki
```

Obsidian displays this folder as a note-taking knowledge base. Notes can link to each other using `[[wikilinks]]`.

---

### 5.2 Codex CLI

Codex CLI is the terminal agent that reads files, edits files, and runs commands.

Install Codex with npm:

```powershell
npm install -g @openai/codex
```

Check installation:

```powershell
codex --version
```

Log in:

```powershell
codex login
```

Start Codex:

```powershell
codex
```

If you are using your ChatGPT account, normally use:

```powershell
codex
```

Do **not** use local model flags unless you intentionally want Ollama or another local model.

Local model example:

```powershell
codex --oss -m qwen3-coder:30b
```

Normal ChatGPT-account usage:

```powershell
codex
```

---

### 5.3 Codex Skill

A Codex skill is a reusable instruction folder.

This project provides:

```text
.skills/
└── paper-organizer/
    └── SKILL.md
```

The file must be named exactly:

```text
SKILL.md
```

A valid `SKILL.md` must start with YAML frontmatter:

```markdown
---
name: paper-organizer
description: Organize research papers in an Obsidian wiki by inventorying PDFs, renaming high-confidence papers to year-keyword-publisher, grouping papers by topic, and summarizing each paper's key contributions and limitations.
---
```

If Codex reports:

```text
missing YAML frontmatter delimited by ---
```

then your `SKILL.md` is malformed.

---

### 5.4 Global Skill Path on Windows

In PowerShell, `$HOME` means your Windows user folder.

Run:

```powershell
$HOME
```

It may return something like:

```text
C:\Users\Alice
```

Codex reusable skills can be installed under your user folder. A common global skills path is:

```text
$HOME\.agents\skills
```

So this path:

```text
$HOME\.agents\skills\paper-organizer\SKILL.md
```

means something like:

```text
C:\Users\Alice\.agents\skills\paper-organizer\SKILL.md
```

The installed skill should look like this:

```text
C:\Users\Alice\.agents
└── skills
    └── paper-organizer
        └── SKILL.md
```

Some older workflows also use:

```text
$HOME\.codex\skills
```

To avoid compatibility confusion, you can install the skill in both locations:

```powershell
New-Item -ItemType Directory -Force $HOME\.agents\skills\paper-organizer
New-Item -ItemType Directory -Force $HOME\.codex\skills\paper-organizer

Copy-Item .\.skills\paper-organizer\SKILL.md $HOME\.agents\skills\paper-organizer\SKILL.md -Force
Copy-Item .\.skills\paper-organizer\SKILL.md $HOME\.codex\skills\paper-organizer\SKILL.md -Force
```

Restart Codex after installing or editing a skill.

---

### 5.5 Virtual Environment

A Python virtual environment is optional.

You do **not** need a Python virtual environment just to use:

```text
Codex + Obsidian + paper-organizer
```

You may want a virtual environment if you plan to add Python helper scripts for:

- PDF metadata extraction
- DOI lookup
- BibTeX generation
- local duplicate detection
- CSV export
- batch validation

#### Conda option

If your terminal shows `(base)`, you are using Anaconda or Miniconda.

```powershell
conda create -n wiki python=3.12 -y
conda activate wiki
pip install pymupdf pandas rich
```

Deactivate:

```powershell
conda deactivate
```

#### Built-in venv option

```powershell
cd C:\Users\YourName\Documents\llm-wiki-paper-organizer
python -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
pip install pymupdf pandas rich
```

If PowerShell blocks activation:

```powershell
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
.\.venv\Scripts\Activate.ps1
```

Common mistake:

```powershell
python -3.12 -m venv .venv
```

Use this instead:

```powershell
python -m venv .venv
```

The `-3.12` form is for the Windows `py` launcher, not for `python.exe`.

---

## 6. Requirements

Required:

- Git
- Obsidian
- OpenAI Codex CLI
- ChatGPT login or another Codex authentication method
- An Obsidian vault
- This repository's `paper-organizer` skill

Recommended:

- VS Code
- PowerShell on Windows
- A separate Obsidian vault for research papers
- A Python virtual environment only if you use helper scripts

---

## 7. Install the Paper Organizer Skill

From this repository folder:

```powershell
cd C:\Users\YourName\Documents\llm-wiki-paper-organizer
```

Run the install script:

```powershell
.\scripts\install-paper-organizer.ps1
```

Manual install:

```powershell
New-Item -ItemType Directory -Force $HOME\.agents\skills\paper-organizer
New-Item -ItemType Directory -Force $HOME\.codex\skills\paper-organizer

Copy-Item .\.skills\paper-organizer\SKILL.md $HOME\.agents\skills\paper-organizer\SKILL.md -Force
Copy-Item .\.skills\paper-organizer\SKILL.md $HOME\.codex\skills\paper-organizer\SKILL.md -Force
```

Verify:

```powershell
dir $HOME\.agents\skills\paper-organizer
dir $HOME\.codex\skills\paper-organizer
```

You should see:

```text
SKILL.md
```

Check the first lines:

```powershell
Get-Content $HOME\.agents\skills\paper-organizer\SKILL.md -TotalCount 5
```

Expected:

```markdown
---
name: paper-organizer
description: Organize research papers in an Obsidian wiki...
---
```

Restart Codex after installing or editing a skill.

---

## 8. Where to Run Codex

Run Codex from the folder that contains, or can access, the files you want it to read and write.

If your Obsidian vault is:

```text
C:\Users\YourName\Documents\LLM-Wiki
```

and this repository is:

```text
C:\Users\YourName\Documents\llm-wiki-paper-organizer
```

then run Codex from their shared parent folder:

```powershell
cd C:\Users\YourName\Documents
codex
```

This lets Codex access both:

```text
C:\Users\YourName\Documents\LLM-Wiki
C:\Users\YourName\Documents\llm-wiki-paper-organizer
```

Safer workspace mode:

```powershell
cd C:\Users\YourName\Documents
codex --sandbox workspace-write --ask-for-approval on-request
```

This allows Codex to work inside the current workspace while asking for approval for higher-risk actions.

---

## 9. Prepare Your Obsidian Vault

Create a vault folder:

```powershell
mkdir C:\Users\YourName\Documents\LLM-Wiki
mkdir C:\Users\YourName\Documents\LLM-Wiki\_raw
```

Open Obsidian.

Choose:

```text
Open folder as vault
```

Select:

```text
C:\Users\YourName\Documents\LLM-Wiki
```

Recommended structure:

```text
LLM-Wiki/
├── _raw/
├── concepts/
├── entities/
├── skills/
├── references/
├── synthesis/
├── journal/
├── projects/
├── _archives/
├── index.md
├── log.md
├── hot.md
└── .manifest.json
```

Put your research papers in:

```text
C:\Users\YourName\Documents\LLM-Wiki\_raw
```

---

## 10. Paper Organizer Workflow

The workflow has four phases.

---

### Phase 1: Paper Inventory

The skill scans PDFs in:

```text
LLM-Wiki/_raw/
```

and creates or updates:

```text
LLM-Wiki/references/paper-inventory.md
```

Inventory columns:

| Column | Meaning |
|---|---|
| Current filename | Original PDF filename |
| Detected title | Paper title detected from the document |
| Detected year | Publication year |
| Venue or publisher | arXiv, NeurIPS, ACL, ICML, etc. |
| Keywords | 3 to 5 topic keywords |
| Suggested filename | Clean filename in `YEAR-keyword-publisher.pdf` format |
| Group | Suggested topic folder |
| Confidence | high, medium, or low |
| Notes | Uncertainty or missing metadata |

---

### Phase 2: Rename and Group

The skill renames only high-confidence papers using:

```text
YEAR-keyword-publisher.pdf
```

Filename rules:

- lowercase
- hyphen-separated
- no spaces
- no special characters
- maximum 80 characters
- never overwrite files
- never rename uncertain papers

Recommended topic folders:

```text
_raw/
├── rag/
├── agents/
├── llm-training/
├── fine-tuning/
├── alignment-rlhf/
├── inference-serving/
├── evaluation-benchmarks/
├── multimodal-vlm/
├── long-context/
├── reasoning/
├── tool-use/
├── security-safety/
├── datasets/
├── survey/
└── uncategorized/
```

Uncertain papers should go to:

```text
_raw/uncategorized/
```

---

### Phase 3: Reference Notes

For each paper, the skill creates one note under:

```text
references/
```

Recommended reference note structure:

```markdown
# Paper Title

## Summary

## Key Contributions

## Limitations

## Methods

## Datasets or Benchmarks

## Related Concepts

## Source
```

---

### Phase 4: Topic Literature Reviews

For each topic group, the skill creates one synthesis note under:

```text
synthesis/
```

Example:

```text
synthesis/rag-literature-review.md
```

Recommended synthesis note structure:

```markdown
# Topic Literature Review

## Overview

## Table of Papers

## Key Contributions by Paper

## Main Limitations by Paper

## Common Patterns

## Contradictions or Disagreements

## Open Research Questions

## Recommended Reading Order

## Related Reference Notes
```

---

## 11. Autonomous Paper Organization Prompt

Start Codex from the parent folder that contains your vault and this repository:

```powershell
cd C:\Users\YourName\Documents
codex
```

Inside Codex:

```text
Use the paper-organizer skill in autonomous mode.

Vault:
C:\Users\YourName\Documents\LLM-Wiki

Raw papers:
C:\Users\YourName\Documents\LLM-Wiki\_raw

Run the full paper organization workflow:

1. Create or update paper inventory.
2. Rename only high-confidence papers to YEAR-keyword-publisher.pdf.
3. Group papers by topic.
4. Keep uncertain papers in uncategorized.
5. Create reference notes.
6. Create topic literature-review notes.
7. Summarize key contributions and limitations.
8. Update index.md, log.md, hot.md, .manifest.json, and paper-inventory.md.

Rules:
- Do not delete anything.
- Do not overwrite anything.
- Do not rename uncertain papers.
- Do not invent metadata.
- Use source attribution.
- Use Obsidian [[wikilinks]].
- Process in batches of 10.
- At the end, report all files created or changed.
```

---

## 12. Safer Non-Autonomous Prompt

Use this if you want to review before renaming files:

```text
Use the paper-organizer skill.

Start with Phase 1 only.

Create the paper inventory.
Do not rename files.
Do not move files.
Do not delete anything.

After creating the inventory, stop and list uncertain papers.
```

After reviewing `references/paper-inventory.md`, approve the next step:

```text
Use the paper-organizer skill.

I approve Phase 2 for high-confidence papers only.

Rename and group high-confidence papers according to paper-inventory.md.
Keep medium-confidence and low-confidence papers in uncategorized.
Do not delete anything.
Do not overwrite anything.
```

---

## 13. Optional: Tidy Existing Reference Notes

If you already have reference notes and want to clean them:

```text
Use the paper-organizer skill.

Task:
Tidy existing reference notes in my Obsidian wiki.

Vault:
C:\Users\YourName\Documents\LLM-Wiki

References folder:
C:\Users\YourName\Documents\LLM-Wiki\references

Please:
- scan all Markdown files under references/
- merge obvious duplicate reference notes
- standardize frontmatter
- standardize headings
- add missing source paths when available
- add useful [[wikilinks]]
- create or update references/reference-index.md
- update index.md, log.md, hot.md, and .manifest.json
- do not delete anything
- do not overwrite unrelated content
- list every file created or changed
```

---

## 14. Safety Rules

This workflow is intentionally conservative:

- Never delete papers
- Never overwrite files
- Never rename uncertain papers
- Never invent metadata
- Always mark uncertainty
- Always preserve source attribution
- Use `uncategorized` for unclear papers
- Use Obsidian `[[wikilinks]]`
- Process in batches of 10
- Report all files created or changed

---

## 15. What Not to Upload to GitHub

Do not upload private or copyrighted research content.

Do not upload:

```text
_raw/
*.pdf
LLM-Wiki/
references/
synthesis/
concepts/
entities/
journal/
projects/
_archives/
.env
.manifest.json
log.md
hot.md
```

unless you are absolutely sure the content is public and safe to share.

---

## 16. Recommended `.gitignore`

```gitignore
# Secrets
.env
*.env
.env.*

# Raw papers / copyrighted files
_raw/
*.pdf

# Private wiki output
LLM-Wiki/
references/
synthesis/
concepts/
entities/
journal/
projects/
_archives/
.manifest.json
log.md
hot.md

# Obsidian workspace state
.obsidian/workspace.json
.obsidian/workspace-mobile.json

# Python / virtual environments
__pycache__/
*.pyc
.venv/
.wiki/
.ipynb_checkpoints/

# Node
node_modules/

# OS files
.DS_Store
Thumbs.db
```

---

## 17. Troubleshooting

### README appears as plain text on GitHub

Make sure the file is named:

```text
README.md
```

not:

```text
README
```

Also make sure the README does not start with:

```text
```markdown
```

The first line should be:

```markdown
# LLM-Wiki Paper Organizer
```

---

### Codex does not use the skill

Try explicitly saying:

```text
Use the paper-organizer skill.
```

Then restart Codex.

---

### Codex says the skill is invalid

Error:

```text
missing YAML frontmatter delimited by ---
```

Fix:

Make sure `SKILL.md` starts with:

```markdown
---
name: paper-organizer
description: Organize research papers in an Obsidian wiki...
---
```

---

### Codex invents metadata

Add this rule:

```text
Do not invent metadata. If title, year, venue, publisher, or dataset is unclear, write "uncertain" or "not found".
```

---

### Codex cannot find the vault

Use absolute paths:

```text
Vault:
C:\Users\YourName\Documents\LLM-Wiki

Raw papers:
C:\Users\YourName\Documents\LLM-Wiki\_raw
```

---

### Codex cannot access both this repo and the vault

Start Codex from their shared parent folder:

```powershell
cd C:\Users\YourName\Documents
codex
```

---

### PowerShell cannot activate venv

Run:

```powershell
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
```

Then:

```powershell
.\.venv\Scripts\Activate.ps1
```

---

## 18. Roadmap

Possible future improvements:

- Add a Python script to extract PDF metadata
- Add duplicate detection by DOI or title
- Add BibTeX export
- Add Zotero integration
- Add DOI lookup
- Add citation graph generation
- Add paper ranking by importance
- Add reading queue generation
- Add topic clustering
- Add Obsidian Dataview templates

---

## 19. License

MIT License.

See `LICENSE` for details.

---

## 20. Disclaimer

This project does not include research papers or copyrighted PDFs.

Users are responsible for ensuring they have the right to store, process, and share any papers they place in their Obsidian vault.

The skill may generate summaries and metadata automatically. Always verify important academic details manually before citation or publication.

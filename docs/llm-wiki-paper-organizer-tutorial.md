# LLM-Wiki Construction and Paper Organizer Skills Tutorial

This tutorial summarizes the setup and reusable workflows for building an Obsidian-based LLM wiki using Codex CLI and the `obsidian-wiki` GitHub repository.

## Your Windows Setup

```text
Windows PC
VS Code
PowerShell
ChatGPT-login Codex
Obsidian
obsidian-wiki
Vault: C:\Users\Robot\Downloads\LLM-Wiki
Repo:  C:\Users\Robot\Downloads\obsidian-wiki
```

## 1. System Architecture

Your system works like this:

```text
Codex CLI
↓
obsidian-wiki skills
↓
Obsidian vault
↓
Markdown wiki + graph view
```

Important folders:

```text
Repository:
C:\Users\Robot\Downloads\obsidian-wiki

Obsidian vault:
C:\Users\Robot\Downloads\LLM-Wiki
```

Recommended vault structure:

```text
LLM-Wiki
├── _raw
├── concepts
├── entities
├── skills
├── references
├── synthesis
├── journal
├── projects
├── _archives
├── index.md
├── log.md
├── hot.md
└── .manifest.json
```

## 2. Starting Codex

Because you logged in with your ChatGPT account and do not want to use a local model now, start Codex normally:

```powershell
cd C:\Users\Robot\Downloads
codex
```

Do **not** use this unless you want local Ollama mode:

```powershell
codex --oss -m qwen3-coder:30b
```

## 3. Main Skills

### `wiki-update`

Use `wiki-update` for:

```text
tidying wiki pages
cleaning references
updating index/log/hot/manifest
syncing project knowledge
cross-linking notes
```

Example prompt:

```text
Use the wiki-update skill.

Task:
Tidy up the references section of my Obsidian wiki.

Repository:
C:\Users\Robot\Downloads\obsidian-wiki

Vault:
C:\Users\Robot\Downloads\LLM-Wiki

References folder:
C:\Users\Robot\Downloads\LLM-Wiki\references

Do not delete anything.
Do not overwrite unrelated files.
Merge duplicates when obvious.
Standardize frontmatter and headings.
Add useful [[wikilinks]].
Create or update references/reference-index.md.
Update index.md, log.md, hot.md, and .manifest.json.
List every file created or changed.
```

### `wiki-ingest`

Use `wiki-ingest` for:

```text
turning raw files into wiki notes
processing documents
processing papers
extracting concepts
creating reference pages
```

Example prompt:

```text
Use the wiki-ingest skill.

Ingest this file into my wiki:

C:\Users\Robot\Downloads\LLM-Wiki\_raw\example-paper.pdf

Create reference notes, concept notes, and useful wikilinks.
Update index.md, log.md, and .manifest.json.
Do not delete anything.
```

### Custom `paper-organizer` Skill

Use `paper-organizer` for:

```text
many research papers
renaming PDFs
grouping papers
creating literature reviews
summarizing key contributions
summarizing limitations
```

Global Codex skill location:

```text
C:\Users\Robot\.codex\skills\paper-organizer\SKILL.md
```

Optional repo copy:

```text
C:\Users\Robot\Downloads\obsidian-wiki\.skills\paper-organizer\SKILL.md
```

A valid skill must begin with YAML frontmatter:

```markdown
---
name: paper-organizer
description: Organize research papers in an Obsidian wiki by inventorying PDFs, renaming high-confidence papers to year-keyword-publisher, grouping papers by topic, and summarizing each paper's key contributions and limitations.
---
```

If Codex says this:

```text
missing YAML frontmatter delimited by ---
```

then your `SKILL.md` is broken and must be fixed.

## 4. Paper Organizer Workflow

The paper workflow has four phases.

### Phase 1: Inventory

Codex scans:

```text
C:\Users\Robot\Downloads\LLM-Wiki\_raw
```

It creates or updates:

```text
C:\Users\Robot\Downloads\LLM-Wiki\references\paper-inventory.md
```

Inventory columns:

```text
current filename
detected title
detected year
detected venue/publisher
keywords
suggested new filename
suggested group/topic
confidence
notes / uncertainty
```

Filename format:

```text
YEAR-keyword-publisher.pdf
```

Examples:

```text
2023-rag-survey-arxiv.pdf
2024-agent-memory-neurips.pdf
2022-chain-of-thought-google.pdf
```

### Phase 2: Rename and Group

Papers are grouped into folders such as:

```text
_raw
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

Safe rule:

```text
Only rename high-confidence papers.
Keep uncertain papers in uncategorized.
Never delete anything.
Never overwrite anything.
```

### Phase 3: Reference Notes

For each paper, create one note under:

```text
C:\Users\Robot\Downloads\LLM-Wiki\references
```

Each reference note should include:

```text
title
year
venue/publisher
source file path
problem addressed
method
key contributions
limitations
datasets or benchmarks
related concepts
wikilinks
```

Recommended headings:

```markdown
# Title

## Summary

## Key Contributions

## Limitations

## Methods

## Datasets or Benchmarks

## Related Concepts

## Source
```

### Phase 4: Topic Synthesis

For each topic group, create:

```text
C:\Users\Robot\Downloads\LLM-Wiki\synthesis\topic-literature-review.md
```

Each literature review should include:

```text
overview
table of papers
key contribution of each paper
main limitation of each paper
common patterns
contradictions
open research questions
recommended reading order
links to reference notes
```

## 5. Autonomous Paper Organizer Prompt

Use this in Codex:

```text
Use the paper-organizer skill in autonomous mode.

Repository:
C:\Users\Robot\Downloads\obsidian-wiki

Vault:
C:\Users\Robot\Downloads\LLM-Wiki

Raw papers:
C:\Users\Robot\Downloads\LLM-Wiki\_raw

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

## 6. Cleaning References with `wiki-update`

Use this prompt when your references are messy:

```text
Use the wiki-update skill.

Task:
Tidy up the references section of my Obsidian wiki.

Repository:
C:\Users\Robot\Downloads\obsidian-wiki

Vault:
C:\Users\Robot\Downloads\LLM-Wiki

References folder:
C:\Users\Robot\Downloads\LLM-Wiki\references

Please do the following:

1. Read the wiki-update skill instructions.
2. Read index.md, log.md, hot.md if present, and .manifest.json.
3. Scan all Markdown files under references/.
4. Do not delete any files.
5. Do not overwrite unrelated content.
6. Merge duplicate reference notes when they clearly describe the same paper/source.
7. Standardize reference note frontmatter.
8. Standardize headings.
9. Add missing source paths if available.
10. Add wikilinks to related concepts, synthesis notes, and project pages.
11. Create or update references/reference-index.md as a clean catalog.
12. Update index.md so it links to references/reference-index.md.
13. Update log.md with a WIKI_UPDATE entry.
14. Update hot.md with recent activity if hot.md exists.
15. Update .manifest.json to reflect changed reference pages.
16. At the end, list every file created or changed.

Rules:
- Do not invent missing metadata.
- If unknown, write "unknown" or "not found".
- Preserve useful existing content.
- Prefer merging over creating duplicates.
- Use Obsidian [[wikilinks]].
- Process in batches if there are many files.
```

## 7. Syncing a Code Project with `wiki-update`

Go into the project folder:

```powershell
cd C:\Users\Robot\Downloads\some-project
codex
```

Then use:

```text
Use the wiki-update skill.

Sync this current project into my Obsidian wiki.
Distill architecture, tools, decisions, patterns, and lessons learned.
Create project pages under projects/<project-name>.
Update index.md, log.md, hot.md, and .manifest.json.
Do not copy large code blocks.
Do not delete anything.
Use Obsidian [[wikilinks]].
List all files created or changed.
```

## 8. Safety Rules to Reuse

Use these rules in almost every Codex prompt:

```text
Do not delete anything.
Do not overwrite unrelated files.
Do not invent metadata.
Use source attribution.
Use Obsidian [[wikilinks]].
List all files created or changed.
```

For papers, also add:

```text
Rename only high-confidence papers.
Put uncertain papers in uncategorized.
Process in batches of 10.
```

## 9. Best Routine

### For new papers

Put PDFs into:

```text
C:\Users\Robot\Downloads\LLM-Wiki\_raw
```

Then run in Codex:

```text
Use the paper-organizer skill in autonomous mode.
```

### For cleaning references

Run in Codex:

```text
Use the wiki-update skill for tidying up references.
```

### For syncing a code project

Run Codex from the project folder, then:

```text
Use the wiki-update skill.
```

## 10. Final System

You are building:

```text
Research paper library
+ Obsidian knowledge graph
+ automatic paper grouping
+ literature reviews
+ reference notes
+ contribution/limitation summaries
+ reusable Codex skills
```

Most important reusable commands:

```text
Use the paper-organizer skill in autonomous mode.
```

```text
Use the wiki-update skill for tidying up references.
```

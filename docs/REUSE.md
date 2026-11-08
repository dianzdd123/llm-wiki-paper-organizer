# Reusing llm-wiki-paper-organizer

Agent-assisted paper organisation and Obsidian notes.

**Current scope:** Instruction/template repository with a PowerShell installer; it is not a standalone PDF-processing Python application.


## What you can reuse

| Path | Purpose |
|---|---|
| `.skills/paper-organizer/SKILL.md` | Paper organisation instructions for a compatible agent |
| `scripts/install-paper-organizer.ps1` | Windows PowerShell installation helper |
| `examples/sample-reference-note.md` | Individual-paper note example |
| `examples/sample-synthesis-note.md` | Cross-paper synthesis example |
| `docs/llm-wiki-paper-organizer-tutorial.md` | Extended workflow tutorial |
| `LICENSE.txt` | Existing licence text |

## First use

Clone this repository and inspect the instruction file. On Windows, run the installer from PowerShell:

```powershell
.\scripts\install-paper-organizer.ps1
```

It copies the instruction file into your user-level Codex skills directory. Review any existing installation before replacing it. On other systems, use the equivalent user-level skill location supported by your agent; the supplied installer is PowerShell-specific. No Python package installation is required merely to read the instructions or copy the templates.

Use a separate test vault with a few papers you can lawfully process. Ask the agent to inventory files and propose changes first. Check titles, authors, years and source links against the PDFs before accepting renamed copies or notes. Keep original PDFs and a backup outside the generated output.

## Inputs and expected outputs

Inputs are a local paper collection, a destination vault and your organising criteria. Outputs are proposed filenames, reference notes, topic syntheses and links. The sample notes show a format, not verified research findings. Agent and PDF-extraction capabilities depend on the environment you supply; the repository does not include OCR, a scheduler or a hosted service.

## Quality and troubleshooting

```bash
python scripts/check_repository.py
```

Python is needed only for this optional structural check. It checks repository navigation and source structure, not whether an agent has installed or followed the instructions.

If the agent cannot find the instruction file, check its configured skill directory and restart the session. If links point outside the intended vault, review the proposed relative paths before accepting output. Uncertain bibliographic metadata should remain marked for review. Do not publish a private paper collection, API credentials or generated notes containing confidential information.

## Attribution and reuse permissions

Read the existing [licence](../LICENSE.txt) before redistributing code. External datasets, models, papers and images may have separate terms.

## Contributing

See [CONTRIBUTING.md](../CONTRIBUTING.md) for the local workflow and what to include with a proposed change.

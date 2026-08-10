# Documentation Translation Rules

Apply these rules whenever editing translated documentation under `docs/`.

1. Treat the Chinese `.md` file as the source of truth. Its English counterpart uses the same path and the `.en.md` suffix (for example, `docs/index.md` → `docs/index.en.md`).
2. Create a missing English counterpart for every Chinese Markdown document unless the file is a generated artifact or a non-document configuration file.
3. Preserve Markdown and MkDocs Material syntax exactly: headings, blank lines, indentation, lists, tables, admonitions, tabs, code fences and their language labels, HTML, comments, link destinations, image paths, anchors, and inline formatting.
4. Translate prose only. Do not translate code, commands, API/class/property names, file paths, URLs, identifiers, product names, version numbers, or values that must be copied verbatim.
5. Keep source line ordering. Translate table cell text without changing columns, separators, alignment, or whitespace that affects rendering.
6. Before finishing, verify every Chinese `docs/**/*.md` file has a matching `.en.md` file, and compare each pair's Markdown structure (including fenced-code and admonition delimiters).

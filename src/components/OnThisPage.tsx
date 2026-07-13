"use client";

import { useEffect, useState } from "react";

interface Item {
  id: string;
  title: string;
  level: number; // 2 = section (h2), 3 = subsection (h3, indented)
}

// Right-rail table of contents for the current entry. Reads the section
// headings straight from the rendered article (#reader-content h2/h3[id]),
// rebuilds when the content changes, and highlights the section you're on
// (violet) as you scroll — like the FlutterFlow docs outline. Subsections
// (h3) are indented under their section so the outline mirrors the article.
export function OnThisPage() {
  const [items, setItems] = useState<Item[]>([]);
  const [active, setActive] = useState<string>("");

  useEffect(() => {
    let spy: IntersectionObserver | null = null;
    let contentMo: MutationObserver | null = null;

    const build = (root: HTMLElement) => {
      const hs = Array.from(
        root.querySelectorAll<HTMLElement>("h2[id], h3[id]"),
      );
      setItems(
        hs.map((h) => ({
          id: h.id,
          title: h.textContent ?? "",
          level: h.tagName === "H3" ? 3 : 2,
        })),
      );
      spy?.disconnect();
      spy = new IntersectionObserver(
        (entries) => {
          const visible = entries
            .filter((e) => e.isIntersecting)
            .sort((a, b) => a.boundingClientRect.top - b.boundingClientRect.top);
          if (visible[0]) setActive((visible[0].target as HTMLElement).id);
        },
        { rootMargin: "-88px 0px -72% 0px", threshold: 0 },
      );
      hs.forEach((h) => spy!.observe(h));
      if (hs[0]) setActive((prev) => prev || hs[0].id);
    };

    // The article renders asynchronously (content is fetched), so #reader-content
    // may not exist yet at mount. Watch the whole document until it appears, then
    // switch to watching the content itself for depth/level/format changes.
    const attach = () => {
      const root = document.getElementById("reader-content");
      if (!root) return false;
      build(root);
      contentMo?.disconnect();
      contentMo = new MutationObserver(() => build(root));
      contentMo.observe(root, { childList: true, subtree: true });
      return true;
    };

    let docMo: MutationObserver | null = null;
    if (!attach()) {
      docMo = new MutationObserver(() => {
        if (attach()) docMo?.disconnect();
      });
      docMo.observe(document.body, { childList: true, subtree: true });
    }

    return () => {
      spy?.disconnect();
      contentMo?.disconnect();
      docMo?.disconnect();
    };
  }, []);

  if (items.length === 0) return null;

  return (
    <nav className="text-[13px]">
      <div className="font-mono font-semibold text-[10px] tracking-[0.12em] uppercase text-whisper">
        On this page
      </div>
      <ul className="mt-3 border-l border-line">
        {items.map((it) => {
          const on = active === it.id;
          return (
            <li key={it.id}>
              <a
                href={`#${it.id}`}
                onClick={() => setActive(it.id)}
                className={`block py-1.5 -ml-px border-l-2 transition-colors ${
                  it.level === 3 ? "pl-6 text-[12px]" : "pl-3"
                } ${
                  on
                    ? "border-purple text-purple font-medium"
                    : "border-transparent text-muted hover:text-purple"
                }`}
              >
                {it.title}
              </a>
            </li>
          );
        })}
      </ul>
    </nav>
  );
}

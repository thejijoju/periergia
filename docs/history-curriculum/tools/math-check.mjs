// usage: node docs/history-curriculum/tools/math-check.mjs supabase/content/<file>.sql ...
// Renders each master body the way the Reader does (remark-gfm + remark-math +
// rehype-katex) and reports any KaTeX output. History prose should contain no
// math, so any hit is almost always an unescaped "$" pair (currency).
import React from 'react';
import { renderToStaticMarkup } from 'react-dom/server';
import ReactMarkdown from 'react-markdown';
import remarkGfm from 'remark-gfm';
import remarkMath from 'remark-math';
import rehypeKatex from 'rehype-katex';
import { readFileSync } from 'fs';
let bad = 0;
for (const f of process.argv.slice(2)) {
  const t = readFileSync(f, 'utf8');
  const m = t.match(/\$([A-Za-z0-9_]+_master)\$([\s\S]*?)\$\1\$/);
  if (!m) continue;
  const html = renderToStaticMarkup(React.createElement(ReactMarkdown, { remarkPlugins: [remarkGfm, remarkMath], rehypePlugins: [rehypeKatex], children: m[2] }));
  const n = (html.match(/class="katex"/g) || []).length;
  if (n) { bad = 1; console.log(`${f}: ${n} stray math span(s) — escape currency as \\$`); }
}
if (!bad) console.log('math-check: no stray math');

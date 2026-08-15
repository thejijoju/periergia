// Render every authored master body through the exact pipeline Reader uses
// (react-markdown + remark-gfm + remark-math + rehype-katex) and fail if any
// chapter produces a KaTeX error. A single malformed math block does not stay
// local: remark-math treats everything up to the next delimiter as one
// formula, so one bad fence can swallow the whole rest of an article and
// render it as raw red text. Run: node scripts/render-check.mjs
import React from 'react';
import { renderToStaticMarkup } from 'react-dom/server';
import ReactMarkdown from 'react-markdown';
import remarkGfm from 'remark-gfm';
import remarkMath from 'remark-math';
import rehypeKatex from 'rehype-katex';
import { readFileSync, readdirSync } from 'fs';

let bad = 0;
for (const f of readdirSync('supabase/content').filter((x) => x.endsWith('.sql')).sort()) {
  const t = readFileSync('supabase/content/' + f, 'utf8');
  // The master body sits between a pair of matching $..._master$ dollar tags.
  const m = t.match(/\$([A-Za-z0-9_]+_master)\$([\s\S]*?)\$\1\$/);
  if (!m) continue;
  const html = renderToStaticMarkup(
    React.createElement(ReactMarkdown, {
      remarkPlugins: [remarkGfm, remarkMath],
      rehypePlugins: [rehypeKatex],
      children: m[2],
    }),
  );
  const errs = (html.match(/katex-error/g) || []).length;
  if (errs) {
    bad++;
    console.error(`KATEX ERRORS (${errs}) in ${f}`);
  }
}
if (bad) {
  console.error(`${bad} file(s) would render broken math`);
  process.exit(1);
}
console.log('render-check: all content renders clean');

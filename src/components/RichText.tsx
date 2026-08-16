"use client";

import { Fragment, useMemo } from "react";
import katex from "katex";

// ── Inline rich text ──────────────────────────────────────────────────────
// Article prose goes through ReactMarkdown + rehype-katex, so `$x^2$` renders
// as mathematics there. Text that reaches a React component as a plain string —
// checkpoint questions and options, drill prompts and answers — bypassed that
// pipeline entirely and rendered the dollar signs literally. Since a large
// fraction of the authored checkpoints carry mathematics, that was visible as
// raw `$\mathbb{Z}$` on the page.
//
// <Rich> is the minimal fix: split a plain string on inline `$...$` spans,
// KaTeX-render those, and pass everything else through. It also honours
// **bold** and *italic*, which the same authored strings occasionally use.
// Deliberately not a markdown parser — no links, lists, or block structure.

function renderTex(tex: string): string {
  return katex.renderToString(tex, { displayMode: false, throwOnError: false, output: "html" });
}

// **bold** and *italic* inside a non-math run.
function emphasise(text: string, keyBase: string) {
  const out: React.ReactNode[] = [];
  const re = /\*\*([^*]+)\*\*|\*([^*]+)\*/g;
  let last = 0;
  let m: RegExpExecArray | null;
  let i = 0;
  while ((m = re.exec(text)) !== null) {
    if (m.index > last) out.push(text.slice(last, m.index));
    if (m[1] !== undefined) {
      out.push(<strong key={`${keyBase}-b${i}`}>{m[1]}</strong>);
    } else {
      out.push(<em key={`${keyBase}-i${i}`}>{m[2]}</em>);
    }
    last = m.index + m[0].length;
    i++;
  }
  if (last < text.length) out.push(text.slice(last));
  return out;
}

export function Rich({ text }: { text: string }) {
  const parts = useMemo(() => {
    // Split on inline math delimited by single dollars. A backslash-escaped
    // \$ is a literal dollar and never opens a span.
    const nodes: React.ReactNode[] = [];
    const re = /(?<!\\)\$([^$]+?)(?<!\\)\$/g;
    let last = 0;
    let m: RegExpExecArray | null;
    let i = 0;
    while ((m = re.exec(text)) !== null) {
      if (m.index > last) {
        nodes.push(
          <Fragment key={`t${i}`}>{emphasise(text.slice(last, m.index), `t${i}`)}</Fragment>,
        );
      }
      nodes.push(
        <span key={`m${i}`} dangerouslySetInnerHTML={{ __html: renderTex(m[1]) }} />,
      );
      last = m.index + m[0].length;
      i++;
    }
    if (last < text.length) {
      nodes.push(<Fragment key="tail">{emphasise(text.slice(last), "tail")}</Fragment>);
    }
    return nodes;
  }, [text]);

  return <>{parts}</>;
}

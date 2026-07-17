"use client";

import { useState } from "react";

// A historical quotation embedded in an article via a fenced ```quote block
// (see Reader's `pre` override). It grounds an abstract topic in the words of
// people who wrote about it — often long before it was a formal subject. Laid
// out as a small portrait on the left, the quote on the right.
//
// Format inside the fence (one item per line, order-independent):
//   img: <url>                      optional portrait (hidden if it fails to load)
//   <original-script line>          optional (Han/kana shown upright)
//   <translation line>              the quote, shown in serif italic
//   Author · Work · Date            attribution (last line carrying " · ")

const CJK = /[㐀-鿿぀-ヿ]/; // Han ideographs + Japanese kana
const IMG_LINE = /^img:\s*(\S+)/i;

function attributionParts(text: string) {
  return text
    .replace(/^[—–-]\s*/, "")
    .split(" · ")
    .map((s) => s.trim());
}

function Attribution({ parts }: { parts: string[] }) {
  if (parts.length >= 3) {
    const author = parts[0];
    const date = parts[parts.length - 1];
    const work = parts.slice(1, -1).join(" · ");
    return (
      <>
        — {author}, <em>{work}</em>, {date}
      </>
    );
  }
  return <>— {parts.join(", ")}</>;
}

export function Quotation({ spec }: { spec: string }) {
  const [imgOk, setImgOk] = useState(true);

  const lines = spec
    .split("\n")
    .map((l) => l.trim())
    .filter(Boolean);

  let portrait: string | undefined;
  const rest: string[] = [];
  for (const l of lines) {
    const m = l.match(IMG_LINE);
    if (m && !portrait) portrait = m[1];
    else rest.push(l);
  }

  // Attribution = the last remaining line that carries the " · " separator.
  let attrIndex = -1;
  for (let i = rest.length - 1; i >= 0; i--) {
    if (rest[i].includes(" · ")) {
      attrIndex = i;
      break;
    }
  }
  const attrParts = attrIndex >= 0 ? attributionParts(rest[attrIndex]) : [];
  const body = rest.filter((_, i) => i !== attrIndex);

  return (
    <figure className="quotation">
      {portrait && imgOk && (
        // eslint-disable-next-line @next/next/no-img-element
        <img
          className="q-portrait"
          src={portrait}
          alt={attrParts[0] ?? ""}
          loading="lazy"
          onError={() => setImgOk(false)}
        />
      )}
      <div className="q-main">
        <blockquote>
          {body.map((line, i) => (
            <p key={i} className={CJK.test(line) ? "q-orig" : "q-trans"}>
              {line}
            </p>
          ))}
        </blockquote>
        {attrParts.length > 0 && (
          <figcaption>
            <Attribution parts={attrParts} />
          </figcaption>
        )}
      </div>
    </figure>
  );
}

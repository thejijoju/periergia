"use client";

import {
  BookOpen, Headphones, Mic, Feather, Music,
  Image, Pencil, LayoutGrid, Video, Film, Box, Network, Milestone,
  Layers, MessageCircle, SlidersHorizontal, Drama, Presentation, MessagesSquare, Wrench,
  Gamepad2, Puzzle, Swords, Timer, Route,
  Scan, Glasses,
  type LucideIcon,
} from "lucide-react";
import { MODES, MODE_CATEGORIES, type Mode } from "@/lib/modes";

// Icon-name → component map (icon names live in the shared modes module so the
// server can reference modes without pulling in lucide).
const ICONS: Record<string, LucideIcon> = {
  BookOpen, Headphones, Mic, Feather, Music,
  Image, Pencil, LayoutGrid, Video, Film, Box, Network, Milestone,
  Layers, MessageCircle, SlidersHorizontal, Drama, Presentation, MessagesSquare, Wrench,
  Gamepad2, Puzzle, Swords, Timer, Route,
  Scan, Glasses,
};

// The learning-mode rail shown next to a topic title: a row of icon chips that
// grow to reveal their label on hover / focus / when active. Each chip is tinted
// by its category colour. Horizontally scrollable when it overflows.
export function LearningModeRail({
  active,
  onSelect,
}: {
  active: Mode;
  onSelect: (id: Mode) => void;
}) {
  return (
    <div className="periergia-rail">
      <style>{`
        .periergia-rail {
          --chip: 32px;
          display: flex;
          gap: 4px;
          overflow-x: auto;
          padding: 4px 2px;
          scrollbar-width: none;
        }
        .periergia-rail::-webkit-scrollbar { display: none; }

        .pm-chip {
          --c: #888;
          flex: 0 0 auto;
          display: inline-flex;
          align-items: center;
          height: var(--chip);
          width: var(--chip);
          padding: 0;
          border: 1px solid transparent;
          border-radius: 999px;
          background: transparent;
          color: #a59a8a;
          cursor: pointer;
          overflow: hidden;
          transition: width .22s ease, padding .22s ease, background .18s ease,
                      color .18s ease, border-color .18s ease, transform .18s ease;
          -webkit-tap-highlight-color: transparent;
        }
        .pm-chip svg {
          flex: 0 0 auto;
          width: 16px;
          height: 16px;
          margin: 0 auto;
          transition: width .18s ease, height .18s ease, margin .22s ease;
        }
        .pm-label {
          max-width: 0;
          opacity: 0;
          white-space: nowrap;
          font: 500 12.5px/1 var(--font-inter), system-ui, sans-serif;
          transition: max-width .22s ease, opacity .16s ease;
        }
        .pm-chip:hover,
        .pm-chip:focus-visible,
        .pm-chip[data-active="true"] {
          width: auto;
          padding: 0 12px 0 10px;
          color: var(--c);
          background: color-mix(in srgb, var(--c) 12%, transparent);
          border-color: color-mix(in srgb, var(--c) 35%, transparent);
          transform: translateY(-1px);
          outline: none;
        }
        .pm-chip:hover svg,
        .pm-chip:focus-visible svg,
        .pm-chip[data-active="true"] svg {
          width: 18px;
          height: 18px;
          margin: 0 7px 0 0;
        }
        .pm-chip:hover .pm-label,
        .pm-chip:focus-visible .pm-label,
        .pm-chip[data-active="true"] .pm-label {
          max-width: 140px;
          opacity: 1;
        }
        @media (prefers-reduced-motion: reduce) {
          .pm-chip, .pm-chip svg, .pm-label { transition: none; }
        }
      `}</style>

      {MODES.map((m) => {
        const Icon = ICONS[m.icon] ?? BookOpen;
        const on = active === m.id;
        return (
          <button
            key={m.id}
            type="button"
            className="pm-chip"
            data-active={on}
            style={{ ["--c" as string]: MODE_CATEGORIES[m.cat] }}
            aria-label={m.label}
            aria-pressed={on}
            title={m.label}
            onClick={() => onSelect(m.id)}
          >
            <Icon strokeWidth={1.75} aria-hidden="true" />
            <span className="pm-label">{m.label}</span>
          </button>
        );
      })}
    </div>
  );
}

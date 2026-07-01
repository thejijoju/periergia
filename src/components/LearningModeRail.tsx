"use client";

import { useState } from "react";
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

// Modes shown at rest (the "absorb" cluster). The rest stay hidden and cascade
// in — middle first, then the end — when you hover the rail. The active mode is
// always visible even if it lives past the peek.
const PEEK = 5;

// Small, discreet icon rail that sits next to a topic title. At rest it shows a
// few modes; hovering reveals the rest with a staggered cascade. Each chip grows
// to show its label (tinted by category) on hover / focus / when active.
export function LearningModeRail({
  active,
  onSelect,
}: {
  active: Mode;
  onSelect: (id: Mode) => void;
}) {
  const [open, setOpen] = useState(false);

  return (
    <div
      className="periergia-rail"
      onMouseEnter={() => setOpen(true)}
      onMouseLeave={() => setOpen(false)}
      onFocus={() => setOpen(true)}
      onBlur={(e) => {
        if (!e.currentTarget.contains(e.relatedTarget as Node | null)) setOpen(false);
      }}
    >
      <style>{`
        .periergia-rail {
          --chip: 24px;
          display: flex;
          align-items: center;
          gap: 3px;
          overflow-x: auto;
          overflow-y: hidden;
          padding: 2px;
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
          transition: width .22s ease, padding .22s ease, opacity .2s ease,
                      margin .22s ease, background .18s ease, color .18s ease,
                      border-color .18s ease, transform .18s ease;
          -webkit-tap-highlight-color: transparent;
        }
        .pm-chip svg {
          flex: 0 0 auto;
          width: 15px;
          height: 15px;
          margin: 0 auto;
          transition: width .18s ease, height .18s ease, margin .22s ease;
        }
        .pm-label {
          max-width: 0;
          opacity: 0;
          white-space: nowrap;
          font: 500 12px/1 var(--font-inter), system-ui, sans-serif;
          transition: max-width .22s ease, opacity .16s ease;
        }

        /* hidden until the rail is hovered/focused */
        .pm-chip.pm-collapsed {
          width: 0;
          padding: 0;
          margin-left: -3px;
          opacity: 0;
          pointer-events: none;
          border-color: transparent;
        }

        /* grow + reveal label on hover, keyboard focus, or when active */
        .pm-chip:hover,
        .pm-chip:focus-visible,
        .pm-chip[data-active="true"] {
          width: auto;
          padding: 0 11px 0 9px;
          color: var(--c);
          background: color-mix(in srgb, var(--c) 12%, transparent);
          border-color: color-mix(in srgb, var(--c) 35%, transparent);
          transform: translateY(-1px);
          outline: none;
        }
        .pm-chip:hover svg,
        .pm-chip:focus-visible svg,
        .pm-chip[data-active="true"] svg {
          width: 17px;
          height: 17px;
          margin: 0 6px 0 0;
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

      {MODES.map((m, i) => {
        const Icon = ICONS[m.icon] ?? BookOpen;
        const on = active === m.id;
        const collapsed = !open && i >= PEEK && !on;
        return (
          <button
            key={m.id}
            type="button"
            className={`pm-chip${collapsed ? " pm-collapsed" : ""}`}
            data-active={on}
            style={{
              ["--c" as string]: MODE_CATEGORIES[m.cat],
              // cascade the hidden ones in — middle first, then the end
              transitionDelay: open ? `${Math.max(0, i - PEEK) * 22}ms` : "0ms",
            }}
            tabIndex={collapsed ? -1 : 0}
            aria-hidden={collapsed}
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

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

// Small, discreet icon rail beside a topic title. Icons keep a fixed size; the
// label appears as a little black tooltip above the icon on hover (no inline
// growing). At rest it shows a few modes; hovering the rail reveals the rest.
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
          display: flex;
          align-items: center;
          gap: 3px;
          padding: 2px 0;
          overflow: visible;
        }

        .pm-chip {
          --c: #888;
          position: relative;
          flex: 0 0 auto;
          display: inline-flex;
          align-items: center;
          justify-content: center;
          height: 24px;
          width: 24px;
          padding: 0;
          border: 1px solid transparent;
          border-radius: 8px;
          background: transparent;
          color: #a59a8a;
          cursor: pointer;
          transition: width .22s ease, opacity .2s ease, margin .22s ease,
                      background .16s ease, color .16s ease, border-color .16s ease;
          -webkit-tap-highlight-color: transparent;
        }
        .pm-chip svg { width: 15px; height: 15px; flex: 0 0 auto; }

        /* hidden until the rail is hovered/focused, then cascaded in */
        .pm-chip.pm-collapsed {
          width: 0;
          margin-left: -3px;
          opacity: 0;
          overflow: hidden;
          pointer-events: none;
          border-color: transparent;
        }

        /* colour tint only — no size change, no inline label */
        .pm-chip:hover,
        .pm-chip:focus-visible,
        .pm-chip[data-active="true"] {
          color: var(--c);
          background: color-mix(in srgb, var(--c) 12%, transparent);
          border-color: color-mix(in srgb, var(--c) 30%, transparent);
          outline: none;
        }

        /* black tooltip above the icon */
        .pm-tip {
          position: absolute;
          bottom: calc(100% + 7px);
          left: 50%;
          transform: translateX(-50%) translateY(2px);
          background: #17130f;
          color: #fff;
          font: 500 11px/1 var(--font-inter), system-ui, sans-serif;
          letter-spacing: 0;
          padding: 5px 7px;
          border-radius: 6px;
          white-space: nowrap;
          opacity: 0;
          pointer-events: none;
          z-index: 40;
          transition: opacity .13s ease, transform .13s ease;
        }
        .pm-tip::after {
          content: "";
          position: absolute;
          top: 100%;
          left: 50%;
          transform: translateX(-50%);
          border: 4px solid transparent;
          border-top-color: #17130f;
        }
        .pm-chip:hover .pm-tip,
        .pm-chip:focus-visible .pm-tip {
          opacity: 1;
          transform: translateX(-50%) translateY(0);
        }

        @media (prefers-reduced-motion: reduce) {
          .pm-chip, .pm-tip { transition: none; }
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
            onClick={() => onSelect(m.id)}
          >
            <Icon strokeWidth={1.75} aria-hidden="true" />
            <span className="pm-tip">{m.label}</span>
          </button>
        );
      })}
    </div>
  );
}

// ── Learning modes ────────────────────────────────────────────────────────
// Every topic can be experienced in many "mediums". Each mode maps to a
// tailored Claude generation (see generate.ts). `kind` drives how the reader
// renders/augments the result:
//   text        → markdown article
//   audio       → markdown + a "Play" (text-to-speech) affordance
//   visual      → markdown storyboard/description (real image/video/3D later)
//   interactive → markdown, plus mode-specific UI where we have it (e.g. quiz)
//
// This module is shared by client and server, so it stays free of any
// server-only imports.

export type Mode =
  | "read" | "listen" | "podcast" | "story" | "song"
  | "image" | "sketch" | "comic" | "video" | "animation" | "model3d" | "mindmap" | "timeline"
  | "quiz" | "tutor" | "simulate" | "roleplay" | "teachback" | "debate" | "build"
  | "game" | "puzzle" | "duel" | "speedrun" | "adventure"
  | "ar" | "vr";

export type ModeCategory = "absorb" | "see" | "do" | "play" | "immersive";
export type ModeKind = "text" | "audio" | "visual" | "interactive";

// Each category is tinted by the kind of effort it asks for.
export const MODE_CATEGORIES: Record<ModeCategory, string> = {
  absorb: "#378ADD", // sit back and take it in
  see: "#7F77DD", // show me, don't tell me
  do: "#1D9E75", // hands on the wheel
  play: "#D85A30", // learning that fights back
  immersive: "#BA7517", // step inside it
};

export interface ModeSpec {
  id: Mode;
  label: string;
  cat: ModeCategory;
  kind: ModeKind;
  icon: string; // lucide-react icon name (resolved in LearningModeRail)
}

export const MODES: ModeSpec[] = [
  { id: "read", label: "Read", cat: "absorb", kind: "text", icon: "BookOpen" },
  { id: "listen", label: "Listen", cat: "absorb", kind: "audio", icon: "Headphones" },
  { id: "podcast", label: "Podcast", cat: "absorb", kind: "audio", icon: "Mic" },
  { id: "story", label: "Story", cat: "absorb", kind: "text", icon: "Feather" },
  { id: "song", label: "Song", cat: "absorb", kind: "audio", icon: "Music" },

  { id: "image", label: "Image", cat: "see", kind: "visual", icon: "Image" },
  { id: "sketch", label: "Sketch", cat: "see", kind: "visual", icon: "Pencil" },
  { id: "comic", label: "Comic", cat: "see", kind: "visual", icon: "LayoutGrid" },
  { id: "video", label: "Video", cat: "see", kind: "visual", icon: "Video" },
  { id: "animation", label: "Animation", cat: "see", kind: "visual", icon: "Film" },
  { id: "model3d", label: "3D model", cat: "see", kind: "visual", icon: "Box" },
  { id: "mindmap", label: "Mind map", cat: "see", kind: "text", icon: "Network" },
  { id: "timeline", label: "Timeline", cat: "see", kind: "text", icon: "Milestone" },

  { id: "quiz", label: "Quiz", cat: "do", kind: "interactive", icon: "Layers" },
  { id: "tutor", label: "Tutor", cat: "do", kind: "text", icon: "MessageCircle" },
  { id: "simulate", label: "Simulate", cat: "do", kind: "text", icon: "SlidersHorizontal" },
  { id: "roleplay", label: "Roleplay", cat: "do", kind: "text", icon: "Drama" },
  { id: "teachback", label: "Teach back", cat: "do", kind: "text", icon: "Presentation" },
  { id: "debate", label: "Debate", cat: "do", kind: "text", icon: "MessagesSquare" },
  { id: "build", label: "Build", cat: "do", kind: "text", icon: "Wrench" },

  { id: "game", label: "Game", cat: "play", kind: "text", icon: "Gamepad2" },
  { id: "puzzle", label: "Puzzle", cat: "play", kind: "text", icon: "Puzzle" },
  { id: "duel", label: "Duel", cat: "play", kind: "text", icon: "Swords" },
  { id: "speedrun", label: "Speedrun", cat: "play", kind: "text", icon: "Timer" },
  { id: "adventure", label: "Adventure", cat: "play", kind: "text", icon: "Route" },

  { id: "ar", label: "AR", cat: "immersive", kind: "visual", icon: "Scan" },
  { id: "vr", label: "VR", cat: "immersive", kind: "visual", icon: "Glasses" },
];

export const DEFAULT_MODE: Mode = "read";

const MODE_BY_ID = new Map<Mode, ModeSpec>(MODES.map((m) => [m.id, m]));

export function getMode(id: string): ModeSpec {
  return MODE_BY_ID.get(id as Mode) ?? MODES[0];
}

/** Listen just reads the article aloud, so it shares the "read" content cache. */
export function contentMode(mode: Mode): Mode {
  return mode === "listen" ? "read" : mode;
}

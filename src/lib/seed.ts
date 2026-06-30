import type { Subject, Node } from "./types";

// ── Curated launch corpus ────────────────────────────────────────────────
// Six subjects, each with a hand-authored, STABLE syllabus tree. This is the
// "generated once, then stored" tree. When Supabase is wired, these rows seed
// the `subjects` and `nodes` tables (see README → Database schema); the app
// reads the tree from Postgres thereafter. Until then they live in memory.

interface NodeSpec {
  title: string;
  summary?: string;
  children?: NodeSpec[];
}

interface SubjectSpec {
  name: string;
  slug: string;
  description: string;
  tree: NodeSpec[];
}

const SUBJECTS: SubjectSpec[] = [
  {
    name: "History",
    slug: "history",
    description: "How we got here — people, power, and turning points.",
    tree: [
      {
        title: "Revolutions",
        summary: "When the old order broke and something new took its place.",
        children: [
          {
            title: "The French Revolution",
            summary: "1789–1799 — the collapse of the ancien régime.",
          },
          { title: "The American Revolution", summary: "1765–1783 — a colony becomes a republic." },
          { title: "The Russian Revolution", summary: "1917 — empire to Soviet state." },
        ],
      },
      {
        title: "Empires",
        summary: "How states grew vast — and what undid them.",
        children: [
          { title: "Rome", summary: "From republic to empire to fall." },
          { title: "The Mongol Empire", summary: "The largest contiguous land empire." },
        ],
      },
      {
        title: "The Modern World",
        children: [
          { title: "The Industrial Revolution", summary: "Steam, factories, and a new economy." },
          { title: "The World Wars", summary: "1914–1945 — the century's hinge." },
        ],
      },
    ],
  },
  {
    name: "Mathematics",
    slug: "mathematics",
    description: "The language of pattern, quantity, and proof.",
    tree: [
      {
        title: "Algebra",
        children: [
          { title: "Equations & Variables", summary: "Solving for the unknown." },
          { title: "Functions", summary: "Inputs, outputs, and how they relate." },
        ],
      },
      {
        title: "Calculus",
        summary: "The mathematics of change.",
        children: [
          { title: "Limits", summary: "Approaching a value." },
          { title: "Derivatives", summary: "Instantaneous rates of change." },
          { title: "Integrals", summary: "Accumulation and area." },
        ],
      },
      {
        title: "Probability",
        children: [
          { title: "Counting & Combinatorics", summary: "How many ways?" },
          { title: "Distributions", summary: "Modelling uncertainty." },
        ],
      },
    ],
  },
  {
    name: "Physics",
    slug: "physics",
    description: "The rules the universe runs on.",
    tree: [
      {
        title: "Classical Mechanics",
        children: [
          { title: "Newton's Laws", summary: "Force, mass, and motion." },
          { title: "Energy & Momentum", summary: "What is conserved, and why." },
        ],
      },
      {
        title: "Electromagnetism",
        children: [
          { title: "Electric Fields", summary: "Charge and the forces between." },
          { title: "Light & Waves", summary: "Why the sky is blue." },
        ],
      },
      {
        title: "Modern Physics",
        children: [
          { title: "Special Relativity", summary: "Space, time, and the speed of light." },
          { title: "Quantum Mechanics", summary: "The strange rules of the very small." },
        ],
      },
    ],
  },
  {
    name: "English Literature",
    slug: "literature",
    description: "What we mean, and how we say it beautifully.",
    tree: [
      {
        title: "Shakespeare",
        children: [
          { title: "Hamlet", summary: "Revenge, doubt, and a haunted prince." },
          { title: "Macbeth", summary: "Ambition and its undoing." },
        ],
      },
      {
        title: "The Novel",
        children: [
          { title: "The Rise of the Novel", summary: "How prose fiction took over." },
          { title: "Modernism", summary: "Breaking the form to find the truth." },
        ],
      },
      {
        title: "Poetry",
        children: [
          { title: "Meter & Form", summary: "The architecture of a poem." },
          { title: "The Romantics", summary: "Nature, feeling, and the sublime." },
        ],
      },
    ],
  },
  {
    name: "Economics",
    slug: "economics",
    description: "How people, firms, and nations make choices under scarcity.",
    tree: [
      {
        title: "Microeconomics",
        children: [
          { title: "Supply & Demand", summary: "How prices are set." },
          { title: "Markets & Competition", summary: "From monopoly to perfect competition." },
        ],
      },
      {
        title: "Macroeconomics",
        children: [
          { title: "GDP & Growth", summary: "Measuring an economy." },
          { title: "Inflation & Money", summary: "What money is and what moves it." },
        ],
      },
      {
        title: "Behavioural Economics",
        children: [{ title: "Why We Choose Badly", summary: "Bias, nudges, and bounded rationality." }],
      },
    ],
  },
  {
    name: "Computer Science",
    slug: "computer-science",
    description: "Computation, from first principles to working systems.",
    tree: [
      {
        title: "Foundations",
        children: [
          { title: "Algorithms", summary: "Step-by-step problem solving." },
          { title: "Data Structures", summary: "Organising information for speed." },
        ],
      },
      {
        title: "Systems",
        children: [
          { title: "How Computers Work", summary: "From transistors to instructions." },
          { title: "The Internet", summary: "How packets cross the world." },
        ],
      },
      {
        title: "Intelligence",
        children: [
          { title: "Machine Learning", summary: "Programs that learn from data." },
          { title: "Large Language Models", summary: "How models like Claude work." },
        ],
      },
    ],
  },
];

// ── Flatten the nested specs into stable Subject[] / Node[] rows ──────────

function slugify(s: string): string {
  return s
    .toLowerCase()
    .replace(/&/g, "and")
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/(^-|-$)/g, "");
}

const subjects: Subject[] = [];
const nodes: Node[] = [];

SUBJECTS.forEach((subj, si) => {
  const subjectId = subj.slug;
  subjects.push({
    id: subjectId,
    name: subj.name,
    slug: subj.slug,
    description: subj.description,
    position: si,
  });

  const walk = (
    specs: NodeSpec[],
    parentId: string | null,
    parentPath: string[],
    depth: number,
  ) => {
    specs.forEach((spec, i) => {
      const slug = slugify(spec.title);
      const path = [...parentPath, slug];
      const id = `${subjectId}/${path.join("/")}`;
      nodes.push({
        id,
        subjectId,
        subjectSlug: subj.slug,
        parentId,
        title: spec.title,
        slug,
        summary: spec.summary ?? "",
        position: i,
        path,
        depth,
      });
      if (spec.children) walk(spec.children, id, path, depth + 1);
    });
  };

  walk(subj.tree, null, [], 0);
});

/** Total number of leaf + branch nodes per subject (used for the "N themes" label). */
export function themeCount(subjectId: string): number {
  return nodes.filter((n) => n.subjectId === subjectId).length;
}

export const SEED_SUBJECTS: Subject[] = subjects;
export const SEED_NODES: Node[] = nodes;

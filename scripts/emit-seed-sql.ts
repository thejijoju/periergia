import { SEED_SUBJECTS, SEED_NODES } from "../src/lib/seed";
const q = (v: string | null) => (v === null ? "null" : `'${v.replace(/'/g, "''")}'`);
let out = `-- Periergia seed data — generated from src/lib/seed.ts\n`;
out += `-- Paste and run in the Supabase SQL Editor AFTER schema.sql. Idempotent.\n\n`;
out += `insert into subjects (id, name, slug, description, position) values\n`;
out += SEED_SUBJECTS.map(
  (s) => `  (${q(s.id)}, ${q(s.name)}, ${q(s.slug)}, ${q(s.description)}, ${s.position})`,
).join(",\n");
out += `\non conflict (id) do update set name=excluded.name, slug=excluded.slug, description=excluded.description, position=excluded.position;\n\n`;
const nodes = [...SEED_NODES].sort((a, b) => a.depth - b.depth || a.position - b.position);
out += `insert into nodes (id, subject_id, parent_id, title, slug, summary, position, depth) values\n`;
out += nodes.map(
  (n) => `  (${q(n.id)}, ${q(n.subjectId)}, ${q(n.parentId)}, ${q(n.title)}, ${q(n.slug)}, ${q(n.summary)}, ${n.position}, ${n.depth})`,
).join(",\n");
out += `\non conflict (id) do update set subject_id=excluded.subject_id, parent_id=excluded.parent_id, title=excluded.title, slug=excluded.slug, summary=excluded.summary, position=excluded.position, depth=excluded.depth;\n`;
process.stdout.write(out);

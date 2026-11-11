import { SEED_NODES } from "../../../src/lib/seed";
import { readdirSync, readFileSync } from "fs";
const files = new Map<string,string>();
for (const f of readdirSync("supabase/content")) {
  const t = readFileSync("supabase/content/" + f, "utf8");
  const m = t.match(/^-- \S.*\n-- (history\/[^\s@]+) @/m); if (m) files.set(m[1], f);
}
const h = SEED_NODES.filter(n => n.subjectId === "history");
const isParent = (id: string) => h.some(c => c.parentId === id);
for (const era of h.filter(n => n.depth === 0)) {
  const sub = h.filter(n => n.id === era.id || n.id.startsWith(era.id + "/"));
  console.log(`\n### ${era.title}`);
  for (const n of sub) {
    const kind = n.id === era.id ? (isParent(n.id) ? "overview" : "chapter") : (isParent(n.id) ? "section" : "chapter");
    if (kind === "section") { console.log(`#### ${n.title}`); continue; }
    console.log(`${files.has(n.id) ? "DONE" : "TODO"}\t${kind}\t${n.id}\t${n.title}\t${files.get(n.id) ?? ""}`);
  }
}

/**
 * Seed the stable syllabus tree into Supabase.
 *
 *   npm run seed
 *
 * Reads NEXT_PUBLIC_SUPABASE_URL + SUPABASE_SERVICE_ROLE_KEY from the
 * environment (and from .env.local if present), then upserts SEED_SUBJECTS and
 * SEED_NODES into the `subjects` and `nodes` tables. Idempotent — safe to
 * re-run. Requires the schema from supabase/schema.sql to exist first.
 */
import { readFileSync } from "node:fs";
import { resolve } from "node:path";
import { createClient } from "@supabase/supabase-js";
import { SEED_SUBJECTS, SEED_NODES } from "../src/lib/seed";

// Minimal .env.local loader (no dependency) — real env vars still win.
function loadDotEnv(file: string) {
  try {
    const raw = readFileSync(resolve(process.cwd(), file), "utf8");
    for (const line of raw.split("\n")) {
      const m = line.match(/^\s*([A-Z0-9_]+)\s*=\s*(.*)\s*$/i);
      if (m && !process.env[m[1]]) {
        process.env[m[1]] = m[2].replace(/^["']|["']$/g, "");
      }
    }
  } catch {
    /* no .env.local — rely on real env */
  }
}

async function main() {
  loadDotEnv(".env.local");

  const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
  if (!url || !key) {
    console.error(
      "✗ Missing NEXT_PUBLIC_SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY.\n" +
        "  Set them in .env.local (see .env.example), then run the schema in\n" +
        "  supabase/schema.sql before seeding.",
    );
    process.exit(1);
  }
  if (!process.env.SUPABASE_SERVICE_ROLE_KEY) {
    console.warn("⚠ Using the anon key — writes will be blocked by RLS. Prefer SUPABASE_SERVICE_ROLE_KEY.");
  }

  const supabase = createClient(url, key, { auth: { persistSession: false } });

  // Subjects
  const subjectRows = SEED_SUBJECTS.map((s) => ({
    id: s.id,
    name: s.name,
    slug: s.slug,
    description: s.description,
    position: s.position,
  }));
  const { error: subjErr } = await supabase.from("subjects").upsert(subjectRows, { onConflict: "id" });
  if (subjErr) throw subjErr;
  console.log(`✓ Upserted ${subjectRows.length} subjects`);

  // Nodes — insert shallow-first so parent_id FKs resolve within the batch.
  const nodeRows = [...SEED_NODES]
    .sort((a, b) => a.depth - b.depth || a.position - b.position)
    .map((n) => ({
      id: n.id,
      subject_id: n.subjectId,
      parent_id: n.parentId,
      title: n.title,
      slug: n.slug,
      summary: n.summary,
      position: n.position,
      depth: n.depth,
    }));

  // Upsert depth-by-depth to guarantee parents exist before children.
  const maxDepth = Math.max(...nodeRows.map((n) => n.depth));
  for (let d = 0; d <= maxDepth; d++) {
    const batch = nodeRows.filter((n) => n.depth === d);
    if (!batch.length) continue;
    const { error } = await supabase.from("nodes").upsert(batch, { onConflict: "id" });
    if (error) throw error;
    console.log(`✓ Upserted ${batch.length} nodes at depth ${d}`);
  }

  console.log(`\n✓ Seed complete: ${subjectRows.length} subjects, ${nodeRows.length} nodes.`);
}

main().catch((err) => {
  console.error("✗ Seed failed:", err.message ?? err);
  process.exit(1);
});

"use client";

import { useCallback, useEffect, useRef, useState } from "react";
import Link from "next/link";
import ReactMarkdown from "react-markdown";
import remarkGfm from "remark-gfm";
import remarkMath from "remark-math";
import rehypeKatex from "rehype-katex";
import "katex/dist/katex.min.css";
import { LEVELS, type Depth, type Level } from "@/lib/types";
import { getMode, type Mode } from "@/lib/modes";
import { injectAffiliateLinks } from "@/lib/affiliate";
import { isRtl, t } from "@/lib/i18n";
import { isExcludedVisitor } from "@/lib/analyticsOptOut";
import { useProgress } from "@/lib/progress";
import { LearningModeRail } from "./LearningModeRail";
import { VoiceButton } from "./VoiceButton";
import { QuizPanel } from "./QuizPanel";
import { WorkedExample } from "./WorkedExample";
import { SupplyDemandChart } from "./SupplyDemandChart";
import { IncomeGoodChart } from "./IncomeGoodChart";
import { GiffenChart } from "./GiffenChart";
import { BlackbodyChart } from "./BlackbodyChart";
import { SegmentedMirror } from "./SegmentedMirror";
import { RocketEquation } from "./RocketEquation";
import { StagingSplit } from "./StagingSplit";
import { PowerThrustTrade } from "./PowerThrustTrade";
import { ReuseEconomics } from "./ReuseEconomics";
import { ThermochemCeiling } from "./ThermochemCeiling";
import { EngineCycles } from "./EngineCycles";
import { AscentBudget } from "./AscentBudget";
import { OrbitShape } from "./OrbitShape";
import { HohmannTransfer } from "./HohmannTransfer";
import { LagrangePoints } from "./LagrangePoints";
import { SunSyncOrbit } from "./SunSyncOrbit";
import { PlanetHohmann } from "./PlanetHohmann";
import { DebrisLifetime } from "./DebrisLifetime";
import { RedshiftBand } from "./RedshiftBand";
import { InterferometryBaseline } from "./InterferometryBaseline";
import { ConsumablesMass } from "./ConsumablesMass";
import { BoneLoss } from "./BoneLoss";
import { ArtificialGravity } from "./ArtificialGravity";
import { RadiationDose } from "./RadiationDose";
import { ShieldingParadox } from "./ShieldingParadox";
import { LoopClosureMass } from "./LoopClosureMass";
import { Biosphere2Oxygen } from "./Biosphere2Oxygen";
import { ArchitectureMass } from "./ArchitectureMass";
import { DvBudget } from "./DvBudget";
import { ShuttleRisk } from "./ShuttleRisk";
import { NormalizedDeviance } from "./NormalizedDeviance";
import { LifeChecklist } from "./LifeChecklist";
import { EntropyExport } from "./EntropyExport";
import { OriginOdds } from "./OriginOdds";
import { LifeLadder } from "./LifeLadder";
import { HabitableZone } from "./HabitableZone";
import { DistanceLadder } from "./DistanceLadder";
import { OceanAccess } from "./OceanAccess";
import { IngredientsForLife } from "./IngredientsForLife";
import { Disequilibrium } from "./Disequilibrium";
import { BiosignatureCase } from "./BiosignatureCase";
import { DrakeEquation } from "./DrakeEquation";
import { GreatFilter } from "./GreatFilter";
import { SkyLatitude } from "./SkyLatitude";
import { LineOfSight } from "./LineOfSight";
import { SeasonMaker } from "./SeasonMaker";
import { Gnomon } from "./Gnomon";
import { MoonPhase } from "./MoonPhase";
import { MoonClock } from "./MoonClock";
import { EclipseNodes } from "./EclipseNodes";
import { EclipseSizes } from "./EclipseSizes";
import { CelestialGrid } from "./CelestialGrid";
import { LongitudeClock } from "./LongitudeClock";
import { SolarSiderealDay } from "./SolarSiderealDay";
import { CalendarDrift } from "./CalendarDrift";
import { PrecessionCone } from "./PrecessionCone";
import { EquinoxDrift } from "./EquinoxDrift";
import { RetrogradeSky } from "./RetrogradeSky";
import { EratosthenesShadow } from "./EratosthenesShadow";
import { EpicycleMachine } from "./EpicycleMachine";
import { EquantDiagram } from "./EquantDiagram";
import { ElongationDistance } from "./ElongationDistance";
import { EllipseOrbit } from "./EllipseOrbit";
import { EqualAreas } from "./EqualAreas";
import { VenusPhases } from "./VenusPhases";
import { JupiterMoons } from "./JupiterMoons";
import { NewtonCannon } from "./NewtonCannon";
import { AppleMoon } from "./AppleMoon";
import { SpectrumLab } from "./SpectrumLab";
import { DopplerShift } from "./DopplerShift";
import { LightTime } from "./LightTime";
import { SnowLine } from "./SnowLine";
import { FluxGradient } from "./FluxGradient";
import { SolarBoundaries } from "./SolarBoundaries";
import { DiskCollapse } from "./DiskCollapse";
import { AngularBudget } from "./AngularBudget";
import { CondensationLadder } from "./CondensationLadder";
import { DensityDivide } from "./DensityDivide";
import { DriftBarrier } from "./DriftBarrier";
import { GravFocus } from "./GravFocus";
import { Resonance } from "./Resonance";
import { NiceModel } from "./NiceModel";
import { CoolingSize } from "./CoolingSize";
import { GreenhouseBars } from "./GreenhouseBars";
import { PlanetCores } from "./PlanetCores";
import { SpinOrbit } from "./SpinOrbit";
import { EnergyBudget } from "./EnergyBudget";
import { Runaway } from "./Runaway";
import { FaintYoungSun } from "./FaintYoungSun";
import { Thermostat } from "./Thermostat";
import { IsotopeCrisis } from "./IsotopeCrisis";
import { TidalRecession } from "./TidalRecession";
import { CausalChain } from "./CausalChain";
import { TriplePoint } from "./TriplePoint";
import { Quotation } from "./Quotation";
import { ResearchGate } from "./ResearchGate";

export interface Crumb {
  label: string;
  href?: string;
  current?: boolean; // the page you're on — styled distinctly, still tappable
}

export interface ReaderNode {
  id: string;
  title: string;
  summary: string;
  crumbs: Crumb[]; // subject → … → current (current has no href)
}

// Slugify a heading's text into a stable anchor id.
function headingId(children: React.ReactNode): string {
  return extractText(children)
    .toLowerCase()
    .replace(/&/g, "and")
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "");
}

// Generated bodies write display math as single-line `$$…$$` (and sometimes
// LaTeX `\[…\]` / `\(…\)`), but remark-math only treats `$$` fenced on its own
// lines as display math. Normalize so equations render centered, textbook-style.
function normalizeMath(md: string): string {
  return md
    .replace(/\\\[([\s\S]+?)\\\]/g, (_, m) => `\n$$\n${m}\n$$\n`)
    .replace(/\\\((.+?)\\\)/g, (_, m) => `$${m}$`)
    .replace(/^[ \t]*\$\$([^$\n]+?)\$\$[ \t]*$/gm, (_, m) => `$$\n${m}\n$$`);
}

// Coarse dwell buckets — Vercel Web Analytics shows a custom-event property as a
// clean breakdown, so a labelled range reads better on the dashboard than raw
// seconds (which we also send, for export).
function dwellBucket(seconds: number): string {
  if (seconds < 10) return "0–10s";
  if (seconds < 30) return "10–30s";
  if (seconds < 60) return "30–60s";
  if (seconds < 180) return "1–3 min";
  if (seconds < 600) return "3–10 min";
  return "10 min+";
}

// Co-authored masters are stored verbatim, so any {{image: Title | caption}}
// markers they carry never went through the generator's image step. Detect them
// (HAS) so the Reader can resolve them via /api/resolve-images on Vercel, and
// STRIP any that remain (pre-resolution, or a marker that didn't resolve) so a
// raw marker is never shown as literal text.
const HAS_IMAGE_MARKER = /\{\{\s*image:/;
const STRIP_IMAGE_MARKER = /^[ \t]*\{\{\s*image:[^{}\n]*\}\}[ \t]*$/gm;

function extractText(node: React.ReactNode): string {
  if (typeof node === "string" || typeof node === "number") return String(node);
  if (Array.isArray(node)) return node.map(extractText).join("");
  if (node && typeof node === "object" && "props" in node) {
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    return extractText((node as any).props?.children);
  }
  return "";
}

export function Reader({
  node,
  initialBody = "",
  initialDepth,
  initialLevel,
  initialReviewed = false,
  country,
  lang = "en",
}: {
  node: ReaderNode;
  initialBody?: string;
  initialDepth?: Depth;
  initialLevel?: Level;
  initialReviewed?: boolean;
  country?: string;
  lang?: string;
}) {
  const { state, hydrated, markVisited, markCompleted, setPrefs } = useProgress();
  const { depth: prefDepth, level: prefLevel, mode } = state.prefs;
  const spec = getMode(mode);

  // initialBody is the server-rendered article (the richest cached variant, not
  // necessarily the reader's own depth/level preference): crawlers get the full
  // text, and a visitor landing from search sees it immediately and keeps it —
  // we do NOT re-fetch on mount when it's present, so the good article isn't
  // replaced by a shorter regeneration. A fetch fires only when the reader
  // changes depth/level/mode, or when nothing was cached.
  //
  // `shown` tracks what's actually on screen, which starts from initialDepth/
  // initialLevel (the SSR pick) rather than the sticky global pref — otherwise
  // the pills would claim "Medium/Easy" while a Research/Advanced article is
  // displayed, and switching mode alone would silently regenerate at the wrong,
  // lower tier instead of the one the reader is looking at.
  // Resolve the depth/level to open at. The old "detailed" distillation rung is
  // retired from the UI, so coerce it to the master ("research", badged
  // "Detailed"); and the master reads as "Expert" by default (it's served
  // verbatim at every level, so the badge is cosmetic — "Detailed & Expert").
  const resolveInitial = () => {
    const raw = initialDepth === "detailed" ? "research" : initialDepth;
    const d: Depth = raw ?? prefDepth;
    const l: Level = d === "research" ? "expert" : (initialLevel ?? prefLevel);
    return { d, l };
  };
  const [shownDepth, setShownDepth] = useState<Depth>(() => resolveInitial().d);
  const [shownLevel, setShownLevel] = useState<Level>(() => resolveInitial().l);
  const [gate, setGate] = useState(false); // gated "Research" tier panel shown?
  const [body, setBody] = useState(initialBody);
  const [loading, setLoading] = useState(!initialBody);
  const [streaming, setStreaming] = useState(false); // article is writing itself
  const [generated, setGenerated] = useState(!!initialBody);
  const [reviewed, setReviewed] = useState(initialReviewed);
  const [showQuiz, setShowQuiz] = useState(false);
  const skipInitialFetch = useRef(!!initialBody);

  useEffect(() => {
    markVisited(node.id);
    setShowQuiz(false);
  }, [node.id, markVisited]);

  // On client-side navigation the page re-renders with a new node + body.
  useEffect(() => {
    setBody(initialBody);
    setGenerated(!!initialBody);
    setReviewed(initialReviewed);
    setLoading(!initialBody);
    const { d, l } = resolveInitial();
    setShownDepth(d);
    setShownLevel(l);
    setGate(false);
    skipInitialFetch.current = !!initialBody;
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [node.id]);

  // Resolve {{image}} markers in a co-authored master to real Wikipedia images.
  // Runs on the server route (which can reach Wikipedia); we swap the resolved
  // body in once. Guarded by a ref so it fires once per distinct body, and it's
  // a no-op for generated bodies (their images were already spliced in).
  const imgResolvedFor = useRef<string>("");
  useEffect(() => {
    if (streaming || loading || !body || !HAS_IMAGE_MARKER.test(body)) return;
    if (imgResolvedFor.current === body) return;
    const target = body;
    imgResolvedFor.current = target;
    let alive = true;
    fetch("/api/resolve-images", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ body: target, topicTitle: node.title.replace(/\s*\*+$/, "") }),
    })
      .then((r) => r.json())
      .then((d) => {
        if (alive && d?.body && d.body !== target) setBody(d.body);
      })
      .catch(() => {});
    return () => {
      alive = false;
    };
  }, [body, loading, streaming, node.id, node.title]);

  const load = useCallback(async () => {
    setLoading(true);
    setStreaming(false);
    try {
      const res = await fetch("/api/content/stream", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ nodeId: node.id, depth: shownDepth, level: shownLevel, mode, lang }),
      });
      const genHeader = res.headers.get("x-generated") === "1";
      setReviewed(res.headers.get("x-reviewed") === "1");

      if (!res.body) {
        const text = await res.text();
        setBody(text);
        setGenerated(genHeader && text.length > 0);
        return;
      }

      // Stream the article in as it's written. First byte clears the "Composing…"
      // state; repaints are throttled (~90ms) so re-rendering the growing Markdown
      // tree on every token doesn't choke the main thread.
      const reader = res.body.getReader();
      const decoder = new TextDecoder();
      let acc = "";
      let started = false;
      let lastPaint = 0;
      for (;;) {
        const { done, value } = await reader.read();
        if (done) break;
        acc += decoder.decode(value, { stream: true });
        if (!started) {
          started = true;
          setGenerated(genHeader);
          setLoading(false);
          setStreaming(true);
        }
        const now = Date.now();
        if (now - lastPaint > 90) {
          lastPaint = now;
          setBody(acc);
        }
      }
      acc += decoder.decode();
      setBody(acc);
      setGenerated(genHeader && acc.length > 0);
    } finally {
      setLoading(false);
      setStreaming(false);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [node.id, shownDepth, shownLevel, mode]);

  useEffect(() => {
    if (!hydrated) return;
    // Keep the server-rendered article on first mount; only fetch on pref change.
    if (skipInitialFetch.current) {
      skipInitialFetch.current = false;
      return;
    }
    load();
  }, [hydrated, load]);

  // Engagement tracking: how long a reader actually stays on an article, plus
  // which depth/level they read it at. Vercel Web Analytics already reports real
  // visitors, per-article page views, and location; this custom event adds the
  // dwell time it can't measure on its own. Fires once, on leaving the article
  // (tab hidden, tab/page close, client-side nav, or a depth/level switch).
  useEffect(() => {
    if (loading || !generated) return;
    const startedAt = Date.now();
    let sent = false;
    const title = node.title.replace(/\s*\*+$/, "");
    const fire = () => {
      if (sent) return;
      if (isExcludedVisitor()) return; // owner opted this browser out (?mine)
      const seconds = Math.round((Date.now() - startedAt) / 1000);
      if (seconds < 3) return; // ignore flickers and instant bounces
      sent = true;
      const payload = JSON.stringify({
        name: "article_read",
        nodeId: node.id,
        title,
        path: window.location.pathname,
        depth: shownDepth,
        level: shownLevel,
        seconds,
        dwell: dwellBucket(seconds),
        referrer: document.referrer || null,
      });
      // Beacon so it still sends while the page is unloading; keepalive fetch
      // is the fallback. Fully fire-and-forget — never blocks or throws.
      try {
        const blob = new Blob([payload], { type: "application/json" });
        if (navigator.sendBeacon?.("/api/track", blob)) return;
        fetch("/api/track", {
          method: "POST",
          body: payload,
          headers: { "Content-Type": "application/json" },
          keepalive: true,
        }).catch(() => {});
      } catch {
        // ignore — analytics must never affect the reading experience
      }
    };
    const onVisibility = () => {
      if (document.visibilityState === "hidden") fire();
    };
    document.addEventListener("visibilitychange", onVisibility);
    window.addEventListener("pagehide", fire);
    return () => {
      document.removeEventListener("visibilitychange", onVisibility);
      window.removeEventListener("pagehide", fire);
      fire(); // client-side navigation away, unmount, or depth/level change
    };
  }, [node.id, loading, generated, shownDepth, shownLevel]);

  const isAudio = spec.kind === "audio";
  const isVisual = spec.kind === "visual";

  return (
    <article className="max-w-[720px] mx-auto px-1">
      {/* Breadcrumb — house + arrows + linked ancestors. On mobile the text runs a
          touch larger and every link carries a taller tap area (py-1.5 -my-1.5), so
          the ancestor crumbs are comfortably tappable on a phone rather than a
          pixel-thin target that fingers miss. Desktop reverts to the compact size. */}
      <nav className="flex items-center flex-wrap gap-x-1.5 gap-y-0.5 text-[14px] sm:text-[12.5px] text-muted">
        <Link href="/" aria-label="Home" className="text-faint hover:text-purple transition-colors py-1.5 -my-1.5">
          <svg width="15" height="15" viewBox="0 0 16 16" fill="none" stroke="currentColor" strokeWidth="1.4" strokeLinejoin="round">
            <path d="M2.5 7 8 2.5 13.5 7" strokeLinecap="round" />
            <path d="M4 6.5v6.5h8V6.5" />
          </svg>
        </Link>
        {node.crumbs.map((c, i) => (
          <span key={i} className="flex items-center gap-x-1.5">
            <Chevron />
            {c.href ? (
              <Link
                href={c.href}
                aria-current={c.current ? "page" : undefined}
                className={
                  c.current
                    ? "text-ink font-medium hover:text-purple transition-colors py-1.5 -my-1.5"
                    : "hover:text-purple transition-colors py-1.5 -my-1.5"
                }
              >
                {c.label}
              </Link>
            ) : (
              <span className="text-ink font-medium">{c.label}</span>
            )}
          </span>
        ))}
      </nav>

      {/* Title with the inline learning-mode rail beside it */}
      <div className="mt-4 flex items-start gap-x-3 gap-y-1 flex-wrap">
        <h1 className="font-sans font-bold text-[32px] leading-[1.12] tracking-[-0.02em] text-ink">
          {/* Strip any literal trailing "*" from the title: the reviewed marker
              below is the single, styled source of the asterisk on the heading
              (the seed "*" still flags the topic in the tree, which has no
              reviewed signal of its own). */}
          {node.title.replace(/\s*\*+$/, "")}
          {reviewed && (
            <span
              title="This article has been reviewed by a human"
              aria-label="Human-reviewed"
              className="ml-1.5 align-super text-maroon text-[20px] select-none"
            >
              *
            </span>
          )}
        </h1>
        <div className="mt-2 flex-1 min-w-[120px]">
          <LearningModeRail active={mode} onSelect={(id: Mode) => setPrefs({ mode: id })} />
        </div>
      </div>

      {/* Depth + Level controls. The reviewed master is the free "Detailed"
          tier (default); "Research" is a separate, gated frontier tier that
          locks to Expert — nothing written is hidden behind it. */}
      <div className="mt-4 space-y-2.5">
        <div className="flex items-center gap-3 flex-wrap">
          <span className="font-mono text-[10px] tracking-[0.12em] uppercase text-whisper w-[42px] shrink-0">
            {t(lang, "depth")}
          </span>
          <div className="flex flex-wrap gap-[6px]">
            {DEPTH_TIERS.map((it) => (
              <button
                key={it.id}
                onClick={() => {
                  setGate(false);
                  setShownDepth(it.id);
                  setPrefs({ depth: it.id });
                }}
                className={chipCls(!gate && it.id === shownDepth)}
              >
                {t(lang, it.key)}
              </button>
            ))}
            {/* Gated frontier tier — locks to Expert, opens the signup panel. */}
            <button
              onClick={() => {
                setGate(true);
                setShownLevel("expert");
                setPrefs({ level: "expert" });
              }}
              className={`${chipCls(gate)} inline-flex items-center gap-[3px]`}
            >
              <svg width="9" height="9" viewBox="0 0 16 16" fill="none" stroke="currentColor" strokeWidth="1.8" className="text-maroon">
                <rect x="3" y="7" width="10" height="7" rx="1.5" />
                <path d="M5 7V5a3 3 0 0 1 6 0v2" />
              </svg>
              {t(lang, "research")}
            </button>
          </div>
        </div>
        {!gate && (
          <ControlRow
            labelKey="level"
            lang={lang}
            items={LEVELS}
            value={shownLevel}
            onSelect={(id) => {
              setShownLevel(id as Level);
              setPrefs({ level: id as Level });
            }}
          />
        )}
      </div>

      {gate ? (
        <ResearchGate nodeId={node.id} title={node.title.replace(/\s*\*+$/, "")} />
      ) : (
        <>
      <hr className="my-7 border-line" />

      {/* Body */}
      {loading ? (
        <p className="font-sans italic text-[15px] text-faint">
          {t(lang, "composing")}
        </p>
      ) : (
        <>
          {isAudio && (
            <div className="mb-5">
              <VoiceButton text={body} lang={lang} />
            </div>
          )}
          {isVisual && (
            <p className="mb-5 font-sans text-[13px] text-muted bg-purple-soft/60 border border-line rounded-xl px-4 py-2.5">
              Rich {spec.label.toLowerCase()} generation is coming soon — for now, here’s the{" "}
              {spec.label.toLowerCase()} described in words.
            </p>
          )}
          <div
            id="reader-content"
            className="prose-reading"
            dir={isRtl(lang) ? "rtl" : "ltr"}
          >
            <ReactMarkdown
              remarkPlugins={[remarkGfm, remarkMath]}
              rehypePlugins={[rehypeKatex]}
              components={{
                h2: ({ children }) => <h2 id={headingId(children)}>{children}</h2>,
                h3: ({ children }) => <h3 id={headingId(children)}>{children}</h3>,
                // External links open in a new tab. Affiliate links (our tagged
                // Amazon/Bookshop URLs) are marked rel="sponsored nofollow" per
                // Google/FTC guidance. A linkified book TITLE keeps the normal
                // prominent link style so it's obviously tappable; only the
                // small trailing store tag (its text carries the "↗") is muted.
                a: ({ href, children }) => {
                  const url = typeof href === "string" ? href : "";
                  if (!/^https?:\/\//.test(url)) return <a href={url}>{children}</a>;
                  const affiliate =
                    (/amazon\./.test(url) && /[?&]tag=/.test(url)) ||
                    /bookshop\.org\//.test(url);
                  const compact = affiliate && /↗/.test(extractText(children));
                  return (
                    <a
                      href={url}
                      target="_blank"
                      rel={affiliate ? "sponsored nofollow noopener noreferrer" : "noopener noreferrer"}
                      className={compact ? "affiliate-link" : undefined}
                    >
                      {children}
                    </a>
                  );
                },
                // A fenced ```example block becomes an interactive "Your turn"
                // practice box. We intercept at the <pre> so the surrounding
                // <pre><code> code styling never wraps the widget.
                pre: ({ children }) => {
                  const child = Array.isArray(children) ? children[0] : children;
                  const cls =
                    child && typeof child === "object" && "props" in child
                      ? // eslint-disable-next-line @typescript-eslint/no-explicit-any
                        ((child as any).props?.className ?? "")
                      : "";
                  if (typeof cls === "string" && /language-example\b/.test(cls)) {
                    // eslint-disable-next-line @typescript-eslint/no-explicit-any
                    const spec = extractText((child as any).props?.children).trim();
                    return <WorkedExample spec={spec} lang={lang} />;
                  }
                  // A fenced ```supplydemand block becomes an interactive
                  // supply-and-demand diagram with shift sliders.
                  if (typeof cls === "string" && /language-supplydemand\b/.test(cls)) {
                    return <SupplyDemandChart />;
                  }
                  // A fenced ```incomegood block becomes an interactive diagram
                  // of a demand curve shifting with income (normal vs inferior).
                  if (typeof cls === "string" && /language-incomegood\b/.test(cls)) {
                    return <IncomeGoodChart />;
                  }
                  // A fenced ```giffen block decomposes a price rise into its
                  // substitution and income effects (normal / inferior / Giffen).
                  if (typeof cls === "string" && /language-giffen\b/.test(cls)) {
                    return <GiffenChart />;
                  }
                  // A fenced ```blackbody block becomes the interactive spectrum
                  // "thermometer of violence" (Wien's law, temperature slider).
                  if (typeof cls === "string" && /language-blackbody\b/.test(cls)) {
                    return <BlackbodyChart />;
                  }
                  // A fenced ```segmentedmirror block becomes the drag-to-rotate
                  // 3D hexagonal segmented-mirror model.
                  if (typeof cls === "string" && /language-segmentedmirror\b/.test(cls)) {
                    return <SegmentedMirror />;
                  }
                  // A fenced ```rocketequation block becomes the interactive
                  // Tsiolkovsky Δv-vs-mass-ratio explorer (propellant + slider).
                  if (typeof cls === "string" && /language-rocketequation\b/.test(cls)) {
                    return <RocketEquation />;
                  }
                  // A fenced ```stagingsplit block becomes the interactive
                  // two-stage Δv-split payload explorer.
                  if (typeof cls === "string" && /language-stagingsplit\b/.test(cls)) {
                    return <StagingSplit />;
                  }
                  // A fenced ```powerthrust block becomes the interactive
                  // F = 2P/v_e thrust-vs-exhaust-velocity tradeoff (log-log).
                  if (typeof cls === "string" && /language-powerthrust\b/.test(cls)) {
                    return <PowerThrustTrade />;
                  }
                  // A fenced ```reuseeconomics block becomes the interactive
                  // amortization explorer ($/kg vs first-stage reuses).
                  if (typeof cls === "string" && /language-reuseeconomics\b/.test(cls)) {
                    return <ReuseEconomics />;
                  }
                  // A fenced ```thermochem block becomes the interactive
                  // exhaust-velocity ceiling explorer (v_e vs T_c and M).
                  if (typeof cls === "string" && /language-thermochem\b/.test(cls)) {
                    return <ThermochemCeiling />;
                  }
                  // A fenced ```enginecycles block becomes the interactive
                  // engine-cycle selector (turbine-exhaust fate + gauges).
                  if (typeof cls === "string" && /language-enginecycles\b/.test(cls)) {
                    return <EngineCycles />;
                  }
                  // A fenced ```ascentbudget block becomes the interactive
                  // ascent Δv loss-budget (latitude + thrust-to-weight sliders).
                  if (typeof cls === "string" && /language-ascentbudget\b/.test(cls)) {
                    return <AscentBudget />;
                  }
                  // A fenced ```orbitshape block becomes the interactive vis-viva
                  // conic-section orbit explorer (speed sets the orbit shape).
                  if (typeof cls === "string" && /language-orbitshape\b/.test(cls)) {
                    return <OrbitShape />;
                  }
                  // A fenced ```hohmann block becomes the interactive
                  // Hohmann-transfer explorer (transfer ellipse + Δv budget).
                  if (typeof cls === "string" && /language-hohmann\b/.test(cls)) {
                    return <HohmannTransfer />;
                  }
                  // A fenced ```lagrangemap block becomes the interactive
                  // five-Lagrange-points map (mass-ratio slider + stability).
                  if (typeof cls === "string" && /language-lagrangemap\b/.test(cls)) {
                    return <LagrangePoints />;
                  }
                  // A fenced ```sunsync block becomes the interactive
                  // sun-synchronous orbit designer (J2 nodal precession).
                  if (typeof cls === "string" && /language-sunsync\b/.test(cls)) {
                    return <SunSyncOrbit />;
                  }
                  // A fenced ```planethohmann block becomes the interactive
                  // interplanetary Hohmann trip planner (planet → Δv + time).
                  if (typeof cls === "string" && /language-planethohmann\b/.test(cls)) {
                    return <PlanetHohmann />;
                  }
                  // A fenced ```debrislifetime block becomes the interactive
                  // orbital-decay-lifetime-vs-altitude explorer.
                  if (typeof cls === "string" && /language-debrislifetime\b/.test(cls)) {
                    return <DebrisLifetime />;
                  }
                  // A fenced ```redshiftband block becomes the interactive
                  // redshift-to-band explorer (why the first galaxies force IR).
                  if (typeof cls === "string" && /language-redshiftband\b/.test(cls)) {
                    return <RedshiftBand />;
                  }
                  // A fenced ```interferometrybaseline block becomes the
                  // interactive θ = 1.22λ/B baseline-vs-resolution explorer.
                  if (typeof cls === "string" && /language-interferometrybaseline\b/.test(cls)) {
                    return <InterferometryBaseline />;
                  }
                  // A fenced ```consumablesmass block becomes the interactive
                  // consumables-mass explorer (crew x days, recycling closure).
                  if (typeof cls === "string" && /language-consumablesmass\b/.test(cls)) {
                    return <ConsumablesMass />;
                  }
                  // A fenced ```boneloss block becomes the interactive
                  // bone-loss-over-mission explorer (Wolff's law + exercise).
                  if (typeof cls === "string" && /language-boneloss\b/.test(cls)) {
                    return <BoneLoss />;
                  }
                  // A fenced ```artificialgravity block becomes the interactive
                  // a = ω²r spin-gravity explorer (radius vs rpm for 1 g).
                  if (typeof cls === "string" && /language-artificialgravity\b/.test(cls)) {
                    return <ArtificialGravity />;
                  }
                  // A fenced ```radiationdose block becomes the interactive
                  // dose-vs-transit-time explorer (radiation as a propulsion problem).
                  if (typeof cls === "string" && /language-radiationdose\b/.test(cls)) {
                    return <RadiationDose />;
                  }
                  // A fenced ```shieldingparadox block becomes the interactive
                  // dose-vs-shielding curve (a little shielding is worse than none).
                  if (typeof cls === "string" && /language-shieldingparadox\b/.test(cls)) {
                    return <ShieldingParadox />;
                  }
                  // A fenced ```loopclosuremass block becomes the interactive
                  // carried-mass-vs-duration explorer (closing loops trades a
                  // growing consumable for a fixed mass of recycling machinery).
                  if (typeof cls === "string" && /language-loopclosuremass\b/.test(cls)) {
                    return <LoopClosureMass />;
                  }
                  // A fenced ```biosphere2oxygen block becomes the interactive
                  // sealed-oxygen-decline explorer (closure is unforgiving).
                  if (typeof cls === "string" && /language-biosphere2oxygen\b/.test(cls)) {
                    return <Biosphere2Oxygen />;
                  }
                  // A fenced ```architecturemass block becomes the interactive
                  // LOR-vs-direct-ascent mass comparison (fits one Saturn V, or
                  // needs the never-built Nova).
                  if (typeof cls === "string" && /language-architecturemass\b/.test(cls)) {
                    return <ArchitectureMass />;
                  }
                  // A fenced ```dvbudget block becomes the interactive Δv-budget
                  // ledger (launch dominates; the atmosphere brakes for free).
                  if (typeof cls === "string" && /language-dvbudget\b/.test(cls)) {
                    return <DvBudget />;
                  }
                  // A fenced ```shuttlerisk block becomes the interactive
                  // risk-perception-gap explorer (Feynman: management vs
                  // engineers vs the real record).
                  if (typeof cls === "string" && /language-shuttlerisk\b/.test(cls)) {
                    return <ShuttleRisk />;
                  }
                  // A fenced ```normalizeddeviance block becomes the interactive
                  // accepted-risk ratchet toward the failure line.
                  if (typeof cls === "string" && /language-normalizeddeviance\b/.test(cls)) {
                    return <NormalizedDeviance />;
                  }
                  // A fenced ```lifechecklist block becomes the interactive
                  // checklist-threshold classifier that never gets every case right.
                  if (typeof cls === "string" && /language-lifechecklist\b/.test(cls)) {
                    return <LifeChecklist />;
                  }
                  // A fenced ```entropyexport block becomes the interactive
                  // open-system view (order held by exporting entropy).
                  if (typeof cls === "string" && /language-entropyexport\b/.test(cls)) {
                    return <EntropyExport />;
                  }
                  // A fenced ```originodds block becomes the interactive
                  // easy-or-hard explorer (per-world origin odds → living worlds).
                  if (typeof cls === "string" && /language-originodds\b/.test(cls)) {
                    return <OriginOdds />;
                  }
                  // A fenced ```lifeladder block becomes the interactive
                  // great-filter ladder (simple life common, minds rare).
                  if (typeof cls === "string" && /language-lifeladder\b/.test(cls)) {
                    return <LifeLadder />;
                  }
                  // A fenced ```habitablezone block becomes the interactive
                  // Goldilocks-band explorer (scales with the star; tidal oceans beyond).
                  if (typeof cls === "string" && /language-habitablezone\b/.test(cls)) {
                    return <HabitableZone />;
                  }
                  // A fenced ```distanceladder block becomes the interactive
                  // rung-by-rung reach chart (radar → parallax → Cepheids → SNe → redshift).
                  if (typeof cls === "string" && /language-distanceladder\b/.test(cls)) {
                    return <DistanceLadder />;
                  }
                  // A fenced ```oceanaccess block becomes the interactive
                  // ice-shell cross-section (drill vs plume flythrough).
                  if (typeof cls === "string" && /language-oceanaccess\b/.test(cls)) {
                    return <OceanAccess />;
                  }
                  // A fenced ```ingredientsforlife block becomes the interactive
                  // habitable-vs-inhabited checklist of Cassini's plume finds.
                  if (typeof cls === "string" && /language-ingredientsforlife\b/.test(cls)) {
                    return <IngredientsForLife />;
                  }
                  // A fenced ```disequilibrium block becomes the interactive
                  // methane-decay plot (life holding an atmosphere out of balance).
                  if (typeof cls === "string" && /language-disequilibrium\b/.test(cls)) {
                    return <Disequilibrium />;
                  }
                  // A fenced ```biosignaturecase block becomes the interactive
                  // confidence-ladder for building the case that a world is alive.
                  if (typeof cls === "string" && /language-biosignaturecase\b/.test(cls)) {
                    return <BiosignatureCase />;
                  }
                  // A fenced ```drakeequation block becomes the interactive
                  // seven-factor Drake explorer with a live N meter.
                  if (typeof cls === "string" && /language-drakeequation\b/.test(cls)) {
                    return <DrakeEquation />;
                  }
                  // A fenced ```greatfilter block becomes the interactive
                  // road-to-civilisation with a movable filter (behind vs ahead).
                  if (typeof cls === "string" && /language-greatfilter\b/.test(cls)) {
                    return <GreatFilter />;
                  }
                  // A fenced ```skylatitude block becomes the interactive
                  // Earth-geometry proof that the pole's altitude equals latitude.
                  if (typeof cls === "string" && /language-skylatitude\b/.test(cls)) {
                    return <SkyLatitude />;
                  }
                  // A fenced ```lineofsight block becomes the interactive
                  // directions-but-not-distances (line-of-sight) demonstration.
                  if (typeof cls === "string" && /language-lineofsight\b/.test(cls)) {
                    return <LineOfSight />;
                  }
                  // A fenced ```seasonmaker block becomes the interactive Sun's
                  // daily-altitude curve (directness + duration from the tilt).
                  if (typeof cls === "string" && /language-seasonmaker\b/.test(cls)) {
                    return <SeasonMaker />;
                  }
                  // A fenced ```gnomon block becomes the interactive shadow-stick
                  // reading the season — and the tilt — from a noon shadow.
                  if (typeof cls === "string" && /language-gnomon\b/.test(cls)) {
                    return <Gnomon />;
                  }
                  // A fenced ```moonphase block becomes the interactive phase
                  // orrery (a half-lit sphere seen from a moving vantage point).
                  if (typeof cls === "string" && /language-moonphase\b/.test(cls)) {
                    return <MoonPhase />;
                  }
                  // A fenced ```moonclock block becomes the interactive phase-as-
                  // clock (rise/culminate/set times from the phase).
                  if (typeof cls === "string" && /language-moonclock\b/.test(cls)) {
                    return <MoonClock />;
                  }
                  // A fenced ```eclipsenodes block becomes the interactive tilt-and-
                  // nodes explainer (why eclipses aren't monthly).
                  if (typeof cls === "string" && /language-eclipsenodes\b/.test(cls)) {
                    return <EclipseNodes />;
                  }
                  // A fenced ```eclipsesizes block becomes the interactive Sun/Moon
                  // size-match (total vs annular, the corona).
                  if (typeof cls === "string" && /language-eclipsesizes\b/.test(cls)) {
                    return <EclipseSizes />;
                  }
                  // A fenced ```celestialgrid block becomes the interactive RA/dec
                  // address explorer.
                  if (typeof cls === "string" && /language-celestialgrid\b/.test(cls)) {
                    return <CelestialGrid />;
                  }
                  // A fenced ```longitudeclock block becomes the interactive
                  // longitude-by-time (celestial navigation) explorer.
                  if (typeof cls === "string" && /language-longitudeclock\b/.test(cls)) {
                    return <LongitudeClock />;
                  }
                  // A fenced ```solarsidereal block becomes the interactive two-days
                  // explorer (why the solar day is 4 min longer than the sidereal).
                  if (typeof cls === "string" && /language-solarsidereal\b/.test(cls)) {
                    return <SolarSiderealDay />;
                  }
                  // A fenced ```calendardrift block becomes the interactive
                  // Julian-vs-Gregorian calendar-drift explorer.
                  if (typeof cls === "string" && /language-calendardrift\b/.test(cls)) {
                    return <CalendarDrift />;
                  }
                  // A fenced ```precessioncone block becomes the interactive
                  // wandering-pole explorer (the pole star changes over millennia).
                  if (typeof cls === "string" && /language-precessioncone\b/.test(cls)) {
                    return <PrecessionCone />;
                  }
                  // A fenced ```equinoxdrift block becomes the interactive
                  // equinox-precession / astrology-drift explorer.
                  if (typeof cls === "string" && /language-equinoxdrift\b/.test(cls)) {
                    return <EquinoxDrift />;
                  }
                  // A fenced ```retrogradesky block becomes the interactive
                  // retrograde-motion explorer (Earth overtaking Mars → backward loop).
                  if (typeof cls === "string" && /language-retrogradesky\b/.test(cls)) {
                    return <RetrogradeSky />;
                  }
                  // A fenced ```eratosthenesshadow block becomes the interactive
                  // shadow-angle → Earth-circumference measurement.
                  if (typeof cls === "string" && /language-eratosthenesshadow\b/.test(cls)) {
                    return <EratosthenesShadow />;
                  }
                  // A fenced ```epicyclemachine block becomes the interactive
                  // deferent-and-epicycle retrograde machine (geocentric).
                  if (typeof cls === "string" && /language-epicyclemachine\b/.test(cls)) {
                    return <EpicycleMachine />;
                  }
                  // A fenced ```equantdiagram block becomes the interactive equant
                  // explorer (uniform motion only as seen from the offset equant point).
                  if (typeof cls === "string" && /language-equantdiagram\b/.test(cls)) {
                    return <EquantDiagram />;
                  }
                  // A fenced ```elongationdistance block becomes the interactive
                  // scale-model explorer (max elongation → inner-planet distance in AU).
                  if (typeof cls === "string" && /language-elongationdistance\b/.test(cls)) {
                    return <ElongationDistance />;
                  }
                  // A fenced ```ellipseorbit block becomes the interactive Kepler
                  // first-law explorer (ellipse, two foci, Sun at one, eccentricity).
                  if (typeof cls === "string" && /language-ellipseorbit\b/.test(cls)) {
                    return <EllipseOrbit />;
                  }
                  // A fenced ```equalareas block becomes the interactive Kepler
                  // second-law explorer (equal areas in equal times, varying speed).
                  if (typeof cls === "string" && /language-equalareas\b/.test(cls)) {
                    return <EqualAreas />;
                  }
                  // A fenced ```venusphases block becomes the interactive phases-of-Venus
                  // explorer (the decisive test — full cycle + size swing, Sun-orbiting).
                  if (typeof cls === "string" && /language-venusphases\b/.test(cls)) {
                    return <VenusPhases />;
                  }
                  // A fenced ```jupitermoons block becomes the interactive Galilean-moons
                  // explorer (a centre of motion that is not the Earth).
                  if (typeof cls === "string" && /language-jupitermoons\b/.test(cls)) {
                    return <JupiterMoons />;
                  }
                  // A fenced ```newtoncannon block becomes the interactive Newton's-
                  // cannonball explorer (orbit as perpetual falling; real integrated paths).
                  if (typeof cls === "string" && /language-newtoncannon\b/.test(cls)) {
                    return <NewtonCannon />;
                  }
                  // A fenced ```applemoon block becomes the interactive apple-and-Moon
                  // inverse-square unification (surface gravity diluted to the Moon's orbit).
                  if (typeof cls === "string" && /language-applemoon\b/.test(cls)) {
                    return <AppleMoon />;
                  }
                  // A fenced ```spectrumlab block becomes the interactive Kirchhoff's-laws
                  // spectrum laboratory (continuous / emission / absorption, per element).
                  if (typeof cls === "string" && /language-spectrumlab\b/.test(cls)) {
                    return <SpectrumLab />;
                  }
                  // A fenced ```dopplershift block becomes the interactive Doppler
                  // explorer (spectral lines shifting with line-of-sight velocity).
                  if (typeof cls === "string" && /language-dopplershift\b/.test(cls)) {
                    return <DopplerShift />;
                  }
                  // A fenced ```lighttime block becomes the light-travel-time explorer
                  // (an expanding wavefront sweeping past the planets from the Sun).
                  if (typeof cls === "string" && /language-lighttime\b/.test(cls)) {
                    return <LightTime />;
                  }
                  // A fenced ```snowline block becomes the snow-line explorer
                  // (disk temperature vs distance, with the 2.7 AU condensation boundary).
                  if (typeof cls === "string" && /language-snowline\b/.test(cls)) {
                    return <SnowLine />;
                  }
                  // A fenced ```fluxgradient block becomes the inverse-square solar-flux
                  // explorer (flux vs distance, the master variable of the block).
                  if (typeof cls === "string" && /language-fluxgradient\b/.test(cls)) {
                    return <FluxGradient />;
                  }
                  // A fenced ```solarboundaries block becomes the "where does the solar
                  // system end?" explorer (heliopause vs the Oort Cloud, the 833x gap).
                  if (typeof cls === "string" && /language-solarboundaries\b/.test(cls)) {
                    return <SolarBoundaries />;
                  }
                  // A fenced ```diskcollapse block becomes the collapse-to-disk explorer
                  // (a rotating cloud flattening into a disk, with the spin-up readout).
                  if (typeof cls === "string" && /language-diskcollapse\b/.test(cls)) {
                    return <DiskCollapse />;
                  }
                  // A fenced ```angularbudget block becomes the mass-vs-angular-momentum
                  // inversion explorer (the Sun's 99.87% mass but 0.61% angular momentum).
                  if (typeof cls === "string" && /language-angularbudget\b/.test(cls)) {
                    return <AngularBudget />;
                  }
                  // A fenced ```condensation block becomes the condensation-sequence
                  // explorer (which materials are solid vs vapour at each disk distance).
                  if (typeof cls === "string" && /language-condensation\b/.test(cls)) {
                    return <CondensationLadder />;
                  }
                  // A fenced ```densitydivide block becomes the density-fossil explorer
                  // (planet/moon density vs distance, the snow line's clean division).
                  if (typeof cls === "string" && /language-densitydivide\b/.test(cls)) {
                    return <DensityDivide />;
                  }
                  // A fenced ```driftbarrier block becomes the metre-size-barrier explorer
                  // (radial-drift infall time vs body size, with its catastrophic minimum).
                  if (typeof cls === "string" && /language-driftbarrier\b/.test(cls)) {
                    return <DriftBarrier />;
                  }
                  // A fenced ```gravfocus block becomes the gravitational-focusing explorer
                  // (effective capture reach vs body size, and runaway growth).
                  if (typeof cls === "string" && /language-gravfocus\b/.test(cls)) {
                    return <GravFocus />;
                  }
                  // A fenced ```resonance block becomes the mean-motion-resonance explorer
                  // (why conjunctions at a simple period ratio make tugs accumulate).
                  if (typeof cls === "string" && /language-resonance\b/.test(cls)) {
                    return <Resonance />;
                  }
                  // A fenced ```nicemodel block becomes the Nice-model explorer (the
                  // giants' orbits evolving through the 2:1 instability to today).
                  if (typeof cls === "string" && /language-nicemodel\b/.test(cls)) {
                    return <NiceModel />;
                  }
                  // A fenced ```coolingsize block becomes the size-cooling-activity
                  // explorer (A/V = 3/R: small worlds cool fast and die geologically).
                  if (typeof cls === "string" && /language-coolingsize\b/.test(cls)) {
                    return <CoolingSize />;
                  }
                  // A fenced ```greenhouse block becomes the greenhouse-effect explorer
                  // (equilibrium vs actual temperature; the Venus paradox).
                  if (typeof cls === "string" && /language-greenhouse\b/.test(cls)) {
                    return <GreenhouseBars />;
                  }
                  // A fenced ```planetcores block becomes the interior-structure explorer
                  // (core-fraction cross-sections; Mercury's outsized iron core).
                  if (typeof cls === "string" && /language-planetcores\b/.test(cls)) {
                    return <PlanetCores />;
                  }
                  // A fenced ```spinorbit block becomes the 3:2 spin-orbit explorer
                  // (Mercury's 176-day solar day and the retrograde Sun near perihelion).
                  if (typeof cls === "string" && /language-spinorbit\b/.test(cls)) {
                    return <SpinOrbit />;
                  }
                  // A fenced ```energybudget block becomes the sunlight-budget explorer
                  // (Venus reflects 77%, so it absorbs less than Earth and is colder without air).
                  if (typeof cls === "string" && /language-energybudget\b/.test(cls)) {
                    return <EnergyBudget />;
                  }
                  // A fenced ```runaway block becomes the runaway-greenhouse step-through
                  // (ocean → steam feedback → UV destruction of water → CO₂ to 92 bar).
                  if (typeof cls === "string" && /language-runaway\b/.test(cls)) {
                    return <Runaway />;
                  }
                  // A fenced ```faintyoungsun block becomes the faint-young-Sun paradox
                  // explorer (T_eq rises as the Sun brightens; the thermostat holds ~288 K).
                  if (typeof cls === "string" && /language-faintyoungsun\b/.test(cls)) {
                    return <FaintYoungSun />;
                  }
                  // A fenced ```thermostat block becomes the carbon-silicate feedback explorer
                  // (nudge Earth off 288 K and weathering restores it; Venus runs away).
                  if (typeof cls === "string" && /language-thermostat\b/.test(cls)) {
                    return <Thermostat />;
                  }
                  // A fenced ```isotopecrisis block becomes the lunar isotope-fingerprint
                  // explorer (the Moon predicted off Earth like Mars, but measured on Earth).
                  if (typeof cls === "string" && /language-isotopecrisis\b/.test(cls)) {
                    return <IsotopeCrisis />;
                  }
                  // A fenced ```tidalrecession block becomes the Earth-Moon tidal-evolution
                  // explorer (the bulge dragged ahead; the Moon recedes; the Devonian day).
                  if (typeof cls === "string" && /language-tidalrecession\b/.test(cls)) {
                    return <TidalRecession />;
                  }
                  // A fenced ```causalchain block becomes the size-to-death chain explorer
                  // (Mars's eight links from small radius to frozen desert, evidence at each).
                  if (typeof cls === "string" && /language-causalchain\b/.test(cls)) {
                    return <CausalChain />;
                  }
                  // A fenced ```triplepoint block becomes the water phase-diagram explorer
                  // (below 6.11 mbar liquid water is impossible; Mars sits at the threshold).
                  if (typeof cls === "string" && /language-triplepoint\b/.test(cls)) {
                    return <TriplePoint />;
                  }
                  // A fenced ```quote block becomes a portrait + historical quote.
                  if (typeof cls === "string" && /language-quote\b/.test(cls)) {
                    // eslint-disable-next-line @typescript-eslint/no-explicit-any
                    const spec = extractText((child as any).props?.children).trim();
                    return <Quotation spec={spec} />;
                  }
                  return <pre>{children}</pre>;
                },
              }}
            >
              {normalizeMath(injectAffiliateLinks(body.replace(STRIP_IMAGE_MARKER, ""), country))}
            </ReactMarkdown>
          </div>
          {streaming && (
            <p className="mt-3 font-sans text-[13px] text-faint animate-pulse" aria-live="polite">
              {t(lang, "composing")}
            </p>
          )}
        </>
      )}

      {!generated && !loading && (
        <p className="mt-4 font-mono text-[10.5px] tracking-[0.04em] text-whisper uppercase">
          Placeholder — set ANTHROPIC_API_KEY for original content
        </p>
      )}

      {/* Test CTA — held back until the article finishes streaming. */}
      {!loading && !streaming && (
        <div className="mt-8">
          {!showQuiz ? (
            <button
              onClick={() => setShowQuiz(true)}
              className="w-full flex justify-between items-center border border-maroon rounded-full px-5 py-3 hover:bg-[#faf3f0] transition-colors"
            >
              <span className="font-sans font-medium text-[14px] text-ink">
                {t(lang, "testYourself")}
              </span>
              <span className="font-sans font-semibold text-[16px] text-maroon">→</span>
            </button>
          ) : (
            <QuizPanel
              nodeId={node.id}
              level={shownLevel}
              title={node.title}
              onClose={() => setShowQuiz(false)}
              onPassed={() => markCompleted(node.id)}
              lang={lang}
            />
          )}
        </div>
      )}
        </>
      )}
    </article>
  );
}

function Chevron() {
  return (
    <svg width="12" height="12" viewBox="0 0 12 12" fill="none" stroke="currentColor" strokeWidth="1.4" className="text-faint">
      <path d="M4.5 3 7.5 6 4.5 9" strokeLinecap="round" strokeLinejoin="round" />
    </svg>
  );
}

// Reader depth tiers. The reviewed master (stored internally at the "research"
// rung) is presented as the free, default "Detailed" tier — every written
// article moved down a notch in NAME only, nothing hidden. A separate, gated
// "Research" tier sits above it (rendered specially, not in this list): a
// coming-soon frontier of articles written by working researchers.
const DEPTH_TIERS: { id: Depth; key: string }[] = [
  { id: "skim", key: "skim" },
  { id: "definition", key: "definition" },
  { id: "medium", key: "medium" },
  { id: "research", key: "detailed" }, // the master, badged "Detailed"
];

// Shared pill styling for the depth chips (mirrors ControlRow's buttons).
const chipCls = (active: boolean) =>
  `font-sans text-[11px] px-[10px] py-[4px] rounded-full transition-colors ${
    active
      ? "border-[1.1px] border-ink bg-page text-ink"
      : "border border-[rgba(33,29,24,.08)] bg-pill text-ink"
  }`;

function ControlRow({
  labelKey,
  lang,
  items,
  value,
  onSelect,
}: {
  labelKey: string;
  lang: string;
  items: { id: string; label: string }[];
  value: string;
  onSelect: (id: string) => void;
}) {
  return (
    <div className="flex items-center gap-3 flex-wrap">
      <span className="font-mono text-[10px] tracking-[0.12em] uppercase text-whisper w-[42px] shrink-0">
        {t(lang, labelKey)}
      </span>
      <div className="flex flex-wrap gap-[6px]">
        {items.map((it) => {
          const active = it.id === value;
          return (
            <button
              key={it.id}
              onClick={() => onSelect(it.id)}
              className={`font-sans text-[11px] px-[10px] py-[4px] rounded-full transition-colors ${
                active
                  ? "border-[1.1px] border-ink bg-page text-ink"
                  : "border border-[rgba(33,29,24,.08)] bg-pill text-ink"
              }`}
            >
              {t(lang, it.id)}
            </button>
          );
        })}
      </div>
    </div>
  );
}

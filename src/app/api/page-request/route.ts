import { NextResponse, type NextRequest } from "next/server";
import { logPageRequest } from "@/lib/demand";

// Demand log for article pages, reported by the browser (PageBeacon) now that
// the pages themselves are cached and no longer log while rendering.
export async function POST(req: NextRequest) {
  let body: { nodeId?: unknown; title?: unknown; path?: unknown; cold?: unknown; referrer?: unknown };
  try {
    body = await req.json();
  } catch {
    return new NextResponse(null, { status: 204 });
  }
  const str = (v: unknown) => (typeof v === "string" ? v : undefined);
  const path = str(body.path);
  if (!path || !path.startsWith("/learn/")) return new NextResponse(null, { status: 204 });
  await logPageRequest({
    name: "article_request",
    nodeId: str(body.nodeId),
    title: str(body.title),
    path,
    cold: body.cold === true,
    referrer: str(body.referrer) ?? null,
    headers: req.headers,
  });
  return new NextResponse(null, { status: 204 });
}

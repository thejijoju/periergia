"use client";

import Link from "next/link";
import { accountsEnabled, useSession } from "@/lib/account";

// Header control: "Sign in" for visitors, an initial badge linking to the
// reader's own profile when signed in. Hidden when accounts are not
// configured. Client-side so cached article pages stay reader-independent.
export function AccountButton() {
  const session = useSession();
  if (!accountsEnabled || session === undefined) return null;
  if (!session) {
    return (
      <Link
        href="/signin"
        className="shrink-0 font-sans text-[13px] px-3 py-1.5 rounded-full border border-line text-ink hover:border-ink transition-colors whitespace-nowrap"
      >
        Sign in
      </Link>
    );
  }
  const email = session.user.email ?? "?";
  return (
    <Link
      href="/me"
      title="Your profile"
      aria-label="Your profile"
      className="shrink-0 w-8 h-8 rounded-full bg-pill text-ink font-sans text-[13px] font-semibold flex items-center justify-center hover:ring-1 hover:ring-ink transition"
    >
      {email.charAt(0).toUpperCase()}
    </Link>
  );
}

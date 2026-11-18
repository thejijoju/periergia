"use client";

import { useEffect } from "react";
import { useRouter } from "next/navigation";
import { ownProfilePath } from "@/lib/account";

// /me → your own profile page (or sign-in / the editor).
export default function Me() {
  const router = useRouter();
  useEffect(() => {
    ownProfilePath().then((p) => router.replace(p));
  }, [router]);
  return <main className="min-h-screen bg-page" />;
}

import { notFound, redirect } from "next/navigation";
import { getSubject, getFirstLeaf } from "@/lib/store";

// Bare /learn/[subject] → redirect to the subject's first readable node.
export default async function SubjectIndex({
  params,
}: {
  params: Promise<{ subject: string }>;
}) {
  const { subject } = await params;
  const subj = getSubject(subject);
  if (!subj) notFound();
  const leaf = getFirstLeaf(subj.id);
  if (!leaf) notFound();
  redirect(`/learn/${subj.slug}/${leaf.path.join("/")}`);
}

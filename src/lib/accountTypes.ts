// Account and profile types shared by server and client code.

export type AccountType = "student" | "professor" | "independent";

export const ACCOUNT_TYPES: { id: AccountType; label: string; hint: string }[] = [
  { id: "student", label: "Student", hint: "Enrolled at a university or college" },
  { id: "professor", label: "Professor / lecturer", hint: "Teaching or researching at a university" },
  { id: "independent", label: "Independent learner", hint: "Learning outside a university" },
];

export function accountTypeLabel(t: string): string {
  return ACCOUNT_TYPES.find((a) => a.id === t)?.label ?? "Independent learner";
}

export interface Profile {
  id: string;
  handle: string;
  display_name: string;
  account_type: AccountType;
  headline: string | null;
  bio: string | null;
  location: string | null;
  institution: string | null;
  field: string | null;
  website: string | null;
  skills: string[];
  avatar_url: string | null;
  degree: string | null;
  contact_email: string | null;
  is_public: boolean;
  show_progress: boolean;
}

export interface ProfileEntry {
  id?: number;
  kind: "education" | "experience";
  title: string;
  organisation: string;
  location: string | null;
  start_year: number | null;
  end_year: number | null;
  description: string | null;
  position: number;
}

import { NextResponse } from "next/server";
import type { Level, QuizQuestion } from "@/lib/types";
import { getNodeById, getCachedQuiz, putCachedQuiz } from "@/lib/store";
import { generateQuiz, gradeOpenAnswer } from "@/lib/generate";

export const runtime = "nodejs";

// Two actions on one route:
//   { action: "quiz",  nodeId, level }              → { questions }   (cached generate-once)
//   { action: "grade", question, answer }           → { correct, score, feedback }
export async function POST(req: Request) {
  let payload: {
    action?: "quiz" | "grade";
    nodeId?: string;
    level?: Level;
    question?: QuizQuestion;
    answer?: string;
  };
  try {
    payload = await req.json();
  } catch {
    return NextResponse.json({ error: "Invalid JSON" }, { status: 400 });
  }

  if (payload.action === "grade") {
    if (!payload.question || typeof payload.answer !== "string") {
      return NextResponse.json({ error: "Missing question/answer" }, { status: 400 });
    }
    const result = await gradeOpenAnswer(payload.question, payload.answer);
    return NextResponse.json(result);
  }

  // default: quiz
  const { nodeId, level } = payload;
  if (!nodeId || !level) {
    return NextResponse.json({ error: "Missing nodeId/level" }, { status: 400 });
  }
  const node = await getNodeById(nodeId);
  if (!node) return NextResponse.json({ error: "Unknown node" }, { status: 404 });

  const cached = await getCachedQuiz(nodeId, level);
  if (cached) return NextResponse.json({ questions: cached.questions, generated: cached.generated });

  const quiz = await generateQuiz(node, level);
  await putCachedQuiz(quiz);
  return NextResponse.json({ questions: quiz.questions, generated: quiz.generated });
}

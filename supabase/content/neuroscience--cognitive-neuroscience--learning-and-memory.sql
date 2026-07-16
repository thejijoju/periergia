-- Learning and Memory moved to Education & Learning → Learning Science.
-- The authored flagship now lives at
-- education-and-learning/learning-science/learning-and-memory (see
-- education-and-learning--learning-science--learning-and-memory.sql). To avoid
-- serving the same article at two URLs (duplicate content), retire the
-- human-reviewed master here so this node reverts to auto-generated content.
-- Idempotent: safe to re-run.

delete from content
where node_id = 'neuroscience/cognitive-neuroscience/learning-and-memory';

delete from quizzes
where node_id = 'neuroscience/cognitive-neuroscience/learning-and-memory';

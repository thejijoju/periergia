-- Purge stale cached content/quizzes for the Interest Rates node.
--
-- The node's summary was rewritten to remove closely-paraphrased copyrighted
-- text (the 9,500 / 10,000 / 5.26% worked example). Any cached bodies/quizzes
-- were DISTILLED from the old summary and still reproduce that example, so we
-- drop them here and let the next request re-distill from the corrected text.
--
-- Applied after seed.sql by .github/workflows/db-migrate.yml, so by the time
-- this runs the node's summary is already the clean version.
--
-- Self-limiting: only rows that still carry the old example are deleted. Once
-- the caches re-distill from the clean summary they no longer match, so this
-- file becomes a permanent no-op and never churns fresh cache on later
-- migrations. Safe to delete from the repo once it has run in production.

delete from content
where node_id = 'economics/introduction/interest-rates'
  and (body like '%9,500%' or body like '%9500%' or body like '%5.26%');

delete from quizzes
where node_id = 'economics/introduction/interest-rates'
  and (questions::text like '%9,500%'
       or questions::text like '%9500%'
       or questions::text like '%5.26%');

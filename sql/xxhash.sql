-- xxhash regression tests
\set VERBOSITY terse
\pset null 'NULL'
CREATE EXTENSION pg_xxhash;

-- All tests below should return NULL
SELECT pg_xxhash64(NULL);
SELECT pg_xxhash64(NULL, NULL);
SELECT pg_xxhash64('foo', NULL);
SELECT pg_xxhash64(NULL, 0);

-- Testing using default seed = 0
SELECT pg_xxhash64('foo'); -- default seed = 0
SELECT pg_xxhash64('foo', 0);
SELECT pg_xxhash64('foo') = pg_xxhash64('foo', 0); -- should be TRUE
SELECT pg_xxhash64('foo') = pg_xxhash64('foo', 1); -- should be FALSE
SELECT pg_xxhash64('foo') = pg_xxhash64('foo', NULL); -- should be NULL
SELECT pg_xxhash64('foo') IS DISTINCT FROM pg_xxhash64('foo', NULL); -- should be TRUE

-- Testing using an specific seeds
SELECT pg_xxhash64('foo', 100);
SELECT pg_xxhash64('foo', -100);
SELECT pg_xxhash64('foo', 100) = pg_xxhash64('foo', -100); -- should be FALSE

DROP EXTENSION pg_xxhash;

-- xxhash regression tests
\set VERBOSITY terse
\pset null 'NULL'
CREATE EXTENSION pg_xxhash;

-- XXH64 Tests
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

-- XXH3_64bits tests
SELECT pg_xxh3_64(NULL); -- should return NULL
SELECT pg_xxh3_64('foo');
SELECT pg_xxh3_64('bar');
SELECT pg_xxh3_64('foo') = pg_xxh3_64('foo'); -- should be TRUE
SELECT pg_xxh3_64('foo') = pg_xxh3_64('bar'); -- should be FALSE

DROP EXTENSION pg_xxhash;

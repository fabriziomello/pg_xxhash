/* pg_xxhash/pg_xxhash--1.0.sql */

-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION pg_xxhash" to load this file. \quit

CREATE FUNCTION pg_xxhash64(_input TEXT, _seed BIGINT DEFAULT 0)
RETURNS BIGINT
AS 'MODULE_PATHNAME'
LANGUAGE C IMMUTABLE STRICT;


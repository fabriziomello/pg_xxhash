/* -------------------------------------------------------------------------
 *
 * pg_xxhash.c
 *      Postgres implementation of xxHash hashing functions
 *
 * Copyright (C) 2023, Fabrízio de Royes Mello
 *
 * IDENTIFICATION
 *		pg_xxhash/pg_xxhash.c
 *
 * -------------------------------------------------------------------------
 */

#include "postgres.h"
#include "fmgr.h"
#include "utils/builtins.h"

#include "xxhash.h"

PG_MODULE_MAGIC;

/*
 * XXH64 function: https://cyan4973.github.io/xxHash/
 */
PG_FUNCTION_INFO_V1(pg_xxhash64);

Datum
pg_xxhash64(PG_FUNCTION_ARGS)
{
	char *input = text_to_cstring(PG_GETARG_TEXT_P(0));
	int64 seed = PG_ARGISNULL(1) ? 0 : PG_GETARG_INT64(1);

	PG_RETURN_INT64((int64) XXH64(input, strlen(input), (XXH64_hash_t) seed));
}

/*
 * XXH3_64bits function: https://cyan4973.github.io/xxHash/
 */
PG_FUNCTION_INFO_V1(pg_xxh3_64);

Datum
pg_xxh3_64(PG_FUNCTION_ARGS)
{
	char *input = text_to_cstring(PG_GETARG_TEXT_P(0));

	PG_RETURN_INT64((int64) XXH3_64bits(input, strlen(input)));
}

# pg_xxhash
[xxHash](https://github.com/Cyan4973/xxHash) functions for PostgreSQL.

## Supported PostgreSQL versions

The aim of the project is support as many community-supported major versions of Postgres as possible. Currently, the following versions of PostgreSQL are supported:

11, 12, 13, 14, 15 and 16.

## Dependencies

```sh
$ sudo apt install libxxhash-dev
```

## Installation from source

```sh
$ git clone https://github.com/fabriziomello/pg_xxhash.git
$ cd pg_xxhash
# Make sure your path includes the bin directory that contains the correct `pg_config`
$ PATH=/path/to/pg/bin:$PATH
$ USE_PGXS=1 make
$ USE_PGXS=1 make install
```

## Regression Tests

```sh
$ USE_PGXS=1 make installcheck
```

## Examples

```sql
CREATE EXTENSION pg_xxhash;

-- Testing using default seed = 0
SELECT pg_xxhash64('foo');
     pg_xxhash64     
---------------------
 3728699739546630719
(1 row)

SELECT pg_xxhash64('foo', 0);
     pg_xxhash64     
---------------------
 3728699739546630719
(1 row)

-- Testing using an specific seeds
SELECT pg_xxhash64('foo', 100);
     pg_xxhash64     
---------------------
 4679220945261188543
(1 row)
```


Please feel free to [open a PR](https://github.com/fabriziomello/pg_xxhash/pull/new/master).

## Authors

- [Fabrízio de Royes Mello](mailto:fabriziomello@gmail.com)

## License

PostgreSQL server source code, used under the [PostgreSQL license](https://www.postgresql.org/about/licence/).<br>
Portions Copyright (c) 1996-2023, The PostgreSQL Global Development Group<br>
Portions Copyright (c) 1994, The Regents of the University of California

All other parts are licensed under the Apache License Version 2.0, see LICENSE file for details.<br>
Copyright (c) 2023, Fabrízio de Royes Mello <fabriziomello@gmail.com>


MODULE_big = pg_xxhash
OBJS = pg_xxhash.o

REGRESS = xxhash

EXTENSION = pg_xxhash
DATA = pg_xxhash--0.1.sql
PGFILEDESC = "pg_xxhash - xxHash functions for PostgreSQL"

SHLIB_LINK += $(shell pkg-config --libs libxxhash)

PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)

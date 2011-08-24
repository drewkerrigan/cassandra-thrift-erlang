-ifndef(_cassandra_types_included).
-define(_cassandra_types_included, yeah).

-define(cassandra_ConsistencyLevel_ONE, 1).
-define(cassandra_ConsistencyLevel_QUORUM, 2).
-define(cassandra_ConsistencyLevel_LOCAL_QUORUM, 3).
-define(cassandra_ConsistencyLevel_EACH_QUORUM, 4).
-define(cassandra_ConsistencyLevel_ALL, 5).
-define(cassandra_ConsistencyLevel_ANY, 6).
-define(cassandra_ConsistencyLevel_TWO, 7).
-define(cassandra_ConsistencyLevel_THREE, 8).

-define(cassandra_IndexOperator_EQ, 0).
-define(cassandra_IndexOperator_GTE, 1).
-define(cassandra_IndexOperator_GT, 2).
-define(cassandra_IndexOperator_LTE, 3).
-define(cassandra_IndexOperator_LT, 4).

-define(cassandra_IndexType_KEYS, 0).

-define(cassandra_Compression_GZIP, 1).
-define(cassandra_Compression_NONE, 2).

-define(cassandra_CqlResultType_ROWS, 1).
-define(cassandra_CqlResultType_VOID, 2).
-define(cassandra_CqlResultType_INT, 3).

%% struct column

-record(column, {name = undefined :: string(), 
                 value = undefined :: string(), 
                 timestamp = undefined :: integer(), 
                 ttl = undefined :: integer()}).

%% struct superColumn

-record(superColumn, {name = undefined :: string(), 
                      columns = [] :: list()}).

%% struct counterColumn

-record(counterColumn, {name = undefined :: string(), 
                        value = undefined :: integer()}).

%% struct counterSuperColumn

-record(counterSuperColumn, {name = undefined :: string(), 
                             columns = [] :: list()}).

%% struct columnOrSuperColumn

-record(columnOrSuperColumn, {column = #column{} :: #column{}, 
                              super_column = #superColumn{} :: #superColumn{}, 
                              counter_column = #counterColumn{} :: #counterColumn{}, 
                              counter_super_column = #counterSuperColumn{} :: #counterSuperColumn{}}).

%% struct notFoundException

-record(notFoundException, {}).

%% struct invalidRequestException

-record(invalidRequestException, {why = undefined :: string()}).

%% struct unavailableException

-record(unavailableException, {}).

%% struct timedOutException

-record(timedOutException, {}).

%% struct authenticationException

-record(authenticationException, {why = undefined :: string()}).

%% struct authorizationException

-record(authorizationException, {why = undefined :: string()}).

%% struct schemaDisagreementException

-record(schemaDisagreementException, {}).

%% struct columnParent

-record(columnParent, {column_family = undefined :: string(), 
                       super_column = undefined :: string()}).

%% struct columnPath

-record(columnPath, {column_family = undefined :: string(), 
                     super_column = undefined :: string(), 
                     column = undefined :: string()}).

%% struct sliceRange

-record(sliceRange, {start = undefined :: string(), 
                     finish = undefined :: string(), 
                     reversed = false :: boolean(), 
                     count = 100 :: integer()}).

%% struct slicePredicate

-record(slicePredicate, {column_names = [] :: list(), 
                         slice_range = #sliceRange{} :: #sliceRange{}}).

%% struct indexExpression

-record(indexExpression, {column_name = undefined :: string(), 
                          op = undefined :: integer(), 
                          value = undefined :: string()}).

%% struct indexClause

-record(indexClause, {expressions = [] :: list(), 
                      start_key = undefined :: string(), 
                      count = 100 :: integer()}).

%% struct keyRange

-record(keyRange, {start_key = undefined :: string(), 
                   end_key = undefined :: string(), 
                   start_token = undefined :: string(), 
                   end_token = undefined :: string(), 
                   count = 100 :: integer()}).

%% struct keySlice

-record(keySlice, {key = undefined :: string(), 
                   columns = [] :: list()}).

%% struct keyCount

-record(keyCount, {key = undefined :: string(), 
                   count = undefined :: integer()}).

%% struct deletion

-record(deletion, {timestamp = undefined :: integer(), 
                   super_column = undefined :: string(), 
                   predicate = #slicePredicate{} :: #slicePredicate{}}).

%% struct mutation

-record(mutation, {column_or_supercolumn = #columnOrSuperColumn{} :: #columnOrSuperColumn{}, 
                   deletion = #deletion{} :: #deletion{}}).

%% struct tokenRange

-record(tokenRange, {start_token = undefined :: string(), 
                     end_token = undefined :: string(), 
                     endpoints = [] :: list()}).

%% struct authenticationRequest

-record(authenticationRequest, {credentials = dict:new() :: dict()}).

%% struct columnDef

-record(columnDef, {name = undefined :: string(), 
                    validation_class = undefined :: string(), 
                    index_type = undefined :: integer(), 
                    index_name = undefined :: string()}).

%% struct cfDef

-record(cfDef, {keyspace = undefined :: string(), 
                name = undefined :: string(), 
                column_type = "Standard" :: string(), 
                comparator_type = "BytesType" :: string(), 
                subcomparator_type = undefined :: string(), 
                comment = undefined :: string(), 
                row_cache_size = 0 :: float(), 
                key_cache_size = 200000 :: float(), 
                read_repair_chance = 1 :: float(), 
                column_metadata = [] :: list(), 
                gc_grace_seconds = undefined :: integer(), 
                default_validation_class = undefined :: string(), 
                id = undefined :: integer(), 
                min_compaction_threshold = undefined :: integer(), 
                max_compaction_threshold = undefined :: integer(), 
                row_cache_save_period_in_seconds = undefined :: integer(), 
                key_cache_save_period_in_seconds = undefined :: integer(), 
                memtable_flush_after_mins = undefined :: integer(), 
                memtable_throughput_in_mb = undefined :: integer(), 
                memtable_operations_in_millions = undefined :: float(), 
                replicate_on_write = undefined :: boolean(), 
                merge_shards_chance = undefined :: float(), 
                key_validation_class = undefined :: string(), 
                row_cache_provider = "org.apache.cassandra.cache.ConcurrentLinkedHashCacheProvider" :: string(), 
                key_alias = undefined :: string()}).

%% struct ksDef

-record(ksDef, {name = undefined :: string(), 
                strategy_class = undefined :: string(), 
                strategy_options = dict:new() :: dict(), 
                replication_factor = undefined :: integer(), 
                cf_defs = [] :: list(), 
                durable_writes = true :: boolean()}).

%% struct cqlRow

-record(cqlRow, {key = undefined :: string(), 
                 columns = [] :: list()}).

%% struct cqlResult

-record(cqlResult, {type = undefined :: integer(), 
                    rows = [] :: list(), 
                    num = undefined :: integer()}).

-endif.

-type fieldname() :: atom().

-type dbval() :: any().
-type erlval() :: any().
-type operator() :: binary().

-type columns() :: fieldname() | [fieldname()].
-type values() :: erlval() | [erlval()].

-type encoder() :: atom() | fun((erlval()) -> dbval()).
-type decoder() :: atom() | fun((dbval()) -> erlval()).
-type codec() :: atom() | {encoder(), decoder()}.
-type validator() :: fun((erlval()) -> ok | {error, any()}).

-type rowvals() :: #{ fieldname() => erlval() }.

-type datatype() :: 'int' | 'varchar' | 'date' | 'time' | 'timestamp' | 'text' | undefined.
          
-record(field, {
          name :: fieldname(),
          title :: string(),
          default :: any(),
          columns :: columns() | undefined,
          validator :: validator() | undefined,
          codec :: codec(),
          type :: datatype()
         }).

-record(schema, {
          table :: atom(),
          pk :: columns(),
          fields :: [#field{}]
         }).


-type fieldop() :: {op, operator(), erlval()}.

-type fieldval() :: {#field{}, erlval() | fieldop() | undefined}.
-type schemavals() :: {#schema{}, [fieldval()]}.
-type fieldset() :: [schemavals()].
-type bindings() :: [dbval()].


-record(dbquery, {
          sql :: binary(),
          fields :: fieldset(),
          bindings :: bindings()
         }).

-record(dbresult, {
          raw :: any(),
          module :: atom()
         }).



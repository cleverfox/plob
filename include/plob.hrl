-type fieldname() :: atom().

-type dbval() :: any().
-type erlval() :: any().

-type columns() :: fieldname() | [fieldname()].
-type values() :: erlval() | [erlval()].

-type encoder() :: atom() | fun((erlval()) -> dbval()).
-type decoder() :: atom() | fun((dbval()) -> erlval()).
-type validator() :: fun((erlval()) -> ok | {error, any()}).

-type rowvals() :: #{ fieldname() => erlval() }.
          
-record(field, {
          name :: fieldname(),
          columns :: columns() | undefined,
          validator :: validator() | undefined,
          encoder :: encoder() | undefined,
          decoder :: decoder() | undefined
         }).

-record(schema, {
          table :: atom(),
          pk :: columns(),
          fields :: [#field{}]
         }).




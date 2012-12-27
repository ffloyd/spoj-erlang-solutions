% Module with useful for me functions
-module(futil).
-compile([export_all]).

get_int() ->
	{ok, X} = io:fread("", "~d"),
	X.

% print only execution time in seconds
bench(M, F, A) ->
	{Time, _} = timer:tc(M, F, A),
	Time/1000000.

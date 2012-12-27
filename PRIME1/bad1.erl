-module(bad1).
% -export([main/0]).
-compile([export_all]).

% read helper
get_int() ->
	{ok, [X]} = io:fread("", "~d"),
	X.

% get all primes in range
primes(Start, End) when Start < 3          -> primes(3, End, [2]);
primes(Start, End) when Start rem 2 =:= 0  -> primes(Start+1, End);
primes(Start, End)                         -> primes(Start, End, []).

primes(C, N, L) when C > N -> lists:reverse(L);
primes(C, N, L) ->
	IsPrime = not lists:any(
		fun(X) -> C rem X =:= 0 end, 
		[2|lists:seq(3, round(math:sqrt(C)), 2)]
	),
	case IsPrime of
		true  -> primes(C+2, N, [C|L]);
		false -> primes(C+2, N, L)
	end.

% one interation
solve() ->
	lists:foreach(
		fun(X) ->
			io:fwrite("~p~n", [X])
		end,
		primes(get_int(), get_int())
	),
	io:fwrite("~n").

% main loop
main() ->
	lists:foreach(
		fun(_) -> solve() end,
		lists:seq(1, get_int())
	).
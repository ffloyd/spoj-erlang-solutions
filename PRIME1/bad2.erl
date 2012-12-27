-module(bad2).
-compile([export_all]).
%-export([main/0]).

get_int() ->
	{ok, [X]} = io:fread("", "~d"),
	X.


primes(Start, End) when Start < 3 -> [2 | primes(3, End)];
primes(Start, End) when Start rem 2 =:= 0 -> primes(Start+1, End);
primes(Start, End) -> primes(3, round(math:sqrt(End)), lists:seq(Start, End, 2), [2]).

primes(C, Max, L, _) when C > Max -> L;
primes(C, Max, L, P) ->
	MustFiltered = not lists:any(
		fun(X) -> C rem X =:= 0 end,
		P 
	),
	case MustFiltered of
		true ->
			F = fun(X) ->
				(X =:= C) orelse (X rem C =/= 0)
			end,
			primes(C+2, Max, lists:filter(F, L), P ++ [C]);
		false ->
			primes(C+2, Max, L, P)
	end.

solve() ->
	lists:foreach(
		fun(X) -> io:fwrite("~p~n", [X]) end,
		primes(get_int(), get_int())
	),
	io:fwrite("~n").

main() ->
	lists:foreach(
		fun(_) -> solve() end,
		lists:seq(1, get_int())
	).
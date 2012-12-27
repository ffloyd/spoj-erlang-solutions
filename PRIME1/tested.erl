-module(tested).
-compile([export_all]).
%-export([main/0]).

get_int() ->
	{ok, [X]} = io:fread("", "~d"),
	X.

primes(Start, End) when Start < 3 -> [2 | primes(3, End)];
primes(Start, End) when Start rem 2 =:= 0 -> primes(Start+1, End);
primes(Start, End) -> primes(2, round(math:sqrt(End)), Start, array:new(End-Start+1, {default, true}), []).

format_arr(Start, Arr) ->
	F = fun(I, V) ->
		case V of
			true  -> Start + I;
			false -> false
		end
	end,
	lists:filter(
		fun(X) ->
			is_integer(X)
		end,
		array:to_list(array:map(F, Arr))
	).

primes(C, Max, Start, Arr, _) when C > Max -> format_arr(Start, Arr);
primes(C, Max, Start, Arr, P) ->
	MustMapped = not lists:any(
		fun(X) -> C rem X =:= 0 end,
		P 
	),
	case MustMapped of
		true ->
			F = fun(I, V) ->
				case (Start + I =/= C) andalso ((Start + I) rem C =:= 0) of
					true  -> false;
					false -> V
				end
			end,
			primes(C+2, Max, Start, array:map(F, Arr), [C|P]);
		false ->
			primes(C+2, Max, Start, Arr, P)
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

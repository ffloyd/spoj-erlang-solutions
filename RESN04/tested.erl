-module(tested).
-export([main/0]).

read_int() ->
	{ok, [X]} = io:fread("", "~d"),
	X.

read_piles(0) -> [];
read_piles(N) -> [read_int() | read_piles(N-1)].

solve() ->
	read_piles(read_int()),
	io:fwrite("ALICE~n").

repeat(0) -> done;
repeat(N) ->
	solve(),
	repeat(N-1).

main() -> repeat(read_int()).
-module(tested).
-export([main/0]).

main() ->
	{ok, [N]} = io:fread("", "~d"),
	case N of
		42 ->
			done;
		N ->
			io:fwrite("~p~n", [N]),
			main()
	end.
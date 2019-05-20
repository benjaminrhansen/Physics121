-module(model).
-export([integrate/3]).

%% Base equation to be called
integrate(Yi, TimeInterval, Threshold) ->
		%% Call recursive function
		integrate(Yi, -9.8, -9.8, TimeInterval, TimeInterval, Threshold). 

integrate(YInitial, VelInitial, Accel, TimeInterval, RunningTime, Threshold) when RunningTime < Threshold ->
		%% output: Velocity Final, Position Final (Yf), Running Time
		io:format("Position Final (Yf): ~w~n",[YFinal = YInitial + VelInitial * TimeInterval]),
		io:format("Velocity Final: ~w~n",[VelocityFinal = VelInitial + Accel * TimeInterval]),
		io:format("Total Time: ~w~n~n", [RunningTime]),
        integrate(YFinal, VelocityFinal, Accel, TimeInterval, RunningTime + TimeInterval, Threshold);

integrate(YInitial, VelInitial, Accel, TimeInterval, RunningTime, _) ->
		io:format("Position Final (Yf): ~w~n",[YInitial + VelInitial * TimeInterval]),
		io:format("Velocity Final: ~w~n",[VelInitial + Accel * TimeInterval]),
		io:format("Total Time: ~w~n", [RunningTime]).

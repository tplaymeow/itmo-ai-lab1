balance(player_1, 600).
balance(player_2, 500).
balance(player_3, 400).
balance(player_4, 300).

player_position(player_1, 0).
player_position(player_2, 1).
player_position(player_3, 15).
player_position(player_4, 6).

object_category(blue_object_1, blue_category).
object_category(blue_object_2, blue_category).
object_category(blue_object_3, blue_category).
object_category(orange_object_1, orange_category).
object_category(orange_object_2, orange_category).
object_category(orange_object_3, orange_category).
object_category(red_object_1, red_category).
object_category(red_object_2, red_category).
object_category(red_object_3, red_category).
object_category(green_object_1, green_category).
object_category(green_object_2, green_category).
object_category(green_object_3, green_category).

object_position(blue_object_1, 1).
object_position(blue_object_2, 2).
object_position(blue_object_3, 3).
object_position(orange_object_1, 5).
object_position(orange_object_2, 6).
object_position(orange_object_3, 7).
object_position(red_object_1, 9).
object_position(red_object_2, 10).
object_position(red_object_3, 11).
object_position(green_object_1, 13).
object_position(green_object_2, 14).
object_position(green_object_3, 15).

object_price(blue_object_1, 100).
object_price(blue_object_2, 200).
object_price(blue_object_3, 300).
object_price(orange_object_1, 100).
object_price(orange_object_2, 200).
object_price(orange_object_3, 300).
object_price(red_object_1, 100).
object_price(red_object_2, 200).
object_price(red_object_3, 300).
object_price(green_object_1, 100).
object_price(green_object_2, 200).
object_price(green_object_3, 300).

player_ownership(player_1, blue_object_2).
player_ownership(player_2, orange_object_2).
player_ownership(player_3, red_object_2).
player_ownership(player_4, green_object_1).
player_ownership(player_4, green_object_2).
player_ownership(player_4, green_object_3).

distance_to_object(Player, Object, Distance) :-
    player_position(Player, PlayerPos),
    object_position(Object, ObjectPos),
    Distance is (ObjectPos - PlayerPos) mod 16.

players_distance(Player1, Player2, Distance) :-
    player_position(Player1, Player1Pos),
    player_position(Player2, Player2Pos),
    Distance is min((Player2Pos - Player1Pos) mod 16, (Player1Pos - Player2Pos) mod 16).

neighbor_players(Player1, Player2) :- 
    players_distance(Player1, Player2, 1).

list_sum([],0).
list_sum([Head|Tail], TotalSum):-
    list_sum(Tail, Sum1),
    TotalSum is Head+Sum1.

objects_price(Player, Price) :-
    findall(Object, player_ownership(Player, Object), Objects),
    maplist(object_price, Objects, Prices),
    list_sum(Prices, Price).


% tests

:- begin_tests(test).

test(test_distance_to_object_1) :-
    distance_to_object(player_1, blue_object_1, 1).

test(test_distance_to_object_2) :-
    distance_to_object(player_1, orange_object_1, 5).

test(test_distance_to_object_3) :-
    distance_to_object(player_1, red_object_1, 9).

test(test_distance_to_object_4) :-
    distance_to_object(player_1, green_object_1, 13).

test(test_players_distance_1) :-
    players_distance(player_1, player_2, 1).

test(test_players_distance_2) :-
    players_distance(player_1, player_3, 1).

test(test_players_distance_3) :-
    players_distance(player_1, player_4, 6).

test(test_players_distance_4) :-
    players_distance(player_4, player_1, 6).

test(test_neighbor_players_1) :-
    neighbor_players(player_1, player_3).

test(test_neighbor_players_2) :-
    neighbor_players(player_1, player_2).

test(test_objects_price_1) :-
    objects_price(player_4, 600).

test(test_objects_price_2) :-
    objects_price(player_2, 200).

:- end_tests(test).

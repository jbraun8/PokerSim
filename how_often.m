function [prob] = how_often(pre_flop, num_players, trials)

% Win percentage of a certain hand given number of players and trials

wins = 0;

for i = 1:trials
    deck = get_deck(0,pre_flop);
    starts = pre_flop;
    for j = 2:num_players
        starts = [starts;deck(1 + 2*(j-2):2 + 2*(j-2),:)];
    end
    river = deck(1 + 2*num_players:5 + 2*num_players,:);
    hand_winner = who_wins_hand(starts,river,num_players);
    if sum(ismember(hand_winner,1)) == 1
        wins = wins + 1;
    end
    
end

prob = wins/trials;

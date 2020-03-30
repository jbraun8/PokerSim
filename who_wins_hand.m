function [hand_winner] = who_wins_hand(starts,river,num_players)

% Given pre-flop of all players, the river, and number of players
% Determines which player wins the hand

comb_mat = nchoosek([1:7],5);

hands = [];

for i = 1:num_players
    start = starts(1 + 2*(i-1):2 + 2*(i-1),:);
    poss_hands = [start;river];
    best_hand = poss_hands(comb_mat(1,:),:);
    for j = 2:21
        new_hand = poss_hands(comb_mat(j,:),:);
        winner = showdown(best_hand,new_hand);
        if winner == 2
            best_hand = new_hand;
        end
    end
    hands = [hands;best_hand];
end

best_hand = hands(1:5,:);
hand_winner = 1;

for k = 2:num_players
    challenger = hands(1 + 5*(k-1):5 + 5*(k-1),:);
    winner = showdown(best_hand,challenger);
    if winner == 2
        best_hand = challenger;
        hand_winner = k;
    elseif winner == 3
        hand_winner = [hand_winner,k];
    end
end


        
   
end
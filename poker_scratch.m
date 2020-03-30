

num_players = 2;
trials = 100;

results = zeros(13,13);

suit1 = 1;

for i = 2:14
    for j = 2:14
        suit2 = 1;
        if i < j || i == j
            suit2 = 2;
        end
        start_flop = [i,suit1;j,suit2];
        prob = how_often(start_flop,num_players,trials);
        results(i,j) = prob;
    end
end

starts = [13,1;13,4;12,3;12,2;14,1;14,3]

w1 = 0;
w2 = 0;
w3 = 0;

for k = 1:10000
    deck = get_deck(0,starts);
    river = deck(1:5,:);
    hand_winner = who_wins_hand(starts,river,3);
    if sum(ismember(hand_winner, 1)) == 1 
        w1 = w1 + 1;
    elseif sum(ismember(hand_winner,2)) == 1 
        w2 = w2 + 1;
    elseif sum(ismember(hand_winner,3)) == 1
        w3 = w3 + 1;
    end
end

w1/10000
w2/10000
w3/10000

        

        
        
        
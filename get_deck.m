function [deck] = get_deck(deck_seed,exclude_cards)

% Generate a shuffled deck of cards
% If deck_seed doesn't equal 0, will use rng(deck_seed)
% deck(i,j) = ith card of suit j, ace is 14

deck = [[2:14]',ones(13,1);[2:14]',2*ones(13,1);[2:14]',3*ones(13,1);[2:14]',4*ones(13,1)];
remove = ismember(deck,exclude_cards,'rows');
deck(remove,:) = [];

deck_size = length(deck);

if deck_seed == 0
    deck = deck(randperm(deck_size),:);
else
    rng(deck_seed);
    deck = deck(randperm(deck_size),:);
end

end


    


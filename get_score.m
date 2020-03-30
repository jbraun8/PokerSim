function [score, pairs, trips, quads] = get_score(hand)

% Get raw score, kicker, and pair(s) from a hand
% 1 = Nothing (High Card)
% 2 = 1 Pair
% 3 = 2 Pair
% 4 = 3-of-a-kind
% 5 = Straight
% 6 = Flush
% 7 = Full House
% 8 = 4-of-a-kind
% 9 = Straight Flush
% 10 = Royal Flush

[~,ind] = sort(hand(:,1));
hand = hand(ind,:);

score = 1;

flush = 0;

if length(unique(hand(:,2))) == 1
    flush = 1;
    score = max(score,6);
end

pairs = [];
trips = [];
quads = [];

if length(hand(:,1)) ~= length(unique(hand(:,1)))
   bins = histcounts(hand(:,1));
   bins = [bins,zeros(1,hand(1,1) - 1)];
   
   pairs = find(bins == 2);
   trips = find(bins == 3);
   quads = find(bins == 4);
   
   if length(pairs) == 1
       score = max(score, 2);
   elseif length(pairs) == 2
       score = max(score, 3);
   end
   
   if length(trips) == 1
       score = max(score,4);
       if length(pairs) == 1
           score = max(score,7);
       end
   end
   
   if length(quads) == 1
       score = max(score,8);
   end
end


straight = 0;

if isequal(hand(:,1),[hand(1,1):1:hand(5,1)]')
    straight = 1;
    score = max(score,5);
end

alt_hand = hand;
alt_hand(alt_hand == 14) = 1;

if isequal(alt_hand(:,1),[alt_hand(1,1):1:alt_hand(5,1)]')
    straight = 1;
    score = max(score,5);
end

if straight == 1 && flush == 1
    score = max(score,9);
    if hand(1,1) == 10
        score = max(score,10);
    end
end

sort(pairs);
sort(trips);
sort(quads);


end
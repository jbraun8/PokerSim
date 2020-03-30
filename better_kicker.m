function [winner] = better_kicker(hand1, hand2)

% Used to determine ties, who has the better kicker

winner = 0;
i = 1;

while winner == 0
    
    kicker1 = max(hand1(:,1));
    kicker2 = max(hand2(:,1));
    
    if kicker1 > kicker2
        winner = 1;
    elseif kicker1 < kicker2
        winner = 2;
    else
        if i == 5
            winner = 3;
        end
        hand1 = hand1(1:end-1,:);
        hand2 = hand2(1:end-1,:);
        i = i + 1;
    end
end

end
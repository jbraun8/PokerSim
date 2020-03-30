function [winner] = showdown(hand1, hand2)

% Determine winner of showdown

[score1, pairs1, trips1, quads1] = get_score(hand1);
[score2, pairs2, trips2, quads2] = get_score(hand2);

winner = 0;

while winner == 0
    
    if score1 > score2
        winner = 1;
        break
    elseif score1 < score2
        winner = 2;
        break
    end
    
    if score1 == 1
        winner = better_kicker(hand1,hand2);
        break
    end
    
    if score1 == 2
        if pairs1 > pairs2
            winner = 1;
            break
        elseif pairs1 < pairs2
            winner = 2;
            break
        else
            winner = better_kicker(hand1,hand2);
            break
        end
    end
    
    if score1 == 3
        if pairs1(1) > pairs2(1)
            winner = 1;
            break
        elseif pairs1(1) < pairs2(1)
            winner = 2;
            break
        else
            if pairs1(2) > pairs2(2)
                winner = 1;
                break
            elseif pairs1(2) < pairs2(2)
                winner = 2;
                break
            else
                winner = better_kicker(hand1,hand2);
                break
            end
        end
    end
    
    if score1 == 4
        if trips1 > trips2
            winner = 1;
            break
        elseif trips1 < trips2
            winner = 2;
            break
        else
            winner = better_kicker(hand1,hand2);
            break
        end
    end
    
    if score1 == 7
        if trips1 > trips2
            winner = 1;
            break
        elseif trips1 < trips2
            winner = 2;
            break
        else
            if pairs1 > pairs2
                winner = 1;
                break
            elseif pairs1 < pairs2
                winner = 2;
                break
            else
                winner = better_kicker(hand1,hand2);
                break
            end
        end
    end
    
    if score1 == 8
        if quads1 > quads2
            winner = 1;
            break
        elseif quads1 < quads2
            winner = 2;
            break
        else
            winner = better_kicker(hand1,hand2);
            break
        end
    end
    
    winner = better_kicker(hand1,hand2);
    break

end

% Normalizes matrix column wise, divides my absolute value of max
function n = normalize(A)
    numCols = size(A,2);
    n = [];
    
    for i = 1:numCols
        col = A(:, i);
        M = max(abs(col));
        col = col./M;
        n = [n col];
    end
    
    n(isnan(n)) = 0;
end

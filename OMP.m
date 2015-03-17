function [ alpha, vectors ] = OMP( v, D )

    D = D ./ repmat( sqrt(sum(D.*D,1)), size(D,1), 1);
    
    residue = v;
    Threshold = norm(v)/50;
    alpha = [];
    vectors = [];
   
    while norm(residue) >= Threshold,
        disp(norm(residue));
        dot_products = abs(residue' * D);
        [minval, pos] = max(dot_products);
        if (minval == 0),
            break;
        end
        residue = residue - (residue' *D(:,pos)) * D(:,pos);
        alpha = [alpha (residue' *D(:,pos))];
        vectors = [vectors D(:,pos)];
        D(:,pos) = zeros(size(D,1),1);
    end

end


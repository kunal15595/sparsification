function [ x ] = truncate(x,s)
	[sortedX,sortingIndices] = sort(abs(x),'descend');
	% x
	% sortedX
	% sortingIndices
	
    for i= s+1 : size(sortingIndices,1)
       x(sortingIndices(i)) = 0; 
    end
        
end
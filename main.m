%load('trainImages.mat');
%load('testImages.mat');

%disp ( size(testImages) )
%disp( size(trainImages) )
disp('Loaded Images');

[alpha, vectors] = OMP( testImages(:,1), trainImages );
disp('Completed OMP');
disp( norm(alpha) );
disp( size(vectors) );
disp( norm(testImages(:,1) - sum(repmat(alpha, size(vectors,1), 1) .* vectors,2) ) );


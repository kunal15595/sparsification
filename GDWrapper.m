load('train_images.mat','train_images');
% load('train_labels.mat','train_labels');
load('test_images.mat','test_images');
load('test_labels.mat','test_labels');

D = train_images;

% normalize columns of D
D = D ./ norm(D);

s = 500;

for i=1:size(test_images,2)
	y = test_images(:,i);
	x = GD( y, D, s );

	[sortedX,sortingIndices] = sort(abs(x),'descend');

end

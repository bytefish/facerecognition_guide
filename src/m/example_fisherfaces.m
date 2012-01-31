% load function files from subfolders aswell
addpath (genpath ('.'));
% read images
[X,y,w,h] = read_images('/home/philipp/facerec/data/at');
% n - number of samples
% d - dimensionality
[n,d] = size(X);
% get the unique classes
c = unique(y);
% compute the fisherfaces
[W,mu] = fisherfaces(X,y);
% plot fisherfaces
figure; hold on;
title('Fisherfaces (AT&T Facedatabase)');
for i=1:min(16,n)
    subplot(4,4,i);
    fisherface_i = toGrayscale(W(:,i), w, h);
    imshow(fisherface_i);
    colormap(jet(256));
    title(sprintf('Fisherface #%i', i));
end
% print the plot
%set (gca,'fontsize',20)
%print('fisherfaces_fisherfaces.eps','-depsc','-F:20')
% plot fisherfaces reconstruction
steps = 1:3:min(50,length(c)-1);
Q = X(1,:); % first image to reconstruct
figure; hold on;
title('Reconstruction (AT&T Facedatabase)');
for i=1:min(16, length(steps))
    subplot(4,4,i);
    numEvs = steps(i);
    P = project(W(:,1:numEvs), X(1,:), mu);
    R = reconstruct(W(:,1:numEvs),P,mu);
    comp = toGrayscale(R, w, h);
    imshow(comp);
    title(sprintf('%i Fisherfaces', numEvs));
end
% print the plot
%set (gca,'fontsize',20)
%print('fisherfaces_reconstruction.eps','-depsc','-F:20')

pause;

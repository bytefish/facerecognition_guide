% load function files from subfolders aswell
addpath (genpath ('.'));
% for plotting
db_name = 'Yale Facedatabase';
% read images
[X,y,w,h] = read_images('/home/philipp/facerec/data/yalefaces_recognition');
% n - number of samples
% d - dimensionality
[n,d] = size(X);
% get the unique classes
c = unique(y);
% compute the fisherfaces
[W,mu] = fisherfaces(X,y);
% plot fisherfaces
figure; hold on;
title(sprintf('Fisherfaces %s', db_name));
for i=1:min(16,length(c)-1)
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
steps = 1:min(16,length(c)-1);
Q = X(1,:); % first image to reconstruct
figure; hold on;
title(sprintf('Fisherfaces Reconstruction %s', db_name));
for i=1:min(16, length(steps))
  subplot(4,4,i);
  numEv = steps(i);
  P = project(W(:,numEv), X(1,:), mu);
  R = reconstruct(W(:,numEv),P,mu);
  comp = toGrayscale(R, w, h);
  imshow(comp);
  title(sprintf('Fisherface #%i', numEv));
end
% print the plot
%set (gca,'fontsize',20)
%print('fisherfaces_reconstruction.eps','-depsc','-F:20')

pause;

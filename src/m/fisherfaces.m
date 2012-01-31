function [W, mu] = fisherfaces(X,y,k)
  % number of samples
  N = rows(X);
  % number of classes
  labels = unique(y);
  c = length(labels);
  if(nargin < 3)
    k = c-1;
  end
  k = min(k,(c-1));
  % get (N-c) principal components
  [Wpca, mu] = pca(X, y, (N-c));
  [Wlda, mu_lda] = lda(project(Wpca, X, mu), y, k);
  W = Wpca*Wlda;
end

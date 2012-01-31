function X = reconstruct(W, Y, mu)
  if(nargin<3)
    X = Y * W';
  else
    X = Y * W' + repmat(mu, rows(Y), 1);
  end
end

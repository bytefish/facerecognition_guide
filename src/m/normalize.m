function X = normalize(X, l, h)
  minX = min(X(:));
  maxX = max(X(:));
  %% Normalize to [0...1].
  X = X - minX;
  X = X ./ (maxX - minX);
  %% Scale to [low...high].
  X = X .* (h-l);
  X = X + l;
end

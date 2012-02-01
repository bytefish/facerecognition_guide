function Y = toGrayscale(X, width, height)
  Y = normalize(X, 0, 255);
  if(nargin==3)
    Y = reshape(Y, height, width);
  end
  Y = uint8(Y);
end

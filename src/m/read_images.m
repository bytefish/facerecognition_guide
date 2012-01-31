function [X y width height] = read_images(path_fn)
  % get files for a given path
  folder = list_files(path_fn);
  % initialize the empty return values
  X=[];
  y=[];
  width=0;
  height=0;
  % start counting with class index 1
  classIdx = 1;
  % for each file...
  for i=1:length(folder)
    subject = folder{i};
    % ... get files in this subdir
    images = list_files([path_fn, filesep, subject]);
    % ... ignore a file or empty folder
    if(length(images) == 0)
      continue; 
    end
    % ... for each image
    for j=1:length(images)
      % ... get the absolute path
      filename = [path_fn, filesep, subject, filesep, images{j}];
      % ... read the image
      T = double(imread(filename));
      % ... get the image information
      [height width channels] = size(T);
      % ... and grayscale if it's a color image
      if(channels == 3)
        T = 0.2989 * T(:,:,1) + 0.5870* T(:,:,2) + 0.1140 * T(:,:,3);
      end
      % ... reshape into a row vector and append to data matrix
      X = [X; reshape(T,1,width*height)];
      % ... append the corresponding class to the class vector
      y = [y, classIdx];
    end
    % ... increase the class index
    classIdx = classIdx + 1;
  end % ... for-each folder.
end

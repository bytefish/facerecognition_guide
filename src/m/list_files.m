function L = list_files(path_fn)
  % get information about given path_fn
  L = dir(path_fn);
  % ... ignore . and ..
  L = L(3:length(L));
  % ... turn into a cell array
  L = struct2cell(L);
  % ... and only keep the filenames.
  L = L(1,:);
end

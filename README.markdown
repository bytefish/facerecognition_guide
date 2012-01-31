# bytefish/facerecognition_guide #

This is my guide to face recognition with OpenCV2 C++ and GNU Octave/MATLAB. If you research on face recognition, you'll soon notice there's a [gigantic number of publications](http://scholar.google.de/scholar?q=face+recognition), but source code is very sparse. So this guide is here to change that. Two algorithms are explained and implemented with GNU Octave/MATLAB and OpenCV2 C++ namely [Eigenfaces](http://www.bytefish.de/blog/eigenfaces) and [Fisherfaces](http://www.bytefish.de/blog/fisherfaces).

If you are looking for a complete Python or GNU Octave/MATLAB implementation of various algorithms, please use [github.com/bytefish/facerec](https://github.com/bytefish/facerec) instead. It comes with:

  * Preprocessing
    * Histogram Equalization
    * Local Binary Patterns
    * TanTriggs Preprocessing)
  * Feature Extraction
    * Eigenfaces
    * Fisherfaces
    * Local Binary Patterns Histograms
  * Classifier
	  * k-Nearest Neighbor Model (with various metrics)
    * Support Vector Machine
  * Cross Validation
    * k-fold CV 
    * Leave One Out CV
    * Leave One Subject Out CV

More (maybe) here: [http://www.bytefish.de](http://www.bytefish.de).

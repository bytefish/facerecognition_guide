import sys
# append tinyfacerec to module search path
sys.path.append("..")
# import numpy and matplotlib colormaps
import numpy as np
# import tinyfacerec modules
from tinyfacerec.util import read_images
from tinyfacerec.model import FisherfacesModel
# read images
[X,y] = read_images("/home/philipp/facerec/data/yalefaces_recognition")
# compute the eigenfaces model
model = FisherfacesModel(X[1:], y[1:])
# get a prediction for the first observation
print "expected =", y[0], "/", "predicted =", model.predict(X[0])

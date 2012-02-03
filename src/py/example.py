import util, subspace, model
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.cm as cm

def create_font(fontname='Tahoma', fontsize=10):
	return { 'fontname': fontname, 'fontsize':fontsize }

def subplot(title, images, rows, cols, sptitle="subplot", colormap=cm.gray, ticks_visible=True, filename="plot.pdf"):
	fig = plt.figure()
	# main title
	fig.text(.5, .95, title, horizontalalignment='center') 
	for i in xrange(len(images)):
		ax0 = fig.add_subplot(rows,cols,(i+1))
		plt.setp(ax0.get_xticklabels(), visible=False)
		plt.setp(ax0.get_yticklabels(), visible=False)
		plt.title("%s #%d" % (sptitle, (i+1)), create_font('Tahoma',10))
		plt.imshow(np.asarray(images[i]), cmap=colormap)
	fig.savefig(filename, format="pdf")

[X,y] = util.read_images("/home/philipp/facerec/data/yalefaces_recognition")
# Fisherfaces and prediction...
from model import EigenfacesModel, FisherfacesModel
model = FisherfacesModel(X[1:],y[1:])
print model.predict(X[0])
# Plot the fisherfaces
[D, W, mu] = subspace.fisherfaces(util.asRowMatrix(X), y)
# ... turn them into normalized 2D matrices first
F = []
for i in xrange(min(W.shape[1], 16)):
	ev = W[:,i].reshape(X[0].shape)
	F.append(util.normalize(ev,0,255))
# ... and plot them
subplot("Fisherfaces", F, 4, 4, sptitle="Fisherface", colormap=cm.jet, filename="/home/philipp/test.pdf")

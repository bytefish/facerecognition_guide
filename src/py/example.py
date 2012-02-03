import util, subspace

from pylab import *
import matplotlib.cm as cm

def create_font(fontname='Tahoma', fontsize=10):
	return { 'fontname': fontname, 'fontsize':fontsize }

def subplot(title, images, rows, cols, title2="subplot", colormap=cm.gray, ticks_visible=True, filename="plot.pdf"):
	fig = plt.figure()
	# main title
	fig.text(.5, .95, title, horizontalalignment='center') 
	for i in xrange(len(images)):
		ax0 = fig.add_subplot(rows,cols,(i+1))
		setp(ax0.get_xticklabels(), visible=False)
		setp(ax0.get_yticklabels(), visible=False)
		#print title,i
		#print "%s #%d" % (title2, i)
		#title("%s #%d" % (title2, i), create_font('Tahoma',10))
		imshow(np.asarray(images[i]), cmap=colormap)
	fig.savefig(filename, format="pdf")

[X,y] = util.read_images("/home/philipp/facerec/data/yalefaces_recognition")
print len(X)
[D, W, mu] = subspace.fisherfaces(util.asRowMatrix(X), y)

F = []
print min(W.shape[1], 16)
for i in xrange(min(W.shape[1], 16)):
	ev = W[:,i].reshape(X[0].shape)
	F.append(util.normalize(ev,0,255))

subplot("Fisherfaces", F, 4, 4, filename="/home/philipp/test.pdf")

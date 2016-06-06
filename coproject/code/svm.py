#!/usr/bin/python

import matplotlib.pyplot as plt
import numpy as np
# Import datasets, classifiers and performance metrics
from sklearn import datasets, svm, metrics
from sklearn.cross_validation import StratifiedShuffleSplit
from sklearn.grid_search import GridSearchCV
from sklearn.svm import SVC
import argparse

from mnist import MNIST

DATA_PATH='./data'
SIZE_TRAIN=60000
SIZE_TEST=10000

unique_labels=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

def main(kernel):
  print "Loading the data"

  mn = MNIST(DATA_PATH)

  test_img, test_label = mn.load_testing()
  train_img, train_label = mn.load_training()
  
  train_img = np.array(train_img[:SIZE_TRAIN])
  train_label = np.array(train_label[:SIZE_TRAIN])
  test_img = np.array(test_img[:SIZE_TEST])
  test_label = np.array(test_label[:SIZE_TEST])

  print "Finished loading the data"

  # Create a classifier: a support vector classifier
  if kernel == 'rbf':
    print "Training with RBF kernel - Might take a few minutes"
    classifier = svm.SVC(C=10, gamma=5e-7, kernel='rbf') 
  elif kernel == 'linear':
    print "Training with Linear kernel - Might take a few minutes"
    classifier = svm.SVC(C=1e-6, kernel='linear')
  elif kernel == 'poly':
    print "Training with Polynomial kernel - Might take a few minutes"
    #classifier = svm.SVC(C=10, gamma=1e-7, kernel='poly', degree=2)
    #classifier = svm.SVC(C=10, gamma=1e-6, kernel='poly', degree=3)
    classifier = svm.SVC(C=10, gamma=1e-6, kernel='poly', degree=4)

  # We learn the digits on the first half of the digits
  classifier.fit(train_img, train_label)

  print "Classifying - Might take a few minutes"

  predicted = classifier.predict(test_img)
  print predicted

  cm = metrics.confusion_matrix(test_label, predicted)

  print("Classification report for classifier %s:\n%s\n"% (classifier, metrics.classification_report(test_label, predicted)))
  print("Confusion matrix:\n%s" % cm)

  cm_normalized = cm.astype('float') / cm.sum(axis=1)[:, np.newaxis]

  plt.figure()
  plot_confusion_matrix(cm_normalized, title='Normalized confusion matrix')

  print "Result: %s"%(np.trace(cm_normalized)/10)

  #plt.show()

def plot_confusion_matrix(cm, title='Confusion matrix', cmap=plt.cm.Blues):
    plt.imshow(cm, interpolation='nearest', cmap=cmap)
    plt.title(title)
    plt.colorbar()
    tick_marks = np.arange(len(unique_labels))
    plt.xticks(tick_marks, unique_labels)
    plt.yticks(tick_marks, unique_labels)
    plt.tight_layout()
    plt.ylabel('True label')
    plt.xlabel('Predicted label')  

if __name__=="__main__":
    argParser = argparse.ArgumentParser()
    argParser.add_argument('-k', '--kernel', default='rbf',
        help='Type of kernel. You can choose between linear, rbf or poly. Default is rbf.')
    parsed = argParser.parse_args()
    main(parsed.kernel) 

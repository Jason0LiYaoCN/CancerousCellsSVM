#  Classification of cancerous cells with Support Vector Machine method

### Synopsis ###
This project took place during the module _Neural networks_ at NUS (EE5904R).
It consists of determining whether a breast cell of a given person is cancerous or not. The samples provided have been obtained by a Fine Needle Aspiration Biopsy and the resulting datasset is called 'Breast Cancer Wisconsin Dataset'.

In order to accomplish the classification of benign cells from malign cells, a Support Vector Machine method is used. Support Vector Machine (SVM) is a useful machine learning algorithm that can be used as a discriminative classifier. It consists of finding a hyperplane that divides a set of samples into two categories (here, benign and malign cells). 

The use of a kernel is sometimes needed to put the samples into a higher dimensional space and find a suitable hyperplane. Thus I tried different types of kernel such as linear kernel, polynomial kernel of different degrees or Radial Basis Function kernel.

Finding an optimal hyperplane means finding the hyperplane that keeps samples as far away as possible from it, in order to make a _margin_ appear around the hyperplane (area without any samples inside). This margin can be _hard_, with strictly no samples between the hyperplane and the margin or _soft_, with authorized samples to lead to a better generalization of the model. Samples on the margin are called _support vectors_. Finding a suitable hyperplane results from the resolution of an optimization problem (quadratic programming), whose formulation is not detailed here.

The SVM algorithm has been implemented on Matlab, with the following steps:

* resolution of the optimization problem (quadratic programming) [_coeff_discriminant_function.m_]
* find the support vectors by defining a criteria to select them [_coeff_discriminant_function.m_]
* test the model with a tesst dataset [_eval_discriminant_function.m_]

### Results ###

The best results were found with a soft margin and a polynomial kernel of degree 5. 
Two main parameters have been tuned:

* _p_: the degree of the polynomial kernel
* _C_: the penalization factor for soft margin. The larger C is, the bigger the penalization is for a sample which is not well separated by the hyperplane, so the smaller the margin is. Nevertheless it is always hard to draw conclusions about the value of C.

Make the values of p and C vary gives the following results concerning the accuracy of the training set and the test set.

### Project content ###

Content of this project: 

* files 'train.mat' and 'test.mat': training and test dataset
* other Matlab files ('.m' extension): Matlab function and scripts to run the program

To make the program run:

* run _init_ Matlab script to load the datasets into the workspace
* run either _hardmargin_lin_ker_ / _hardmargin_pol_ker_ / _softmargin_pol_ker_ to apply SVM method 

### Dependencies ###

This Matlab code needs the Matlab function _quadprog_ to solve Quadratic Programming optimization problem.

### Author ###

Mareva Brixy (marevabrixy@gmail.com)




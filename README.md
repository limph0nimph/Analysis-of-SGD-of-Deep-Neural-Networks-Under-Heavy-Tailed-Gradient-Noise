# Analysis-of-SGD-of-Deep-Neural-Networks-Under-Heavy-Tailed-Gradient-Noise
Skoltech Machine Learning 2021 course project


# Prerequisites
Gradient history requires large amounts of disk storage. Training a network with 2-4 layers for 5-10 epochs and calculating SG noise statistics may require up to 150Gb of storage and several hours of GPU time.

# Theory & goals

Experiments in this repository are intended to reproduce some of the results provided in papers https://arxiv.org/abs/1901.06053 and https://arxiv.org/abs/1912.00018. Main goals are:
- to calculate Stochastic Gradient noise for several deep neural networks
- to perform an extensive empirical analysis of the tail-index of the SG noise in these networks
- bring an alternative perspective to the existing approaches for analyzing SGD 

# Experiments

A series of experiments for different neural network architectures and datasets was conducted. 
## Fully-connected networks:
- MNIST notebooks: see folder `experiments on FCNs/FCN_data_analysis.ipynb` and `experiments on FCNs/FCN_MNIST_experiment.ipynb`
- CIFAR notebook: see `experiments on FCNs/FCN_CIFAR_baseline_v2.ipynb` 
## Convolutional neural networks :
- MNIST notebooks: `experiments on CNNs/CCN_MNIST_batch_sizes_150_200_300.ipynb` and `experiments on CNNs/CCN_MNIST_batch_50.ipynb`
## BERT:
- BERT notebook: `bert_experiments.ipynb`

### In addition, some statistics for SG noise were calculated in R language
Due to inner problems of scipy, part of the work with alpha-stable distributions has been made in R.
- R notebook


# Results

Experiments show that for the majority of weights in our neural networks, distributions of SG noise are clearly not gaussian.  

# Vector Omniglot Dataset

![samples](https://cdn.rawgit.com/hardmaru/sketch-rnn/master/example/omniglot_sample.svg)

This directory contains a vector dataset of symbols, derived from Brenden Lake's [Omniglot Data Set for One-Shot Learning](https://github.com/brendenlake/omniglot).  The original data was made available in both pixel image format and also stroke data format.  The stroke data is stored in MATLAB format, making it difficult to perform research work with a Scientific Python stack.  To make it easier to use with NumPy, we have converted and simplified the original data into *stroke-3* format and performed RDP line simplification.  The train/validation/test split sizes are 30000/1000/1000 respectively.

# Citation

Please cite this dataset according to the instructions specified in the original [Omniglot repo](https://github.com/brendenlake/omniglot).

# License

Copyright © 2015 Brenden Lake

The license for this dataset mirrors the LICENSE specified in the original [Omniglot repo](https://github.com/brendenlake/omniglot).

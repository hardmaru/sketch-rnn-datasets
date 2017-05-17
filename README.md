# sketch-rnn-datasets

Each example in the dataset is stored as list of coordinate offsets: ∆x, ∆y, and a binary value representing whether the pen is lifted away from the paper.  This format, we refer to as *stroke-3*, is described in this [paper](https://arxiv.org/abs/1308.0850).  Note that the data format described in the paper has 5 elements (*stroke-5* format), and this conversion is done automatically inside the `DataLoader`.  Below is an example sketch of a turtle using this format:

![Example Training Sketches](https://cdn.rawgit.com/hardmaru/sketch-rnn/master/example/data_format.svg)
*Figure: A sample sketch, as a sequence of (∆x, ∆y, binary pen state) points and in rendered form.
In the rendered sketch, the line color corresponds to the sequential stroke ordering.*

In our datasets, each example in the list of examples is represented as a `np.array` with `np.int16` datatypes.  You can store them as `np.int8` if you can get away with it to save storage space.  If your data must be in floating-point format, `np.float16` also works.  `np.float32` can be a waste of storage space.  In our data, the ∆x and ∆y offsets are represented in pixel locations, which are larger than the range of numbers a neural network model likes to see, so there is a normalization scaling process built into the model.  When we load the training data, the model will automatically convert to `np.float` and normalize accordingly before training.

If you want to create your own dataset, you must create three lists of examples for training/validation/test sets, to avoid overfitting to the training set.  The model will handle the early stopping using the validation set.  For the `aaron_sheep` dataset, we used a split of 7400/300/300 examples, and put each inside python lists called `train_data`, `validation_data`, and `test_data`.  Afterwards, we created a subdirectory called `datasets/aaron_sheep` and we use the built-in `savez_compressed` method to save a compressed version of the dataset in a `aaron_sheep.npz` file.  In all of our experiments, the size of each dataset is an exact multiple of 100, and use a `batch_size` of 100.  Deviate at your own peril.

```python
filename = os.path.join('datasets/your_dataset_directory', 'your_dataset_name.npz')
np.savez_compressed(filename, train=train_data, valid=validation_data, test=test_data)
```

We also performed simple stroke simplification to preprocess the data, called [Ramer-Douglas-Peucker](https://en.wikipedia.org/wiki/Ramer%E2%80%93Douglas%E2%80%93Peucker_algorithm).  There is some easy-to-use open source code for applying this algorithm [here](https://github.com/fhirschmann/rdp).  In practice, we can set the `epsilon` parameter to a value between 0.2 to 3.0, depending on how aggressively we want to simply the lines.  In the paper we used an `epsilon` parameter of 2.0. We suggest you build a dataset where the maximum sequence length is less than 250.

If you have a large set of simple SVG images, there are some available [libraries](https://pypi.python.org/pypi/svg.path) to convert subsets of SVGs into line segments, and you can then apply RDP on the line segments before converting the data to *stroke-3* format.

# License

Please check the license and copyright information for each dataset in their respective directories.

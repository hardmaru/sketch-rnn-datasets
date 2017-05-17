# Sketch-RNN Datasets

This repo contains a set of optional, extra datasets for training `sketch-rnn`, a generative model for vector sketches.  You can read more about the model by reading this [blog post](https://research.googleblog.com/2017/04/teaching-machines-to-draw.html) or the [paper](https://arxiv.org/abs/1704.03477).  Although the datasets had been created in the format customized for training `sketch-rnn`, it can, and should be used for any future research for vector image modelling.

So far we have organized 3 datasets:

* [Aaron Koblin Sheep Market](https://github.com/hardmaru/sketch-rnn-datasets/tree/master/aaron_sheep)
* [Kanji Stroke Data](https://github.com/hardmaru/sketch-rnn-datasets/tree/master/kanji)
* [Omniglot Stroke Data](https://github.com/hardmaru/sketch-rnn-datasets/tree/master/omniglot)

# *Stroke-3* Format

In each dataset, each sample is stored as list of coordinate offsets: ∆x, ∆y, and a binary value representing whether the pen is lifted away from the paper.  This format, we refer to as *stroke-3*, is described in Alex Graves' [paper](https://arxiv.org/abs/1308.0850) on sequence generation.  Note that the data format described in the `sketch-rnn` paper has 5 elements (*stroke-5* format), and we need to perform live conversion of the data to the *stroke-5* format during mini-batch construction.

![Example Training Sketche](https://cdn.rawgit.com/hardmaru/sketch-rnn/master/example/data_format.svg)

To illustrate this data format, in the figure above is a drawing of a turtle, sketched by the author.  The turtle is represented as a sequence of (∆x, ∆y, binary pen state) points and in rendered form.  In the rendered sketch, the line color corresponds to the sequential stroke ordering.

In the datasets, each example in the list of examples is represented as a `np.array` with `np.int16` datatypes, and can be loaded using the following command in a Jupyter notebook:

```python
filename = "sketch-rnn-datasets/kanji/short_kanji.npz"
load_data = np.load(filename)
train_set = load_data['train']
valid_set = load_data['valid']
test_set = load_data['test']

print len(train_set)
  Output -> 10000
print len(valid_set)
  Output -> 600
print len(test_set)
  Output -> 500
  
# draw a random example:
draw_strokes(random.choice(train_set))
```

For some of the datasets, we also performed simple stroke simplification to preprocess the data, called [Ramer-Douglas-Peucker](https://en.wikipedia.org/wiki/Ramer%E2%80%93Douglas%E2%80%93Peucker_algorithm).  We choose the `epsilon` parameter to be a value between 0.2 to 3.0, depending on how aggressively we want to simply the lines.

If you have a large set of simple SVG images, and want to construct a similar dataset, there are some available [libraries](https://pypi.python.org/pypi/svg.path) to convert subsets of SVGs into line segments, and you can then apply RDP on the line segments before converting the data to *stroke-3* format.  There is some easy-to-use open source code for applying this algorithm [here](https://github.com/fhirschmann/rdp).

# License

Please check the license and copyright information for each dataset in their respective directories.

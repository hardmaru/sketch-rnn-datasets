# KanjiVG Dataset

![samples](https://cdn.rawgit.com/hardmaru/sketch-rnn/master/example/short_kanji_sample.svg)

This directory contains a vector dataset of Kanji characters used in this machine learning experiment described in this [blog post](http://blog.otoro.net/2015/12/28/recurrent-net-dreams-up-fake-chinese-characters-in-vector-format-with-tensorflow/).

It is derived from [KanjiVG](http://kanjivg.tagaini.net/), an open source project for teaching people how to write Kanji.

We have converted and simplified the original `.svg` each stroke as a short polyline sequence, and stored the data into the *stroke-3* format for training `sketch-rnn`.  The train/validation/test split sizes are 10000/600/500 respectively.

# License

KanjiVG is Copyright © 2009-2015 Ulrich Apel

<a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/3.0/88x31.png" /></a><br/>This dataset, and all files in this directory is licensed under a Attribution-ShareAlike 3.0 Unported License <a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/">(CC BY-SA 3.0)</a>.

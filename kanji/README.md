# KanjiVG Dataset

![samples](https://cdn.rawgit.com/hardmaru/sketch-rnn/master/example/short_kanji_sample.svg)

This directory contains a vector dataset of Kanji characters used in the machine learning experiment described in this [blog post](http://blog.otoro.net/2015/12/28/recurrent-net-dreams-up-fake-chinese-characters-in-vector-format-with-tensorflow/).  It is derived from [KanjiVG](http://kanjivg.tagaini.net/), an educational open source project for teaching people Kanji.

We have converted and simplified the original `.svg` each stroke as a short polyline sequence, and stored the data into the *stroke-3* format for training `sketch-rnn`.  The train/validation/test split sizes are 10000/600/500 respectively.

# Files

| filename  | max length | description  |
|---|---|---|
| short_kanji.npz  | 88  | original dataset used in mentioned blog post  |
| kanji.rdp25.npz (recommended)  | 133  | rebuilt dataset using [RDP](https://en.wikipedia.org/wiki/Ramer%E2%80%93Douglas%E2%80%93Peucker_algorithm) line simplification with epsilon=0.25 |
| kanji.rdp100.npz  | 80  | RDP with epsilon=1.0  |
| kanji.rdp200.npz  | 70  | RDP with epsilon=2.0 (same as [QuickDraw](https://quickdraw.withgoogle.com/data) dataset)  |

# License

KanjiVG is Copyright © 2009-2015 Ulrich Apel

<a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/3.0/88x31.png" /></a><br/>This dataset, and all files in this directory is licensed under a Attribution-ShareAlike 3.0 Unported License <a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/">(CC BY-SA 3.0)</a>.

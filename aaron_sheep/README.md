# Aaron Koblin 10K Sheep Dataset

![samples](https://cdn.rawgit.com/hardmaru/sketch-rnn/master/example/aaron_sheep_sample.svg)

This repo contains the Aaron Koblin 10K sheep dataset, a set of crowdsourced drawings of sheep.

More information about this dataset at the original project pages:

http://www.aaronkoblin.com/project/the-sheep-market/

http://www.aaronkoblin.com/work/thesheepmarket/

Aaron Koblin provided the original raw data, in the two `.zip` files, along with the processing `.pde` script for loading and rendering the original raw data.  The `.zip` files must be unzipped and placed into a subdirectory called `sheepTxts` for the `.pde` script to run.

For the purposes of training `sketch-rnn`, a simplified, *stroke-3* version of the dataset has been created as `aaron_sheep.npz`.  We kept 8000 out of the 10027 original sheep, and applied the RDP line simplification algorith mto get the samples below 250 datapoints.  The train/validation/test split sizes are 7400/300/300 respectively.

# License

By Aaron Koblin - 2006

<a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc/4.0/88x31.png" /></a><br/>This dataset, and all files in this directory is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License <a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/">(CC BY-NC 4.0)</a>.

Confirm your deep learning environment is installed and working correctly. Create a script that prints the version numbers of each library, as we did before for the SciPy
environment.

<pre class="file" data-filename="deep_versions.py" data-target="replace">

# check deep learning version numbers
# theano
import theano
print('theano: %s' % theano.__version__)
# tensorflow
import tensorflow
print('tensorflow: %s' % tensorflow.__version__)
# keras
import keras
print('keras: %s' % keras.__version__)

</pre>

Now, run the python script by running: `python deep_versions.py`{{execute}}

You should see output like the following:

```
theano: 1.0.4
tensorflow: 1.13.1
keras: 2.2.4
```

#### Summary
Congratulations, you now have a working Python development environment for machine learning
and deep learning. You can now learn and practice machine learning and deep learning on your
workstation.
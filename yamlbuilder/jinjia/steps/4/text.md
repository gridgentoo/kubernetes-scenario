The script below will print the version number of the key SciPy libraries you require for
machine learning development, specifically: SciPy, NumPy, Matplotlib, Pandas, Statsmodels,
and Scikit-learn. You can type python and type the commands in directly. Alternatively, I
recommend opening a text editor and copy-pasting the script into your editor.


<pre class="file" data-filename="python_versions.py" data-target="replace">

# check library version numbers
# scipy
import scipy
print('scipy: %s' % scipy.__version__)
# numpy
import numpy
print('numpy: %s' % numpy.__version__)
# matplotlib
import matplotlib
print('matplotlib: %s' % matplotlib.__version__)
# pandas
import pandas
print('pandas: %s' % pandas.__version__)
# statsmodels
import statsmodels
print('statsmodels: %s' % statsmodels.__version__)
# scikit-learn
import sklearn
print('sklearn: %s' % sklearn.__version__)

</pre>

Now, run the python script by running: `python python_versions.py`{{execute}}

You should see output like the following:

```
scipy: 1.2.1
numpy: 1.16.2
matplotlib: 3.0.3
pandas: 0.24.2
statsmodels: 0.9.0
sklearn: 0.20.3
```

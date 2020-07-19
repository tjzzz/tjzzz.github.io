# t-sne


```
from sklearn.manifold import TSNE
from sklearn.datasets import load_iris
from sklearn.decomposition import PCA
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
 
 
 
data=pd.read_csv('test.data', sep=',',header=None)
dd= data[range(200)]

X_tsne = TSNE().fit_transform(dd)
X_pca = PCA().fit_transform(dd)

out = DataFrame(np.hstack((X_tsne, X_pca)))

out2=data[200])

out.to_csv('save_data.csv')


plt.figure(figsize=(10, 5))
plt.subplot(121)
plt.scatter(X_tsne[:, 0], X_tsne[:, 1],c=data[200])
plt.subplot(122)
#plt.scatter(X_pca[:, 0], X_pca[:, 1], c=iris.target)
plt.scatter(X_pca[:, 0], X_pca[:, 1], c=data[200])
```


R
```

```


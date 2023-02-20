#!/usr/bin/env python
# coding: utf-8

# # Comparing regression models

# ## P-value for feature reduction

# In[25]:


import pandas as pd
import numpy as np
pd.set_option('display.max_columns', None)
import warnings
warnings.filterwarnings('ignore')
import statsmodels.api as sm
from sklearn.datasets import load_boston
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.linear_model import Ridge, RidgeCV, Lasso


# In[26]:


customer_analysis_df = pd.read_csv('Data_Marketing_Customer_Analysis_Round3.csv')


# ## Fitting OLS model

# In[27]:


x = load_boston()
y = x.target 
X = pd.DataFrame(x.data, columns = x.feature_names)

X_added_constant = sm.add_constant(X) 
X_added_constant 


# In[28]:


model = sm.OLS(y,X_added_constant).fit() 
model.summary()


# ## Dropping Insignificant Features using p-value thresholding

# In[29]:


alpha                = 0.05 
sig_param_names      = model.params[list(np.where(model.pvalues < alpha)[0])].iloc[0:].index.tolist() 
significant_features = X_added_constant[sig_param_names] 
significant_features 


# In[30]:


model = sm.OLS(y,X_added_constant).fit()
model.summary()


# In[31]:


lr = LinearRegression()
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=17)

lr.fit(X_train, y_train)

actual = y_test

train_score_lr = lr.score(X_train, y_train)
test_score_lr = lr.score(X_test, y_test)

print("The train score for lr model is {}".format(train_score_lr))
print("The test score for lr model is {}".format(test_score_lr))


# In[38]:


lasso = Lasso(alpha = 10)
lasso.fit(X_train,y_train)
train_score_ls =lasso.score(X_train,y_train)
test_score_ls =lasso.score(X_test,y_test)
print("\nLasso Model............................................\n")
print("The train score for ls model is {}".format(train_score_ls))
print("The test score for ls model is {}".format(test_score_ls))


# In[39]:


ridgeReg = Ridge(alpha=10)
ridgeReg.fit(X_train,y_train)
train_score_ridge = ridgeReg.score(X_train, y_train)
test_score_ridge = ridgeReg.score(X_test, y_test)

print("\nRidge Model............................................\n")
print("The train score for ridge model is ".format(train_score_ridge))
print("The test score for ridge model is ".format(test_score_ridge))


# In[ ]:





# In[ ]:





# In[ ]:





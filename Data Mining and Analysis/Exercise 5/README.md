1. Create one hot encoding of an array. For example For an array([2, 3, 2, 2, 2, 1]) Output should be

       array([[ 0.,  1.,  0.],
             [ 0.,  0.,  1.],
             [ 0.,  1.,  0.],
             [ 0.,  1.,  0.],
             [ 0.,  1.,  0.],
            [ 1.,  0.,  0.]])

2.Drop all missing values from an array Input: np.array([1,2,3,np.nan,5,6,7,np.nan]) Desired Output: array([ 1.,2.,3.,5.,6.,7.])

3.Find Index of Local maxima from an array. Input: a = np.array([1, 3, 7, 1, 2, 6, 0, 1]) Desired Output: array([2, 5])

4.From the given 1d array arr, generate a 2d matrix using strides,
For example for an array ([ 0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14])with a window length of w=4 and strides of s=2, like [[0,1,2,3], [2,3,4,5], [4,5,6,7]..]
w and s will be provided by user
Calculate the moving average.

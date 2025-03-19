# Scikit-Learn Programming in Termux

## Overview
Scikit-Learn is an open-source machine learning library for Python. It features various classification, regression, and clustering algorithms and is designed to interoperate with the Python numerical and scientific libraries NumPy and SciPy. In Termux, you can set up Scikit-Learn to run machine learning scripts, perform data analysis, and more.

- **Language**: Python
- **Library**: Scikit-Learn
- **File Extension**: `.py`
- **Package Name**: `scikit-learn`

## Step 1: Installing Scikit-Learn

### Update and Upgrade Termux Packages
Before installing new packages, it's a good practice to update and upgrade your existing packages:
```sh
pkg update && pkg upgrade
```

### Install Python
To install Python, run the following command:
```sh
pkg install python
```

### Install Pip
Pip is the package manager for Python. Install it by running:
```sh
pkg install python-pip
```

### Install Scikit-Learn
To install Scikit-Learn, use pip:
```sh
pip install scikit-learn
```

### Verify Installation
To verify that Scikit-Learn has been installed correctly, you can run a simple script:
```sh
python -c "import sklearn; print(sklearn.__version__)"
```

## Step 2: Writing and Running Scikit-Learn Programs

### Example Program
Create a simple Scikit-Learn program to demonstrate basic operations.

1. Open Termux and create a new file named `example.py` using a text editor like `nano` or `vi`:
    ```sh
    nano example.py
    ```

2. Add the following code to the file:
    ```python
    from sklearn import datasets
    from sklearn.model_selection import train_test_split
    from sklearn.linear_model import LogisticRegression
    from sklearn.metrics import accuracy_score

    # Load the Iris dataset
    iris = datasets.load_iris()
    X = iris.data
    y = iris.target

    # Split the dataset into training and testing sets
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)

    # Create a logistic regression model
    model = LogisticRegression(max_iter=200)

    # Train the model
    model.fit(X_train, y_train)

    # Make predictions
    y_pred = model.predict(X_test)

    # Calculate accuracy
    accuracy = accuracy_score(y_test, y_pred)
    print(f'Accuracy: {accuracy}')
    ```

3. Save the file and exit the editor (`Ctrl + X` in nano, `:wq` in vi).

### Running the Scikit-Learn Script
To run the Scikit-Learn script, use the `python` command:
```sh
python example.py
```

Output:
```
Accuracy: 1.0
```

## Step 3: Common Issues & Solutions

### Issue 1: Memory Issues
If you encounter memory issues while running Scikit-Learn scripts, you can try increasing the available memory by using smaller datasets or optimizing your code.

### Issue 2: Missing Dependencies
If a package requires additional system dependencies, install them using Termux's package manager. For example:
```sh
pkg install libhdf5
```

### Issue 3: Scikit-Learn Session Crashes
If Scikit-Learn crashes during a session, try increasing the available memory for Termux or using smaller datasets.

## Step 4: Advanced Topics

### Using Scikit-Learn for Machine Learning
Scikit-Learn is often used for building and training machine learning models. Here is an example of how to create and train a simple neural network.

#### Example Program (`mnist.py`)
1. Create a new file named `mnist.py`:
    ```sh
    nano mnist.py
    ```

2. Add the following code to the file:
    ```python
    from sklearn.datasets import fetch_openml
    from sklearn.model_selection import train_test_split
    from sklearn.neural_network import MLPClassifier
    from sklearn.metrics import accuracy_score

    # Load MNIST dataset
    mnist = fetch_openml('mnist_784')

    # Normalize the input data
    X = mnist.data / 255.0
    y = mnist.target

    # Split the dataset into training and testing sets
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)

    # Create a neural network model
    model = MLPClassifier(hidden_layer_sizes=(50,), max_iter=20, alpha=1e-4,
                          solver='sgd', verbose=10, random_state=42,
                          learning_rate_init=.1)

    # Train the model
    model.fit(X_train, y_train)

    # Make predictions
    y_pred = model.predict(X_test)

    # Calculate accuracy
    accuracy = accuracy_score(y_test, y_pred)
    print(f'Accuracy: {accuracy}')
    ```

3. Save the file and exit the editor.

4. Run the program:
    ```sh
    python mnist.py
    ```

Output:
```
Iteration 1, loss = 0.59430275
Iteration 2, loss = 0.29164545
...
Iteration 20, loss = 0.07993711
Training loss did not improve more than tol=0.000100 for 10 consecutive epochs. Stopping.
Accuracy: 0.9714
```

## Additional Resources

- [Scikit-Learn Documentation](https://scikit-learn.org/stable/documentation.html)
- [Scikit-Learn Tutorials](https://scikit-learn.org/stable/tutorial/index.html)
- [Scikit-Learn GitHub Repository](https://github.com/scikit-learn/scikit-learn)
- [Scikit-Learn User Guide](https://scikit-learn.org/stable/user_guide.html)

## Conclusion

By following this guide, you can set up and use Scikit-Learn in Termux to write, run, and debug machine learning scripts. Whether you are building machine learning models, performing data analysis, or experimenting with new algorithms, this setup provides a robust environment for Scikit-Learn development. Enjoy exploring the capabilities of Scikit-Learn on your Android device!

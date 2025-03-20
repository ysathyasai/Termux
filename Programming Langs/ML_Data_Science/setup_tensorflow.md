# TensorFlow Programming in Termux

## Overview
TensorFlow is an open-source machine learning framework developed by Google. It is widely used for building machine learning models and deploying them in production. In Termux, you can set up TensorFlow to run machine learning scripts, perform data analysis, and more.

- **Language**: Python
- **Platform**: TensorFlow
- **File Extension**: `.py`
- **Package Name**: `tensorflow`

## Step 1: Installing TensorFlow

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

### Install TensorFlow
To install TensorFlow, use pip:
```sh
pip install tensorflow
```

### Verify Installation
To verify that TensorFlow has been installed correctly, you can run a simple script:
```sh
python -c "import tensorflow as tf; print(tf.__version__)"
```

## Step 2: Writing and Running TensorFlow Programs

### Example Program
Create a simple TensorFlow program to demonstrate basic operations.

1. Open Termux and create a new file named `example.py` using a text editor like `nano` or `vi`:
    ```sh
    nano example.py
    ```

2. Add the following code to the file:
    ```python
    import tensorflow as tf

    # Create a constant tensor
    hello = tf.constant('Hello, TensorFlow!')

    # Create a TensorFlow session
    sess = tf.compat.v1.Session()

    # Run the session to get the output of the tensor
    print(sess.run(hello))
    ```

3. Save the file and exit the editor (`Ctrl + X` in nano, `:wq` in vi).

### Running the TensorFlow Script
To run the TensorFlow script, use the `python` command:
```sh
python example.py
```

Output:
```
b'Hello, TensorFlow!'
```

## Step 3: Common Issues & Solutions

### Issue 1: Memory Issues
If you encounter memory issues while running TensorFlow scripts, you can try increasing the available memory by setting environment variables:
```sh
export TF_FORCE_GPU_ALLOW_GROWTH=true
```

### Issue 2: Missing Dependencies
If a package requires additional system dependencies, install them using Termux's package manager. For example:
```sh
pkg install libhdf5
```

### Issue 3: TensorFlow Session Crashes
If TensorFlow crashes during a session, try increasing the available memory for Termux or using smaller datasets.

## Step 4: Advanced Topics

### Using TensorFlow for Machine Learning
TensorFlow is often used for building and training machine learning models. Here is an example of how to create and train a simple neural network.

#### Example Program (`mnist.py`)
1. Create a new file named `mnist.py`:
    ```sh
    nano mnist.py
    ```

2. Add the following code to the file:
    ```python
    import tensorflow as tf
    from tensorflow.keras.datasets import mnist
    from tensorflow.keras.models import Sequential
    from tensorflow.keras.layers import Dense, Flatten

    # Load MNIST dataset
    (x_train, y_train), (x_test, y_test) = mnist.load_data()

    # Normalize the input data
    x_train, x_test = x_train / 255.0, x_test / 255.0

    # Create a simple neural network model
    model = Sequential([
        Flatten(input_shape=(28, 28)),
        Dense(128, activation='relu'),
        Dense(10, activation='softmax')
    ])

    # Compile the model
    model.compile(optimizer='adam',
                  loss='sparse_categorical_crossentropy',
                  metrics=['accuracy'])

    # Train the model
    model.fit(x_train, y_train, epochs=5)

    # Evaluate the model
    loss, accuracy = model.evaluate(x_test, y_test)
    print(f'Loss: {loss}, Accuracy: {accuracy}')
    ```

3. Save the file and exit the editor.

4. Run the program:
    ```sh
    python mnist.py
    ```

Output:
```
...
Epoch 5/5
1875/1875 [==============================] - 4s 2ms/step - loss: 0.0452 - accuracy: 0.9860
313/313 [==============================] - 0s 1ms/step - loss: 0.0764 - accuracy: 0.9774
Loss: 0.07644698023796082, Accuracy: 0.977400004863739
```

## Additional Resources

- [TensorFlow Documentation](https://www.tensorflow.org/learn)
- [TensorFlow Tutorials](https://www.tensorflow.org/tutorials)
- [TensorFlow GitHub Repository](https://github.com/tensorflow/tensorflow)
- [TensorFlow Keras API](https://www.tensorflow.org/api_docs/python/tf/keras)

## Conclusion

By following this guide, you can set up and use TensorFlow in Termux to write, run, and debug machine learning scripts. Whether you are building neural networks, performing data analysis, or experimenting with new models, this setup provides a robust environment for TensorFlow development. Enjoy exploring the capabilities of TensorFlow on your Android device!

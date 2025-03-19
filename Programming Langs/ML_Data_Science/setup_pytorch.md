# PyTorch Programming in Termux

## Overview
PyTorch is an open-source machine learning library based on the Torch library. It is widely used for applications such as natural language processing. In Termux, you can set up PyTorch to run machine learning scripts, perform data analysis, and more.

- **Language**: Python
- **Library**: PyTorch
- **File Extension**: `.py`
- **Package Name**: `torch`

## Step 1: Installing PyTorch

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

### Install PyTorch
To install PyTorch, use pip:
```sh
pip install torch torchvision
```

### Verify Installation
To verify that PyTorch has been installed correctly, you can run a simple script:
```sh
python -c "import torch; print(torch.__version__)"
```

## Step 2: Writing and Running PyTorch Programs

### Example Program
Create a simple PyTorch program to demonstrate basic operations.

1. Open Termux and create a new file named `example.py` using a text editor like `nano` or `vi`:
    ```sh
    nano example.py
    ```

2. Add the following code to the file:
    ```python
    import torch

    # Check if GPU is available
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

    # Create a tensor
    x = torch.tensor([1.0, 2.0, 3.0], device=device)

    # Perform a simple operation
    y = x * 2

    print(y)
    ```

3. Save the file and exit the editor (`Ctrl + X` in nano, `:wq` in vi).

### Running the PyTorch Script
To run the PyTorch script, use the `python` command:
```sh
python example.py
```

Output:
```
tensor([2., 4., 6.])
```

## Step 3: Common Issues & Solutions

### Issue 1: Memory Issues
If you encounter memory issues while running PyTorch scripts, you can try increasing the available memory by using smaller datasets or optimizing your code.

### Issue 2: Missing Dependencies
If a package requires additional system dependencies, install them using Termux's package manager. For example:
```sh
pkg install libhdf5
```

### Issue 3: PyTorch Session Crashes
If PyTorch crashes during a session, try increasing the available memory for Termux or using smaller datasets.

## Step 4: Advanced Topics

### Using PyTorch for Machine Learning
PyTorch is often used for building and training machine learning models. Here is an example of how to create and train a simple neural network.

#### Example Program (`mnist.py`)
1. Create a new file named `mnist.py`:
    ```sh
    nano mnist.py
    ```

2. Add the following code to the file:
    ```python
    import torch
    import torch.nn as nn
    import torch.optim as optim
    from torchvision import datasets, transforms
    from torch.utils.data import DataLoader

    # Define a simple neural network
    class SimpleNN(nn.Module):
        def __init__(self):
            super(SimpleNN, self).__init__()
            self.fc1 = nn.Linear(28*28, 128)
            self.fc2 = nn.Linear(128, 10)

        def forward(self, x):
            x = x.view(-1, 28*28)
            x = torch.relu(self.fc1(x))
            x = self.fc2(x)
            return x

    # Load MNIST dataset
    transform = transforms.Compose([transforms.ToTensor(), transforms.Normalize((0.5,), (0.5,))])
    train_dataset = datasets.MNIST(root='./data', train=True, download=True, transform=transform)
    test_dataset = datasets.MNIST(root='./data', train=False, download=True, transform=transform)

    train_loader = DataLoader(dataset=train_dataset, batch_size=64, shuffle=True)
    test_loader = DataLoader(dataset=test_dataset, batch_size=64, shuffle=False)

    # Initialize the model, loss function, and optimizer
    model = SimpleNN()
    criterion = nn.CrossEntropyLoss()
    optimizer = optim.SGD(model.parameters(), lr=0.01, momentum=0.9)

    # Train the model
    for epoch in range(5):
        for batch_idx, (data, target) in enumerate(train_loader):
            optimizer.zero_grad()
            output = model(data)
            loss = criterion(output, target)
            loss.backward()
            optimizer.step()
            if batch_idx % 100 == 0:
                print(f'Epoch {epoch}, Batch {batch_idx}, Loss: {loss.item()}')

    # Evaluate the model
    correct = 0
    total = 0
    with torch.no_grad():
        for data, target in test_loader:
            output = model(data)
            _, predicted = torch.max(output.data, 1)
            total += target.size(0)
            correct += (predicted == target).sum().item()

    print(f'Accuracy: {100 * correct / total}%')
    ```

3. Save the file and exit the editor.

4. Run the program:
    ```sh
    python mnist.py
    ```

Output:
```
...
Epoch 4, Batch 900, Loss: 0.031234567
Accuracy: 98.75%
```

## Additional Resources

- [PyTorch Documentation](https://pytorch.org/docs/)
- [PyTorch Tutorials](https://pytorch.org/tutorials/)
- [PyTorch GitHub Repository](https://github.com/pytorch/pytorch)
- [PyTorch Forum](https://discuss.pytorch.org/)

## Conclusion

By following this guide, you can set up and use PyTorch in Termux to write, run, and debug machine learning scripts. Whether you are building neural networks, performing data analysis, or experimenting with new models, this setup provides a robust environment for PyTorch development. Enjoy exploring the capabilities of PyTorch on your Android device!

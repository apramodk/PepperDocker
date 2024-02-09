# Docker Development Instructions

To get started with development in the Docker container, follow these steps:

1. Run the following command to make the `run.sh` script executable:
    ### *For Unix-based systems (Linux and macOS)*
    ```
    chmod +x run.sh
    ```
    ### *For Windows*
    For the love of God please turn on [WSL](https://learn.microsoft.com/en-us/windows/wsl/install).

## For all systems
2. Run the following command to start the Docker container:
    ```
    ./run.sh
    ```
3. Once you are inside the Docker container, navigate to the workspace directory using the following command:
    ```
    cd workspace
    ```

    If the workspace directory doesn't exist, you can create a new directory using the following command:
    ```
    mkdir workspace
    ```

4. Start developing whatever you want inside the workspace directory.

To exit the Docker container, simply write `exit` in the terminal.

Happy coding!

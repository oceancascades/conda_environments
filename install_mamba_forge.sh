#!/bin/bash
# Run the create_env.sh script directly from the URL
CREATE_ENV_URL="https://raw.githubusercontent.com/oceancascades/conda_environments/main/create_env.sh"
MAMBAFORGE_URL="https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh"
MULTITOOL_ENV_URL="https://raw.githubusercontent.com/oceancascades/conda_environments/main/multitool.yml"

# Check if mamba is already installed
if command -v mamba &> /dev/null
then
    echo "Mamba is already installed"
else
    # Download and install Mambaforge
    echo "Downloading Mambaforge"
    curl -L -o Mambaforge.sh $MAMBAFORGE_URL

    echo "Installing Mambaforge"
    bash Mambaforge.sh -b

    # Initialize conda
    echo "Initializing conda"
    source ~/mambaforge/bin/conda init
fi

#echo "Running create_env.sh"
#bash <(curl -s $CREATE_ENV_URL) $MULTITOOL_ENV_URL

#echo "Installation complete. To activate the environment, use: conda activate multitool"
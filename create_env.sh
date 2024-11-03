create_env() {
  if [ "$#" -ne 1 ]; then
    echo "Usage: create_env <path/to/environment.yml>"
    return 1
  fi
  local env_file="$1"
  local env_name
  # Extract the environment name from the file, if specified
  env_name=$(grep "name:" "$env_file" | awk '{print $2}')
  if [ -z "$env_name" ]; then
    env_name=$(basename "$env_file" .yml)
  fi
  # Create the Conda environment
  mamba env create --file "$env_file" --name "$env_name"
  # Activate the Conda environment
  mamba activate "$env_name"
  # Install ipykernel into the environment if not specified in the file
  if ! mamba list --name "$env_name" ipykernel | grep ipykernel &>/dev/null; then
    mamba install -y ipykernel
  fi
  # Install the IPython kernel for Jupyter
  python -m ipykernel install --user --name "$env_name" --display-name "$env_name"
  # Deactivate the Conda environment
  mamba deactivate
}
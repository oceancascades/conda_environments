remove_env() {
  if [ "$#" -ne 1 ]; then
    echo "Usage: remove_env <environment_name>"
    return 1
  fi
  local env_name="$1"
  mamba activate "$env_name"
  # Uninstall the IPython kernel for Jupyter
  jupyter kernelspec uninstall -y "$env_name"
  # Deactivate the Conda environment
  mamba deactivate
  # Remove the Conda environment
  mamba env remove --name "$env_name"
}
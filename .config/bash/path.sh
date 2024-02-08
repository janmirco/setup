#                  __  __
#     ____  ____ _/ /_/ /_
#    / __ \/ __ `/ __/ __ \    Jan Mirco Pfeifer
#   / /_/ / /_/ / /_/ / / /    https://github.com/janmirco
#  / .___/\__,_/\__/_/ /_/
# /_/

export PATH="$HOME/bin/neovim/nvim-linux64/bin:$PATH"
export PATH="$HOME/bin/nodejs/node-linux-x64/bin:$PATH"

# deal.II
export DEAL_II_DIR="$HOME/bin/dealii/install"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$HOME/bin/dealii/install/lib"
export PYTHONPATH="$PYTHONPATH:$HOME/bin/dealii/install/lib/python3.10/site-packages"

# modular
export MODULAR_HOME="$HOME/.modular"
export PATH="$MODULAR_HOME/pkg/packages.modular.com_mojo/bin:$PATH"

# rust
export PATH="$HOME/.cargo/bin:$PATH"

# Update and upgrade
sudo apt update && sudo apt upgrade

# Install text editor
sudo apt install micro

# Install graphics libraries
sudo apt install libsdl2-2.0-0 libsdl2-dev # SDL
sudo apt install libgl1-mesa-dev # OpenGL
sudo apt install libglfw3-dev # GLFW

# Install core components
sudo apt install clang
sudo apt install build-essential

# vulkan
sudo apt install libvulkan1
sudo apt install vulkan-utils
sudo apt install mesa-vulkan-drivers
sudo apt install vulkan-validationlayers

# Verify installation
clear
echo "Verifying installation"
sleep 3 # Pause for 3 seconds
echo "Core"
gcc --version
make --version
sleep 3 # Pause for 3 seconds
echo "Tools"
# Additional tools can be added here
sleep 3 # Pause for 3 seconds
echo "Graphics"
sdl2-config --version
glxinfo | grep "OpenGL version"

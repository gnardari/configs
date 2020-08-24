# Configs

## Things to setup:

### Packages
ROS - [http://wiki.ros.org/ROS/Installation](http://wiki.ros.org/ROS/Installation)
CUDA - [https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html](https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html)
OpenCV - [https://www.pyimagesearch.com/2018/05/28/ubuntu-18-04-how-to-install-opencv/](https://www.pyimagesearch.com/2018/05/28/ubuntu-18-04-how-to-install-opencv/)


### Problems

When I had problems detecting a second display using NVIDIA drivers, this solved it:
```
sudo dpkg-reconfigure gdm3
```

alias vim='nvim'
alias vimconf='vim ~/.config/nvim/init.vim'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color'

#ros
alias ck='catkin'
alias rqtrc='rosrun rqt_reconfigure rqt_reconfigure'
alias rqtrt='rosrun rqt_runtime_monitor rqt_runtime_monitor'
alias rqtiv='rqt_image_view'
alias rosenv='env | grep ROS'
alias cb='catkin build'
alias cbr='catkin build --cmake-args -DCMAKE_CXX_COMPILER_LAUNCHER=ccache -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="-Wall -Wno-deprecated-copy -fdiagnostics-color=always"'
alias cbd='catkin build --cmake-args -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_CXX_FLAGS="-Wall -Wno-deprecated-copy"'
alias crt='catkin run_tests'
alias crtp='catkin run_tests --no-deps --this'

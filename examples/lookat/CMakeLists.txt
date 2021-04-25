project(lookat)
add_executable(${PROJECT_NAME} camera.cpp main.cpp openglwindow.cpp wall.cpp)
enable_abcg(${PROJECT_NAME})

# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/zell/Documents/CG/Season3/abcg

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/zell/Documents/CG/Season3/abcg/build

# Include any dependencies generated for this target.
include abcg/CMakeFiles/abcg.dir/depend.make

# Include the progress variables for this target.
include abcg/CMakeFiles/abcg.dir/progress.make

# Include the compile flags for this target's objects.
include abcg/CMakeFiles/abcg.dir/flags.make

abcg/CMakeFiles/abcg.dir/abcg_application.cpp.o: abcg/CMakeFiles/abcg.dir/flags.make
abcg/CMakeFiles/abcg.dir/abcg_application.cpp.o: abcg/CMakeFiles/abcg.dir/includes_CXX.rsp
abcg/CMakeFiles/abcg.dir/abcg_application.cpp.o: ../abcg/abcg_application.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zell/Documents/CG/Season3/abcg/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object abcg/CMakeFiles/abcg.dir/abcg_application.cpp.o"
	cd /home/zell/Documents/CG/Season3/abcg/build/abcg && /usr/bin/ccache /home/zell/Documents/CG/emsdk/upstream/emscripten/em++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/abcg.dir/abcg_application.cpp.o -c /home/zell/Documents/CG/Season3/abcg/abcg/abcg_application.cpp

abcg/CMakeFiles/abcg.dir/abcg_application.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/abcg.dir/abcg_application.cpp.i"
	cd /home/zell/Documents/CG/Season3/abcg/build/abcg && /home/zell/Documents/CG/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zell/Documents/CG/Season3/abcg/abcg/abcg_application.cpp > CMakeFiles/abcg.dir/abcg_application.cpp.i

abcg/CMakeFiles/abcg.dir/abcg_application.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/abcg.dir/abcg_application.cpp.s"
	cd /home/zell/Documents/CG/Season3/abcg/build/abcg && /home/zell/Documents/CG/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zell/Documents/CG/Season3/abcg/abcg/abcg_application.cpp -o CMakeFiles/abcg.dir/abcg_application.cpp.s

abcg/CMakeFiles/abcg.dir/abcg_elapsedtimer.cpp.o: abcg/CMakeFiles/abcg.dir/flags.make
abcg/CMakeFiles/abcg.dir/abcg_elapsedtimer.cpp.o: abcg/CMakeFiles/abcg.dir/includes_CXX.rsp
abcg/CMakeFiles/abcg.dir/abcg_elapsedtimer.cpp.o: ../abcg/abcg_elapsedtimer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zell/Documents/CG/Season3/abcg/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object abcg/CMakeFiles/abcg.dir/abcg_elapsedtimer.cpp.o"
	cd /home/zell/Documents/CG/Season3/abcg/build/abcg && /usr/bin/ccache /home/zell/Documents/CG/emsdk/upstream/emscripten/em++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/abcg.dir/abcg_elapsedtimer.cpp.o -c /home/zell/Documents/CG/Season3/abcg/abcg/abcg_elapsedtimer.cpp

abcg/CMakeFiles/abcg.dir/abcg_elapsedtimer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/abcg.dir/abcg_elapsedtimer.cpp.i"
	cd /home/zell/Documents/CG/Season3/abcg/build/abcg && /home/zell/Documents/CG/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zell/Documents/CG/Season3/abcg/abcg/abcg_elapsedtimer.cpp > CMakeFiles/abcg.dir/abcg_elapsedtimer.cpp.i

abcg/CMakeFiles/abcg.dir/abcg_elapsedtimer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/abcg.dir/abcg_elapsedtimer.cpp.s"
	cd /home/zell/Documents/CG/Season3/abcg/build/abcg && /home/zell/Documents/CG/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zell/Documents/CG/Season3/abcg/abcg/abcg_elapsedtimer.cpp -o CMakeFiles/abcg.dir/abcg_elapsedtimer.cpp.s

abcg/CMakeFiles/abcg.dir/abcg_exception.cpp.o: abcg/CMakeFiles/abcg.dir/flags.make
abcg/CMakeFiles/abcg.dir/abcg_exception.cpp.o: abcg/CMakeFiles/abcg.dir/includes_CXX.rsp
abcg/CMakeFiles/abcg.dir/abcg_exception.cpp.o: ../abcg/abcg_exception.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zell/Documents/CG/Season3/abcg/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object abcg/CMakeFiles/abcg.dir/abcg_exception.cpp.o"
	cd /home/zell/Documents/CG/Season3/abcg/build/abcg && /usr/bin/ccache /home/zell/Documents/CG/emsdk/upstream/emscripten/em++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/abcg.dir/abcg_exception.cpp.o -c /home/zell/Documents/CG/Season3/abcg/abcg/abcg_exception.cpp

abcg/CMakeFiles/abcg.dir/abcg_exception.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/abcg.dir/abcg_exception.cpp.i"
	cd /home/zell/Documents/CG/Season3/abcg/build/abcg && /home/zell/Documents/CG/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zell/Documents/CG/Season3/abcg/abcg/abcg_exception.cpp > CMakeFiles/abcg.dir/abcg_exception.cpp.i

abcg/CMakeFiles/abcg.dir/abcg_exception.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/abcg.dir/abcg_exception.cpp.s"
	cd /home/zell/Documents/CG/Season3/abcg/build/abcg && /home/zell/Documents/CG/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zell/Documents/CG/Season3/abcg/abcg/abcg_exception.cpp -o CMakeFiles/abcg.dir/abcg_exception.cpp.s

abcg/CMakeFiles/abcg.dir/abcg_image.cpp.o: abcg/CMakeFiles/abcg.dir/flags.make
abcg/CMakeFiles/abcg.dir/abcg_image.cpp.o: abcg/CMakeFiles/abcg.dir/includes_CXX.rsp
abcg/CMakeFiles/abcg.dir/abcg_image.cpp.o: ../abcg/abcg_image.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zell/Documents/CG/Season3/abcg/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object abcg/CMakeFiles/abcg.dir/abcg_image.cpp.o"
	cd /home/zell/Documents/CG/Season3/abcg/build/abcg && /usr/bin/ccache /home/zell/Documents/CG/emsdk/upstream/emscripten/em++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/abcg.dir/abcg_image.cpp.o -c /home/zell/Documents/CG/Season3/abcg/abcg/abcg_image.cpp

abcg/CMakeFiles/abcg.dir/abcg_image.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/abcg.dir/abcg_image.cpp.i"
	cd /home/zell/Documents/CG/Season3/abcg/build/abcg && /home/zell/Documents/CG/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zell/Documents/CG/Season3/abcg/abcg/abcg_image.cpp > CMakeFiles/abcg.dir/abcg_image.cpp.i

abcg/CMakeFiles/abcg.dir/abcg_image.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/abcg.dir/abcg_image.cpp.s"
	cd /home/zell/Documents/CG/Season3/abcg/build/abcg && /home/zell/Documents/CG/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zell/Documents/CG/Season3/abcg/abcg/abcg_image.cpp -o CMakeFiles/abcg.dir/abcg_image.cpp.s

abcg/CMakeFiles/abcg.dir/abcg_openglfunctions.cpp.o: abcg/CMakeFiles/abcg.dir/flags.make
abcg/CMakeFiles/abcg.dir/abcg_openglfunctions.cpp.o: abcg/CMakeFiles/abcg.dir/includes_CXX.rsp
abcg/CMakeFiles/abcg.dir/abcg_openglfunctions.cpp.o: ../abcg/abcg_openglfunctions.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zell/Documents/CG/Season3/abcg/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object abcg/CMakeFiles/abcg.dir/abcg_openglfunctions.cpp.o"
	cd /home/zell/Documents/CG/Season3/abcg/build/abcg && /usr/bin/ccache /home/zell/Documents/CG/emsdk/upstream/emscripten/em++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/abcg.dir/abcg_openglfunctions.cpp.o -c /home/zell/Documents/CG/Season3/abcg/abcg/abcg_openglfunctions.cpp

abcg/CMakeFiles/abcg.dir/abcg_openglfunctions.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/abcg.dir/abcg_openglfunctions.cpp.i"
	cd /home/zell/Documents/CG/Season3/abcg/build/abcg && /home/zell/Documents/CG/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zell/Documents/CG/Season3/abcg/abcg/abcg_openglfunctions.cpp > CMakeFiles/abcg.dir/abcg_openglfunctions.cpp.i

abcg/CMakeFiles/abcg.dir/abcg_openglfunctions.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/abcg.dir/abcg_openglfunctions.cpp.s"
	cd /home/zell/Documents/CG/Season3/abcg/build/abcg && /home/zell/Documents/CG/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zell/Documents/CG/Season3/abcg/abcg/abcg_openglfunctions.cpp -o CMakeFiles/abcg.dir/abcg_openglfunctions.cpp.s

abcg/CMakeFiles/abcg.dir/abcg_openglwindow.cpp.o: abcg/CMakeFiles/abcg.dir/flags.make
abcg/CMakeFiles/abcg.dir/abcg_openglwindow.cpp.o: abcg/CMakeFiles/abcg.dir/includes_CXX.rsp
abcg/CMakeFiles/abcg.dir/abcg_openglwindow.cpp.o: ../abcg/abcg_openglwindow.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zell/Documents/CG/Season3/abcg/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object abcg/CMakeFiles/abcg.dir/abcg_openglwindow.cpp.o"
	cd /home/zell/Documents/CG/Season3/abcg/build/abcg && /usr/bin/ccache /home/zell/Documents/CG/emsdk/upstream/emscripten/em++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/abcg.dir/abcg_openglwindow.cpp.o -c /home/zell/Documents/CG/Season3/abcg/abcg/abcg_openglwindow.cpp

abcg/CMakeFiles/abcg.dir/abcg_openglwindow.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/abcg.dir/abcg_openglwindow.cpp.i"
	cd /home/zell/Documents/CG/Season3/abcg/build/abcg && /home/zell/Documents/CG/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zell/Documents/CG/Season3/abcg/abcg/abcg_openglwindow.cpp > CMakeFiles/abcg.dir/abcg_openglwindow.cpp.i

abcg/CMakeFiles/abcg.dir/abcg_openglwindow.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/abcg.dir/abcg_openglwindow.cpp.s"
	cd /home/zell/Documents/CG/Season3/abcg/build/abcg && /home/zell/Documents/CG/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zell/Documents/CG/Season3/abcg/abcg/abcg_openglwindow.cpp -o CMakeFiles/abcg.dir/abcg_openglwindow.cpp.s

abcg/CMakeFiles/abcg.dir/abcg_string.cpp.o: abcg/CMakeFiles/abcg.dir/flags.make
abcg/CMakeFiles/abcg.dir/abcg_string.cpp.o: abcg/CMakeFiles/abcg.dir/includes_CXX.rsp
abcg/CMakeFiles/abcg.dir/abcg_string.cpp.o: ../abcg/abcg_string.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zell/Documents/CG/Season3/abcg/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object abcg/CMakeFiles/abcg.dir/abcg_string.cpp.o"
	cd /home/zell/Documents/CG/Season3/abcg/build/abcg && /usr/bin/ccache /home/zell/Documents/CG/emsdk/upstream/emscripten/em++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/abcg.dir/abcg_string.cpp.o -c /home/zell/Documents/CG/Season3/abcg/abcg/abcg_string.cpp

abcg/CMakeFiles/abcg.dir/abcg_string.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/abcg.dir/abcg_string.cpp.i"
	cd /home/zell/Documents/CG/Season3/abcg/build/abcg && /home/zell/Documents/CG/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zell/Documents/CG/Season3/abcg/abcg/abcg_string.cpp > CMakeFiles/abcg.dir/abcg_string.cpp.i

abcg/CMakeFiles/abcg.dir/abcg_string.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/abcg.dir/abcg_string.cpp.s"
	cd /home/zell/Documents/CG/Season3/abcg/build/abcg && /home/zell/Documents/CG/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zell/Documents/CG/Season3/abcg/abcg/abcg_string.cpp -o CMakeFiles/abcg.dir/abcg_string.cpp.s

abcg/CMakeFiles/abcg.dir/abcg_trackball.cpp.o: abcg/CMakeFiles/abcg.dir/flags.make
abcg/CMakeFiles/abcg.dir/abcg_trackball.cpp.o: abcg/CMakeFiles/abcg.dir/includes_CXX.rsp
abcg/CMakeFiles/abcg.dir/abcg_trackball.cpp.o: ../abcg/abcg_trackball.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zell/Documents/CG/Season3/abcg/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object abcg/CMakeFiles/abcg.dir/abcg_trackball.cpp.o"
	cd /home/zell/Documents/CG/Season3/abcg/build/abcg && /usr/bin/ccache /home/zell/Documents/CG/emsdk/upstream/emscripten/em++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/abcg.dir/abcg_trackball.cpp.o -c /home/zell/Documents/CG/Season3/abcg/abcg/abcg_trackball.cpp

abcg/CMakeFiles/abcg.dir/abcg_trackball.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/abcg.dir/abcg_trackball.cpp.i"
	cd /home/zell/Documents/CG/Season3/abcg/build/abcg && /home/zell/Documents/CG/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zell/Documents/CG/Season3/abcg/abcg/abcg_trackball.cpp > CMakeFiles/abcg.dir/abcg_trackball.cpp.i

abcg/CMakeFiles/abcg.dir/abcg_trackball.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/abcg.dir/abcg_trackball.cpp.s"
	cd /home/zell/Documents/CG/Season3/abcg/build/abcg && /home/zell/Documents/CG/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zell/Documents/CG/Season3/abcg/abcg/abcg_trackball.cpp -o CMakeFiles/abcg.dir/abcg_trackball.cpp.s

# Object files for target abcg
abcg_OBJECTS = \
"CMakeFiles/abcg.dir/abcg_application.cpp.o" \
"CMakeFiles/abcg.dir/abcg_elapsedtimer.cpp.o" \
"CMakeFiles/abcg.dir/abcg_exception.cpp.o" \
"CMakeFiles/abcg.dir/abcg_image.cpp.o" \
"CMakeFiles/abcg.dir/abcg_openglfunctions.cpp.o" \
"CMakeFiles/abcg.dir/abcg_openglwindow.cpp.o" \
"CMakeFiles/abcg.dir/abcg_string.cpp.o" \
"CMakeFiles/abcg.dir/abcg_trackball.cpp.o"

# External object files for target abcg
abcg_EXTERNAL_OBJECTS =

abcg/libabcg.a: abcg/CMakeFiles/abcg.dir/abcg_application.cpp.o
abcg/libabcg.a: abcg/CMakeFiles/abcg.dir/abcg_elapsedtimer.cpp.o
abcg/libabcg.a: abcg/CMakeFiles/abcg.dir/abcg_exception.cpp.o
abcg/libabcg.a: abcg/CMakeFiles/abcg.dir/abcg_image.cpp.o
abcg/libabcg.a: abcg/CMakeFiles/abcg.dir/abcg_openglfunctions.cpp.o
abcg/libabcg.a: abcg/CMakeFiles/abcg.dir/abcg_openglwindow.cpp.o
abcg/libabcg.a: abcg/CMakeFiles/abcg.dir/abcg_string.cpp.o
abcg/libabcg.a: abcg/CMakeFiles/abcg.dir/abcg_trackball.cpp.o
abcg/libabcg.a: abcg/CMakeFiles/abcg.dir/build.make
abcg/libabcg.a: abcg/CMakeFiles/abcg.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/zell/Documents/CG/Season3/abcg/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Linking CXX static library libabcg.a"
	cd /home/zell/Documents/CG/Season3/abcg/build/abcg && $(CMAKE_COMMAND) -P CMakeFiles/abcg.dir/cmake_clean_target.cmake
	cd /home/zell/Documents/CG/Season3/abcg/build/abcg && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/abcg.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
abcg/CMakeFiles/abcg.dir/build: abcg/libabcg.a

.PHONY : abcg/CMakeFiles/abcg.dir/build

abcg/CMakeFiles/abcg.dir/clean:
	cd /home/zell/Documents/CG/Season3/abcg/build/abcg && $(CMAKE_COMMAND) -P CMakeFiles/abcg.dir/cmake_clean.cmake
.PHONY : abcg/CMakeFiles/abcg.dir/clean

abcg/CMakeFiles/abcg.dir/depend:
	cd /home/zell/Documents/CG/Season3/abcg/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zell/Documents/CG/Season3/abcg /home/zell/Documents/CG/Season3/abcg/abcg /home/zell/Documents/CG/Season3/abcg/build /home/zell/Documents/CG/Season3/abcg/build/abcg /home/zell/Documents/CG/Season3/abcg/build/abcg/CMakeFiles/abcg.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : abcg/CMakeFiles/abcg.dir/depend


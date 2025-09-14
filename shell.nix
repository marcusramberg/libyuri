let
  pkgs = import <nixpkgs> { };
in
pkgs.mkShell {
  env.NDI_PATH = "${pkgs.ndi}/lib/libndi.so";
  buildInputs = with pkgs; [
    alsa-lib
    boost
    cmake
    curl
    doxygen
    freetype
    ffmpeg_4-full
    gcc
    glew
    glfw
    glm
    imagemagick
    jsoncpp
    libgphoto2
    libjack2
    libjpeg
    librealsense
    libshout
    libx11
    libxfixes
    libxdmcp
    ndi
    ninja
    opencv4WithoutCuda
    pipewire
    poppler
    pulseaudio
    python3
    pkg-config
    SDL2
    vorbis-tools
    x264
    x265
  ];
}

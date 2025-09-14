let
  pkgs = import <nixpkgs> { };
in
pkgs.mkShell {
  env.NDI_PATH = "${pkgs.ndi}/lib/libndi.so";
  buildInputs = with pkgs; [
    boost
    cmake
    doxygen
    freetype
    gcc
    glew
    glfw
    glm
    jsoncpp
    libx11
    ndi
    ninja
    python3
    pkg-config
    libjpeg
  ];
}

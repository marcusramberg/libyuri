{
  pkgs ? import <nixpkgs> { },
}:
pkgs.stdenv.mkDerivation {
  pname = "libyuri";
  version = "0.0.0-unstable-2025-09-14";
  src = pkgs.fetchFromGitHub {
    owner = "marcusramberg";
    repo = "libyuri";
    rev = "b6b98c6e9deacb5a62032fa0659fc8d59e8069a2";
    sha256 = "sha256-gHwwS/77qTxaLxkGAhgJw60xgEy++AnmzNJytYgMSDk=";
  };
  nativeBuildInputs = with pkgs; [
    cmake
    pkg-config
    makeWrapper
  ];
  cmakeFlags = [
    "-DCMAKE_BUILD_TYPE=Release"
    "-DOpenGL_GL_PREFERENCE=LEGACY"
  ];
  postInstall = ''
    wrapProgram $out/bin/yuri2 \
      --set NDI_PATH ${pkgs.ndi}/lib/libndi.so
    wrapProgram $out/bin/yuri_simple \
      --set NDI_PATH ${pkgs.ndi}/lib/libndi.so
  '';

  buildInputs = with pkgs; [
    alsa-lib
    boost
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
    SDL2
    vorbis-tools
    x264
    x265
  ];
  meta = {
    mainProgram = "yuri2";
    description = "Modular multimedia framework";
    license = [ pkgs.lib.licenses.gpl3 ];
  };
}

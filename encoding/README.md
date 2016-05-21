## Scripts

#### encode-to-aac.pl
Encodes mp3 to aac using libfdk_aac. Also maps out the weird stream that always comes with Amazon Music mp3s.

#### encode-for-piwigo.pl
Encodes all video files in a directory tree of a given extension to MP4/x264/aac.

## Build ffmpeg with libx264 and libfdk_aac support.

#### Dependencies
`yum install autoconf automake cmake freetype-devel gcc gcc-c++ git libtool make mercurial nasm pkgconfig zlib-devel`

#### Set up dir structure in root HOME. Add output bin dir to PATH.
```
cd ~
mkdir -p ffmpeg/build
export PATH=$PATH:~/ffmpeg/build/bin
```

Put all components in the ffmpeg/ directory. All of them will publish their artifacts in ffmpeg/build.

#### Yasm
```
git clone --depth 1 git://github.com/yasm/yasm.git
autoreconf -fiv
./configure --prefix="$HOME/ffmpeg/build" --bindir="$HOME/ffmpeg/build/bin"
make
make install
```

#### libx264
For 10-bit, configure with --bit-depth=10
```
git clone --depth 1 git://git.videolan.org/x264
PKG_CONFIG_PATH="$HOME/ffmpeg/build/lib/pkgconfig" ./configure --prefix="$HOME/ffmpeg/build" --bindir="$HOME/ffmpeg/build/bin" --enable-static
make
make install
```

#### libfdk_aac
```
git clone --depth 1 git://git.code.sf.net/p/opencore-amr/fdk-aac
autoreconf -fiv
./configure --prefix="$HOME/ffmpeg/build" --disable-shared
make
make install
```

#### ffmpeg. Instead of cloning the repo, sometimes it makes sense to grab a tarball of an official release.
```
git clone http://source.ffmpeg.org/git/ffmpeg.git
PKG_CONFIG_PATH="$HOME/ffmpeg/build/lib/pkgconfig" ./configure --prefix="$HOME/ffmpeg/build" --extra-cflags="-I$HOME/ffmpeg/build/include" --extra-ldflags="-L$HOME/ffmpeg/build/lib" --bindir="$HOME/ffmpeg/build/bin" --pkg-config-flags="--static" --enable-gpl --enable-nonfree --enable-libfdk-aac --enable-libfreetype --enable-libx264
```

#### Manually publish the executables.
Copy to /usr/local/bin. If 8-bit and 10-bit versions, rename 10-bit to ffmpeg10.

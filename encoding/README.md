## Scripts

#### encode-to-aac.pl
Encodes mp3 to aac using libfdk_aac. Also maps out the weird stream that always comes with Amazon Music mp3s.

#### encode-for-piwigo.pl
Encodes all video files in a directory tree of a given extension to MP4/x264/aac.

## Build ffmpeg with libx264 and libfdk_aac support.

#### Dependencies
`yum install autoconf automake cmake freetype-devel gcc gcc-c++ git libtool make mercurial nasm pkgconfig zlib-devel`

#### Set up build dirs in root HOME.
```
cd ~
mkdir -p ffmpeg-build
```

Sync all components in ffmpeg-build. They will publish their artifacts in /usr/local[bin/lib/include/...]

#### Yasm
```
git clone --depth 1 git://github.com/yasm/yasm.git
autoreconf -fiv
./configure --prefix="/usr/local" --bindir="/usr/local/bin"
make
make install
```

#### libx264
For 10-bit, configure with --bit-depth=10
```
git clone --depth 1 git://git.videolan.org/x264
PKG_CONFIG_PATH="/usr/local/lib/pkgconfig" ./configure --prefix="/usr/local" --bindir="/usr/local/bin" --enable-static
make
make install
```

#### libfdk_aac
```
git clone --depth 1 git://git.code.sf.net/p/opencore-amr/fdk-aac
autoreconf -fiv
./configure --prefix="/usr/local" --disable-shared
make
make install
```

#### ffmpeg. Instead of cloning the repo, sometimes it makes sense to grab a tarball of an official release.
```
git clone http://source.ffmpeg.org/git/ffmpeg.git
PKG_CONFIG_PATH="/usr/local/lib/pkgconfig" ./configure --prefix="/usr/local" --extra-cflags="-I/usr/local/include" --extra-ldflags="-L/usr/local/lib" --bindir="/usr/local/bin" --pkg-config-flags="--static" --enable-gpl --enable-nonfree --enable-libfdk-aac --enable-libfreetype --enable-libx264
make
make install
```

#### Optional
For 10-bit, rename to ffmpeg10, then build 8-bit.

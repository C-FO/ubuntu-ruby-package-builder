sudo apt-get install libssl-dev
sudo gem install fpm

wget ftp://ftp.ruby-lang.org//pub/ruby/1.9/ruby-1.9.3-p0.tar.gz
tar -zxvf ruby-1.9.3-p0.tar.gz
cd src/ruby-1.9.3-p0
time (./configure --prefix=/usr && make && make install DESTDIR=/tmp/installdir)

fpm -s dir -t deb -n ruby -v 1.9.3-p0 -C /tmp/installdir \
  -p ruby-VERSION_ARCH.deb -d "libstdc++6 (>= 4.4.3)" \
  -d "libc6 (>= 2.6)" -d "libffi5 (>= 3.0.4)" -d "libgdbm3 (>= 1.8.3)" \
  -d "libncurses5 (>= 5.7)" -d "libreadline6 (>= 6.1)" \
  -d "libssl0.9.8 (>= 0.9.8)" -d "zlib1g (>= 1:1.2.2)" \
  usr/bin usr/lib usr/share/man usr/include
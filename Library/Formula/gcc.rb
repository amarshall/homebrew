require 'formula'

class Gcc < Formula
  url 'http://ftpmirror.gnu.org/gcc/gcc-4.6.2/gcc-4.6.2.tar.gz'
  homepage 'http://gcc.gnu.org/'
  md5 '56c5b2a0ca0d4f27a827548ce5cf4203'

  depends_on 'gmp'
  depends_on 'libmpc'
  depends_on 'mpfr'

  def install
    %w[MAKEFLAGS CFLAGS LDFLAGS CPPFLAGS CXXFLAGS LDFLAGS CXX LD CC].each do |env|
      ENV.delete env
    end

    system "./configure", "--enable-checking-release",
                          "--program-suffix=-#{version}",
                          "--enable-languages=c,c++,fortran",
                          "--prefix=#{prefix}"
    system "make"
    system "make install"
  end

  def test
    system "make -k check"
  end
end

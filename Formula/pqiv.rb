class Pqiv < Formula
  desc "Powerful image viewer with minimal UI"
  homepage "https://github.com/phillipberndt/pqiv"
  url "https://github.com/phillipberndt/pqiv/archive/2.10.4.tar.gz"
  sha256 "58ddd18748e0b597aa126b7715f54f10b4ef54e7cd02cf64f7b83a23a6f5a14b"
  revision 4
  head "https://github.com/phillipberndt/pqiv.git"

  bottle do
    cellar :any
    sha256 "147a3c4adbf177df4f339874b33c9120a9f5191c0bb96539de9d4f98ea8ecad0" => :mojave
    sha256 "a3d08b8315eff78fe53885d40d2f207219f8c9d8e82c08a2ee10f458255afb7f" => :high_sierra
    sha256 "78408230b162677104caac334176523e89104006f3d993a607f5cf422d59aea5" => :sierra
  end

  depends_on "pkg-config" => :build
  depends_on "gtk+3"
  depends_on "imagemagick"
  depends_on "libarchive"
  depends_on "libspectre"
  depends_on "poppler"
  depends_on "webp"

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pqiv --version 2>&1")
  end
end

class Bat < Formula
  desc "Clone of cat(1) with syntax highlighting and Git integration"
  homepage "https://github.com/sharkdp/bat"
  url "https://github.com/sharkdp/bat/archive/v0.4.1.tar.gz"
  sha256 "3ae66854da59d691b8740672708a2e7f2f240c76e8a00283f59a6e39127e4583"

  bottle do
    sha256 "2f7a44de55ec1868f4a5009b8369657dc4293b0b442aa57334163e266efc8ba8" => :high_sierra
    sha256 "fe5730a0b8ab66fdac34ccc2581013f3f10f50d62157234000663be707b8de83" => :sierra
    sha256 "f8bdb53a7058fdbbdee13561790e6636013379463a1a28a30315e89a8f9454b3" => :el_capitan
  end

  depends_on "cmake" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "install", "--root", prefix
  end

  test do
    pdf = test_fixtures("test.pdf")
    output = shell_output("#{bin}/bat #{pdf} --color=never")
    assert_match "Homebrew test", output
  end
end

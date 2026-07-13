class Memgit < Formula
  include Language::Python::Virtualenv

  desc "Git for AI memory — version-controlled context persistence across Claude, GPT, Cursor, Windsurf and more"
  homepage "https://memgit.dev"
  url "https://files.pythonhosted.org/packages/d1/35/8715e21310b3dc90a8ad9bf87d01692aa7f91887c508e3ffcbbe7c64f1e6/memgit-0.6.0.tar.gz"
  sha256 "f4ecc42c4d8ba489b2ced1097428e4b60f2282842cb02f647fa6143e378fa023"
  license "MIT"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install buildpath
    bin.install_symlink venv.root/"bin/memgit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/memgit --version")
    assert_match "Usage:", shell_output("#{bin}/memgit --help")
  end
end

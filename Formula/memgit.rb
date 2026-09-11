class Memgit < Formula
  include Language::Python::Virtualenv

  desc "Git for AI memory — version-controlled context persistence across Claude, GPT, Cursor, Windsurf and more"
  homepage "https://memgit.dev"
  url "https://files.pythonhosted.org/packages/source/m/memgit/memgit-0.11.0.tar.gz"
  sha256 "6aefb52fb18fb1f184e9562e8f0d46bf350912b73f8ad4c0564acc83b0cd04be"
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

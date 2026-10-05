# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Tccli < Formula
  include Language::Python::Virtualenv
  desc "Tencent Cloud API 3.0 Command Line Interface"
  homepage "https://cloud.tencent.com/document/product/440/6176"
  url "https://github.com/TencentCloud/tencentcloud-cli/archive/3.1.179.1.tar.gz"
  sha256 "f676c4018c1be1d30d77be7d2e712c68dc323299a3f0cbefb49836ae0d69c4d5"
  license "Apache-2.0"

  depends_on "python@3.14"

  def install
    venv = virtualenv_create(libexec, "python3", without_pip: false)
    system libexec/"bin/pip", "install", "-v", 
                              "--ignore-installed", buildpath
    system libexec/"bin/pip", "uninstall", "-y", "tccli"
    venv.pip_install_and_link buildpath
    system libexec/"bin/pip", "uninstall", "-y", "pyinstaller"

  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tccli --version")
  end
end

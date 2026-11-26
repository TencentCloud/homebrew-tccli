# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class TccliIntlEn < Formula
  include Language::Python::Virtualenv
  desc "Tencent Cloud API 3.0 Command Line Interface"
  homepage "https://www.tencentcloud.com/document/product/1013/33464?lang=en"
  url "https://github.com/TencentCloud/tencentcloud-cli-intl-en/archive/3.1.210.1.tar.gz"
  sha256 "9a1dc67f6783f5e1be7b25278b4f3b7c4d675b3cdc3201b24ddd2a022683d943"
  license "Apache-2.0"

  depends_on "python@3.14"

  def install
    venv = virtualenv_create(libexec, "python3", without_pip: false)
    system libexec/"bin/pip", "install", "-v", 
                              "--ignore-installed", buildpath
    system libexec/"bin/pip", "uninstall", "-y", "tccli-intl-en"
    venv.pip_install_and_link buildpath
    system libexec/"bin/pip", "uninstall", "-y", "pyinstaller"

  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tccli --version")
  end
end

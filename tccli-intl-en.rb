# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class TccliIntlEn < Formula
  include Language::Python::Virtualenv
  desc "Tencent Cloud API 3.0 Command Line Interface"
  homepage "https://www.tencentcloud.com/document/product/1013/33464?lang=en"
  url "https://github.com/TencentCloud/tencentcloud-cli-intl-en/archive/3.0.1233.1.tar.gz"
  sha256 "9ced354baa7d24740327c417ff1d0784a3bab1ec6602a7013c53e639a0d24e6a"
  license "Apache-2.0"

  depends_on "python@3.10"

  def install
    venv = virtualenv_create(libexec, "python3", without_pip: false)
    system libexec/"bin/pip", "install", "-v", 
                              "--ignore-installed", buildpath
    system libexec/"bin/pip", "uninstall", "-y", "tccli-intl-en"
    venv.pip_install_and_link buildpath
    system libexec/"bin/pip", "uninstall", "-y", "pyinstaller"

  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test tencentcloud-cli`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end

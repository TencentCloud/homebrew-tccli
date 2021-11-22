# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Tccli < Formula
  include Language::Python::Virtualenv
  desc "Tencent Cloud API 3.0 Command Line Interface"
  homepage "https://cloud.tencent.com/document/product/440/6176"
  url "https://github.com/TencentCloud/tencentcloud-cli/archive/3.0.530.1.tar.gz"
  sha256 "55d4b7dc46fe2c9a6e9e9f221b44b45db06afd1da83c359aa0169d230ff62985"
  license "Apache-2.0"

  depends_on "python@3.9"

  def install
    venv = virtualenv_create(libexec, "python3")
    system libexec/"bin/pip", "install", "-v", 
                              "--ignore-installed", buildpath
    system libexec/"bin/pip", "uninstall", "-y", "tccli"
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

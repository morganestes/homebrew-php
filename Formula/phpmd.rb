require 'formula'
require File.expand_path("../../Requirements/php-meta-requirement", Pathname.new(__FILE__).realpath)
require File.expand_path("../../Requirements/phar-requirement", Pathname.new(__FILE__).realpath)

class Phpmd < Formula
  homepage 'http://phpmd.org'
  url 'http://static.phpmd.org/php/2.1.3/phpmd.phar'
  sha1 'a390c80f8108a07fb2d2bb91dfc175fa3a44371c'
  version '2.1.3'

  depends_on PhpMetaRequirement
  depends_on PharRequirement

  def install
    libexec.install "phpmd.phar"
    sh = libexec + "phpmd"
    sh.write("#!/bin/sh\n\n/usr/bin/env php -d allow_url_fopen=On -d detect_unicode=Off #{libexec}/phpmd.phar $*")
    chmod 0755, sh
    bin.install_symlink sh
  end

  def test
    system 'phpmd'
  end

  def caveats; <<-EOS.undent
    You can read more about phpmd by running:
      "brew home phpmd".
    EOS
  end
end

require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php56V8js < AbstractPhp56Extension
  init
  desc "A PHP extension for Google's V8 Javascript engine"
  homepage 'http://pecl.php.net/package/v8js'
  url "http://pecl.php.net/get/v8js-0.2.6.tgz"
  sha256 "603e2d825fdd3b633ecfac99e8433c5d56bf70ff8a4a5e62fc8ab3de20785e9f"
  depends_on "v8"

  def install
    Dir.chdir "v8js-#{version}" unless build.head?

    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig
    system "make"
    prefix.install "modules/v8js.so"
    write_config_file if build.with? "config-file"
  end
end

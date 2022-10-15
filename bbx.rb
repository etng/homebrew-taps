# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Bbx < Formula
  desc ""
  homepage "https://github.com/etng/homebrew-taps"
  version "0.0.4"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/etng/bbx/releases/download/v0.0.4/bbx_0.0.4_Darwin_x86_64.tar.gz"
      sha256 "b9739488553a532b610ffb15b139f206380a80b66120cea9dadf4c479cc984c0"

      def install
        bin.install "bbx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/etng/bbx/releases/download/v0.0.4/bbx_0.0.4_Darwin_arm64.tar.gz"
      sha256 "49e81916bdfa94f9bfd37c5246563381f2610646855edf011194512ddd678f5c"

      def install
        bin.install "bbx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/etng/bbx/releases/download/v0.0.4/bbx_0.0.4_Linux_arm64.tar.gz"
      sha256 "32d3d9e013eb5a9ed4c9df454e257a5a3a05894b28de7b3c01a4a075d0803fa1"

      def install
        bin.install "bbx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/etng/bbx/releases/download/v0.0.4/bbx_0.0.4_Linux_x86_64.tar.gz"
      sha256 "a8b34bfaeada2d4a50867325bdf6db2645833a253a25af75f4aed76a477ffb71"

      def install
        bin.install "bbx"
      end
    end
  end
end

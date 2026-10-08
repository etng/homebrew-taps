# frozen_string_literal: true

# 由 osd-notify 的 tag 发布流程生成，请修改源模板后重新发布。
class OsdNotify < Formula
  desc "Show clear, source-aware notifications on every macOS display"
  homepage "https://github.com/etng/osd_notify"
  url "https://github.com/etng/osd_notify/releases/download/v1.0.0/osd-notify-v1.0.0-macos-universal.tar.gz"
  version "1.0.0"
  sha256 "e7b20398d64b632092a130ffadc8f777fe6a04384b31e45617f2a3548a8d2c66"

  livecheck do
    skip "Updated automatically by the osd-notify release workflow."
  end

  depends_on macos: :ventura

  def install
    bin.install "osd-notify"
  end

  post_install_steps do
    # 二进制仅做 ad-hoc 签名，未做 Apple 公证；只移除本程序的隔离标记。
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{bin}}/osd-notify"]
  end

  test do
    assert_match "osd-notify #{version}", shell_output("#{bin}/osd-notify --version")
  end
end

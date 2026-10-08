# frozen_string_literal: true

# 由 osd-notify 的 tag 发布流程生成，请修改源模板后重新发布。
class OsdNotify < Formula
  desc "Show clear, source-aware notifications on every macOS display"
  homepage "https://github.com/etng/osd_notify"
  url "https://github.com/etng/osd_notify/releases/download/v1.0.1/osd-notify-v1.0.1-macos-universal.tar.gz"
  version "1.0.1"
  sha256 "895e9c1a2eac62206e4fdec1c59c6059868ae5bc4c53b513520a73c0d8df4a41"

  livecheck do
    skip "Updated automatically by the osd-notify release workflow."
  end

  depends_on macos: :ventura

  def install
    bin.install "osd-notify"
  end

  post_install_steps do
    # 二进制仅做 ad-hoc 签名，未做 Apple 公证；只移除本程序的隔离标记。
    # Homebrew 将已安装的二进制设为只读；临时允许所有者写入扩展属性，再恢复。
    set_permissions "osd-notify", "0755", base: :bin
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{bin}}/osd-notify"],
                          writable_paths: ["{{bin}}/osd-notify"]
    set_permissions "osd-notify", "0555", base: :bin
  end

  test do
    assert_match "osd-notify #{version}", shell_output("#{bin}/osd-notify --version")
  end
end

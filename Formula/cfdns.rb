# frozen_string_literal: true

# 由 cfdns 的 tag 发布流程生成，请修改源模板后重新发布。
class Cfdns < Formula
  desc "Cloudflare DNS 配置驱动管理工具 (配置即代码, 生成带域名 tab 的 HTML 报告)"
  homepage "https://github.com/etng/cfdns"
  url "https://github.com/etng/cfdns/releases/download/v0.1.1/cfdns-v0.1.1-macos-universal.tar.gz"
  version "0.1.1"
  sha256 "887840fad42021cf7411dc9d6f6309ee8dd2af97d41d9a15c8a901a7bc871e49"

  livecheck do
    skip "Updated automatically by the cfdns release workflow."
  end

  depends_on macos: :ventura

  def install
    bin.install "cfdns"
  end

  test do
    assert_match "cfdns #{version}", shell_output("#{bin}/cfdns version")
  end
end

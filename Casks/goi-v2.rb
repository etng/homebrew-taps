# 本地发布后更新版本与 DMG 校验和；Goi v2 使用独立的发行 tag。
cask "goi-v2" do
  version "0.3.5"
  sha256 "ba6e1aa0352fa4bb982df538036fc3595a462968ab33c0961cbb6ce5e2d716ba"

  url "https://github.com/etng/goi/releases/download/goi-v2-v#{version}/Goi-v2-#{version}-macos-arm64.dmg"
  name "Goi v2"
  desc "Local dictionary lookup and vocabulary learning"
  homepage "https://github.com/etng/goi"

  livecheck do
    skip "Goi v2 local releases use separate versioned tags."
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Goi v2.app"

  postflight_steps do
    # 当前 Apple Development 包未经公证；仅清理本应用的隔离属性。
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Goi v2.app"]
  end

  caveats <<~EOS
    本版仅支持 Apple Silicon，使用 Apple Development 签名，未经 Apple 公证。
    安装后已自动清除 Goi v2.app 的 quarantine 标记。
    macOS 划词需要在系统设置中为 Goi v2 授予辅助功能权限。
    卸载应用不会自动删除词典、学习记录或社区账号。
  EOS
end

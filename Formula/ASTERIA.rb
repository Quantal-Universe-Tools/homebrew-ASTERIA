class Asteria < Formula
  desc "ASTERIA Research Tool (Node 24 / Electron Launcher) Astronomical SPHEREx Time-series Extraction & Rapid Image Analysis"
  homepage "https://quantal-labs.com/asteria"
  url "https://github.com/Quantal-Universe/ASTERIA/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "3199238a5995e61959552ef38a62e074c8936d57efd923726705d0294607e72a" 

  def install
    # Install all files into libexec
    libexec.install Dir["*"]

    # Create the wrapper script that runs launch.sh
    (bin/"ASTERIA").write <<~EOS
      #!/bin/bash
      #{libexec}/launch.sh "$@"
    EOS
  end

  # Optional: Add a test to ensure it works
  test do
    system "#{bin}/ASTERIA", "--version"
  end
end

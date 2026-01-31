{lib, ...}: {
  nixpkgs.overlays = [
    (final: prev: {
      xwlsat-run = final.writeShellScriptBin "xwlsat-run" ''
        n=0
        while [ -e "/tmp/.X11-unix/X$n" ]; do
          n=$((n + 1))
        done

        xwayland-satellite :$n &

        xwlsat_pid=$!

        export DISPLAY=:$n

        DISPLAY=:$n "$@"

        kill $xwlsat_pid
      '';
    })
  ];
}

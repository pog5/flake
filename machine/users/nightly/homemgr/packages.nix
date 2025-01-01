{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    # drawing
    krita
    opentabletdriver

    # remote
    rustdesk-flutter
    wayvnc

    # wayland / desktop utils
    wlr-randr
    grimblast
    hyprpaper
    xsettingsd
    dunst
    libnotify
    wl-clipboard
    slurp
    playerctl
    grim

    # desktop utils
    mission-center

    # desktop
    dolphin

    # audio
    pavucontrol
    easyeffects

    # internet
    vesktop
    signal-desktop
    element-desktop

    # games
    prismlauncher
    osu-lazer-bin
    steam
    xonotic

    # term util
    btop
    htop
    iotop
    iftop
    fastfetch
    nnn # file mgr
    glow # md preview

    # shell util
    fd
    zoxide
    thefuck
    grc
    bat
    ripgrep
    jq
    yq-go
    eza
    fzf

    # syscall mon
    strace
    ltrace
    lsof

    # term net
    mtr
    iperf3
    dnsutils
    ldns
    aria2
    socat
    rustscan
    ipcalc

    # term misc
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    # dev
    nixfmt-rfc-style
    # nix-output-monitor # provides `nom`, use it instead of `nix`

    # archives
    zip
    xz
    unzip
    p7zip

    # sys tools
    sysstat
    lm_sensors
    ethtool
    pciutils # lspci
    usbutils # lsusb

    # fonts
    liberation_ttf
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    noto-fonts-extra
    cozette
    commit-mono
    jetbrains-mono
    fira-code
    fira-code-symbols
    hack-font
    victor-mono
    inter
    roboto
    roboto-mono
    ubuntu_font_family
    font-awesome
    material-design-icons
    material-icons
    noto-fonts-lgc-plus
    dejavu_fonts
    freefont_ttf
    gyre-fonts
    nerd-fonts.commit-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.hack
    nerd-fonts.space-mono
    nerd-fonts.droid-sans-mono
    nerd-fonts.victor-mono
  ];
}

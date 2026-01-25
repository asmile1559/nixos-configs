{ pkgs, ... }:

{
  home.packages = with pkgs; [
    grim
    slurp
    satty
    wl-clipboard
  ];

  programs.satty = {
    enable = true;
    # https://github.com/Satty-org/Satty
    settings = {
      general = {
        # Start Satty in fullscreen mode
        fullscreen = true;
        # Exit directly after copy/save action. NEXTRELEASE: Does not apply to save as
        early-exit = true; # 当 copy 或者 save 后直接退出
        # Exit directly after save as (NEXTRELEASE)
        # early-exit-save-as = true; # 当 save as 后退出
        corner-roundness = 12; # 圆角大小
        # Select the tool on startup [possible values: pointer, crop, line, arrow, rectangle, text, marker, blur, brush]
        initial-tool = "brush";
        # Configure the command to be called on copy, for example `wl-copy`
        copy-command = "wl-copy";
        # Increase or decrease the size of the annotations
        annotation-size-factor = 2;
        # Filename to use for saving action. Omit to disable saving to file.
        # Might contain format specifiers: https://docs.rs/chrono/latest/chrono/format/strftime/index.html
        # starting with 0.20.0, can contain leading tilde (~) for home directory
        output-filename = "~/Pictures/Screenshots/%Y-%m-%d_%H:%M:%S.png";
        # After copying the screenshot, save it to a file as well
        save-after-copy = false;
        # Hide toolbars by default
        default-hide-toolbars = false;
        # Experimental (since 0.20.0): whether window focus shows/hides toolbars. This does not affect initial state of toolbars, see default-hide-toolbars.
        focus-toggles-toolbars = false;
        # Fill shapes by default (since 0.20.0)
        default-fill-shapes = false;
        # The primary highlighter to use, the other is accessible by holding CTRL at the start of a highlight [possible values: block, freehand]
        primary-highlighter = "block";
        # Disable notifications
        disable-notifications = false;
        # Actions to trigger on right click (order is important)
        # [possible values: save-to-clipboard, save-to-file, save-to-file-as, copy-filepath-to-clipboard, exit]
        actions-on-right-click = [ ];
        # Actions to trigger on Enter key (order is important)
        # [possible values: save-to-clipboard, save-to-file, save-to-file-as, copy-filepath-to-clipboard, exit]
        actions-on-enter = [ "save-to-clipboard" ];
        # Actions to trigger on Escape key (order is important)
        # [possible values: save-to-clipboard, save-to-file, save-to-file-as, copy-filepath-to-clipboard, exit]
        actions-on-escape = [ "exit" ];
        # Action to perform when the Enter key is pressed [possible values: save-to-clipboard, save-to-file]
        # Deprecated: use actions-on-enter instead
        action-on-enter = "save-to-clipboard";
        # Right click to copy
        # Deprecated: use actions-on-right-click instead
        right-click-copy = false;
        # request no window decoration. Please note that the compositor has the final say in this. At this point. requires xdg-decoration-unstable-v1.
        no-window-decoration = true;
        # experimental feature: adjust history size for brush input smoothing (0: disabled, default: 0, try e.g. 5 or 10)
        brush-smooth-history-size = 10;
        # experimental feature (NEXTRELEASE): The pan step size to use when panning with arrow keys.
        # pan-step-size = 50.0;
        # experimental feature (NEXTRELEASE): The zoom factor to use for the image.
        # 1.0 means no zooming.
        # zoom-factor = 1.1;
        # experimental feature (NEXTRELEASE): The length to move the text when using arrow keys. defaults to 50.0
        # text-move-length = 50.0;
        # experimental feature (NEXTRELEASE): Scale factor on the input image when it was taken (e.g. DPI scale on the monitor it was recorded from).
        # This may be more useful to set via the command line.
        # input-scale = 1.0;
      };
      keybinds = {
        pointer = "p";
        crop = "c";
        brush = "b";
        line = "i";
        arrow = "x";
        rectangle = "r";
        ellipse = "e";
        text = "t";
        marker = "m";
        blur = "u";
        highlight = "h";
      };
      font = {
        family = "Microsoft YaHei";
        style = "Regular";
        # if not family, use fallback
        # fallback = [
        #   "Maple Mono NL NF CN"
        #   "Noto Sans CJK SC"
        # ];
      };
      color-palette = {
        palette = [
          "#00ffff"
          "#a52a2a"
          "#dc143c"
          "#ff1493"
          "#ffd700"
          "#008000"
        ];
        custom = [
          "#00ffff"
          "#a52a2a"
          "#dc143c"
          "#ff1493"
          "#ffd700"
          "#008000"
        ];
      };
    };
  };
}

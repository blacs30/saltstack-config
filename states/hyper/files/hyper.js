// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

module.exports = {

  config: {
  hyperBorder: {
    borderColors: ['#fc1da7', '#fba506'],
    borderWidth: '2px'
  },
  paneNavigation: {
    debug: false,
    hotkeys: {
      navigation: {
        up: 'ctrl+alt+up',
        down: 'ctrl+alt+down',
        left: 'ctrl+alt+left',
        right: 'ctrl+alt+right'
      },
      jump_prefix: 'ctrl+alt', // completed with 1-9 digits
      permutation_modifier: 'shift', // Added to jump and navigation hotkeys for pane permutation
      maximize: 'meta+shift+enter'
    },

    showIndicators: true, // Show pane number
    indicatorPrefix: '^⌥', // Will be completed with pane number
    indicatorStyle: { // Added to indicator <div>
      position: 'absolute',
      top: 0,
      left: 0,
      fontSize: '10px'
    },
    focusOnMouseHover: false,
    inactivePaneOpacity: 0.6 // Set to 1 to disable inactive panes dimming
  },

  'hyper-match': {
        triggers: [
          {
              name: 'date',
              pattern: '^(0[1-9]|1[0-2])[\\/](0[1-9]|[12]\\d|3[01])[\\/](19|20)\\d{2}$',
              options: 'g',
              strategy: 'echo \'$&\' | pbcopy && open "https://calendar.google.com"',
              priority: 1,
              linkColor: '#4285f4',
          },
          {
              name: 'email',
              pattern: '[a-z0-9]+[_a-z0-9\\.-]*[a-z0-9]+@[a-z0-9-]+(\\.[a-z0-9-]+)*(\\.[a-z]{2,4})',
              options: 'gi',
              strategy: 'echo \'$&\' | pbcopy && open "https://mail.google.com"',
              priority: 2,
          },
          {
              name: 'css-color',
              pattern: '#(?:[a-f\\d]{3}){1,2}\\b|rgb\\((?:(?:\\s*0*(?:25[0-5]|2[0-4]\\d|1?\\d?\\d)\\s*,){2}\\s*0*(?:25[0-5]|2[0-4]\\d|1?\\d?\\d)|\\s*0*(?:100(?:\\.0+)?|\\d?\\d(?:\\.\\d+)?)%(?:\\s*,\\s*0*(?:100(?:\\.0+)?|\\d?\\d(?:\\.\\d+)?)%){2})\\s*\\)|hsl\\(\\s*0*(?:360|3[0-5]\\d|[12]?\\d?\\d)\\s*(?:,\\s*0*(?:100(?:\\.0+)?|\\d?\\d(?:\\.\\d+)?)%\\s*){2}\\)|(?:rgba\\((?:(?:\\s*0*(?:25[0-5]|2[0-4]\\d|1?\\d?\\d)\\s*,){3}|(?:\\s*0*(?:100(?:\\.0+)?|\\d?\\d(?:\\.\\d+)?)%\\s*,){3})|hsla\\(\\s*0*(?:360|3[0-5]\\d|[12]?\\d?\\d)\\s*(?:,\\s*0*(?:100(?:\\.0+)?|\\d?\\d(?:\\.\\d+)?)%\\s*){2},)\\s*0*(?:1|0(?:\\.\\d+)?)\\s*\\)',
              options: 'gi',
              strategy: 'echo \'$&\' | pbcopy',
              priority: 1,
          },
      ]
  },

  hyperline: {
    plugins: [
      "hostname",
      "ip",
      "memory",
      "cpu",
      "network",
      "battery",
      "Time",
      "git-status"
    ]
  },

  broadcast: {
      debug: true,
      hotkeys: {
        selectCurrentPane: 'Command+Alt+Shift+i',
        selectCurrentTabPanes: 'Command+Alt+i',
        selectAllPanes: 'Command+Shift+i',
        toggleCurrentPane: 'Command+Alt+Control+Shift+i'
      },
      indicatorStyle: {
        position: 'absolute',
        top: 5,
        right: 10,
        borderRadius: '50%',
        width: '10px',
        height: '10px',
        background: 'red'
      }
    },

  autoProfile: {
      prompts: [
        {
          // 'MyHost:Documents me$ ' default MacOS bash prompt
          pattern: "^(\\S+):(.*) ([a-z_][a-z0-9_\\-\\.]*[\\$]?)[\\$#]\\s*$",
          hostname: 1,
          path: 2,
          username: 3
        },
        {
          // 'me@MyHost:~$ ' default Linux bash prompt
          pattern:
            "^([a-z_][a-z0-9_\\-\\.]*[\\$]?)@(\\S+):([\\/~].*)[\\$#]\\s*$",
          username: 1,
          hostname: 2,
          path: 3
        },
        {
          // 'me@MyHost ~> ' default fish prompt
          pattern: "^([a-z_][a-z0-9_\\-\\.]*[\\$]?)@(\\S+) ([\\/~].*)[>#]\\s*",
          username: 1,
          hostname: 2,
          path: 3
        },
        {
          // 'MyHost% ' default zsh prompt
          pattern: "^(\\S+)% ",
          hostname: 1
        },
        {
          // '➜  ~' default oh-my-zsh prompt (robbyrussell theme)
          pattern: "^➜  ([\\/~].*) ",
          path: 1
        }
      ],
      profiles: [
        {
          triggers: ["root@"],
          backgroundColor: "#400"
        }
      ],
      stripAnsiColors: true, //default
      debug: false //default
    },

    hyperTabs: {
      activityColor: 'salmon',
      closeAlign: 'right',
      activityPulse: true,
      tabIconsColored: true,
      border: true,
    },

    // choose either `'stable'` for receiving highly polished,
    // or `'canary'` for less polished but more frequent updates
    updateChannel: 'canary',

    // default font size in pixels for all tabs
    fontSize: 15,

    // font family with optional fallbacks
    fontFamily: 'Source Code Pro for Powerline',

    // default font weight: 'normal' or 'bold'
    fontWeight: 'normal',

    // font weight for bold characters: 'normal' or 'bold'
    fontWeightBold: 'bold',

    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    cursorColor: 'rgba(248,28,229,0.8)',

    // terminal text color under BLOCK cursor
    cursorAccentColor: '#000',

    // `'BEAM'` for |, `'UNDERLINE'` for _, `'BLOCK'` for █
    cursorShape: 'BLOCK',

    // set to `true` (without backticks and without quotes) for blinking cursor
    cursorBlink: true,

    // color of the text
    foregroundColor: '#fff',

    // terminal background color
    // opacity is only supported on macOS
    backgroundColor: 'rgba(0,0,0,1)',

    // terminal selection color
    selectionColor: 'rgba(248,28,229,0.3)',

    // border color (window, tabs)
    borderColor: '#663',

    // custom CSS to embed in the main window
    css: '',

    // custom CSS to embed in the terminal window
    termCSS: '',

    // if you're using a Linux setup which show native menus, set to false
    // default: `true` on Linux, `true` on Windows, ignored on macOS
    showHamburgerMenu: '',

    // set to `false` (without backticks and without quotes) if you want to hide the minimize, maximize and close buttons
    // additionally, set to `'left'` if you want them on the left, like in Ubuntu
    // default: `true` (without backticks and without quotes) on Windows and Linux, ignored on macOS
    showWindowControls: '',

    // custom padding (CSS format, i.e.: `top right bottom left`)
    // padding: '12px 14px',
    padding: '0 5px 13px',

    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    colors: {
      black: '#000000',
      red: '#d71e00',
      green: '#5da602',
      yellow: '#cfad00',
      blue: '#417ab3',
      magenta: '#88658d',
      cyan: '#00a7aa',
      white: '#dbded8',
      lightBlack: '#676965',
      lightRed: '#f44135',
      lightGreen: '#98e342',
      lightYellow: '#fcea60',
      lightBlue: '#83afd8',
      lightMagenta: '#bc93b6',
      lightCyan: '#37e5e7',
      lightWhite: '#f1f1ef',
    },

    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    //
    // Windows
    // - Make sure to use a full path if the binary name doesn't work
    // - Remove `--login` in shellArgs
    //
    // Bash on Windows
    // - Example: `C:\\Windows\\System32\\bash.exe`
    //
    // PowerShell on Windows
    // - Example: `C:\\WINDOWS\\System32\\WindowsPowerShell\\v1.0\\powershell.exe`
    shell: '/bin/zsh',

    // for setting shell arguments (i.e. for using interactive shellArgs: `['-i']`)
    // by default `['--login']` will be used
    shellArgs: ['--login'],

    // for environment variables
    env: {
      LANG: "en_US.UTF-8"
    },

    // scrollback buffer
    scrollback: '20000',

    // set to `false` for no bell
    bell: 'SOUND',

    // if `true` (without backticks and without quotes), selected text will automatically be copied to the clipboard
    copyOnSelect: true,

    // if `true` (without backticks and without quotes), hyper will be set as the default protocol client for SSH
    defaultSSHApp: true,

    // if `true` (without backticks and without quotes), on right click selected text will be copied or pasted if no
    // selection is present (`true` by default on Windows and disables the context menu feature)
    // quickEdit: true,

    // URL to custom bell
    // bellSoundURL: 'http://example.com/bell.mp3',

    // for advanced config flags please refer to https://hyper.is/#cfg
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
    "hyper-broadcast",
    "hyper-search",
    "hypercwd",
    "hyper-autohide-tabs",
    "hyper-alt-click",
    "hyperminimal",
    "hyper-match",
    "hyperlinks",
    "hyper-autoprofile",
    "hyperline",
    "hyper-pane",
    "hyperborder",
    // "hyper-statusline", // not working together with hyperline
    // THEMES
    //
    // "hyperterm-monokai",
    "hyper-night-owl",
    // "hyperocean",
    // "hyper-altair",
    // "hyper-ayu-light",
    // "hyper-one-light",
    // "hyperterm-atom-dark",
  ],

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: [
  ],

  keymaps: {
    // Example
    'window:devtools': 'cmd+alt+o'
  }
};

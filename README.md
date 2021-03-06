# rainbow-fart.el

Rainbow Fart for Emacs. Ported from [vscode-rainbow-fart](https://github.com/SaekiRaku/vscode-rainbow-fart).

# Deprecated

In favor of [emacs-rainbow-fart](https://github.com/stardiviner/emacs-rainbow-fart).

# Requirements

`mpg123` is required for playing mp3 audio file.

# Installation and Usage

Not ready on melpa yet.

## Use Quelpa
```emacs-lisp
(use-package rainbow-fart
  :quelpa (rainbow-fart :fetcher github
                        :repo "DogLooksGood/rainbow-fart.el"
                        :files ("*.el" "voice")))
```

## Use straight
```emacs-lisp
(straight-use-package
 '(rainbow-fart :host  github
                :repo  "DogLooksGood/rainbow-fart.el"
                :files ("*.el" "voice")))
```

## Use Straight with use-package
```emacs-lisp
(use-package rainbow-fart
  :straight (rainbow-fart :type git
                          :host github
                          :repo "DogLooksGood/rainbow-fart.el"
                          :files ("*.el" "voice")))
```

Enable by activate `rainbow-fart-mode`.

```emacs-lisp
(rainbow-fart-mode 1)
```

# LICENSE
Please Note, voice files (in voice directory) are copy from [vscode-rainbow-fart](https://github.com/SaekiRaku/vscode-rainbow-fart), under [MIT license](https://github.com/SaekiRaku/vscode-rainbow-fart/blob/master/LICENSE).


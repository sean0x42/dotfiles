;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Sean Bailey"
      user-mail-address "hello@seanbailey.dev")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "JetBrains Mono" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-ayu-mirage)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(projectile-add-known-project "~/workspace/HabitTracker")
(projectile-add-known-project "~/workspace/dotfiles")
(projectile-add-known-project "~/workspace/fas/api")
(projectile-add-known-project "~/workspace/fas/api-gateway")
(projectile-add-known-project "~/workspace/fas/frontend")
(projectile-add-known-project "~/workspace/gth/api")
(projectile-add-known-project "~/workspace/gth/ducks")
(projectile-add-known-project "~/workspace/gth/frontline")
(projectile-add-known-project "~/workspace/gth/ghost")
(projectile-add-known-project "~/workspace/koi")
(projectile-add-known-project "~/workspace/koi-prototype-mk-ii")
(projectile-add-known-project "~/workspace/mineshark")
(projectile-add-known-project "~/workspace/ncmg.com.au")
(projectile-add-known-project "~/workspace/raycast-scripts")
(projectile-add-known-project "~/workspace/seanbailey.dev")
(projectile-add-known-project "~/workspace/specialist-fuzzy-match")
(projectile-add-known-project "~/workspace/specialist-spell-checker")

;; Disable smart parens
(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)

(setq default-tab-width 2)
(setq typescript-indent-level 2)
(setq js-indent-level 2)
(setq standard-indent 2)

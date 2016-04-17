# dotfiles

## Content

* zsh configuration
  * Few alias and nice prompt
  * Display current git branch in the prompt
* VIM configuration
  * I rarely use VIM
* Emacs
  * auto install emacs 24.4
  * auto install rtags
  * Comprehensive C++ environment
    * Flycheck with clang
    * Code navigation with rtags (based on on-the-fly compilation)
    * C-J jump to definition, C-F find references, C-L list virtual overrides
    * Improved gdb experience
    * F8 compile, F9 recompile
  * Python linting, code navigation and correct code completion
    * C-J jump to definition, C-F find references
  * Spellcheck everywhere (code comments, text)
  * Smart completion everywhere (shell script, lisp, text, python)
  * Check content of .emacs for more details...

## Install

   Run
   ./install.sh

   This will ask you before performing each operation.
   Few questions you might want to say no
   * Overwrite ~/.gitconfig ? This will set ME as default user
   * Do you want to make zsh your default shell ?
   * Do you want to install emacs 24.4 from source ? Say no if you already have a version >= 24.4

## Bug

   * Rarely an error saying flycheck-mode failed will appear when opening a C++ buffer
   * Very rarely emacs will hang when working in a C++ buffer (seems related to rtags)
   * If you experience display glitches or issue with indentation, make sure to upgrade to emacs 24.4
   
Dotfiles for Arch Linux on Ubuntu
=======================================

Ubuntu 上の Arch Linux 用 dotfiles。対象プログラムは

* Vim
* Git

追加の操作を行う必要があるプログラムは

* Vim
* Git

環境移行時に行うこと
--------------------

1. サブモジュールを更新する。

    ```bash
    cd /path/to/dotfiles-ubuntu
    git submodule update --init
    ```
2. 以下を実行して、ホームディレクトリに dotfiles へのシンボリックリンクを配置する。

    ```bash
    for f in _*; do
        ln -sf `pwd`/$f ~/${f/_/.}
    done
    ```
3. .gitconfig の設定。gitconfig.sh を `FIXME` の指示通りに修正して、実行する。

    ```bash
    vim gitconfig.sh # 編集
    ./gitconfig.sh
    ```

4. Vim の設定。
    1. Vim を起動して `NeoBundleInstall` を実行させる。
    2. vimproc の設定。以下を実行する。

        ```bash
        cd ~/.vim/bundle/vimproc
        make -f make_unix.mak
        ```

# Script Hyprland #

Essa parte será bem curta.

- - - -
## 1. Preparando Ambiente ##
Essa etapa será breve, pois tudo o que precisará para instalar é o [Git](https://wiki.archlinux.org/title/git).
```shell
sudo pacman -S git
```

Agora que o Git está instalado, clone este repositório.
```shell
git clone https://github.com/gutohertzog/arch-hyprland
```

- - - -
## 2. Instalando ##
Isso irá criar uma pasta como o mesmo nome do repositório. Entre nela.
```shell
cd arch-hyprland
```

Como última parte, torne o arquivo `install.sh` executável.
```shell
chmod u+x install.sh
```

Agora, tudo o que precisa fazer é executar o script.
```shell
./install.sh
```

Após a finalização do script, ainda há duas coisas para fazer:
- abrir o Vim e executar o comando `PlugInstall`;
- adicionar `ILoveCandy` no arquivo `/etc/pacman.conf` em `Misc options`;

Apreveite o sistema =D


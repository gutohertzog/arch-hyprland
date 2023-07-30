# Tutorial Hyprland #

O tutorial a seguir vai ser bem extenso, já que ele contará com a instalação de diversas ferramentas e pacotes.

Para não deixar ele mais extenso, quande novas ferramentas e pacotes forem apresentados, haverá uma breve explicação do seu uso e links para maiores informações, documentações e tutoriais.

## 1. Pacotes Necessários ##
Primeiro, é necessário instalar:
- [Vim](https://www.tutorialspoint.com/vim/index.htm): para editar os documentos;
- [Git](https://git-scm.com/docs/gittutorial) para baixar alguns programas e pacotes;
- [neofetch](https://linuxnightly.com/neofetch-command-in-linux/): para mostrar alguns dados do sistema;
```shell
pacman -S vim git neofetch
```

### 1.1. Configurando o Pacman ###
Antes de continuar, é necessário adicionar uma configuração muito importante no arquivo de configuração do [`pacman`](https://itsfoss.com/pacman-command/).

Acesse o arquivo usando o comando abaixo e adicione `ILoveCandy` no tópico `Misc options`:
```shell
vim /etc/pacman.conf
```

### 1.2. Configurando o Vim ###


### 1.3 Hyprland e Kitty ###
O [Hyprland](https://hyprland.org/) vem configurado para uso padrão de terminal o [kitty](https://sw.kovidgoyal.net/kitty/).

Use o comando abaixo para instalar ambos:
```shell
pacman -S kitty hyprlan
```

Agora que ambos já estão instalados, a configuração poderá ser continuada já usando o Hyprland e o terminal kitty.




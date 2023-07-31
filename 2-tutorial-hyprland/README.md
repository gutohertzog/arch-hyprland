# Tutorial Hyprland #

O tutorial a seguir vai ser bem extenso, já que ele contará com a instalação de diversas ferramentas e pacotes.

Para não ficar muito extenso, quando novas ferramentas e pacotes forem apresentados, haverá uma breve explicação do seu uso e links para maiores informações, documentações e tutoriais. Também serão mencionados seus respectivos arquivos de configuração na pasta `dotfiles` deste repositório.

Apenas as configurações alteradas serão mencionadas. As demais, devem ser tratadas como as configurações padrão da instalação de cada pacote/ferramenta.

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

### 1.2. Baixando o Repositório ###
Diversos arquivos de configuração serão alterados. Todos eles estão na pasta `dotfiles` deste repositório. Então, a próxima etapa é cloná-lo para sua máquina. Para isso, execute o comando abaixo:
```shell
git clone https://github.com/gutohertzog/arch-hyprland
```

Isso deve criar uma pasta chamada `arch-hyprland` no seu diretório raiz do usuário.

### 1.3. Configurando a Fonte ###
Para diversos programas e ferramentas, será usada uma fonte baixada da internet. A fonte usada será a CaskaydiaCove Nerd Font. Ela está disponível para ser baixada no site [Nerd Fonts](https://www.nerdfonts.com) e também na pasta `dotfiles/Fontes`, já descompactada.

Todos os programas que tiverem suas fontes alteradas serão marcados, para que possam ser alterados para outra fonte de preferência de quem estiver instalando.

Para instalar uma nova fonte, crie uma pasta dentro de `/usr/share/fonts` com o nome da própria fonte. Aqui se chamará `caskaydiacove-nerd-font`. Depois, copie todos os arquivos `*.ttf` para dentro da pasta criada.
```shell
cp ~/arch-hyprland/dotfiles/Fontes/CaskaydiaCove-Nerd-Font/*ttf /usr/share/fonts/caskaydiacove-nerd-font/
```

Depois, execute o comando [fc-cache](https://wiki.archlinux.org/title/fonts) para carregar as novas fontes para o sistema operacional:
```shell
fc-cache -f -v
```

### 1.4. Configurando o Vim ###


### 1.3 Hyprland e Kitty ###
O [Hyprland](https://hyprland.org/) vem configurado para uso padrão de terminal o [kitty](https://sw.kovidgoyal.net/kitty/).

Use o comando abaixo para instalar ambos:
```shell
pacman -S kitty hyprland
```

Agora que ambos já estão instalados, a configuração poderá ser continuada já usando o Hyprland e o terminal kitty.

Para instalar as fontes, 



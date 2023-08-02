# Tutorial Hyprland #

O tutorial a seguir vai ser bem extenso, já que ele contará com a instalação de diversas ferramentas e pacotes.

Para não ficar muito extenso, quando novas ferramentas e pacotes forem apresentados, haverá uma breve explicação do seu uso e links para maiores informações, documentações e tutoriais. Também serão mencionados seus respectivos arquivos de configuração na pasta `dotfiles` deste repositório.

Apenas as configurações alteradas serão mencionadas. As demais, devem ser tratadas como as configurações padrão da instalação de cada pacote/ferramenta.

- - - -
## 1. Preparando o Ambiente ##
Antes de começar a instalar os pacotes, é necessário realizar a instalação de alguns pacotes mais básicos e configurá-los.

### 1.1. Pacotes Básicos ###
Primeiro, é necessário instalar alguns pacotes importantes.

São eles:
- [Vim](https://wiki.archlinux.org/title/vim): para editar os arquivos de configuração;
- [Git](https://wiki.archlinux.org/title/git) para baixar programas e pacotes;
- [neofetch](https://linuxnightly.com/neofetch-command-in-linux/): para mostrar alguns dados do sistema;
```shell
pacman -S vim git neofetch
```

### 1.2. Configurando o Pacman ###
Agora que já podemos editar arquivos com Vim, é necessário adicionar uma configuração ***`importantíssima`*** no arquivo de configuração do [`pacman`](https://wiki.archlinux.org/title/pacman).

Acesse o arquivo usando o comando abaixo e adicione `ILoveCandy` no tópico `Misc options`:
```shell
vim /etc/pacman.conf
```

### 1.3. Baixando o Repositório ###
Diversos arquivos de configuração serão alterados. Todos eles estão na pasta `dotfiles` deste repositório. Então, a próxima etapa é cloná-lo para sua nova instalação. Para isso, execute o comando abaixo:
```shell
git clone https://github.com/gutohertzog/arch-hyprland
```

Isso deve criar uma pasta chamada `arch-hyprland` no seu diretório raiz do usuário (`~`).

### 1.4. Configurando a Fonte ###
Para diversos programas e ferramentas, será usada uma fonte baixada da internet. A fonte usada será a CaskaydiaCove Nerd Font, uma variação da Cascadia Code da Microsoft, mas com suporte a ícones. Ela está disponível para ser baixada no site [Nerd Fonts](https://www.nerdfonts.com) e também no [GitHub](https://github.com/ryanoasis/nerd-fonts/releases/).

Para deixar este repositório mais leve, a fonte será baixada do GitHub durante a instalação. Para isso, é necessário instalar o pacote [curl](https://wiki.archlinux.org/title/CURL).
```shell
pacman -S curl
```

Depois de instalado, baixe a fonte usando o comando:
```shell
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/CascadiaCode.tar.xz
```

Antes de descompactar, é preciso criar as pastas onde a fonte será armazenada. A primeira pasta ficará dentro de `/urs/share/` com o nome de `fonts`. A segunda, ficará dentro de `/usr/share/fonts/` com o nome da própria fonte, que aqui se chamará `caskaydiacove-nerd-font`.
```shell
mkdir -p /usr/share/fonts/caskaydiacove-nerd-font/
```

Descompacte o arquivo `tar.xz` com o comando abaixo, para que todos os arquivos internos sejam copiados para a pasta criada anteriomente:
```shell
tar -xvf CascadiaCode.tar.xz -C /usr/share/fonts/caskaydiacove-nerd-font
```

Depois de descompactado, o arquivo `tar.xz` pode ser apagado:
```shell
rm CascadiaCode.tar.xz
```

`PS`.: Todos os programas que tiverem suas fontes alteradas serão marcados, para que possam ser alterados para outra fonte de preferência de quem estiver instalando.

### 1.5. Configurando o Bash ###
O [bash](https://wiki.archlinux.org/title/bash) é um shell de linha de comando. Ele pode ser configurado através do arquivo `.bashrc`, normalmente localizado no diretório raiz do usuário (o `~`).

Para configurá-lo, copie o arquivo `.bashrc` do repositório para o `~`. Ele está com uma personalização para o shell e também alguns comandos de atalhos.
```shell
cp ~/arch-hyprland/dotfiles/.bashrc ~/
```

Se quiser inspecioná-lo e ver os atalhos, basta abrir com o Vim e buscar por `alias`.

Após copiado, recarregue o bash usando o comando source:
```shell
source .bashrc
```

### 1.6. Configurando o Vim ###
O [Vim](https://www.freecodecamp.org/news/vim-beginners-guide/) será o programa usado para realizar as edições necessárias nos arquivos.

Na pasta `arch-hyprland/dotfiles/` há um arquivo `.vimrc` e uma pasta `.vim` e eles já estão configurados. Para usá-los, basta copiá-los para a pasta raiz do usuário.
```shell
cp -r ~/arch-hyprland/dotfiles/.vim ~/
cp ~/arch-hyprland/dotfiles/.vimrc ~/
```

Isso irá copiar o arquivo `.vimrc` e a pasta `.vim` para a pasta raiz do usuário. Ambos são usados para configurar e deixar o Vim com um visual mais amigável. Após a cópia, execute o Vim (não se preocupe com as mensagens de erro, elas irão desaparecer na próxima execução) e usando o modo de comando, execute o comando `:PlugInstall`. Isso instalará todos os plugins configurados no arquivo `~/.vim/plugins.vim`. Na próxima execução, ele estará com seus plugins funcionais e sem erros.

Se quiser alterar a fonte do Vim, altere a variável `guifont` no arquivo `~/.vim/options.vim`.

`PS`.: mesmo que o visual do bash ou do Vim esteja entranhos, eles ficarão melhores quando usar o emulador de terminal Kitty.

- - - -
## 2. Hyprland e Kitty ##
Agora que todos os pacotes básicos já estão configurados, já podemos instalar o Hyprland e o Kitty.

### 2.1. Instalando ###
Por padrão, o [Hyprland](https://hyprland.org/) vem configurado para uso do terminal [kitty](https://sw.kovidgoyal.net/kitty/). Então, ambos serão instalados ao mesmo tempo.

Use o comando abaixo para instalar ambos:
```shell
pacman -S kitty hyprland
```

### 2.2. Configurando ###
Agora que ambos já estão instalados, é necessário copiar os arquivos de configuração deles.

Se buscar com o comando `ls -la`, verá que há uma nova pasta na raiz do seu usuário chamada `.config`. Ela será responsável por guardar quase todos arquivos de configuração para seu usuário.

Então, agora é necessário copiar os arquivos de configuração do Hyprland e do Kitty do repositório para essa pasta.
```shell
cp ~/arch-hyprland/dotfiles/.config/hypr ~/.config/
cp ~/arch-hyprland/dotfiles/.config/kitty ~/.config/
```

#### 2.2.1. kitty.conf ####
Como o arquivo `kitty.conf` é muito extenso, todas as configurações personalizadas dele estão agrupadas no começo do arquivo, no bloco `Configurações Personalizadas`. Dessa forma, não é necessário ficar navegando pelas categorias do arquivo em busca de uma configuração específica, e, ao mesmo tempo, deixa o restante como fonte de documentação e consulta de todas suas funcionalidades.

#### 2.2.2. hyprland.conf ####
Toda a configuração do `Hyprland` está presente na pasta `.config/hypr/`. Dentro dela, há dois arquivos:
* `hyprland.conf`: arquivo principal de configuração;
* `shortcuts.conf`: arquivo chamado pelo principal com todos os atalhos do `Hyprland`;

No arquivo `hyprland.conf` tem algumas alterações. Tais como:
- auto inicialização do terminal Kitty quando o Hyprland é inicializado;
- remapear o Ctrl para o Caps Lock;
- adicionado dois layouts para o teclado, ambos `us`, com as variações com e sem dead keys;
- alterado a taxa de repetição das teclas (`repeat_rate`) e atraso para repetição (`repeat_delay`);
- alterado os espaçamentos dos aplicativos (`gaps_in` e `gaps_out`);

Todas as teclas de atalhos usando a tecla `SUPER` estão no arquivo `shortcuts.conf`. Se inspecionar, verá todos as teclas de atalhos configuradas. Ele está comentado para facilitar o entendimento.

### 2.3. Executando ###
Agora já é possível executar o Hyprland. Para isso, execute o comando no shell:
```shell
Hyprland
```

Se os arquivos de configuração foram copiados corretamente, assim que a interface do `Hyprland` for executada, automaticamente inicializará uma janela do `Kitty`.

Parabéns. Já tens o básico funcional. A partir de agora, todos os próximos comandos e configurações serão feitas a partir da interface do `Hyprland` e o terminal `Kitty`.


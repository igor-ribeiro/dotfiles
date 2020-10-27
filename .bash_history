yarn ts-check
ga .
gc --amend
ggp
gco DEV-3930
gl
git stash pop
gst
ggp
gm origin/develop
yarn ts-check
gst
ggp
gco develop
ggl
yarn storybook
yarn ts-check
yarn
yarn test
container prime
st
gst
yarn ts-check
gst
gl
gc --amend
gst
ggp
gco DEV-3928
container prime
yarn storybook
exit
gco develop
ggl
chrome
tmux
tmux-start bbrands
container prime
exit
ggp
gst
ga .
gc --amend
ggpf
gco -b feat-button
dcu
container prime
yarn storybook
container prime
exit
chrome
tmus
tmux
tmux-start bbrands
ntr
curl http://gandalf.staging.bbrands.com.br/user/find
curl --help
curl -d 'token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTcsImVtYWlsIjoiaWdvcnJAYmJyYW5kcy5jb20uYnIiLCJpYXQiOjE1OTkyODk5MzgsImV4cCI6MTYwMDU4NTkzOH0.phyG381f-yNMUG8LGNVmiL11oxNKKkaqaUBOIPWoWPI' http://gandalf.staging.bbrands.com.br/user/find
curl -d '{"token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTcsImVtYWlsIjoiaWdvcnJAYmJyYW5kcy5jb20uYnIiLCJpYXQiOjE1OTkyODk5MzgsImV4cCI6MTYwMDU4NTkzOH0.phyG381f-yNMUG8LGNVmiL11oxNKKkaqaUBOIPWoWPI"}'  -H 'Content-Type: application/json' http://gandalf.staging.bbrands.com.br/user/find
gst
gd
gst
ga .
gc -m 'Endpoint para retornar usuario por token'
ggl
ggp
postman
dcu
gst
ga .
gc -m 'Retornar usuario no endpoint de login'
ggp
gco develop
ggl
dcu
dcd
dcu
dcd
dcu
gco -b DEV-3927
yarn storybook
yarn ts-check
gl
gc --amend
yarn test
yarn test:watch
yarn ts-check
gc --amend
ggp
gco develop
ggl
gco -
gm origin/develop
container prime
ga .
yarn ts-check
ga .
gc
gst
ga .
ggp
yarn ts-check
gst
ga .
gc --amend
ggpf
gst
ga .
gc --amend
ggp
ggpf
gl
contianer prime
container prime
postman
ga .
git stash save
gco develop
ggl
gst
gd
ga .
gc -m '(fix) Mostrar mensagem de sucesso'
ggp
gm origin/DEV-3913
gl
git fetch
gm origin/DEV-3913
gl
ggp
gco staging
ggl
gm origin/develop
ggp
git stash list
gco DEV-3927:
gco DEV-3927
git stash pop
tmux
chrome
tmux-start bbrands
container optimus
exit
dcu
dcd
ntr
yarn hot-reload:container
gcps
sudo rm -rf /tmp/bptp-varwwwhtml.sock
yarn hot-reload:container
git fetch
gco feature/lookandfeel
ggl
gco staging
gco feature/lookandfeel
dcu
dcu --force-recreate
dcu
dcd
dcu --build
dcu
gr .
gco staging
rm -rf node_modules/
dcu
container optimus 
gst
gr tsconfig.json 
exiyt
exit
dcu
yarn dev
dcu
dcd
dcu
sudo yarn dev
sudo node server.js 
npm rebuild
sudo node server.js 
sudo node NODE_ICU_DATA=node_modules/full-icu server.js 
yarn add full-icu
sudo node server.js 
npm rebuild
sudo node server.js 
dcu
dcd
gl
ggp
gst
gr .
rm .env.production 
container prime
gco develop
ggl
gco -
gm origin/develop
ggp
yarn ts-check
ga .
gc -m '(fix) Ajuste na tipagem'
ggp
gco develop
ggl
gst
ga .
ggp
gco staging
ggl
gm origin/develop
ggp
gco master
ggl
gm origin/staging
ggp
gst
dcu
exit
docker-compose logs -f
bb
cd stark
ntr
exit
vim
gst
ga .
gc -m '(fix) Ajuste para não dar erro quando o produto não tiver atributos'
ggp
vim
ggl
ggp
vim .
ggl
vim .
ggl
vim .
ggl
ggp
exit
vim
vim ../prime/.git
exit
gco staging
ggl
gst
gd
bb
cd lucius/
dcu
exit
bb
cd stark
dcu
exit
cd prime/
dcu
dcu -d
code .
gst
gco develop
ggl
gco -b DEV-3913-FIX
git cherry-pick
git cherry-pick fc4c70a45b4517e45ea12913f10cb5b5b412bde0
git cherry-pick c7cf954523475b38e8a424a649586d5efb58969c
gst
ga .
gc
git cherry-pick c7cf954523475b38e8a424a649586d5efb58969c
ggp
ssh -T git@github.com
gco develop
vim ../stark
exit
dcul
dc
docker-compose logs -f
dcd
dcu -d && docker-compose logs -f
dcd && dcu -d && docker-compose logs -f
dcu
yarn ts-check
--
yarn ts-check
gst
ggp
gco develop
gm origin/DEV-3852
gpg
ggp
gst
ga .
gc -m '(feat) Ajustes de layout'
ggp
gst
ga .
gc --amend
ggp
ggpf
gco staging
ggl
gm origin/develop
ggp
gst
ga .
gc -m '(feat) Ajuste no Footer'
ggp
dcd
ggl
gst
ga .
gc -m '(fix) Listar categorias pai na home'
ggp
gco staging
ggl
gm origin/develop
ggp
firebase login
npm install -g firebase-tools
npm rebuild
npm install -g firebase-tools
firebase login
firebase logout
firebase login
firebase init
exit
yarn build
ls -l
ls -l build/
exit
yarn start
yarn add clsx
yarn add firebase
yarn add react-input-mask
yarn deploy
dcu
yarn start
yarn deploy
git remote add origin git@github.com:igor-ribeiro/charreata.git
git branch -M master
ga .
gc -m 'create'
git push -u origin master
dcu
ggl
container lucius
code .
exit
gco develop
gm origin/staging
ggl
dcu
git merge --abort
gl
git reset HEAD~
git reset .
gst
git restore .
gl
ggl
gco -b DEV-3924
chrome
bb-vpen
bb-vpn
tmux
tmux-start bbrands
dcu
tmuz
tmux
tmux-start
tmux-start bbrands
dcu
ntr
gst
ggl
ggp
container stark
ntr
postman
gst
ga src/controllers/
gc -m '(feat) Retornar categorias no endpoint de produto'
ggp
ggl
gd
gr .
ggl
ggp
dcu
dcd
dcu
gr .
gst
dcu
gl
ggp
gst
container lucius
gst
ggpf
gr .
container lucius
ga .
gc -m 'yarn install'
ggp
gl
gco master
ggl
gco develop
ggl
container lucius
gst
ga .
gc
ggp
gco staging
gm origin/develop
git merge --abort
gst
ga .
gc -m 'add npm rebuild'
ggp
gl
ggl
gl
git cherry-pick 7fb11e6a752d6121f474bb5bbb77fdf14fe6c4f0
dcu
gst
gd
ggp
gco develop
ggl
gst
ga .
gc -m '(feat) Atualizar ProductCard'
ggp
gco develop
ggl
gco -b fps
gst
ga .
ggp
yarn ts-check
yarn test
gst
ga .
gc -m '(fix) Ajustes em testes e tipagem'
ggp
gl
dcu
gco release_candidate
git fetch
gst
gco release_candidate
ggl
dcu
dcd
dcu
tmux
tmux-start bbrands
dcd
yarn test
ggp
gst
ggp
gco -
dcu
chrome
dnf-update
chrome
bb
code prime
gsutil -h
gsutil --help
man gsutil
gsutil -m --help
bb
code prime
dnf-update
gco develop
ggl
gst
gco master
ggl
gst
gd
ga .
gc -m '(fix) Criar novo carrinho na lisatgem quando expirar'
ggp
gst
ggl
gco staging
ggl
gco master
ggl
gco develop
dcu
yarn cli config:generate
dcu
container prime
gco -b feature/snackbar-discount
gst
ggp
gl
gst
ga .
yarn test
gc -m '(fix) Ajuste no teste de `plural`'
ggp
gst
ga core/
gc -m '(fix) Typo "product" -> "produto"'
ggp
gco develop
ggl
gco -
gl
gco develop
ggl
gco -b feature/useImage
container prime
gst
ggp
container prime
gco develop
gst
ga .
gc -m '(fix) Remover espaçamento de texto em `Snackbar`'
ggp
ggl
ggp
ggl
gco staging
ggl
gco master
ggl
gs
ebash
sbash
ebash
sbash
gs 
gco -b feature/popup-discount
gco develop
gco -B feature/popup-discount
yarn ts-check
bb
code prime
consul
tmux
tmux-start bbrands
container prime
ggp
gco develop
gco -
gst
ga .
ggp
gco master
ggl
container prime
gst
ggl
ggp
xcopy ~/.ssh/config
node
container prime
gst
glg
ggl
ggp
gco staging
ggl
gl
gm origin/master
ggp
gco develop
ggl
gm origin/staging
ggp
gco feature/opt-in
gco -b feature/opt-in
gco master
gst
gd
ggl
ggp
containe rprime
container prime
git stash save
gco develop
ggl
git stash pop
container prime
gm --amend
gst
gc --amend
ggp
yarn analyze
container prime
xdg-open .next/analyze/client.html 
container prime
ggl
yarn hot-reload
dcu
yarn hot-reload:container
gcpprod
gcpp
yarn hot-reload:container
ntr
container optimus
ntr
ntr]
ntr
yarn hot-reload:container
gst
gd
ga .
ggl
gc
ga .
gc
ggp
ggl
gco master
ggl
gst
ga .
gst
ggp
yarn npm:publish
npm publish --help
npm publish -h
ggl
code .git
ggl
gl
gst
ga .
gc -m 'bump version'
ggp
yarn npm:publish
yarn
npm rebuild
yarn
yarn npm:publish
git branch
gco typeorm-latest
gco -
git fetch
git branch
gco v2
ggl
gst
ga .
ggp
yarn
yarn npm:publish
yarn
yarn npm:publish
rm -rf node_modules/
npm rebuild
yarn
yarn npm:publish
npm run npm:publish
which npm
npm run npm:publish
npm login
npm run npm:publish
gst
ga .
ggp
gco v3
gm origin/v2
gc
gta .
ga.
ga .
gc
ggp
ga .
g c-m 'bump to 3.0.12'
gc -m 'bump to 3.0.12'
ggp
yarn
npm run npm:publish
git reset HEAD~2
gst
ga .
ggpf
npm run npm:publish
ntr
gst
gl
ggp
ggl
gco master
ggl
gco staging
dcu
dcd
dcu
yarn test
gst
git branch
gco feature/error-handling
gco -b feature/error-handling
gsrt
gst
git stash save
git stash pop
ga .
git stash save
gco develop
ggl
gco master
ggl
gst
ggp
gco staging
ggl
gm origin/master
ggp
gco develop
ggl
gm origin/staging
ggp
gco feature/error-handling
git stash pop
code ../optimus
cat .git/config 
ontainer prime
container prime
gst
ga .
git stash save
gco master
ggl
gst
ga .
ggp
gco -
git stash pop
git stash save
git stash pop
ga .
git stash save
gco develop
ggl
container prime 
gst
gd
ggp
gco -
git stash pop
ga .
git stash save
gm origin/develop
git stash pop
container prime
gst
ga .
rm -rf .git/index.lock 
ga .
ggp
gst 
ga .
gc -m '(fix) Cleanup'
ggp
gst
ga core/externalLog.ts
gst
ga pages/_error.tsx
gst
ggp
gst
gd
container prime
gst
gd
gr .
gco develop
ggl
gco staging
ggl
gco master
ggl
gl
gco develop
ggl
gm origin/staging
gco feature/opt-in
gm origin/develop
gco master
gst
ga .
gc -m 'fix: Adicionar try/catch ao definir cookies'
ggp
gst
gd
gst
ggp
ggl
gco master
ggl
dcu
ggp
gco staging
ggl
tmux
tmux-start bbrands
gco develop
ggl
gco feature/opt-in
gm origin/develop
ggp
tmux
tmux-start bbrands
gco develop
gco -
dcu
bb
code prime
exit
exit
dcu
exit
gco develop
gco will-develop
ggl
container prime
yarn test:watch
gco -
gco feature/opt-in
dcu
tmux
tmux-start bbrand
tmux-start bbrands
gst
ggl
gst
gco staging
ggl
gst
ga src/
gst
gd
gds
gc -m 'Adicionar "json" como tipo de atributo'
gpg
ggp
ggl
gst
gd
gr .
ggl
yarn hot-reload:container
ntr
exit
dcu
exit
dcu
gst
ga .
git stash save
gco develop
ggl
ggp
gco -
git stash pop
gst
ggp
gst
container prime
ga .
gc --amend
ggpf
gco staging
ggl
container prime
ggp
container prime
ga .
gl
gc --amend
ggp
ggl
gl
git --abort
gm --abort
gr .
gst
git merge --abort
ggpf
ga .
gc --amend
ggpf
gco will-develop
ggl
gco staging
gl
ggl
ggp
ggl
ggp
container prime
ggp
container prime
gco develop
ggl
gm origin/staging
ggp
gco -b feature/tutorial
gco master
ggl
ggp
gco staging
gm origin/master
ggp
gco develop
ggl
gm origin/staging
ggp
git branch -D feature/tutorial
gco -b feature/product-videos
container prime
copy-ip
gst
ga .
ggp
gco develop
ggl
copy-ip
gst
ggp
gco staging
ggl
gm origin/develop
ggp
node
gco cybertron
git fetch
gco cybertron
ggl
container prime
git submodule init
gco develop
ggl
gco staging
ggl
gco develop
gm origin/staging
ggp
dcu
gcps
ntr
yarn hot-reload:container
ntr
yarn hot-reload:container
ntr
yarn hot-reload:container
ntr
yarn hot-reload:container
ls package
tree packages
container prime
yarnb
yarn
dcu
container prime
yarn workspace
yarn workspace --help
yarn -h
yarn workspaces
yarn workspaces info
git submodule update
container prime
yarn workspaces run build
ggl
gr .
ggl
gco staging
ggl
gr .
gst
git remove packages
git rm packages
gst
ad packages
gd packages
ga packages
git rm --cached packages/cybertron
git rm --cached packages/
gst
gco -
ls -l
rm -rf packages
gst
ggp
tmux
tmux-start bbrands

HOST=carolinavicente.busercamp.com.br

function devhelp() {
  echo "dkbuild     constroi a imagem docker"
  echo "dkrun     roda o projeto dockerizado"
  echo "deploy     dá deploy no projeto"
}

function dkbuild(){
  docker build -t carolinavicente .
}

function dkrun() {
  docker run -it -p 8000:8000 \
  -e DATABASE_FILE=/dkdata/db.sqlite3 \
  -e DJANGO_STATIC_ROOT=/dkdata/static \
  -v $(pwd)/dkdata:/dkdata \
  carolinavicente start.sh
}

function deploy() {
  rsync -av --exclude dkdata --exclude db.sqlite3 \
  ./* ubuntu@$HOST:./carolinavicente/
  ssh ubuntu@$HOST "cd carolinavicente && ./dkrunprod.sh"
}

devhelp
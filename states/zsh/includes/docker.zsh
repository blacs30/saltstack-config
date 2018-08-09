## Terraform
function tf7() {
  run_with_docker "hashicorp/terraform" "0.10.7" "terraform" $@
}

function tf() {
  run_with_docker "hashicorp/terraform" "latest" "terraform" $@
}

## Go
function go() {
  docker run --rm -u $UID -e GOPATH -v $GOPATH:/$GOPATH -v $PWD:$PWD -w $PWD -it golang:1.10 go $@
}

## PHP
function php() {
  run_with_docker "php" "7-cli" "php" $@
}

## JS/Node
function node() {
  run_with_docker "node" "latest" "node" $@
}

function hugo() {
  run_with_docker "publysher/hugo" "latest" "hugo" $@
}

## Markdown
function mdv() {
  docker run --rm -u $UID -v $PWD:/sandbox -w /sandbox -it rawkode/mdv:latest $@
}

## PlantUML
function plantuml() {
  cat $@ | docker run --rm -u $UID -i think/plantuml -tpng
}

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

curl -sfL https://get.k3s.io | K3S_URL=https://20.210.104.63:6443 K3S_TOKEN=K109b9a185de2fd096874f1d137980579324eb23a07b43095a187c2b75c8a59586e::server:697dc5f49fc8c9a64d6bbffad039165e sh -


server: https://20.210.104.63:6444
token: K109b9a185de2fd096874f1d137980579324eb23a07b43095a187c2b75c8a59586e::server:697dc5f49fc8c9a64d6bbffad039165e


  curl -sfL https://get.k3s.io | sh -s - server \
    --token "K109b9a185de2fd096874f1d137980579324eb23a07b43095a187c2b75c8a59586e::server:697dc5f49fc8c9a64d6bbffad039165e"

    curl -sfL https://get.k3s.io | K3S_URL=https://13.200.27.226:6443   K3S_TOKEN=K101ca54c991c623183bd741513b4627c347ed63a15ea6b4fd41aeab6a59c490cf8::server:7fbb8fdaee430bd238e27db4ad247c9c sh -


export K3S_URL=https://13.200.27.226:6443
export K3S_TOKEN=K101ca54c991c623183bd741513b4627c347ed63a15ea6b4fd41aeab6a59c490cf8::server:7fbb8fdaee430bd238e27db4ad247c9c
curl -sfL https://get.k3s.io | sh -
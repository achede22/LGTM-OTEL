
sudo apt update && sudo apt install -y curl apt-transport-https gnupg2 ca-certificates lsb-release unzip software-properties-common



#helm
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
sudo apt update
sudo apt install -y  helm

# kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" 
sudo chmod +x /usr/local/bin/kubectl

# Docker
# for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done
# Add Docker's official GPG key:
# sudo apt-get update
# sudo apt-get install ca-certificates curl gnupg
# sudo install -m 0755 -d /etc/apt/keyrings
# curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
# sudo chmod a+r /etc/apt/keyrings/docker.gpg
# sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
# # Add the repository to Apt sources:
# echo \
#   "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
#   "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
#   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# sudo apt-get update
# sudo usermod -aG docker $USER && newgrp docker


# minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube start --driver=docker
minikube kubectl -- get po -A


# aws-cli
# sudo apt install unzip -y
# curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
# unzip awscliv2.zip
# sudo ./aws/install


# git clone https://github.com/achede22/LGTM-OTEL.git
# cd LGTM-OTEL


# helm repo add bitnami https://charts.bitnami.com/bitnami
# helm install gfn oci://registry-1.docker.io/bitnamicharts/grafana
# helm install pmt oci://registry-1.docker.io/bitnamicharts/prometheus

# Add bitnami repo
helm repo add bitnami https://charts.bitnami.com/bitnami

# Install Grfana Tempo
helm install tmp oci://registry-1.docker.io/bitnamicharts/grafana-tempo

# Install Graafana Loki
helm install lk oci://registry-1.docker.io/bitnamicharts/grafana-loki



 # helm install sql oci://registry-1.docker.io/bitnamicharts/mysql --values mysql-values.yaml

    # User Permission: The database user should only be granted SELECT permissions on the specified database & tables you want to query. Grafana does not validate that queries are safe so queries can contain any SQL statement. For example, statements like USE otherdb; and DROP TABLE user; would be executed. To protect against this we Highly recommend you create a specific MySQL user with restricted permissions. Check out the MySQL Data Source Docs for more information.

helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts
kubectl apply -f my-otel-demo-values.yaml

helm install my-otel-demo open-telemetry/opentelemetry-demo \
sleep 200
kubectl --namespace default port-forward svc/my-otel-demo-frontendproxy 8080:8080


# ec2-52-41-105-216.us-west-2.compute.amazonaws.com


#=================== POD ===============# 

#create POD 
# every pod could have the same port 
kubectl run my-ninix --image=nginx --port=80 -labels="app-ninix"

kubectl run papa-apach --image=httpd --port=80 --labels="app-apach"

kubectl describe pod my-ninix

#============================================





# ======================= PORT =================== # 

kubectl port-forward papa-apach  8090:80

#=================================================






# ==================== SHELL ===================== # 

#connect distant shell 
kubectl exec -it my-ninix -- /bin/bash
# exit distant shell 
exit 

#=================================================




# ==================== NAMESPACE - CONTEXT ================ # 

# create namespace ( context + cluster > user)
kubectl config set-context cci --cluster=docker-desktop --user=docker-desktop --namespace=cci-names

#user context 
kubectl config use-context cci

# get config 
kubectl config view

# List pod from specific namespace 
kubectl describe pods cci-names

# get context names 
kubectl config get-contexts

#=================================================







# ================== INFO ================== # 

# list pods 
kubectl get pods --all-namespaces
kubectl get pods -A 

# get system 
kubectl get pods -n kube-system

# List pods filter by name
kubectl get pods -n default

# get pods and label 
kubectl get pods --show-labels

# get logs history 
kubectl logs my-ninix

#=================================================






# ================== YAML =================== # 

# Apply YAML file 
kubectl apply -f apache.yaml

# Delete YAML file 
kubectl delete -f apache.yaml

#=================================================






# =============== CURL ============== # 

# TEST POD > CURL 
kubectl run mycurlpod --image=curlimages/curl -i --tty -- sh

# CURL CMD 
curl http://10.97.17.13:8080

#=================================================






# =============== CONFIG - MAP - SECRET ============== # 

# Creat config map from file 
kubectl create configmap monsite --from-file=<path-to-file-or-directory>

# ADD multiple data in config map 
kubectl create configmap special-config --from-literal=special.how=very --from-literal=special.type=charm

# CREAT config map from row data 
kubectl create configmap <configmap-name> --from-literal=<key1>=<value1> --from-
literal=<key2>=<value2> 

# edit config map a la main 
kubectl edit configmap <votre_configmap> 

# Mise à jour 
kubectl create configmap <configmap name> --from-file 
<file/directory> -o yaml --dry-run=client | kubectl apply -f - 

# CEATE secret 
kubectl create secret generic mes-acces --from-literal=username=cheliel --from-literal=password=toto

#=================================================



# =============== Deployement ============== # 


kubectl rollout status deploy

#=================================================


# =============== Helm ============== # 


kubectl version

#add repository 
helm repo add bitnami https://charts.bitnami.com/bitnami

#install chart
helm install my-odoo bitnami/odoo --version 25.2.1 --set odooEmail=etienne.pernon@gmail.com --set odooPassword=toto --set postgresql.auth.password=toto

#unstall chart 
helm uninstall my-odoo

#remove depo 
helm repo remove bitnami


## PACKING CREATION 

helm create cheliel-chart

helm lint . 

helm package cheliel-chart 

#=================================================





# =============== ingress ============== # 


# Install ingress on cluster 
helm repo add nginx https://helm.nginx.com/stable

helm install my-nginx-ingress nginx/nginx-ingress --version 1.1.0



#=================================================



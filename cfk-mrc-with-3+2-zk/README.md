This example configures a 3 broker kafka in HK, with 3 ZooKeeper in HK, 2 ZK in Singapore. Enjoy

# Step 1
Create your cluster in GKE

Create namespace confluent-hk in HK cluster, confluent-sg in SG cluster.

```bash
# Create NS in HK
$ kubectl create ns/confluent-hk

# Create NS in SG
$ kubectl create ns/confluent-sg
```
# Step 2
Test your firewall, make sure the node private IPs are routed according to https://github.com/confluentinc/confluent-kubernetes-examples/blob/master/hybrid/early-access-multi-region-clusters/networking/networking-GKE-README.md

# Step 3
Create the DNS proxy

```bash
# Run in HK cluster
$ kubectl apply -f dns-lb-hk.yml
# Run in SG cluster
$ kubectl apply -f dns-lb-sg.yml
```

# Step 4

Create DNS resolution map

```bash

# Run in HK cluster
$ kubectl apply -f dns-configmap-hk.yml

# Run in SG cluster
$ kubectl apply -f dns-configmap-sg.yml

```

# Step 5
Apply the hk.yml and sg.yml in HK & SG

```bash
# Run in HK cluster
$ kubectl apply -f hk.yml -n confluent-hk

# Run in SG cluster
$ kubectl apply -f sg.yml -n confluent-sg

```


# Step 6
Verify if your cluster is running, with zookeeper spans across multiple GKE cluster

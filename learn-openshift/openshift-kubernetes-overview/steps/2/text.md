Like any complex system, a Kubernetes cluster can be viewed from multiple perspectives. From the infrastructure perspective, it comprises two sets of nodes; they can be bare-metal servers as well as VMs:

**Masters:**
This type of node is responsible for cluster management, network allocation, quota enforcement, synchronization, and communication. Master nodes act as the main point of contact for clients—be it actual people or some external system. In the simplest setup, there can be only one master, but highly available clusters require at least two to prevent common fail situations. The most important service that masters run is the API.

**Nodes:**
Nodes do the actual work of hosting Docker containers. More specifically, nodes provide a runtime environment for running pods, which are described later in this book. These servers run the kubelet service to manage pods:



From a service point of view, Kubernetes can be represented as a set of interacting services:

These services typically run on masters:
- **etcd:** This is a distributed key-value configuration store that holds all metadata and  cluster resources. Due to its quorum model, you are advised to run an uneven number of etcd nodes, starting from three in a highly available setup.
- **kube-apiserver:** Service that exposes the Kubernetes API to clients. Its stateless nature enables it to be deployed in a highly available configuration by scaling horizontally.
- **kube-scheduler:** Component that governs the placement of newly created pods on nodes. This procedure takes into account such factors as hardware/policy limitations, data locality, and affinity rules. It is worth noting that from the cluster point of view, masters are no different from any other node and thus can be eligible for running pods, although best practices suggest not putting additional strain on master nodes and dedicating them only to management functions.
- **kube-controller-manager:** The component that runs various controllers—some of them are replication controllers that maintain the required number of running pods node controllers for discovering nodes that went down, a volume controller for binding PVs to PVCs, and an endpoints controller that binds services and pods together.
- **cloud-controller-manager:** Service that provides integration with underlying cloud providers, such as DigitalOcean and Oracle Cloud Infrastructure.
These services typically run on nodes:
- **kubelet:** This service uses a pod specification to manage its pods and conduct periodic health checks.
- **kubeproxy:** This component implements service abstraction by providing TCP and UDP forwarding capabilities across a set of backend pods.
- **Container runtime environment:** This component is represented in Kubernetes by an underlying container technology. At the time of writing, Kubernetes supports docker and rkt as runtimes.

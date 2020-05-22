Action:  Kubectl Logs
	
	75	kubectl-tmux-logs	A kubectl plugin to display container logs within separate tmux panes	Logging
	76	kubectl-clogs	kubectl plugin to follow logs of multiple running pods	Logging
	77	kubectl-mtail	Kubectl helper to get logs from multiple pods	Logging
	
	From <https://awesomeopensource.com/project/ishantanu/awesome-kubectl-plugins> 
	
	https://github.com/johanhaleby/kubetail
	
	Add Katacode on Stern logging
		Stern tails multiple pods on Kubernetes and multiple containers within the pod. Each result color coded for quicker debugging.
		
		https://github.com/wercker/stern
		
		Brew install stern
		https://theiconic.tech/tail-logs-from-multiple-kubernetes-pods-the-easy-way-71401b84d7f
		
		wget https://github.com/wercker/stern/releases/download/1.11.0/stern_linux_amd64
		chmod +x stern_linux_amd64
		mv stern_linux_amd64 /usr/local/bin/stern
		stern --version
	
		https://www.techcrumble.net/2019/11/stern-aggregated-multiple-log-tailing-tool-for-kubernetes/
https://kubernetes.io/blog/2016/10/tail-kubernetes-with-stern/z`
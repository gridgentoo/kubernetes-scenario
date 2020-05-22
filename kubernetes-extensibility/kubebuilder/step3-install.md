Install the [release of Kubebuilder](https://github.com/kubernetes-sigs/kubebuilder/releases) that was tested with this scenario. This installation follows the [quickstart](https://book.kubebuilder.io/quick-start.html) recommendation found in the Kubebuilder book.

```bash
version=2.3.0
os=$(go env GOOS)
arch=$(go env GOARCH)

# Download Kubebuilder and extract it to tmp
curl -L https://go.kubebuilder.io/dl/${version}/${os}/${arch} | tar -xz -C /tmp/

# Move to a long-term location and put it on your path
# (you'll need to set the KUBEBUILDER_ASSETS env var if you put it somewhere else)
sudo mv /tmp/kubebuilder_${version}_${os}_${arch} /usr/local/kubebuilder
export PATH=$PATH:/usr/local/kubebuilder/bin
```{{execute}}

Verify the installation is complete.

`kubebuilder version`{{execute}}

# Conclusion #

You now have a better understanding of how to write an Operator using the Kubebuilder. The real goal of this scenario is to show you the power of extending Kubernetes with your a custom resources and coding controllers that are dedicated to observing and managing your custom resources.

There are some other competing Operator frameworks such as the Operator-SDK, Metacontroller and **KUDO**. KUDO, governed by D2IQ, may be an easier way to write an Operator as it embraces a declarative form over an imperative Go-based controller. In this Katacoda course head over to the scenario for learning KUDO and hopefully you will see why it was created to make writing Operators even easier.

## Lessons Learned ##

With these steps you have learned:

- &#x2714; how to modify, build and test code in a Kubebuilder skeleton project,
- &#x2714; how to create a CRD through Go structs and, automation,
- &#x2714; how to define RBACs created through generation from code annotations,
- &#x2714; how to create a controller for observing and managing the _at_ custom resources,
- &#x2714; how to associate Kubernetes events back to the managed resources.

## Special Thank You

To [**Ken Sipe**](https://www.linkedin.com/in/kensipe/) as he inspired this scenario from [his labs found here](https://github.com/kensipe/k8s-ext-workshop).

## References ##

- [Article: Kubebuild origin](
https://kubernetes.io/blog/2018/08/10/introducing-kubebuilder-an-sdk-for-building-kubernetes-apis-using-crds/)
- [Operator Pattern](https://kubernetes.io/docs/concepts/extend-kubernetes/operator/)
- [Custom Resource Definitions (CRDs)](https://kubernetes.io/docs/tasks/access-kubernetes-api/extend-api-custom-resource-definitions)
- [The Kubebuilder book](https://book.kubebuilder.io/)
- [cnat](https://github.com/programming-kubernetes/cnat)
- [Kuberbuilder with cnat, deprecated](https://github.com/programming-kubernetes/cnat/tree/master/cnat-kubebuilder)
- [client-go](https://github.com/kubernetes/client-go)

------
<p style="text-align: center; padding: 1em; margin: 3em; margin-left: 10em; margin-right: 10em; border-; 1px; border-color: olive;  border-radius: 12px; border-style:outset">
<img align="left" src="./assets/jonathan-johnson.jpg" width="100" style="border-radius: 12px">
For a deeper understanding of these topics and more join <br>[Jonathan Johnson](http://www.dijure.com)<br> at various conferences, symposiums, workshops, and meetups.
<br><br>
<b>Software Architectures ★ Speaker ★ Workshop Hosting ★ Kubernetes & Java Specialist</b>
</p>

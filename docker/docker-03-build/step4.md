## Useful public services

Docker was born in the era of opensource projects. It's very simple to set up CD (Continuous Delivery) for your Dockerized private project by means of *[Docker Cloud](https://cloud.docker.com)*. Automated builds can (with some configuration) be triggered by a `git push` to *GitHub*, and your latest image will be available on *Docker Hub* at once.

> Docker Cloud provides a hosted registry service with build and testing facilities for Dockerized application images; tools to help you set up and manage host infrastructure; and application lifecycle features to automate deploying (and redeploying) services created from images.

[Learn more about automated builds on *Docker Cloud*](https://docs.docker.com/docker-cloud/builds)

## Image versioning (tags)

By convention, images usually has a `latest` tag which points to the latest stable release, as well as an `edge` or `developing` etc. pointing to the latest not-so-stable build.

An image can have multiple tags, but a tag can be made on one revision of the image only. When a tag is used on a later revision of the image, it is removed from the older version.

Take the [official *Ubuntu* images](https://store.docker.com/images/ubuntu) as an example, the following tags are available (captured on 4/4/2018):

* `14.04`, `trusty-20180302`, `trusty`
* `16.04`, `xenial-20180228`, `xenial`, `latest`
* `17.10`, `artful-20180227`, `artful`, `rolling`
* `18.04`, `bionic-20180224`, `bionic`, `devel`

All tags on the same row points to the same revision of image.

In this versioning scheme, when `18.04` is officially released later this month, the `latest` tag will be removed from the `16.04` image, and put on `18.04`. And, when `17.10` image has an update, the image tagged as `artful-20180227` will become an archive, while all `17.10`, `artful` and `rolling` will move to the newer image.

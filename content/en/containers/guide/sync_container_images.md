---
title: Synchronize Datadog's images with a private registry
kind: guide
aliases:
 - /agent/guide/sync_container_images
---

Datadog publishes container images in multiple public container registries. The full list of images and their corresponding registries is available in the [Datadog documentation][1].
While this is convenient for many users, some organizations may want to use a private container registry. This guide explains how to synchronize Datadog's container images to a private registry.

Once you've synchronized the images, you can use the previous guide to [change the container registry][1] used by your environment.

## Using Crane

[Crane][2] is a tool made by Google to manage container images and registries and can be used to synchronize images between different container registries.
For more information about Crane, see the [Crane documentation][3].

### Install Crane

For detailed instructions on how to install Crane, see the [Crane README.md][2].
If using macOS, you can install Crane using Homebrew:

```shell
brew install crane
```

### Copy an image to another registry using Crane

Crane is able to copy images between different container registries, while also preserving the image's digest.
This means that the copy will keep the same manifest and will work with multi-platform images.

To copy an image from one registry to another, use the `crane copy` command.

Replace `SOURCE_IMAGE` with the image you want to copy and `DEST_IMAGE` with the destination image.
```shell
crane copy REGISTRY/SOURCE_IMAGE:IMAGE_TAG REGISTRY/DEST_IMAGE:IMAGE_TAG
```

You can use the `-n` flag to avoid overwriting an existing tag in the destination registry.

[1]: https://docs.datadoghq.com/containers/guide/changing_container_registry/
[2]: https://github.com/google/go-containerregistry/tree/main/cmd/crane
[3]: https://github.com/google/go-containerregistry/blob/main/cmd/crane/doc/crane.md

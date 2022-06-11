# beam-images
Images for running Pangeo Forge Recipes as Apache Beam Pipelines.

Build an image for a new `pangeo-forge-recipes` release:

1. Add a requirements file in the `./requirements/` directory. The filename should be formatted as `./requirements/${VERSION}.txt` where `VERSION` is the `pangeo-forge-recipes` release version exactly as it appears on PyPI.
2. From the root of this repo, run
    ```
    make build version=$VERSION
    ```

Push the built image with

```
make push version=$VERSION
```

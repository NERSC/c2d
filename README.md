To build (and tag) the image:

`docker build . -t c2d`

To run the image and start a local JupyterLab instance:

`docker run --rm -it c2d:latest -p 8888`

This will start a JupyterLab server in the container. In the terminal, the
LabApp will display a message like

```
    To access the notebook, open this file in a browser:
        file:///root/.local/share/jupyter/runtime/nbserver-6-open.html
    Or copy and paste one of these URLs:
        http://(<CONTAINER ID> or 127.0.0.1):8888/?token=<token hash>
```

Point your browser of choice to the URL to work with the notebook in the
container's JupyterLab instance.

To copy the notebook out of the container:

`docker cp <CONTAINER ID>:/srv/<notebook file> .`


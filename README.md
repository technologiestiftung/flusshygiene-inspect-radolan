# Inspect Radolan binary files with wradlib

This is a setup to inspect Radolan binary files using the [Python wradlib library](https://docs.wradlib.org/en/stable/index.html)

# Usage

```bash
git clone repo
cd repo
docker-compose up 
# in another shell session
docker exec -it wradlib-radolan-test  /bin/bash
source activate wradlib
cd /root/src
python inspector.py
# will output a geotiff.tif file to the folder out
```

The folders 

`./src`, `./data` and `./out` are mapped from the container to the local fs



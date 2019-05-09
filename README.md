# Inspect Radolan binary files with wradlib

This is a setup to inspect Radolan binary files using the [Python wradlib library](https://docs.wradlib.org/en/stable/index.html) and totally based on [their docker setup](https://github.com/wradlib/wradlib-docker).  


# Usage

```bash
git clone git@github.com:technologiestiftung/flusshygiene-inspect-radolan.git
cd flusshygiene-inspect-radolan
docker-compose up
# might take a while
```

Now in another session:  

```bash
in another shell session
docker exec -it wradlib-radolan-test  /bin/bash
source activate wradlib
cd /root/src
python inspector.py
# will output a geotiff.tif file to the folder out
```

The folders 

`./src`, `./data` and `./out` are mapped from the container to the local filesystem.

## License

Dockerfile based on wradlib Dockerfile which is also MIT licensed

MIT License

Copyright (c) 2017 wradlib developers

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

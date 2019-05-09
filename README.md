# Inspect Radolan binary files with wradlib

This is a setup to inspect Radolan binary files using the [Python wradlib library](https://docs.wradlib.org/en/stable/index.html) and totally based on [their docker setup](https://github.com/wradlib/wradlib-docker).  

## Usage

Basic instructions how to run this.  


```bash
git clone git@github.com:technologiestiftung/flusshygiene-inspect-radolan.git
cd flusshygiene-inspect-radolan
docker-compose up
# might take a while
```

Now in another session:  

```bash
$ docker exec -it wradlib-radolan-test  /bin/bash
$ source activate wradlib
$ cd /root/src
$ python inspector.py
> /opt/conda/envs/wradlib/lib/python3.7/site-packages/wradlib/io/xarray.py:951: DeprecationWarning: Using or importing the ABCs from 'collections' instead of from 'collections.abc' is deprecated, and in 3.8 it will stop working
>   class XRadVol(collections.MutableMapping):
> RX Attributes:
> producttype: SF
> datetime: 2006-10-30 18:50:00
> radarid: 10000
> datasize: 1620000
> maxrange: 128 km
> radolanversion: 1.5.0.1
> precision: 0.1
> intervalseconds: 86400
> nrow: 900
> ncol: 900
> radarlocations: ['bln', 'drs', 'eis', 'emd', 'ess', 'fbg', 'fld', 'fra', 'ham', 'han', 'muc', 'neu', 'nhb', 'ros', 'tur', 'umd']
> radardays: ['bln 23', 'drs 23', 'eis 23', 'emd 23', 'ess 23', 'fbg 23', 'fld 23', 'fra 23', 'ham 23', 'han 23', 'muc 23', 'neu 23', 'nhb 23', 'ros 23', 'tur 23', 'umd 23']
> nodataflag: -9999
> secondary: []
> cluttermask: []
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

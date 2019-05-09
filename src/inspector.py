import wradlib as wrl
import matplotlib.pyplot as pl
import warnings
warnings.filterwarnings("ignore")
try:
    get_ipython().magic("matplotlib inline")
except:
    pl.ion()
import numpy as np

# load radolan files
rw_filename = wrl.util.get_wradlib_data_file("../data/raa01-sf_10000-0610300750-dwd---bin")
rwdata, rwattrs = wrl.io.read_radolan_composite(rw_filename)
# print the available attributes
# print("RW Attributes:", rwattrs)

# print the available attributes
print("RX Attributes:")
for key, value in rwattrs.items():
    print(key + ':', value)
print("----------------------------------------------------------------")

# This is the RADOLAN projection
proj_osr = wrl.georef.create_osr("dwd-radolan")

# Get projected RADOLAN coordinates for corner definition
xy_raw = wrl.georef.get_radolan_grid(900, 900)

data, xy = wrl.georef.set_raster_origin(rwdata, xy_raw, 'upper')
data = np.stack((data, data+100, data+1000))
ds = wrl.georef.create_raster_dataset(data, xy, projection=proj_osr)
wrl.io.write_raster_dataset("/root/out/geotiff.tif", ds, 'GTiff')
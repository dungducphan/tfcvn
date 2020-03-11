Training code:
```bash
scp -r dphan@novagpvm10.fnal.gov:/nova/ana/users/grohmc/NNTutorial .
```

Prepare training set (triming production files to minimal format needed for training)
```bash
python3 ws_sample.py h5data/ traindata/
```

Four new training data files appears in the `TrainingData/` folder. Check the file by open interactive Python session
```bash
python3
```

In the `python` terminal
```
import h5py # Import H5PY
f = h5py.File("fardet_genie_default_fluxswap_genierw_fhc_v08_1000_r00013906_s37_c000_R19-02-23-miniprod5.l_v1_20190701_171258_sim_addtrainingdatapixelmaps_TrainData.h5caf.h5", 'r') # Open a train data file
f.keys() # Check keys or top-level folders in the H5 file
f['PDG'] # Check content
f['PDG'] # Check content
```

Now we examine the `cvnmap`
```
a = f['cvnmap'][:] # Whole CVNMAP
b=a[0] # first event
b[b>0] # Show the hits (ADC value > 0)
```

See how to view EVD with pylab

Training
```bash
python3 train.py -c default.conf
```
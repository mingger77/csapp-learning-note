# DataLab

Here is the first lab of CSAPP and all resources come from the Seif-Study part of this URL [https://csapp.cs.cmu.edu/3e/labs.html](https://csapp.cs.cmu.edu/3e/labs.html) 

---

## Project Structure

```
datalab/
├── datalab-handout/          # Decompressed datalab folder, and edited by me
├── temp/                     # Store some temporary programs to do other job
├── datalab-handout.tar       # Original compressed file downloaded from official URL
└── README.md                 # The file
```

---

## Additional Issues

My datalab grade is **56 / 62** ，the reason of which is the runtine of function `floatPower2` exceeds 10 seconds，while concrete runtime is approximately between 11 to 12 seconds. So the function failed to pass the test script. However, the logic of the function `floatPower2` is correct. With command `./btest -f floatPower2 -T 60`, full score **4 / 4** will be gotten，because of the poor performance of virtual machine.


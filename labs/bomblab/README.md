# BombLab

Here is the second lab of CSAPP and all resources come from the Seif-Study part of this URL [https://csapp.cs.cmu.edu/3e/labs.html](https://csapp.cs.cmu.edu/3e/labs.html) 

---

## Project Structure

```
datalab/
├── bomb/                     # Decompressed bomblab folder, and edited by me
├── temp/                     # Store some temporary programs to do other job
├── bomb.tar                  # Original compressed file downloaded from official URL
└── README.md                 # The file
```

---

## Answer

1. Bomb lab for self learning has six phases. The answers of six phases are written in [answer.txt](.\bomb\answer.txt)

2. Phase_3 and phase_4 have more than one answer. But I don't verify correctness of all possible answers of phase_4. So, I only write one answer of phase_4.

3. I will write possible origin code of some functions in lab file `.\bomb\bomb.c`.

## Feelings

### Lab Self

The lab is proper. 

Phase_1 is the simplest. Finding the location of answer string and getting the string are only needed.

Phase_2 needs students to input six numbers and discover the relations among six numbers. The six numbers are a geometric sequence. It's harder than the phase_1.

Phase_3 is more difficult than phase_2. But phase_3 is not nuch easier than phase_4. They both have a switch_case structure.

Phase_5 needs students to input a six length string. Then, the string turns into another string according a specific rule and the string must be completely same as the key string.

Phase_6 is the most tough among the six phase. In the phase, you must make sure all of the six numbers you input are less than seven and not same as other numbers. Then the six number sequence turns into another sequence, and compare another six numbers you get from six structure from **node1** to **node6** according to the second sequence. Only when the preceding number is greater than the following number, students would pass.

### AI

I must admit that using AI in lab moderately needs to encourage. I ask llm for some gdb commands and thoughts.

## Addentional Issues

I don't thoroughly complete Unit 3. But undoubtedly, I only need to supplement some details.


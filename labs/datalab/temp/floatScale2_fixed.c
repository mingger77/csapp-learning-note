/*
 * floatScale2 - Return bit-level equivalent of expression 2*f for
 *   floating point argument f.
 *   Both the argument and result are passed as unsigned int's, but
 *   they are to be interpreted as the bit-level representation of
 *   single-precision floating point values.
 *   When argument is NaN, return argument
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 4
 */
unsigned floatScale2(unsigned uf) {
  unsigned s = uf >> 31;
  unsigned exp = (uf >> 23) & 0xff;
  unsigned temp = (0xff << 8) + 0xff;
  unsigned mask = (temp << 7) + 0x7f;
  unsigned frac = (uf & mask);
  unsigned doubled_uf = (s << 31) | ((exp + 1) << 23) | frac; /* 声明移到函数顶部 */
  if (exp == 0) {
    return (frac << 1) | (s << 31);
  }
  if (exp == 0xff) {
    return uf;
  }
  return doubled_uf;
}

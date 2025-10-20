#ifndef REGEXP_H_INCLUDED
#define REGEXP_H_INCLUDED

enum{
    Char,
    Match,
    Jmp,
    Split
};

struct Inst{
    int opcode;
    int c;
    Inst* x;
    Inst* y;
};

int recursive(Inst* pc, char* sp);

#endif // REGEXP_H_INCLUDED
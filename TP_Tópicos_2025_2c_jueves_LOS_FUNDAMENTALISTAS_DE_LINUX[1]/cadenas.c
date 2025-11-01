/**
 *  @ingroup ModuloCadenas
 *  @{
 */

#include "cadenas.h"

int toLower(int ch) { return ((ch >= 'A' && ch <= 'Z') ? ch + 32 : ch); }

int toUpper(int ch) { return ((ch >= 'a' && ch <= 'z') ? ch - 32 : ch); }

int isAlpha(int ch) {
  return (((ch >= 'A' && ch <= 'Z') || (ch >= 'a' && ch <= 'z')) ? 1 : 0);
}

int stringCmp(const char *dest, const char *src) {
  while (!(*dest - *src) && *dest && *src) {
    ++dest;
    ++src;
  }

  return (*dest - *src);
}

int stringNCmp(const char *dest, const char *src, int n) {
  while (!(*dest - *src) && *dest && *src && n) {
    ++dest;
    ++src;
    --n;
  }

  return (*dest - *src);
}

int stringCmpi(char *dest, char *src) {
  char *tmpD = dest;
  char *tmpS = src;

  while (!(toLower(*tmpD) - toLower(*tmpS) && *tmpD && *tmpS)) {
    tmpD++;
    tmpS++;
  }

  return (toLower(*tmpD) - toLower(*tmpS));
}

int stringNCmpi(char *dest, char *src, size_t n) {
  char *tmpD = dest;
  char *tmpS = src;

  while (!(tolower(*tmpD) - tolower(*tmpS)) && *tmpD && *tmpS && n) {
    tmpD++;
    tmpS++;
  }

  return (tolower(*tmpD) - tolower(*tmpS));
}

char *stringCopy(char *dest, const char *src) {
  register char *tmpD = dest;

  while (*src) {
    *tmpD++ = *src++;
  }

  *tmpD = '\0';

  return dest;
}

char *stringNCopy(char *dest, const char *src, int n) {
  register char *tmpD = dest;

  while (n-- > 0 && *src) {
    *tmpD++ = *src++;
  }

  *tmpD = '\0';

  return dest;
}

char *stringDup(char *str) {
  char *tmp = malloc(stringLenght(str));

  if (!tmp) {
    return NULL;
  }

  stringCopy(tmp, str);

  return tmp;
}

char *stringNDup(char *str, size_t n) {
  size_t len;
  char *tmp = NULL;

  if (n < 0) {
    return NULL;
  }

  len = stringLenght(str);

  if (len < n) {
    return NULL;
  }

  tmp = malloc((len - n));

  if (!tmp) {
    return NULL;
  }

  stringNCopy(tmp, str, n);

  return tmp;
}

char *stringCat(char *dest, char *src) {
  char *tmpD = dest + stringLenght(dest);
  char *tmpS = src;

  while (*tmpS) {
    *tmpD = *tmpS;
    tmpD++;
    tmpS++;
  }

  *tmpD = '\0';

  return dest;
}

char *stringNCat(char *dest, char *src, size_t n) {
  char *tmpD = dest + stringLenght(dest);
  char *tmpS = src;

  while (*tmpS && n) {
    *tmpD = *tmpS;
    tmpD++;
    tmpS++;
    n--;
  }

  *tmpD = '\0';

  return dest;
}

char *stringToUpper(char *str) {
  char *tmp = str;

  while (*tmp) {
    *tmp = toUpper(*tmp);
    tmp++;
  }

  return str;
}

char *stringToLower(char *str) {
  char *tmp = str;

  while (*tmp) {
    *tmp = toLower(*tmp);
    tmp++;
  }

  return str;
}

char *stringReverse(char *str) {
  char *i = str;
  char *j = str + stringLenght(str) - 1;
  char tmp;

  while (i <= j) {
    tmp = *i;
    *i = *j;
    *j = tmp;
    i++;
    j--;
  }

  return str;
}

char *stringRemove(char *str, int ch) {
  char *i = str;
  register int len = stringLenght(str);

  while (*i) {
    if (*i == ch) {
      memmove(i, i + 1, len - (i - str));
    }

    ++i;
  }

  return str;
}

char *stringReplace(char *str, int ori, int new) {
  char *i = str;

  while (*i) {
    if (*i == ori) {
      *i = new;
    }
    ++i;
  }

  return str;
}

char *stringChar(char *dest, int ch) {
  char *tmpD = dest;

  while (*tmpD) {
    if (*tmpD == ch) {
      return tmpD;
    }

    tmpD++;
  }

  return NULL;
}

char *stringRChar(char *dest, int ch) {
  char *ult = NULL;

  while (*dest) {
    if (*dest == ch)
      ult = dest;
    ++dest;
  }

  return ult;
}

/* dest = "1234ABCD" src = "ABCDEFGH" */
/* stringCSpan(dest, src) = 4 */
int stringCSpan(char *dest, char *src) {
  char *tmpD = dest;
  char *tmpS = src;
  register int sum = 0;

  while (*tmpD) {
    while (*tmpS != *tmpD && *tmpS) {
      ++tmpS;
    }

    if (*tmpS == *tmpD) {
      return sum;
    }

    ++sum;
    ++tmpD;
    tmpS = src;
  }

  return sum;
}

/* dest = "1234ABCD" src = "123456789" */
/* stringSpan(dest, src) = 4 */
int stringSpan(char *dest, char *src) {
  char *tmpD = dest;
  char *tmpS = src;
  int sum = 0;

  while (*tmpD) {
    while (*tmpS != *tmpD && *tmpS) {
      tmpS++;
    }

    if (!(*tmpS)) {
      return sum;
    }

    sum++;
    tmpD++;
    tmpS = src;
  }

  return sum;
}

char *stringPBreak(char *dest, char *src) {
  char *tmpD = dest;
  size_t len = stringLenght(dest);
  int cspan = stringCSpan(dest, src);

  if (cspan == len) {
    return NULL;
  } else {
    tmpD += cspan;
  }

  return tmpD;
}

char *stringSubstring(char *dest, char *src) {
  char *tmpD = dest;
  char *tmpS = src;
  char *tmpAux = dest;

  while (*tmpD) {

    while (*tmpAux == *tmpS && *tmpAux && *tmpS) {
      tmpAux++;
      tmpS++;
    }

    if (!(*tmpS)) {
      return tmpD;
    }

    tmpD++;
    tmpAux = tmpD;
    tmpS = src;
  }

  return NULL;
}

int stringLenght(const char *str) {
  register int len = 0;

  while (*str++) {
    ++len;
  }

  return len;
}

int memzero(void *ptr, size_t n) {
  char *tmp = ptr;

  while (n) {
    *tmp = 0;
    tmp++;
  }

  return 0;
}

int meminte(void *dest, void *src, void *tmp, size_t n) {
  memcpy(tmp, dest, n);
  memcpy(dest, src, n);
  memcpy(src, tmp, n);
  return EXITO;
}

char *scanString(char *str, size_t n) {
  if (n <= 0 || !str) {
    return NULL;
  }

  if (fgets(str, n, stdin) == NULL) {
    return NULL;
  }

  str[stringCSpan(str, "\n")] = '\0';

  return str;
}

void flushStdin(void) {
  int c;

  while ((c = getchar()) != '\n' && c != EOF)
    ;
}

void esperarInput(void) {
  printf("\nPresione Enter para continuar...");
  /*fflush(stdout);*/
  getchar();
}

/**  }@ */

# -*- coding: utf-8 -*-
import sys


def extract_body(s):
    # chop off beginning (here getting rid of \tableofcontents}
    assert s.count(r'\tableofcontents') == 1
    s = s.split(r'\tableofcontents')[1]
    # chop off very end
    assert s.count('\end{document}') == 1
    s = s.split('\end{document}')[0]
    return s


def other_changes(s):
    # s = s.replace("section{", "section*{")
    s = s.replace("£", "$\pounds$")
    return s


def main():
    input = sys.argv[1]
    output = sys.argv[2]
    content = open(input).read()
    result = extract_body(content)
    result = other_changes(result)
    open(output, 'w').write(result)


if __name__ == '__main__':
    main()

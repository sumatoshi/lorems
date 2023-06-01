import std/unittest
import std/strutils
import ./lorems

suite "lorems":
  test "loremIpsum() == loremWords(...)":
    check loremIpsum() == loremWords(wNum = 110, true)

  test "loremIpsum() == loremTexts(...)":
    check loremIpsum() == loremTexts(pNum = 1, true, lfmt = lfNone)

  test "loremIpsum() == loremLines(...)":
    check loremIpsum() == loremLines(pNum = 1, wNum = 110, true, lfNone)
    
  test "loremWords.len":
    check strutils.split(loremWords(500, true), ' ').len == 500

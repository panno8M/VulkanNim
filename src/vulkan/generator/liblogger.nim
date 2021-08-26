import logging
import sequtils
import strutils
import os
import times

type
  LoggingFailure* = object of CatchableError
  ColorCode* = enum
    None         = ""
    Black        = "\e[30m"
    Red          = "\e[31m"
    Green        = "\e[32m"
    Yellow       = "\e[33m"
    Blue         = "\e[34m"
    Magenta      = "\e[35m"
    Cyan         = "\e[36m"
    White        = "\e[37m"
    LightGray    = "\e[90m"
    LightRed     = "\e[91m"
    LightGreen   = "\e[92m"
    LightYellow  = "\e[93m"
    LightBlue    = "\e[94m"
    LightMagenta = "\e[95m"
    LightCyan    = "\e[96m"
    Clear        = "\e[m"
  Title* = distinct string
  ErrorCode* = enum
    ResourcesNotFound = "Not found the require following in the resources"
    UndefinedMacro = "Undefined macro is required"
const
  indentMarker* = ":::"
  unindentMarker* = ":"
  LevelNames*: array[Level, string] = [
    "DEBUG ", "DEBUG ", "INFO  ", "NOTICE", "WARN  ", "ERROR ", "FATAL ", "NONE  "
  ] ## Array of strings representing each logging level.
  LevelColors*: array[Level, ColorCode] = [
    Green, Green, LightGreen, Cyan, Yellow, Magenta, Red, None
  ] ## Array of strings representing each logging level

proc deco*(str: string; colorCode: ColorCode): string =
  $colorCode & str & $Clear
proc logMsg*(title: Title; msg: varargs[string, `$`]): string =
  let msg = msg.join
  if msg.len == 0:
    title.string
  else:
    title.string & "\n" & msg.join.deco(LightGray)

proc title*(str: string): Title = Title(str)
proc info*(title: Title; msg: varargs[string, `$`]) {.raises: [LoggingFailure].} =
  try: info title.logMsg(msg)
  except: raise LoggingFailure.newException(getCurrentExceptionMsg())
proc error*(title: Title; msg: varargs[string, `$`]) {.raises: [LoggingFailure].} =
  try: error title.logMsg(msg)
  except: raise LoggingFailure.newException(getCurrentExceptionMsg())
template errorWithException*(exception: typedesc; title: Title, msg: varargs[string, `$`]) =
  error(title, msg)
  raise newException(exception, title.logMsg(msg))


type MyLogger = ref object of Logger
  file*: File
  indentLv: Natural
proc newMyLogger*(file: File,
                  levelThreshold = lvlAll,
                  fmtStr = defaultFmtStr): MyLogger =
  new(result)
  result.file = file
  result.levelThreshold = levelThreshold
  result.fmtStr = fmtStr

template error*(errorCode: ErrorCode;  msg: varargs[string]) =
  error $errorCode & "\n" & msg.join.split("\n").mapIt(" |" & it).join("\n").deco(LightGray)


proc substituteLog(frmt: string, level: Level,
                    args: varargs[string, `$`]): string =
  var msgLen = 0
  for arg in args:
    msgLen += arg.len
  result = newStringOfCap(frmt.len + msgLen + 20)
  var i = 0
  while i < frmt.len:
    if frmt[i] != '$':
      result.add(frmt[i])
      inc(i)
    else:
      inc(i)
      var v = ""
      let app = when defined(js): "" else: getAppFilename()
      while i < frmt.len and frmt[i] in IdentChars:
        v.add(toLowerAscii(frmt[i]))
        inc(i)
      case v
      of "date": result.add(getDateStr())
      of "time": result.add(getClockStr())
      of "datetime": result.add(getDateStr() & "T" & getClockStr())
      of "app": result.add(app)
      of "appdir":
        when not defined(js): result.add(app.splitFile.dir)
      of "appname":
        when not defined(js): result.add(app.splitFile.name)
      of "levelid": result.add(LevelNames[level][0])
      of "levelname":
        result.add(LevelNames[level].deco(LevelColors[level]))
      else: discard
  for arg in args:
    result.add(arg)

method log*(logger: MyLogger, level: Level, args: varargs[string, `$`]) =
  if level >= logging.getLogFilter() and level >= logger.levelThreshold:
    var args = concat(@["  ".repeat(logger.indentLv)], @args)
    if args.len >= 2:
      if args[1].len >= indentMarker.len and args[1][0..<indentMarker.len] == indentMarker:
        if likely(logger.indentLv < Natural.high):
          inc logger.indentLv
      elif args[1].len >= unindentMarker.len and args[1][0..<unindentMarker.len] == unindentMarker:
        if likely(logger.indentLv > Natural.low):
          dec logger.indentLv
        if args[1..^1].mapIt(it.len).foldl(a+b) == unindentMarker.len:
          return
      else:
        args[0] &= ":"
    logger.file.writeLine(substituteLog(logger.fmtStr, level, args))
    if level in {lvlError, lvlFatal}: flushFile(logger.file)
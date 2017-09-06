" Vim syntax file
" Language: Python
" Mainainter: Jon Barenboim
" Updated: 2017-3-16
"
" Based on the python.vim syntax file included with vim
"    but with a few minor changes. Mainly:
" * highlight tuple, list, and dictionary wrappers as Special
" * highlight arithmetic/assignment operators as Operator
" * link logical operators (and, in, is, not, or) to Boolean
" * link builtins (True, bool, set, len, etc) to Keyword
" * highlight "magic methods" (__add__, __init__, etc) as
" * assume version >=7 and remove options

syntax clear

syn keyword pythonStatement	break continue del
syn keyword pythonStatement	except exec finally
syn keyword pythonStatement	pass print raise
syn keyword pythonStatement	return try with
syn keyword pythonStatement	global assert
syn keyword pythonStatement	lambda yield
syn keyword pythonStatement	def class nextgroup=pythonFunction,pythonMagicMethod skipwhite
syn match   pythonFunction	"[a-zA-Z_][a-zA-Z0-9_]*" contained
syn keyword pythonRepeat	for while
syn keyword pythonConditional	if elif else
syn keyword pythonLogicalOperator	and in is not or "\=\=" "\!" "\!="
syn keyword pythonArithmeticOperator "\=" "\+" "-" "/" "\*" "\*\*" "\+\=" "-\=" "/\=" "\*\=" "^\="
" AS will be a keyword in Python 3
syn keyword pythonPreCondit	import from as
syn match   pythonComment	"#.*$" contains=pythonTodo,@Spell
syn keyword pythonTodo		TODO FIXME XXX contained

syn keyword pythonMagicMethod __init__ __repr__ __str__ __bytes__ __format__
syn keyword pythonMagicMethod __iter__ __next__ __reverse__ 
syn keyword pythonMagicMethod __getattribute__ __getattr__ __setattr__ __delattr__ __dir__
syn keyword pythonMagicMethod __call__ __len__ __contains__
syn keyword pythonMagicMethod __getitem__ __setitem__ __delitem__ __missing__
syn keyword pythonMagicMethod __add__ __sub__ __mul__ __truediv__ __floordiv__ __mod__ __divmod__
syn keyword pythonMagicMethod __pow__ __lshift__ __rshift__ __and__ __xor__ __or__
syn keyword pythonMagicMethod __radd__ _rsub__ __rmul__ __rtruediv__ __rfloordiv__ __rmod__ __rdivmod__
syn keyword pythonMagicMethod __rpow__ __rlshift__ __rrshift__ __rand__ __ixor__ __ror__
syn keyword pythonMagicMethod __iadd__ __isub__ __imul__ __itruediv__ __ifloordiv__ __imod__
syn keyword pythonMagicMethod __ipow__ __ilshift__ __irshift__ __iand__ __ixor__ __ior__
syn keyword pythonMagicMethod __neg__ __pos__ __abs__ __invert__ __complex__ __int__
syn keyword pythonMagicMethod __float__ __round__ __ceil__ __floor__ __trunc__
syn keyword pythonMagicMethod __eq__ __ne__ __lt__ __le__ __gt__ __ge__ __bool__
syn keyword pythonMagicMethod __copy__ __deepcopy__ __getstate__ __reduce__
syn keyword pythonMagicMethod __reduce_ex__ __getnewargs__ __setstate__
syn keyword pythonMagicMethod __enter__ __exit__
syn keyword pythonMagicMethod __new__ __del__ __slots__ __has__ __dict__
syn keyword pythonMagicMethod __isinstancecheck__ __subclasscheck__ __subclasshook__
syn keyword pythonMagicMethod __oct__ __hex__ contained

syn keyword pythonListWrapper "\[" "\]"
syn keyword pythonDictWrapper "\{" "\}"
" Assume a tuple will always be preceeded by an arithmetic/assignment
" operator, whitespace, or another
syn region pythonTUppleWrapper matchgroup=Normal start="(" end=")" 



" Decorators (new in Python 2.4)
syn match   pythonDecorator	"@" display nextgroup=pythonFunction skipwhite

" strings
syn region pythonString		matchgroup=Normal start=+[uU]\='+ end=+'+ skip=+\\\\\|\\'+ contains=pythonEscape,@Spell
syn region pythonString		matchgroup=Normal start=+[uU]\="+ end=+"+ skip=+\\\\\|\\"+ contains=pythonEscape,@Spell
syn region pythonString		matchgroup=Normal start=+[uU]\="""+ end=+"""+ contains=pythonEscape,@Spell
syn region pythonString		matchgroup=Normal start=+[uU]\='''+ end=+'''+ contains=pythonEscape,@Spell
syn region pythonRawString	matchgroup=Normal start=+[uU]\=[rR]'+ end=+'+ skip=+\\\\\|\\'+ contains=@Spell
syn region pythonRawString	matchgroup=Normal start=+[uU]\=[rR]"+ end=+"+ skip=+\\\\\|\\"+ contains=@Spell
syn region pythonRawString	matchgroup=Normal start=+[uU]\=[rR]"""+ end=+"""+ contains=@Spell
syn region pythonRawString	matchgroup=Normal start=+[uU]\=[rR]'''+ end=+'''+ contains=@Spell
syn match  pythonEscape		+\\[abfnrtv'"\\]+ contained
syn match  pythonEscape		"\\\o\{1,3}" contained
syn match  pythonEscape		"\\x\x\{2}" contained
syn match  pythonEscape		"\(\\u\x\{4}\|\\U\x\{8}\)" contained
syn match  pythonEscape		"\\$"

if exists("python_highlight_all")
  let python_highlight_numbers = 1
  let python_highlight_builtins = 1
  let python_highlight_exceptions = 1
  let python_highlight_space_errors = 1
endif

if exists("python_highlight_numbers")
  " numbers (including longs and complex)
  syn match   pythonNumber	"\<0x\x\+[Ll]\=\>"
  syn match   pythonNumber	"\<\d\+[LljJ]\=\>"
  syn match   pythonNumber	"\.\d\+\([eE][+-]\=\d\+\)\=[jJ]\=\>"
  syn match   pythonNumber	"\<\d\+\.\([eE][+-]\=\d\+\)\=[jJ]\=\>"
  syn match   pythonNumber	"\<\d\+\.\d\+\([eE][+-]\=\d\+\)\=[jJ]\=\>"
endif

if exists("python_highlight_builtins")
  " builtin functions, types and objects, not really part of the syntax
  syn keyword pythonBuiltin	True False bool enumerate set frozenset help
  syn keyword pythonBuiltin	reversed sorted sum
  syn keyword pythonBuiltin	Ellipsis None NotImplemented __import__ abs
  syn keyword pythonBuiltin	apply buffer callable chr classmethod cmp
  syn keyword pythonBuiltin	coerce compile complex delattr dict dir divmod
  syn keyword pythonBuiltin	eval execfile file filter float getattr globals
  syn keyword pythonBuiltin	hasattr hash hex id input int intern isinstance
  syn keyword pythonBuiltin	issubclass iter len list locals long map max
  syn keyword pythonBuiltin	min object oct open ord pow property range
  syn keyword pythonBuiltin	raw_input reduce reload repr round setattr
  syn keyword pythonBuiltin	slice staticmethod str super tuple type unichr
  syn keyword pythonBuiltin	unicode vars xrange zip
endif

if exists("python_highlight_exceptions")
  " builtin exceptions and warnings
  syn keyword pythonException	ArithmeticError AssertionError AttributeError
  syn keyword pythonException	DeprecationWarning EOFError EnvironmentError
  syn keyword pythonException	Exception FloatingPointError IOError
  syn keyword pythonException	ImportError IndentationError IndexError
  syn keyword pythonException	KeyError KeyboardInterrupt LookupError
  syn keyword pythonException	MemoryError NameError NotImplementedError
  syn keyword pythonException	OSError OverflowError OverflowWarning
  syn keyword pythonException	ReferenceError RuntimeError RuntimeWarning
  syn keyword pythonException	StandardError StopIteration SyntaxError
  syn keyword pythonException	SyntaxWarning SystemError SystemExit TabError
  syn keyword pythonException	TypeError UnboundLocalError UnicodeError
  syn keyword pythonException	UnicodeEncodeError UnicodeDecodeError
  syn keyword pythonException	UnicodeTranslateError
  syn keyword pythonException	UserWarning ValueError Warning WindowsError
  syn keyword pythonException	ZeroDivisionError
endif

if exists("python_highlight_space_errors")
  " trailing whitespace
  syn match   pythonSpaceError   display excludenl "\S\s\+$"ms=s+1
  " mixed tabs and spaces
  syn match   pythonSpaceError   display " \+\t"
  syn match   pythonSpaceError   display "\t\+ "
endif

" This is fast but code inside triple quoted strings screws it up. It
" is impossible to fix because the only way to know if you are inside a
" triple quoted string is to start from the beginning of the file. If
" you have a fast machine you can try uncommenting the "sync minlines"
" and commenting out the rest.
syn sync match pythonSync grouphere NONE "):$"
syn sync maxlines=200
"syn sync minlines=2000

if version >= 508 || !exists("did_python_syn_inits")
  if version <= 508
    let did_python_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  " The default methods for highlighting.  Can be overridden later
  HiLink pythonStatement	Statement
  HiLink pythonFunction		Function
  HiLink pythonConditional	Conditional
  HiLink pythonRepeat		Repeat
  HiLink pythonString		String
  HiLink pythonRawString	String
  HiLink pythonEscape		Special
  HiLink pythonOperator		Operator
  HiLink pythonPreCondit	PreCondit
  HiLink pythonComment		Comment
  HiLink pythonTodo		Todo
  HiLink pythonDecorator	Define
  if exists("python_highlight_numbers")
    HiLink pythonNumber	Number
  endif
  if exists("python_highlight_builtins")
    HiLink pythonBuiltin	Function
  endif
  if exists("python_highlight_exceptions")
    HiLink pythonException	Exception
  endif
  if exists("python_highlight_space_errors")
    HiLink pythonSpaceError	Error
  endif

  delcommand HiLink
endif

let b:current_syntax = "python"

" vim: ts=8

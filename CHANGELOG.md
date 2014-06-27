Planned:
- Rework some snippets, like a single import without an alias
- Add support for all go tools like fix, vet, lint, oracle

###X.X.X / XXXX-XX-XX
- Rename "Compile" to "Build" to match go tool
- Simplify go fmt, make idiomatic
- Add go install

###2.1.1 / 2014-06-24
- [FIX: gofmt no longer supports -tabwidth or -tabs](https://github.com/syscrusher/golang.tmbundle/commit/122fb557211f3c0db5421cf1288f5b5ebd6bb338)

###2.1.0 / 2014-06-24
Merged improvements and fixes from around the community:

- [Add Printf and Println snippets, fix int and interface snippets - **jish**](https://github.com/syscrusher/golang.tmbundle/commit/837db2d67b3507ffcb26bb257fe965e2d2131460)
- [Ruby 1.8 shim for compatibility - **ifininight**](https://github.com/syscrusher/golang.tmbundle/pull/3)
- [Allow gocode paths with spaces - **tomaszj**](https://github.com/syscrusher/golang.tmbundle/commit/c338ac82cd977e4d3bd91f26da55a9c6e405fa9e)

###2.0.1 / 2012-10-22
Fixed code-completion with a single result: no longer puts single completions at end of file.

###2.0 / 2012-10-22
Merged in a whole lot of work from other folks, primarily bringing in full support for Go 1.0 and TextMate 2:

- [Support for Go version 1.0 - **sdefresne**](https://github.com/AlanQuatermain/go-tmbundle/commit/1f182d955b56f6ccb308c94f4b1e1463ae99a782)
- [Update documentation - **sdefresne**](https://github.com/AlanQuatermain/go-tmbundle/commit/a2297b561653a5cc2874c0ee106715795a92ad99)
- [Fix the mistake when call "go" CMD. - **liuyork**](https://github.com/AlanQuatermain/go-tmbundle/commit/abb8331d64817241a23b8668e2354e983d803c91)
- [Fix important typo - **AlekSi**](https://github.com/AlanQuatermain/go-tmbundle/commit/789bb3951f6e82241ff57cfb4877265191b0f081)
- [It's 'git clone' - **AlekSi**](https://github.com/AlanQuatermain/go-tmbundle/commit/7d7e399afecd114dfc39fe8f8bbc15c883db4c39)
- [Merge "Deferred Function Call" into "Deferred Call" - **mkhl**](https://github.com/AlanQuatermain/go-tmbundle/commit/cf5c2528bb70747301a9e694b55ca376fa2f12c7)
- [Adapt "Goroutine Call" in the spirit of "Deferred Call" - **mkhl**](https://github.com/AlanQuatermain/go-tmbundle/commit/76199f73304285b2e03b25192e129f9744d30ae0)
- [Improve comment matches - **infininight**](https://github.com/AlanQuatermain/go-tmbundle/commit/48287f71203d6c3c87c2bca96a62752b6d33bd72)
- [Improve scoping of braces and parens, remove outdated snippet - **infininight**](https://github.com/AlanQuatermain/go-tmbundle/commit/7232ee66407a894f94358e23c6a32aad584a5ca7)
- [Hide completion command in the menu - **infininight**](https://github.com/AlanQuatermain/go-tmbundle/commit/cb99b8da8a12b328f8c65885a82d569917798202)
- [Move folding settings - **infininight**](https://github.com/AlanQuatermain/go-tmbundle/commit/8d019dd8126334cf4801b8fcf151c522d4fef58f)
- [Correct version lookup and parsing - **infininight**](https://github.com/AlanQuatermain/go-tmbundle/commit/0ff2ffb4260f8332c3e1136d58e6b5122453e26b)
- [Updated all commands to use TM_ variables to locate necessary executables and TM_GOPATH - **whitlockjc**](https://github.com/AlanQuatermain/go-tmbundle/commit/ca55b4ce28b7badd56e3df69a56b6e8f51fce589)
- [Start using requiredCommands to locate go - **infininight**](https://github.com/AlanQuatermain/go-tmbundle/commit/1f69fb08bc84267ecb7b75725ddebe5a879d8bea)

###1.3.2 / 2012-10-19
- Added Symbol List support for functions and received functions (object methods).

###1.3.1 / 2012-10-18
- Fixed some problems with the indentation regexes.

###1.3 / 2011-11-22
- Includes a wrapper for +gotest+ on Cmd-Opt-T.

Imported some community additions and bugfixes to bring compatibility with OS X 10.7 and TextMate 1.5.1:

- [Use default values for GOOS and GOARCH only when necessary - **mkhl**](https://github.com/AlanQuatermain/go-tmbundle/commit/97f8c44552b0347c9d89f948a5fb92172f32daca)
- [Include the receiver in entity.name.function scope so that it shows up in the symbol list - **rsesek**](https://github.com/AlanQuatermain/go-tmbundle/commit/c85768b573f47d7274066b1260df6627ce35b82f)
- [Add gocode completion support - **guncha**](https://github.com/AlanQuatermain/go-tmbundle/commit/2eeb1c60f975af7cc3250964c9da58fca37d57f8)
- [Add proper argument handling for functions - **guncha**](https://github.com/AlanQuatermain/go-tmbundle/commit/b730967fbd14e58bcc32d7f5157234cfa48f4043)
- [Fix links not working properly when html output is produced while compiling a project with errors - **guncha**](https://github.com/AlanQuatermain/go-tmbundle/commit/837e04fba7e6e4a3127006be5fa3f1d04e357cba)
- [Size modifiers are not optional for float or complex - **chriseaton**](https://github.com/AlanQuatermain/go-tmbundle/commit/69797af68e37e171fa12e3aa3f0ce9340369a453)
- [Added x86_64 as a valid architecture string - **schmurfy**](https://github.com/AlanQuatermain/go-tmbundle/commit/05ba567d62018b87619d77653b728fcd25c270fb)
- [Fix for issue #6 - **TassoLee**](https://github.com/AlanQuatermain/go-tmbundle/commit/2912e001142b2e0921f4f5f5c568734ccc6bf701)
- [Revert goroot - **TassoLee**](https://github.com/AlanQuatermain/go-tmbundle/commit/67e6118d245ba4d9901b2fe869ca2c3a3bea4672)
- [Fix for source filenames with spaces bug - **guncha**](https://github.com/guncha/go-tmbundle/commit/27142544725331d465aed364eacb67d2c4b1eeb7)
- [Use GOBIN shell variable instead of PATH if present - **KnightBaron**](https://github.com/KnightBaron/go-tmbundle/commit/eb925bb53f71ab472d67c5ac9cfd78d7cc02be85)

###1.2 / 2010-06-13
- [Many new snippets and updates to the command-runner implementation, courtesy of Martin Kühl](http://github.com/mkhl)

###1.0.3 / 2010-03-28
- [Removed the no-longer-supported -oldparser flags from the invocation of the gofmt command](http://github.com/AlanQuatermain/go-tmbundle/issues/issue/2)

###1.0.2 / 2010-02-16
- [Removed the no-longer-supported -oldprinter flag from the invocation of the gofmt command](http://github.com/AlanQuatermain/go-tmbundle/issues/issue/1)

###1.0.1 / 2009-11-19
- Fixed a couple of bugs in the language grammar.
- Cleaned up menu formatting.
- Commands will now complain correctly if the necessary command-line tools aren't available.

###1.0.0 / 2009-11-18
- Updated grammar, now uses much fewer backrefs and suchlike, meaning it no longer causes TextMate to hog all your CPU!
- Grammar now correctly identifies and separately scopes just about everything I've been able to find, including:
	- Function names, receivers, parameters, and return types.
	- Variable initializations, whether by short or long form (including the := operator).
	- Exported variables.
	- Channel I/O operators.
- Snippets now obey standard Go formatting rules (even though they insist on icky K&R stuff, doh).
- New command: Tidy. Runs 'gofmt' to reformat your code based on standard Go formatting guidelines. This has the useful side-effect of performing a syntax check on the file, so you can also use it as pre-compilation check.
- Regular braces () now open up in the same manner as curly braces {} if you press Enter with the cursor between an empty pair.

###0.2.0 / 2009-11-15
- New indentation increase/decrease rules:
	- Case statements decrease and increase (they pop their own line back by one indent without affecting either prior or following line).
	- Regular braces now increase/decrease indent automatically.
- Regular braces now act as folding markers for multi-line 'const ( ... )' declarations.
- Code-folding matches on curly braces are now more conservative-- before, they could match characters beyond newlines.
- Built-in storage types are now matched properly.
- Variable initialization is FINALLY matching correctly. Should work for every style & number of variables, even in-line in loop statements.
- Matches exported variable names correctly (i.e. those beginning with an uppercase letter).
- Dot-accessed variable match no longer consumes the preceding '.' character.
 
###0.1.0 / 2009-11-14
- Initial Revision
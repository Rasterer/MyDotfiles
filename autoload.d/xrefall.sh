xrefall() {
	find . -name '*.java' -exec echo '"'{}'"' >  cscope.files \;
	find . -name '*.cpp'  -exec echo '"'{}'"' >> cscope.files \;
	find . -name '*.c'    -exec echo '"'{}'"' >> cscope.files \;
	find . -name '*.h'    -exec echo '"'{}'"' >> cscope.files \;
	find . -name '*.S'    -exec echo '"'{}'"' >> cscope.files \;
	find . -name '*.inl'  -exec echo '"'{}'"' >> cscope.files \;
	cscope -bkq -i cscope.files
}

xrefall_windows() {
	find Source Tools/Build/WDK -name '*.java' -exec echo '"'{}'"' >  cscope.files \;
	find Source Tools/Build/WDK -name '*.cpp'  -exec echo '"'{}'"' >> cscope.files \;
	find Source Tools/Build/WDK -name '*.c'    -exec echo '"'{}'"' >> cscope.files \;
	find Source Tools/Build/WDK -name '*.h'    -exec echo '"'{}'"' >> cscope.files \;
	find Source Tools/Build/WDK -name '*.H'    -exec echo '"'{}'"' >> cscope.files \;
	find Source Tools/Build/WDK -name '*.S'    -exec echo '"'{}'"' >> cscope.files \;
	find Source Tools/Build/WDK -name '*.inl'  -exec echo '"'{}'"' >> cscope.files \;
	cscope -bkq -i cscope.files
}

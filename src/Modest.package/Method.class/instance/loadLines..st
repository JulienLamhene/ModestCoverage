initialization
loadLines: covLines
	1 to: (self numberLines) do: [ :line |
		lines add: (covLines at: line)
	].
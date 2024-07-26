initialization
loadLines: covLines
	"Load the line used of our method"
	1 to: (self numberLines) do: [ :line |
		lines add: (covLines at: line)
	].
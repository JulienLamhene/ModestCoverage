comparing
= aLine
	"Check if a line is equal to another"
	^ (self number asInteger = aLine number asInteger) "&
	(self coveredInstruction asInteger = aLine coveredInstruction asInteger) &
	(self missedInstruction asInteger = aLine missedInstruction asInteger)."
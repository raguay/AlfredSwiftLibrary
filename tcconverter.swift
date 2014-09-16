//
// Program:			Text Case Converter (tcconverter)
//
// Description:	This program will take a string on the command line, convert
//                it in several ways, and create a xml output for showing
//                in an Alfred Script Filter.
//

//
// Import Libraries:
//
import Alfred
import Foundation

class Converter {
	init() {
		//
		// Create the Alfred object.
		//
		var wf = Alfred()

		//
		// Get the command line string and initialize the count.
		//
		let str: String = Process.arguments[1]
		var count = 0

		//
		// To a Capitalized String.
		//
		var result = str.capitalizedString
		wf.AddResult("CS\(count)", arg: result, title: "Capitalized: \(result)", sub: "Text Case Converter", icon: "icon.png", valid: "yes", auto: "", rtype: "")
		count++

		//
		// Create a Lowercase String.
		//
		result = str.lowercaseString
		wf.AddResult("CS\(count)", arg: result, title: "Lowercase: \(result)", sub: "Text Case Converter", icon: "icon.png", valid: "yes", auto: "", rtype: "")
		count++

		//
		// Create an Uppercase String.
		//
		result = str.uppercaseString
		wf.AddResult("CS\(count)", arg: result, title: "Uppercase: \(result)", sub: "Text Case Converter", icon: "icon.png", valid: "yes", auto: "", rtype: "")
		count++

		//
		// Create an Titlecase String.
		//
		result = TitleCase(str)
		wf.AddResult("CS\(count)", arg: result, title: "Titlecase: \(result)", sub: "Text Case Converter", icon: "icon.png", valid: "yes", auto: "", rtype: "")
		count++

		//
		// Output the XML.
		//
		println(wf.ToXML())
	}

	//
	// Method:		TitleCase
	//
	// Description:	This method converts the string given to Title Case.
	//
	// Input:
	//				str     The string to convert.
	//
	func TitleCase(str: String) -> String {
		//
		// Create an array of words to make lower case.
		//
		let lower = ["to", "an", "and", "at", "as", "but", "by", "for", "if", "in", "on", "or", "is", "with", "a", "the", "of", "vs", "vs.", "via", "via", "en"]

		//
		// Create an array of words that are to be upper cased.
		//
		let upper = ["I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X", "HTML", "CSS", "AT&T", "PHP"]

		//
		// Split the string by spaces.
		//
		var words = str.componentsSeparatedByString(" ")

		//
		// initialize helper variables.
		//
		var result = ""
		var first = true

		//
		// Loop through each word.
		//
		for word in words {
			//
			// Create a lower case of the word and the result word as capitalized.
			//
			var lword = word.lowercaseString
			var res = word.capitalizedString

			//
			// Loop through each word that should be lower case.
			//
			for low in lower {
				if lword == low.lowercaseString {
					//
					// It should be lower case.  Set the result word to it and break
					// out of the loop.
					//
					res = low
					break
				}
			}

			//
			// Loop through each word that should be uppercased.
			//
			for up in upper {
				if lword == up.lowercaseString {
					//
					// It should be uppercase. Set the result word and break out.
					//
					res = up
					break
				}
			}

			//
			// If it is the first word, then always capitalize.
			//
			if first {
				res = res.capitalizedString
				first = false
			}

			//
			// Create the resulting string.
			//
			result += "\(res) "
		}

		//
		// Return the result.
		//
		return(result)
	}
}


let cv: Converter = Converter()


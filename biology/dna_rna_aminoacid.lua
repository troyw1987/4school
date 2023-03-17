local dnaToRnaTable = {
	["t"] = "a",
	["a"] = "u",
	["c"] = "g",
	["g"] = "c"
}

local rnaToAminoTable = {
	["uuu"] = "phe",
	["uuc"] = "phe",
	["uua"] = "leu",
	["uug"] = "leu",

	["cuu"] = "leu",
	["cuc"] = "leu",
	["cua"] = "leu",
	["cug"] = "leu",

	["auu"] = "lle",
	["auc"] = "lle",
	["aua"] = "lle",
	["aug"] = "met",

	["guu"] = "val",
	["guc"] = "val",
	["gua"] = "val",
	["gug"] = "val",

	["ucu"] = "ser",
	["ucc"] = "ser",
	["uca"] = "ser",
	["ucg"] = "ser",

	["ccu"] = "pro",
	["ccc"] = "pro",
	["cca"] = "pro",
	["ccg"] = "pro",

	["acu"] = "thr",
	["acc"] = "thr",
	["aca"] = "thr",
	["acg"] = "thr",

	["gcu"] = "ala",
	["gcc"] = "ala",
	["gca"] = "ala",
	["gcg"] = "ala",

	["uau"] = "tyr",
	["uac"] = "tyr",
	["uaa"] = "STOP",
	["uag"] = "STOP",

	["cau"] = "his",
	["cac"] = "his",
	["caa"] = "gln",
	["cag"] = "gln",

	["aau"] = "asn",
	["aac"] = "asn",
	["aaa"] = "lys",
	["aag"] = "lys",

	["gau"] = "asp",
	["gac"] = "asp",
	["gaa"] = "glu",
	["gag"] = "glu",

	["ugu"] = "cys",
	["ugc"] = "cys",
	["uga"] = "STOP",
	["ugg"] = "trp",

	["cgu"] = "arg",
	["cgc"] = "arg",
	["cga"] = "arg",
	["cgg"] = "arg",

	["agu"] = "ser",
	["agc"] = "ser",
	["aga"] = "arg",
	["agg"] = "arg",

	["ggu"] = "gly",
	["ggc"] = "gly",
	["gga"] = "gly",
	["ggg"] = "gly"
}


local function dnaToRNA(str)
	print("DNA -> RNA")
	local replaceString = ""
	for i = 0, string.len(str), 4 do
		local individual = string.sub(str, i, i + 3)

		for l = 0, string.len(individual) do
			local letter = string.sub(individual, l, l)
			if dnaToRnaTable[letter] then
				local newLetter = dnaToRnaTable[letter]

				--print(letter.. " -> "..newLetter)
				replaceString = replaceString .. newLetter
			elseif letter == " " then
				replaceString = replaceString .. " "
			end
		end

	end
	--print(str,"---->", replaceString)
	return replaceString
end

local function rnaToAmino(str)
	print("RNA -> AMINO")
	local returnString = ""
	for i = 1, string.len(str), 4 do
		local segment = string.sub(str, i, i + 3)
		print(segment)
		local spaceLess = string.gsub(segment, "%s+", "")
		local aminoAcid = rnaToAminoTable[spaceLess]
		returnString = returnString .. aminoAcid .. " "
	end
	return returnString
end



local inputDNA = "tac cag agg ttt atc tac cat ggg tgt gga ttt act tac gat aag aac ggg att tac cgt cat cac atc tac gta gtg atc tac cag aaa atg act tac tta tag gac gat ggg tgc att tac cag tta ttg tct atc tac aaa aag gtg act tac gcg tac tgg ggg act"
local rna = dnaToRNA(inputDNA)
print(rna)
local amino = rnaToAmino(rna)
print(amino)
